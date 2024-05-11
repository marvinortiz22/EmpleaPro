package com.gestion.planillas.Otros;

import com.gestion.planillas.modelos.Usuario;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.AuthenticationException;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.web.authentication.AuthenticationFailureHandler;

import java.io.IOException;

import com.gestion.planillas.DAO.usuarioDAO;

public class CustomAuthenticationFailureHandler implements AuthenticationFailureHandler {

    @Autowired
    private usuarioDAO usuarioDAO;

    @Autowired
    private BCryptPasswordEncoder passwordEncoder;

    @Override
    public void onAuthenticationFailure(HttpServletRequest request, HttpServletResponse response, AuthenticationException exception) throws IOException, ServletException {
        String username = request.getParameter("username");
        Usuario usuario = usuarioDAO.getUsuarioPorUsername(username);
        if (usuario != null) {
            usuario.setIntentosLogin(usuario.getIntentosLogin() + 1);
            usuarioDAO.guardarUsuario(usuario);
        }
        response.sendRedirect("/login?user="+username);
    }
}