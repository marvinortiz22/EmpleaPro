package com.gestion.planillas.modelos;
import jakarta.persistence.*;

@Entity
@Table(name="ROL")
public class Rol {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int idRol;
    
    private String nombreRol;

    private boolean estado=true;

    // Getters y Setters

    public Rol() {
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
