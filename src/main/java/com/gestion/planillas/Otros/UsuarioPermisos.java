package com.gestion.planillas.Otros;

import com.gestion.planillas.modelos.Permiso;

import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.Date;
import java.util.List;


public class UsuarioPermisos {
    private  String username;

    private String fecha;
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

    public String getFecha() {
        LocalDate fechaActual = LocalDate.now();
        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("dd/MM/yyyy");
        return fechaActual.format(formatter);
    }

    public List<Permiso> getPermisos() {
        return permisos;
    }

}
