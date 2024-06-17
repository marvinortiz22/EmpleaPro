package com.gestion.planillas.modelos;
import jakarta.persistence.*;

import java.math.BigDecimal;

@Entity
@Table(name = "deduccionbeneficioglobal")
public class DeduccionBeneficioGlobal {

    @Id
    @ManyToOne
    @JoinColumn(name = "IDDEDUCBENEF")
    private DeduccionBeneficio deduccionBeneficio;

    private boolean proporcionalAlSueldo;


    private BigDecimal montoOPorcentaje;


    private boolean estado=true;

    // Getters and Setters


    public DeduccionBeneficio getDeduccionBeneficio() {
        return deduccionBeneficio;
    }

    public void setDeduccionBeneficio(DeduccionBeneficio deduccionBeneficio) {
        this.deduccionBeneficio = deduccionBeneficio;
    }

    public boolean isProporcionalAlSueldo() {
        return proporcionalAlSueldo;
    }

    public void setProporcionalAlSueldo(boolean proporcionalAlSueldo) {
        this.proporcionalAlSueldo = proporcionalAlSueldo;
    }

    public BigDecimal getMontoOPorcentaje() {
        return montoOPorcentaje;
    }

    public void setMontoOPorcentaje(BigDecimal montoOPorcentaje) {
        this.montoOPorcentaje = montoOPorcentaje;
    }

    public boolean isEstado() {
        return estado;
    }

    public void setEstado(boolean estado) {
        this.estado = estado;
    }
}
