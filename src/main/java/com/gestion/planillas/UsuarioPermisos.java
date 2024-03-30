package com.gestion.planillas;

import com.gestion.planillas.modelos.Permiso;
import com.gestion.planillas.modelos.Usuario;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import com.gestion.planillas.DAO.usuarioDAO;
import java.util.List;


public class UsuarioPermisos {
    private  String username;
    private List<Permiso> permisos;

    public UsuarioPermisos() {
    }

    public UsuarioPermisos(String username, List<Permiso> permisos) {
        this.username = username;
        this.permisos = permisos;
    }

    public String getUsername() {
        return username;
    }

    public List<Permiso> getPermisos() {
        return permisos;
    }

}
