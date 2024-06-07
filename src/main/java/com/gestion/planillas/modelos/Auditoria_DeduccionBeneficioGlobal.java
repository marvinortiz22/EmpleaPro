package com.gestion.planillas.modelos;
import jakarta.persistence.*;
import java.util.Date;

@Entity
@Table(name = "AUDITORIA_DEDUCCIONBENEFICIOGLOBAL")
public class Auditoria_DeduccionBeneficioGlobal {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int idAuditoria_IdDeducBenef;

    @ManyToOne
    @JoinColumn(name = "IDDEDUCBENEF")
    private DeduccionBeneficio deduccionBeneficio;

    private String nombreDeducBenef;
    private String tipo;
    private boolean proporcionalAlSueldo;
    private double montoOPorcentaje;
    private boolean estado;
    private Date fechaDeOperacion;
    private String tipoDeOperacion;

    @ManyToOne
    @JoinColumn(name = "USUARIOREGISTRA")
    private Usuario usuarioRegistra;

    // Getters and Setters

    public int getIdAuditoria_IdDeducBenef() {
        return idAuditoria_IdDeducBenef;
    }

    public void setIdAuditoria_IdDeducBenef(int idAuditoria_IdDeducBenef) {
        this.idAuditoria_IdDeducBenef = idAuditoria_IdDeducBenef;
    }

    public DeduccionBeneficio getDeduccionBeneficio() {
        return deduccionBeneficio;
    }

    public void setDeduccionBeneficio(DeduccionBeneficio deduccionBeneficio) {
        this.deduccionBeneficio = deduccionBeneficio;
    }

    public String getNombreDeducBenef() {
        return nombreDeducBenef;
    }

    public void setNombreDeducBenef(String nombreDeducBenef) {
        this.nombreDeducBenef = nombreDeducBenef;
    }

    public String getTipo() {
        return tipo;
    }

    public void setTipo(String tipo) {
        this.tipo = tipo;
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

    public boolean isEstado() {
        return estado;
    }

    public void setEstado(boolean estado) {
        this.estado = estado;
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
}

