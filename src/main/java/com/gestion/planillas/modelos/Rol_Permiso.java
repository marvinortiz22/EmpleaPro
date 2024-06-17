package com.gestion.planillas.modelos;
import jakarta.persistence.*;

@Entity
@Table(name="rol_permiso")
public class Rol_Permiso {
    @Id
    @ManyToOne
    @JoinColumn(name = "IDPERMISO")
    private Permiso permiso;

    @Id
    @ManyToOne
    @JoinColumn(name = "IDROL")
    private Rol rol;
    
	public Rol_Permiso() {
		super();
	}
	
	public Rol_Permiso(Permiso permiso, Rol rol) {
		super();
		this.permiso = permiso;
		this.rol = rol;
	}

	public Permiso getPermiso() {
		return permiso;
	}

	public void setPermiso(Permiso permiso) {
		this.permiso = permiso;
	}

	public Rol getRol() {
		return rol;
	}

	public void setRol(Rol rol) {
		this.rol = rol;
	}
    
    // Getters y Setters
}
