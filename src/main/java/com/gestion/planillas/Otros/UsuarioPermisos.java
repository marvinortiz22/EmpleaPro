package com.gestion.planillas.Otros;

import com.gestion.planillas.modelos.Permiso;

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
