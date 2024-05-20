package com.gestion.planillas.Otros;

import jakarta.servlet.http.HttpServletResponse;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;

import org.springframework.security.access.AccessDeniedException;
import org.springframework.security.authentication.AuthenticationCredentialsNotFoundException;

import java.io.IOException;
import com.gestion.planillas.DAO.usuarioDAO;


@ControllerAdvice
public class GlobalExceptionHandler {

    @Autowired
    private usuarioDAO usuarioDAO;

    @ExceptionHandler(AccessDeniedException.class)
    public void handleAccessDeniedException(AccessDeniedException ex, HttpServletResponse response) throws IOException {
        String username=usuarioDAO.getUsuarioActual().getUsername();
        response.sendRedirect("/error/estado?user="+username);
    }
}
