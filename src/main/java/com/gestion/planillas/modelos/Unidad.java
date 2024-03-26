package com.gestion.planillas.modelos;
import jakarta.persistence.*;
import lombok.Data;
import lombok.Getter;

@Entity
public class Unidad {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int idUnidad;

    @ManyToOne
    @JoinColumn(name = "IDTIPOUNIDAD")
    private TipoUnidad tipoUnidad;

    @ManyToOne
    @JoinColumn(name = "UNI_IDUNIDAD")
    private Unidad unidadPadre;

    private String nombreUnidad;
    private boolean estado;

    // Getters y Setters

    public Unidad() {
    }

    public int getIdUnidad() {
        return idUnidad;
    }

    public void setIdUnidad(int idUnidad) {
        this.idUnidad = idUnidad;
    }

    public TipoUnidad getTipoUnidad() {
        return tipoUnidad;
    }

    public void setTipoUnidad(TipoUnidad tipoUnidad) {
        this.tipoUnidad = tipoUnidad;
    }

    public Unidad getUnidadPadre() {
        return unidadPadre;
    }

    public void setUnidadPadre(Unidad unidadPadre) {
        this.unidadPadre = unidadPadre;
    }

    public String getNombreUnidad() {
        return nombreUnidad;
    }

    public void setNombreUnidad(String nombreUnidad) {
        this.nombreUnidad = nombreUnidad;
    }

    public boolean isEstado() {
        return estado;
    }

    public void setEstado(boolean estado) {
        this.estado = estado;
    }
}

