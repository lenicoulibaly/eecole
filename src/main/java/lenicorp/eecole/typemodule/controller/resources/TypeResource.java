package lenicorp.eecole.typemodule.controller.resources;

import lenicorp.eecole.typemodule.controller.repositories.TypeRepo;
import lenicorp.eecole.typemodule.controller.services.ITypeService;
import lenicorp.eecole.typemodule.model.dtos.CreateTypeDTO;
import lenicorp.eecole.typemodule.model.dtos.ReadTypeDTO;
import lenicorp.eecole.typemodule.model.dtos.TypeParamDTO;
import lenicorp.eecole.typemodule.model.dtos.UpdateTypeDTO;
import lenicorp.eecole.typemodule.model.entities.Type;
import lenicorp.eecole.typemodule.model.enums.TypeGroup;
import jakarta.validation.Valid;
import lombok.RequiredArgsConstructor;
import org.springframework.context.annotation.Profile;
import org.springframework.data.domain.Page;
import org.springframework.http.HttpStatus;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;

import java.net.UnknownHostException;
import java.util.List;

@Profile({"dev", "prod"})
@RestController
@RequiredArgsConstructor
@RequestMapping(path = "/types") @Validated
public class TypeResource
{
    private final TypeRepo typeRepo;
    private final ITypeService typeService;

    @GetMapping(path = "") //@PreAuthorize("hasAuthority('DEV')")
    public List<ReadTypeDTO> getAllTypes()
    {
        return typeRepo.findAllTypes();
    }

    /*@GetMapping(path = "/find-by-unique-code/{uniqueCode}") //@PreAuthorize("hasAuthority('DEV')")
    public ReadTypeDTO getTypeByUniqueCode(@PathVariable String uniqueCode)
    {
        return typeRepo.findByUniqueCode(uniqueCode);
    }*/

    //@PreAuthorize("isAuthenticated()")
    @GetMapping(path = "/{group-code}")
    public List<ReadTypeDTO> getByGroupCode(@PathVariable String groupCode)
    {
        return typeRepo.findByTypeGroup(TypeGroup.valueOf(groupCode)); //typeRepo.findByGroupCode(groupCode);
    }

    //@PreAuthorize("isAnonymous()")
    @GetMapping(path = "/sous-type-of/{parentCode}")
    public List<ReadTypeDTO> getSousTypeOf(@PathVariable String parentCode)
    {
        return typeRepo.findSousTypeOf(parentCode);
    }

    //@PreAuthorize("permitAll()")
    @GetMapping(path = "/is-sous-type-of/{parentId}/{childId}")
    public boolean isSousTypeOf(@PathVariable String parentCode, @PathVariable String childCode)
    {
        return typeRepo.isSousTypeOf(parentCode, childCode);
    }

    //@PreAuthorize("permitAll()")
    @GetMapping(path = "/is-deletable/{uniqueCode}")
    public boolean isDeletable(@PathVariable String uniqueCode)
    {
        return typeRepo.isDeletable(uniqueCode);
    }

    //@PreAuthorize("permitAll()")
    @GetMapping(path = "/exists-by-uniqueCode")
    public boolean existsByUniqueCode(@RequestParam(defaultValue = "") String uniqueCode)
    {
        return typeRepo.existsByUniqueCode(uniqueCode);
    }

   // @PreAuthorize("isAnonymous()")
    @GetMapping(path = "/exists-by-id")
    public boolean existsById(@RequestParam String typeCode)
    {
        return typeRepo.existsById(typeCode);
    }

    //@PreAuthorize("hasAuthority('DEV')")
    @PostMapping(path = "/create") @ResponseStatus(HttpStatus.CREATED)
    public Type createType(@RequestBody @Valid CreateTypeDTO dto) throws UnknownHostException {

        return typeService.createType(dto);
    }

    //@PreAuthorize("hasAuthority('DEV')")
    @PutMapping(path = "/update") @ResponseStatus(HttpStatus.OK)
    public Type updateType(@RequestBody @Valid UpdateTypeDTO dto) throws UnknownHostException {
        return typeService.updateType(dto);
    }

    @PostMapping(path = "/add-sub-type")
    public void addSubType(TypeParamDTO dto) throws UnknownHostException {
        typeService.addSousType(dto);
    }

    //@PreAuthorize("hasAuthority('DEV')")
    @PutMapping(path = "/set-sous-type") @ResponseStatus(HttpStatus.OK)
    public void setSousType(@RequestBody @Valid TypeParamDTO dto) throws UnknownHostException {
        typeService.addSousType(dto);
    }

    //@PreAuthorize("hasAuthority('DEV')")
    @PutMapping(path = "/remove-sous-type") @ResponseStatus(HttpStatus.OK)
    public void removeSousType(@RequestBody @Valid TypeParamDTO dto) throws UnknownHostException {
        typeService.removeSousType(dto);
    }

    @GetMapping(path = "/list")
    public Page<Type> searchTypes(@RequestParam(defaultValue = "") String key, String typeGroup, @RequestParam(defaultValue = "0") int num, @RequestParam(defaultValue = "2") int size) throws UnknownHostException {
        return typeService.searchPageOfTypes(key, typeGroup, num, size);
    }
}
