package lenicorp.eecole.moduleauth.controller.services.spec;

import io.jsonwebtoken.Claims;
import lenicorp.eecole.moduleauth.model.dtos.appuser.AuthResponseDTO;
import lenicorp.eecole.modulelog.model.dtos.response.JwtInfos;
import lenicorp.eecole.modulelog.model.entities.Log;
import org.springframework.security.core.userdetails.UserDetails;

import java.util.Map;
import java.util.Set;
import java.util.function.Function;

public interface IJwtService
{
    AuthResponseDTO generateJwt(UserDetails userDetails, String connectionId);
    AuthResponseDTO generateJwt(String username, Map<String, Object> extraClaims);

    String extractUsername(String jwt);
    String extractUsername();
    String extractConnectionId();
    <T> T extractClaim(String jwt, Function<Claims, T> f);

    Log getUserInfosFromJwt(String token);

    Log getUserInfosFromJwt();

    JwtInfos getJwtInfos();
    JwtInfos getJwtInfos(String jwt);

    String getCurrentJwt();

    Object getClaim(String claimName);
    Long getConnectedUserId();
    Long getConnectedUserFunctionId();

    boolean hasAnyAuthority(String ...s);
    Set<String> getAuthorities();

    Long getConnectedUserEcoleId();

    String getConnectedUserEcoleCode();
}
