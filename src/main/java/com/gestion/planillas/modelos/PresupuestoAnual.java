package com.gestion.planillas.modelos;
import jakarta.persistence.*;

import java.math.BigDecimal;

@Entity
@Table(name="PRESUPUESTOANUAL")
public class PresupuestoAnual {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int idPresupuesto;

    @ManyToOne
    @JoinColumn(name = "IDUNIDAD")
    private Unidad unidad;

    private int ano;
    private BigDecimal monto;

    public int getIdPresupuesto() {
        return idPresupuesto;
    }

    public void setIdPresupuesto(int idPresupuesto) {
        this.idPresupuesto = idPresupuesto;
    }

    public Unidad getUnidad() {
        return unidad;
    }

    public void setUnidad(Unidad unidad) {
        this.unidad = unidad;
    }

    public int getAno() {
        return ano;
    }

    public void setAno(int ano) {
        this.ano = ano;
    }

    public BigDecimal getMonto() {
        return monto;
    }

    public void setMonto(BigDecimal monto) {
        this.monto = monto;
    }

    public PresupuestoAnual(int idPresupuesto, Unidad unidad, int ano, BigDecimal monto) {
        this.idPresupuesto = idPresupuesto;
        this.unidad = unidad;
        this.ano = ano;
        this.monto = monto;
    }

    public PresupuestoAnual() {
    }
}
