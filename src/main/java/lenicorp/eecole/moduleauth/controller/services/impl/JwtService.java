package lenicorp.eecole.moduleauth.controller.services.impl;

import io.jsonwebtoken.Claims;
import io.jsonwebtoken.Jwts;
import io.jsonwebtoken.SignatureAlgorithm;
import io.jsonwebtoken.impl.DefaultClaims;
import io.jsonwebtoken.security.Keys;
import jakarta.servlet.http.HttpServletRequest;
import lenicorp.eecole.moduleauth.controller.repositories.FunctionRepo;
import lenicorp.eecole.moduleauth.controller.repositories.UserRepo;
import lenicorp.eecole.moduleauth.controller.services.spec.IJwtService;
import lenicorp.eecole.moduleauth.controller.services.spec.IMenuReaderService;
import lenicorp.eecole.moduleauth.model.constants.SecurityConstants;
import lenicorp.eecole.moduleauth.model.dtos.appuser.AuthResponseDTO;
import lenicorp.eecole.moduleauth.model.entities.AppFunction;
import lenicorp.eecole.moduleauth.model.entities.AppUser;
import lenicorp.eecole.modulelog.model.dtos.response.JwtInfos;
import lenicorp.eecole.modulelog.model.entities.Log;
import lenicorp.eecole.sharedmodule.exceptions.AppException;
import lenicorp.eecole.sharedmodule.utilities.HttpServletManager;
import lombok.RequiredArgsConstructor;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Service;

import java.security.Key;
import java.time.ZoneId;
import java.util.*;
import java.util.function.Function;
import java.util.stream.Collectors;

@Service @RequiredArgsConstructor
public class JwtService implements IJwtService
{
    private final FunctionRepo functionRepo;
    private final UserRepo userRepo;
    private final IMenuReaderService menuService;

    @Override
    public AuthResponseDTO generateJwt(UserDetails userDetails, String connectionId)
    {
        String userEmail = userDetails.getUsername();
        AppUser user = userRepo.findByEmail(userEmail).orElseThrow(()->new AppException("Utilisateur introuvable"));
        Set<Long> visibilityIds = functionRepo.getCurrentFncClasseIds(userDetails.getUsername());
        Set<Long> functionIds = functionRepo.getCurrentFncIds(user.getUserId());
        Long functionId = functionIds == null || functionIds.size() != 1 ? null : new ArrayList<>(functionIds).get(0);
        Map<String, Object> extraClaims = new HashMap<>(); //functionId = 1l;


        AppFunction function = functionId == null ? null : functionRepo.findById(functionId).orElse(null);

        Set<String> menus = menuService.getMenusByFncId(functionId);
        Set<String> authorities = userDetails.getAuthorities().stream().map(auth->auth.getAuthority()).collect(Collectors.toSet());
        Set<String> authAndMenus = new HashSet<String>(authorities);
        authAndMenus.addAll(menus);

        Long userId = user.getUserId();
        extraClaims.put("userId", userId);
        extraClaims.put("email", userEmail);
        extraClaims.put("nom", user.getFirstName());
        extraClaims.put("tel", user.getTel());
        extraClaims.put("prenom", user.getLastName());
        extraClaims.put("authorities", authAndMenus);
        extraClaims.put("menus", menus);
        extraClaims.put("classeIds", visibilityIds == null ? null : visibilityIds.size() != 1 ? null : new ArrayList<>(visibilityIds).get(0));
        extraClaims.put("functionId", functionId);
        extraClaims.put("connectionId", connectionId);
        extraClaims.put("idEcole", function.getEcole() == null ? null : function.getEcole().getId());
        extraClaims.put("codeEcole", user.getEcole() == null ? null : function.getEcole().getCodeEcole());


        extraClaims.put("functionName", function == null ? null : function.getName());

        extraClaims.put("functionStartingDate", function == null ? null : Date.from(function.getStartsAt().atStartOfDay(ZoneId.systemDefault()).toInstant()));
        extraClaims.put("functionEndingDate", function == null ? null : Date.from(function.getEndsAt().atStartOfDay(ZoneId.systemDefault()).toInstant()));

        boolean hasCurrentFonction = functionId != null && functionRepo.functionIsCurrentForUser(functionId, userId);
        boolean doesNotHaveAnyFunction = !functionRepo.userHasAnyAppFunction(userId);
        return generateJwt(userEmail, extraClaims);
    }

    @Override
    public AuthResponseDTO generateJwt(String username, Map<String, Object> extraClaims)
    {
        String accessToken = Jwts.builder().setClaims(extraClaims).setSubject(username)
                .setIssuedAt(new Date(System.currentTimeMillis()))
                .setExpiration(new Date(System.currentTimeMillis() + SecurityConstants.ACCESS_TOKEN_DURATION ))
                .signWith(this.getSigningKey(), SignatureAlgorithm.HS256).compact();

        String refreshToken = Jwts.builder().setSubject(username)
                .claim("connectionId", extraClaims.get("connectionId"))
                .setIssuedAt(new Date(System.currentTimeMillis()))
                .setExpiration(new Date(System.currentTimeMillis() + SecurityConstants.REFRESH_TOKEN_DURATION ))
                .signWith(this.getSigningKey(), SignatureAlgorithm.HS256).compact();
        return new AuthResponseDTO(accessToken, refreshToken);
    }

    @Override
    public String extractUsername()
    {
        String extractedUsername = this.extractUsername(this.getCurrentJwt());
        return extractedUsername == null || extractedUsername.trim().equals("") ? "UNKNOWN" : extractedUsername;
    }

    @Override
    public String extractConnectionId()
    {
        Claims claims= this.extractAllClaims(this.getCurrentJwt());
        return claims == null ? "" : claims.get("connectionId", String.class);
    }

    @Override
    public String extractUsername(String jwt)
    {
        return this.extractClaim(jwt == null ? "" : jwt, Claims::getSubject);
    }

    @Override
    public <T> T extractClaim(String jwt, Function<Claims, T> claimResolver) {
        return claimResolver.apply(this.extractAllClaims(jwt));
    }

    private Key getSigningKey()
    {
        byte[] keyBytes = Base64.getDecoder().decode(SecurityConstants.SEC_KEY);
        return Keys.hmacShaKeyFor(keyBytes);
    }

    private Claims extractAllClaims(String jwt)
    {
        if(jwt == null || jwt.trim().equals("")) return new DefaultClaims();
        return Jwts.parserBuilder().setSigningKey(this.getSigningKey()).build().parseClaimsJws(jwt).getBody();
    }

    @Override
    public Log getUserInfosFromJwt(String token)
    {
        Log log = new Log();
        Claims claims= this.extractAllClaims(token);
        Long  functionId = claims.get("functionId", Long.class);
        log.setUserEmail(this.extractUsername(token));
        log.setUserId(claims.get("userId", Long.class));
        log.setFunction(functionId == null ? null : functionRepo.findById(functionId).orElse(null));
        log.setConnectionId(claims.get("connectionId", String.class));
        return log;
    }

    @Override
    public Log getUserInfosFromJwt()
    {
        return this.getUserInfosFromJwt(this.getCurrentJwt());
    }

    @Override
    public JwtInfos getJwtInfos() {
        return this.getJwtInfos(this.getCurrentJwt());
    }

    @Override
    public JwtInfos getJwtInfos(String jwt)
    {
        JwtInfos jwtInfos = new JwtInfos();
        Claims claims= this.extractAllClaims(jwt);
        Long  functionId = claims.get("functionId", Long.class);
        AppFunction function = functionId == null ? null : functionRepo.findById(functionId).orElse(null);

        jwtInfos.setFncId(functionId);
        jwtInfos.setFncName(function == null ? "" : function.getName());
        jwtInfos.setUserEmail(this.extractUsername(jwt));
        jwtInfos.setUserId(claims.get("userId", Long.class));
        jwtInfos.setIdEcole(claims.get("idEcole", Long.class));
        jwtInfos.setCodeEcole(claims.get("codeEcole", String.class));
        jwtInfos.setAuthorities(claims.get("authorities", List.class));
        jwtInfos.setConnectionId(claims.get("connectionId", String.class));
        jwtInfos.setTokenStartingDate(this.extractClaim(jwt,Claims::getIssuedAt));
        jwtInfos.setTokenEndingDate(this.extractClaim(jwt,Claims::getExpiration));
        jwtInfos.setFncStartingDate(function == null ? null : function.getStartsAt());
        jwtInfos.setFncEndingDate(function == null ? null : function.getEndsAt());

        return jwtInfos;
    }

    @Override
    public String getCurrentJwt()
    {
        HttpServletRequest request = HttpServletManager.getCurrentHttpRequest();
        if(request == null) return null;
        return request.getHeader("Authorization") == null ? null : request.getHeader("Authorization").substring("Bearer ".length());
    }

    @Override
    public Object getClaim(String claimName)
    {
        return this.extractAllClaims(this.getCurrentJwt()).get(claimName);
    }

    @Override
    public Long getConnectedUserId() {
        Object userId = this.getClaim("userId");
        return userId == null ? null : Long.valueOf(String.valueOf(userId));
    }

    @Override
    public Long getConnectedUserFunctionId() {
        Object functionId = this.getClaim("functionId");
        return functionId == null ? null : Long.valueOf(String.valueOf(functionId));
    }


    @Override
    public boolean hasAnyAuthority(String... auth)
    {
        if(auth == null) return false;
        Set<String> authList = Arrays.stream(auth).collect(Collectors.toSet());
        Set<String> userAuthorities = this.getAuthorities();
        boolean hasAnyAuthority =userAuthorities.stream().anyMatch(authList::contains);
        return hasAnyAuthority;
    }

    @Override
    public Set<String> getAuthorities()
    {
        Object authorities = this.getClaim("authorities");
        return authorities == null ? new HashSet<>() : new HashSet<>((List<String>) authorities);
    }

    @Override
    public Long getConnectedUserEcoleId() {
        Object idEcole = this.getClaim("idEcole");
        return idEcole == null ? null : Long.valueOf(String.valueOf(idEcole));
    }

    @Override
    public String getConnectedUserEcoleCode() {
        Object idEcole = this.getClaim("codeEcole");
        return idEcole == null ? null : String.valueOf(idEcole);
    }

    class TokenStatus
    {
        private int status;
        private String description;
        private String message;
    }
}