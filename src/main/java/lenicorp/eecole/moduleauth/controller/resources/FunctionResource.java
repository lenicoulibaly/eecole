package lenicorp.eecole.moduleauth.controller.resources;

import lenicorp.eecole.moduleauth.controller.repositories.FunctionRepo;
import lenicorp.eecole.moduleauth.controller.services.spec.IFunctionService;
import lenicorp.eecole.moduleauth.model.dtos.appfunction.CreateFncDTO;
import lenicorp.eecole.moduleauth.model.dtos.appfunction.FncMapper;
import lenicorp.eecole.moduleauth.model.dtos.appfunction.ReadFncDTO;
import lenicorp.eecole.moduleauth.model.dtos.appfunction.UpdateFncDTO;
import lenicorp.eecole.moduleauth.model.dtos.appuser.AuthResponseDTO;
import lenicorp.eecole.moduleauth.model.dtos.asignation.SetAuthoritiesToFunctionDTO;
import lombok.RequiredArgsConstructor;
import org.springframework.http.HttpStatus;
import org.springframework.web.bind.annotation.*;

import java.net.UnknownHostException;
import java.util.Comparator;
import java.util.List;
import java.util.stream.Collectors;

@RestController @RequiredArgsConstructor
@RequestMapping(path = "/functions") @ResponseStatus(HttpStatus.OK)
public class FunctionResource
{
    private final IFunctionService functionService;
    private final FunctionRepo functionRepo;
    private final FncMapper fncMapper;

    @PostMapping(path = "/create")
    public ReadFncDTO createFunction(@RequestBody CreateFncDTO dto) throws UnknownHostException {
        return functionService.createFnc(dto);
    }

    @PutMapping(path = "/update")
    public ReadFncDTO updateFunction(@RequestBody UpdateFncDTO dto) throws UnknownHostException {
         return functionService.updateFunction(dto);
    }

    @GetMapping(path = "/infos/{foncId}")
    public ReadFncDTO getFoncInfos(@PathVariable Long foncId) throws UnknownHostException
    {
        return functionService.getFunctioninfos(foncId);
    }

    @GetMapping(path = "/get-current-fncId-for-user/{userId}")
    public Long getActiveCurrentFunctionId(@PathVariable Long userId)
    {
        return functionService.getActiveCurrentFunctionId(userId);
    }

    @GetMapping(path = "/get-current-fnc-for-user/{userId}")
    public ReadFncDTO getActiveCurrentFunction(@PathVariable Long userId)
    {
        return functionService.getActiveCurrentFunction(userId);
    }

    @PutMapping(path = "/set-fnc-as-default/{fncId}")
    public AuthResponseDTO setFunctionAsDefault(@PathVariable Long fncId) throws UnknownHostException
    {
        return functionService.setFunctionAsDefault(fncId);
    }
    @PutMapping(path = "/revoke/{fncId}")
    public void revokeFunction(@PathVariable Long fncId) throws UnknownHostException
    {
        functionService.revokeFunction(fncId);
    }
    @PutMapping(path = "/restore/{fncId}")
    public void restoreFunction(@PathVariable Long fncId) throws UnknownHostException
    {
        functionService.restoreFunction(fncId);
    }

    @GetMapping(path = "/active-fnc-for-user/{userId}")
    public List<ReadFncDTO> getActiveFunctionsForUser(@PathVariable Long userId)
    {
        return functionRepo.findActiveByUser(userId).stream().map(fncMapper::mapToReadFncDto).sorted(Comparator.comparingInt(ReadFncDTO::getFncStatus)).collect(Collectors.toList());
    }

    @GetMapping(path = "/all-fnc-for-user/{userId}")
    public List<ReadFncDTO> getUsersAllFunctions(@PathVariable Long userId)
    {
        return functionRepo.findAllByUser(userId).stream().map(fncMapper::mapToReadFncDto).collect(Collectors.toList());
    }
}