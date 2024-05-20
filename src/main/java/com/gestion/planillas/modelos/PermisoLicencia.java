package com.gestion.planillas.modelos;
import jakarta.persistence.*;

@Entity
@Table(name = "PERMISOLICENCIA")
public class PermisoLicencia {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int idPermisoLicencia;

    @Enumerated(EnumType.STRING)
    private Tipo tipo;

    private String causa;

    // Enum for TIPO column
    public enum Tipo {
        P, L
    }

    // Getters and Setters
    public int getIdPermisoLicencia() {
        return idPermisoLicencia;
    }

    public void setIdPermisoLicencia(int idPermisoLicencia) {
        this.idPermisoLicencia = idPermisoLicencia;
    }

    public Tipo getTipo() {
        return tipo;
    }

    public void setTipo(Tipo tipo) {
        this.tipo = tipo;
    }

    public String getCausa() {
        return causa;
    }

    public void setCausa(String causa) {
        this.causa = causa;
    }
}
