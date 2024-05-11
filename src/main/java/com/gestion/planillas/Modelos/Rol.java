package com.gestion.planillas.Modelos;
import jakarta.persistence.*;

import java.util.List;

@Entity
@Table(name="ROL")
public class Rol {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int idRol;
    
    private String nombreRol;

    private boolean estado=true;

    @ManyToMany
    @JoinTable(
            name="ROL_PERMISO",
            joinColumns =@JoinColumn(name="idRol"),
            inverseJoinColumns = @JoinColumn(name="idPermiso")
    )
    private List<Permiso> permisos;

    // Getters y Setters

    public Rol() {
    }
    public List<Permiso> getPermisos() {
        return permisos;
    }

    public void setPermisos(List<Permiso> permisos) {
        this.permisos = permisos;
    }

    public int getIdRol() {
        return idRol;
    }

    public void setIdRol(int idRol) {
        this.idRol = idRol;
    }

    public String getNombreRol() {
        return nombreRol;
    }

    public void setNombreRol(String nombreRol) {
        this.nombreRol = nombreRol;
    }

    public boolean isEstado() {
		return estado;
	}
	public void setEstado(boolean estado) {
		this.estado = estado;
	}

    public Rol(int idRol, String nombreRol,boolean estado) {

        this.idRol = idRol;
        this.nombreRol = nombreRol;
        this.estado=estado;
    }
}
