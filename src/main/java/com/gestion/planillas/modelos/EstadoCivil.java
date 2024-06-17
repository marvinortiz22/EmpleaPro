package com.gestion.planillas.modelos;
import jakarta.persistence.*;

@Entity
@Table(name="estadocivil")
public class EstadoCivil {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int idEstadoCivil;

    private String nombreEstado;

    public int getIdEstadoCivil() {
        return idEstadoCivil;
    }

    public void setIdEstadoCivil(int idEstadoCivil) {
        this.idEstadoCivil = idEstadoCivil;
    }

    public String getNombreEstado() {
        return nombreEstado;
    }

    public void setNombreEstado(String nombreEstado) {
        this.nombreEstado = nombreEstado;
    }

    public EstadoCivil(int idEstadoCivil, String nombreEstado) {
        this.idEstadoCivil = idEstadoCivil;
        this.nombreEstado = nombreEstado;
    }

    public EstadoCivil() {
    }
}
