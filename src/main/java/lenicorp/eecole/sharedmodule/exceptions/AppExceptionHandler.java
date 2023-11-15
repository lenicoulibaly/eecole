package lenicorp.eecole.sharedmodule.exceptions;

import io.jsonwebtoken.ExpiredJwtException;
import lenicorp.eecole.modulelog.controller.service.ILogService;
import lombok.RequiredArgsConstructor;
import org.springframework.http.HttpStatus;
import org.springframework.security.authentication.DisabledException;
import org.springframework.security.authentication.InsufficientAuthenticationException;
import org.springframework.security.authentication.LockedException;
import org.springframework.security.core.AuthenticationException;
import org.springframework.validation.FieldError;
import org.springframework.web.bind.MethodArgumentNotValidException;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.ResponseStatus;
import org.springframework.web.bind.annotation.RestControllerAdvice;

import java.io.PrintWriter;
import java.io.StringWriter;
import java.net.UnknownHostException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

@RestControllerAdvice @RequiredArgsConstructor
public class AppExceptionHandler
{
    private final ILogService logService;
    @ExceptionHandler
    @ResponseStatus(HttpStatus.BAD_REQUEST)
    public Map<String, List<String>> handleMethodArgumentNotValidException(MethodArgumentNotValidException err)
    {
        Map<String, List<String>> errorMap = new HashMap<>();
        err.getGlobalErrors().stream().filter(e->e.getDefaultMessage().contains("::")).map(e->e.getDefaultMessage().split("::")[0]).forEach(f->
        {
            List<String> errors = err.getGlobalErrors().stream().filter(e->e.getDefaultMessage().contains("::"))
                    .filter(e->e.getDefaultMessage().split("::")[0].equals(f))
                    .map(e->e.getDefaultMessage().split("::")[1]).collect(Collectors.toList());
            errorMap.put(f, errors);
        });

        List<String> globalErrors = err.getGlobalErrors().stream().filter(e->!e.getDefaultMessage().contains("::")).map(e->e.getDefaultMessage()).collect(Collectors.toList());

        if(globalErrors != null && !globalErrors.isEmpty()) errorMap.put("global", globalErrors);

        List<FieldError> fieldErrors = err.getBindingResult().getFieldErrors();
        List<String> fields = fieldErrors.stream().map(FieldError::getField).collect(Collectors.toList());
        fields.forEach(f->
        {
            List<String> errors = fieldErrors.stream().filter(f1->f1.getField().equals(f)).map(FieldError::getDefaultMessage).collect(Collectors.toList());
            errorMap.put(f, errors);
        });
        return errorMap;
    }

    @ExceptionHandler
    @ResponseStatus(HttpStatus.INTERNAL_SERVER_ERROR)
    public List<String> handleAppException(AppException err)
    {
        List<String> errorMessages = new ArrayList<>();
        errorMessages.add(err.getMessage());
        return errorMessages;
    }

    @ExceptionHandler()
    @ResponseStatus(HttpStatus.UNAUTHORIZED)
    public List<String> handleAuthException(AuthenticationException exception)
    {
        List<String> errorMessages = new ArrayList<>();
        String errMsg = exception instanceof DisabledException ?
                "Votre compte a bien été créé mais n'est pas encore activé.\nPour recevoir un lien d'activation, veillez cliquer sur le lien ci-dessous." :
                exception instanceof LockedException ? "Compte bloqué" :
                exception instanceof InsufficientAuthenticationException ? exception.getMessage() : "Username ou mot de passe incorrect";
        errorMessages.add(errMsg);
        return errorMessages;
    }

    @ExceptionHandler()
    @ResponseStatus(HttpStatus.FORBIDDEN)
    public String handleJwtExpirationException(ExpiredJwtException exception)
    {
        return "EXPIRED_TOKEN";
    }

    @ExceptionHandler()
    @ResponseStatus(HttpStatus.INTERNAL_SERVER_ERROR)
    public void handleAuthException(Exception exception) throws UnknownHostException {
        StringWriter sw = new StringWriter();
        PrintWriter pw = new PrintWriter(sw);
        exception.printStackTrace(pw);
        String stacktrace = sw.toString();
        exception.printStackTrace();
        logService.saveLogError(exception.getMessage(), stacktrace, null);

    }
}
