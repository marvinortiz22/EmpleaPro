package com.gestion.planillas.modelos;
import jakarta.persistence.*;
import java.util.Date;

@Entity
@Table(name = "auditoria_deduccionbeneficioempleado")
public class Auditoria_DeduccionBeneficioEmpleado {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int idAuditoria_DeducBenefEmp;

    @ManyToOne
    @JoinColumn(name = "IDDEDUCBENEF_EMP")
    private DeduccionBeneficio_Empleado deduccionBeneficioEmpleado;

    @ManyToOne
    @JoinColumn(name = "IDDEDUCBENEF")
    private DeduccionBeneficio deduccionBeneficio;

    @ManyToOne
    @JoinColumn(name = "IDEMPLEADO")
    private Empleado empleado;

    private boolean proporcionalAlSueldo;
    private double montoOPorcentaje;

    private boolean estado;
    private Date fechaDeOperacion;
    private String tipoDeOperacion;

    @ManyToOne
    @JoinColumn(name = "USUARIOREGISTRA")
    private Usuario usuarioRegistra;

    // Getters and Setters

    public int getIdAuditoriaDeducBenefEmp() {
        return idAuditoria_DeducBenefEmp;
    }

    public void setIdAuditoriaDeducBenefEmp(int idAuditoriaDeducBenefEmp) {
        this.idAuditoria_DeducBenefEmp = idAuditoriaDeducBenefEmp;
    }

    public DeduccionBeneficio getDeduccionBeneficio() {
        return deduccionBeneficio;
    }

    public void setDeduccionBeneficio(DeduccionBeneficio deduccionBeneficio) {
        this.deduccionBeneficio = deduccionBeneficio;
    }

    public DeduccionBeneficio_Empleado getDeduccionBeneficioEmpleado() {
        return deduccionBeneficioEmpleado;
    }

    public void setDeduccionBeneficioEmpleado(DeduccionBeneficio_Empleado deduccionBeneficioEmpleado) {
        this.deduccionBeneficioEmpleado = deduccionBeneficioEmpleado;
    }

    public Empleado getEmpleado() {
        return empleado;
    }

    public void setEmpleado(Empleado empleado) {
        this.empleado = empleado;
    }

    public boolean isProporcionalAlSueldo() {
        return proporcionalAlSueldo;
    }

    public void setProporcionalAlSueldo(boolean proporcionalAlSueldo) {
        this.proporcionalAlSueldo = proporcionalAlSueldo;
    }

    public double getMontoOPorcentaje() {
        return montoOPorcentaje;
    }

    public void setMontoOPorcentaje(double montoOPorcentaje) {
        this.montoOPorcentaje = montoOPorcentaje;
    }

    public Date getFechaDeOperacion() {
        return fechaDeOperacion;
    }

    public void setFechaDeOperacion(Date fechaDeOperacion) {
        this.fechaDeOperacion = fechaDeOperacion;
    }

    public String getTipoDeOperacion() {
        return tipoDeOperacion;
    }

    public void setTipoDeOperacion(String tipoDeOperacion) {
        this.tipoDeOperacion = tipoDeOperacion;
    }

    public Usuario getUsuarioRegistra() {
        return usuarioRegistra;
    }

    public void setUsuarioRegistra(Usuario usuarioRegistra) {
        this.usuarioRegistra = usuarioRegistra;
    }

    public boolean isEstado() {
        return estado;
    }

    public void setEstado(boolean estado) {
        this.estado = estado;
    }
}
