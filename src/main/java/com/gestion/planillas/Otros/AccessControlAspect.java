package com.gestion.planillas.Otros;
import com.gestion.planillas.modelos.Permiso;
import com.gestion.planillas.modelos.Usuario;
import jakarta.servlet.http.HttpServletResponse;
import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.AccessDeniedException;
import org.springframework.security.authentication.AuthenticationCredentialsNotFoundException;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.*;
import com.gestion.planillas.DAO.usuarioDAO;

import java.io.IOException;
import java.util.*;

@Aspect
@Component
public class AccessControlAspect {

    @Autowired
    private usuarioDAO usuarioDAO;

    @Around("@annotation(accessControl)")
    public Object checkAccess(ProceedingJoinPoint joinPoint, AccessControl accessControl) throws Throwable {
        // Verificar si el usuario está autenticado
        if (!SecurityContextHolder.getContext().getAuthentication().isAuthenticated()) {
            throw new IllegalAccessException("El usuario no está autenticado");
        }
        UsuarioPermisos usuarioPermisos=usuarioDAO.getUsuarioActual();
        Usuario usuario=usuarioDAO.getUsuarioPorUsername(usuarioPermisos.getUsername());

        if(!usuario.isEstado())
            throw new AccessDeniedException("El usuario está inhabilitado");

        if(usuario.getRol()==null)
            throw new AuthenticationCredentialsNotFoundException("El usuario no tiene ningún rol asignado");

        // Verificar si el usuario tiene los roles requeridos
        String[] requiredRoles = accessControl.roles();
        List<Permiso> permisos=usuarioPermisos.getPermisos();
        if (requiredRoles.length > 0) {
            List<String> requiredRolesList = Arrays.asList(requiredRoles);
            boolean hasRequiredRole = requiredRolesList.stream()
                    .allMatch(role -> permisos.stream()
                            .anyMatch(permiso -> permiso.getNombrePermiso().equals(role)));
            if (!hasRequiredRole) {

                throw new IllegalAccessException("El usuario no tiene los permisos necesarios");
            }
        }

        // Permitir el acceso al método
        return joinPoint.proceed();
    }
    public boolean tienePermisoAdmin(UsuarioPermisos usuario) {
        for (Permiso permiso : usuario.getPermisos()) {
            if (permiso.getNombrePermiso().equals("ROLE_Administrador")) {
                return true;
            }
        }
        return false;
    }
}

