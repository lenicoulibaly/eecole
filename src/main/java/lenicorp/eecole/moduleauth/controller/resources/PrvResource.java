package lenicorp.eecole.moduleauth.controller.resources;

import jakarta.validation.Valid;
import lenicorp.eecole.moduleauth.controller.repositories.PrvRepo;
import lenicorp.eecole.moduleauth.controller.repositories.PrvToRoleAssRepo;
import lenicorp.eecole.moduleauth.controller.services.spec.IPrivilegeService;
import lenicorp.eecole.moduleauth.model.dtos.appprivilege.CreatePrivilegeDTO;
import lenicorp.eecole.moduleauth.model.dtos.appprivilege.PrvByTypeDTO;
import lenicorp.eecole.moduleauth.model.dtos.appprivilege.ReadPrvDTO;
import lombok.RequiredArgsConstructor;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.http.HttpStatus;
import org.springframework.web.bind.annotation.*;

import java.net.UnknownHostException;
import java.util.List;
import java.util.Set;

@RequiredArgsConstructor
@RestController @RequestMapping("/privileges") @ResponseStatus(HttpStatus.OK)
public class PrvResource
{
    private final IPrivilegeService prvService;
    private final PrvRepo prvRepo;
    private final PrvToRoleAssRepo ptrRepo;

    @PostMapping(path = "/create")
    public ReadPrvDTO createPrv(@RequestBody @Valid CreatePrivilegeDTO dto) throws UnknownHostException, IllegalAccessException {
        return prvService.createPrivilege(dto);
    }

    @GetMapping(path = "/search")
    public Page<ReadPrvDTO> searchPrv(@RequestParam(defaultValue = "") String key, @RequestParam(defaultValue = "0") int num, @RequestParam(defaultValue = "10000") int size){
        return prvService.searchPrivileges(key, PageRequest.of(num, size));
    }

    @GetMapping(path = "/grouped-by-type")
    public List<PrvByTypeDTO> getAllPrivilegesGroupedByType(){
        return prvService.getAllPrivlegesGroupesByType();
    }

    @GetMapping(path = "/existsByName/{name}")
    public boolean existsByName(@PathVariable String name){
        return prvRepo.existsByName(name);
    }

    @GetMapping(path = "/existsByName/{name}/{prvId}")
    public boolean existsByName(@PathVariable String name, @PathVariable Long prvId){
        return prvRepo.existsByName(name, prvId);
    }

    @GetMapping(path = "/existsByCode/{code}")
    public boolean existsByCode(@PathVariable String code) throws UnknownHostException, IllegalAccessException {
        return prvRepo.existsByCode(code);
    }

    @GetMapping(path = "/existsByCode/{code}/{prvId}")
    public boolean existsByCode(@PathVariable String code, @PathVariable Long prvId) throws UnknownHostException, IllegalAccessException {
        return prvRepo.existsByCode(code, prvId);
    }

    @GetMapping(path = "/privilegeCodes-for-roleCodes")
    public Set<String> getPrvCodesForRoleCodes(@RequestParam Set<String> roleCodes) throws UnknownHostException, IllegalAccessException {
        return ptrRepo.findActivePrvCodesForRoles(roleCodes);
    }

    @GetMapping(path = "/privileges-for-roleCodes")
    public Set<ReadPrvDTO> getPrvsForRoleCodes(@RequestParam Set<String> roleCodes) throws UnknownHostException, IllegalAccessException {
        return ptrRepo.findActivePrivilegesForRoles(roleCodes);
    }

    @GetMapping(path = "/privilege-belong-to-any-role")
    public boolean prvBelongToAnyRole(@RequestParam Set<String> roleCodes, @RequestParam String prvCode) throws UnknownHostException, IllegalAccessException {
        return ptrRepo.prvBelongToAnyRole(prvCode, roleCodes);
    }
}
