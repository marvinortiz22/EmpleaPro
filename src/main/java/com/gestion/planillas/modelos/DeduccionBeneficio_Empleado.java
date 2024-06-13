package com.gestion.planillas.modelos;
import jakarta.persistence.*;
import java.math.BigDecimal;

@Entity
@Table(name = "DEDUCCIONBENEFICIO_EMPLEADO")
public class DeduccionBeneficio_Empleado {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int idDeducBenef_Emp;

    @ManyToOne
    @JoinColumn(name = "IDEMPLEADO")
    private Empleado empleado;

    @ManyToOne
    @JoinColumn(name = "IDDEDUCBENEF")
    private DeduccionBeneficio deduccionBeneficio;


    private boolean proporcionalAlSueldo;


    private BigDecimal montoOPorcentaje;


    private boolean estado;

    // Getters and Setters
    public int getIdDeducBenef_Emp() {
        return idDeducBenef_Emp;
    }

    public void setIdDeducBenef_Emp(int idDeducBenef_Emp) {
        this.idDeducBenef_Emp = idDeducBenef_Emp;
    }

    public Empleado getEmpleado() {
        return empleado;
    }

    public void setEmpleado(Empleado empleado) {
        this.empleado = empleado;
    }

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
