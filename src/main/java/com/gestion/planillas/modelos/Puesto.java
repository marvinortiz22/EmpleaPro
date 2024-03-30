package com.gestion.planillas.modelos;

import jakarta.persistence.*;
import java.math.BigDecimal;

@Entity
public class Puesto {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int idPuesto;

    @ManyToOne
    @JoinColumn(name = "IDUNIDAD")
    private Unidad unidad;

    private String nombrePuesto;

    private BigDecimal salarioMin;
    private BigDecimal salarioMax;
    private boolean estado=true;

    // Getters y Setters

    public int getIdPuesto() {
        return idPuesto;
    }

    public void setIdPuesto(int idPuesto) {
        this.idPuesto = idPuesto;
    }

    public Unidad getUnidad() {
        return unidad;
    }

    public void setUnidad(Unidad unidad) {
        this.unidad = unidad;
    }

    public String getNombrePuesto() {
        return nombrePuesto;
    }

    public void setNombrePuesto(String nombrePuesto) {
        this.nombrePuesto = nombrePuesto;
    }

    public BigDecimal getSalarioMin() {
        return salarioMin;
    }

    public void setSalarioMin(BigDecimal salarioMin) {
        this.salarioMin = salarioMin;
    }

    public BigDecimal getSalarioMax() {
        return salarioMax;
    }

    public void setSalarioMax(BigDecimal salarioMax) {
        this.salarioMax = salarioMax;
    }

    public boolean isEstado() {
        return estado;
    }

    public void setEstado(boolean estado) {
        this.estado = estado;
    }
}

