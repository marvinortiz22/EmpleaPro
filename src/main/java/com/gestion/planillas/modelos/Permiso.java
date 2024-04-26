package com.gestion.planillas.modelos;
import jakarta.persistence.*;

@Entity
@Table(name="PERMISO")
public class Permiso {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int idPermiso;
    
    private String nombrePermiso;

    // Getters y Setters

    public Permiso() {
    }

    public Permiso(int idPermiso, String nombrePermiso) {
        this.idPermiso = idPermiso;
        this.nombrePermiso = nombrePermiso;
    }

    public int getIdPermiso() {
        return idPermiso;
    }

    public void setIdPermiso(int idPermiso) {
        this.idPermiso = idPermiso;
    }

    public String getNombrePermiso() {
        return nombrePermiso;
    }

    public void setNombrePermiso(String nombrePermiso) {
        this.nombrePermiso = nombrePermiso;
    }
}
