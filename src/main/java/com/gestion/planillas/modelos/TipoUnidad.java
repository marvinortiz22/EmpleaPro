package com.gestion.planillas.modelos;
import jakarta.persistence.*;

@Entity
public class TipoUnidad {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int idTipoUnidad;

    private String nombreTipoUnidad;

    // Getters y Setters

    public TipoUnidad() {
    }

    public int getIdTipoUnidad() {
        return idTipoUnidad;
    }

    public void setIdTipoUnidad(int idTipoUnidad) {
        this.idTipoUnidad = idTipoUnidad;
    }

    public String getNombreTipoUnidad() {
        return nombreTipoUnidad;
    }

    public void setNombreTipoUnidad(String nombreTipoUnidad) {
        this.nombreTipoUnidad = nombreTipoUnidad;
    }
}

