package com.gestion.planillas.Otros;

import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Before;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;


@Aspect
@Component
public class SessionVariableInterceptor {
    @Autowired
    private com.gestion.planillas.DAO.usuarioDAO usuarioDAO;

    @Before("execution(* com.gestion.planillas.Controllers.*.*(..))")
    public void beforeCrudOperation() {
        usuarioDAO.asignarVariableSesionUser();
    }
}
