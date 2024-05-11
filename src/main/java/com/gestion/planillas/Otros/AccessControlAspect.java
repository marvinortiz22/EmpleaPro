package com.gestion.planillas.Otros;
import com.gestion.planillas.Modelos.Permiso;
import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.*;
import com.gestion.planillas.DAO.usuarioDAO;

import java.util.List;

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

        // Verificar si el usuario tiene los roles requeridos
        String[] requiredRoles = accessControl.roles();
        UsuarioPermisos usuarioPermisos=usuarioDAO.getUsuarioActual();
        List<Permiso> permisos=usuarioPermisos.getPermisos();
        if (requiredRoles.length > 0) {
            boolean hasRequiredRole = false;
            for (String role : requiredRoles) {
                if (permisos.stream()
                        .anyMatch(a -> a.getNombrePermiso().equals(role))) {
                    hasRequiredRole = true;
                    break;
                }
            }
            if (!hasRequiredRole) {
                throw new IllegalAccessException("El usuario no tiene los permisos requeridos");
            }
        }

        // Permitir el acceso al método
        return joinPoint.proceed();
    }
}

