package lenicorp.eecole.moduleauth.controller.services.spec;

import lenicorp.eecole.moduleauth.model.dtos.appuser.*;
import lenicorp.eecole.moduleauth.model.enums.UserStatus;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;

import java.net.UnknownHostException;
import java.util.List;

public interface IUserService
{
    AuthResponseDTO login(LoginDTO dto) throws UnknownHostException;
    AuthResponseDTO refreshToken() throws UnknownHostException;
    void logout() throws UnknownHostException;
    ReadUserDTO createUser(CreateUserDTO dto) throws IllegalAccessException, UnknownHostException;
    ReadUserDTO updateUser(UpdateUserDTO dto) throws UnknownHostException;
    ReadUserDTO changePassword(ChangePasswordDTO dto) throws UnknownHostException;
    void blockAccount(Long userId) throws UnknownHostException;
    void unBlockAccount(Long userId) throws UnknownHostException;
    ReadUserDTO activateAccount(ActivateAccountDTO dto) throws UnknownHostException;

    ReadUserDTO reinitialisePassword(ReinitialisePasswordDTO dto) throws UnknownHostException;

    ReadUserDTO findByUsername(String username);

    ReadUserDTO findByEmail(String email);

    ReadUserDTO findByTel(String tel);

    void sendAccountActivationEmail(String email) throws IllegalAccessException, UnknownHostException;
    void sendAccountActivationEmail(Long userId) throws IllegalAccessException, UnknownHostException;

    //void resendAccountActivationEmail(String username, String email) throws IllegalAccessException;

    void sendReinitialisePasswordEmail(String email) throws IllegalAccessException, UnknownHostException;

    void clickLink(String token) throws UnknownHostException;

    UserStatus getUserStatus(Long userId);

    Page<ReadUserDTO> searchUsers(String key, List<String> userStaCode, Pageable pageable);

    ReadUserDTO createUserAndFunction(CreaterUserAndFunctionDTO dto) throws UnknownHostException, IllegalAccessException;


    ReadUserDTO getUserInfos(Long userId);

    boolean existsByEmail(String email, Long userId);
    boolean existsByTel(String email, Long userId);
}
