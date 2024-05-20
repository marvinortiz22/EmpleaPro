package com.gestion.planillas.modelos;
import jakarta.persistence.*;
import java.util.Date;

@Entity
@Table(name = "PERLIC_EMPLEADO")
public class Perlic_Empleado {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int idPerLic_Emp;

    @ManyToOne
    @JoinColumn(name = "IDEMPLEADO")
    private Empleado empleado;

    @ManyToOne
    @JoinColumn(name = "IDPERMISOLICENCIA")
    private PermisoLicencia permisoLicencia;

    private boolean aprobada;
    private boolean descontable;

    @Temporal(TemporalType.DATE)
    private Date fechaInicio;

    @Temporal(TemporalType.DATE)
    private Date fechaFin;

    private String direccionArchivo;

    // Getters and Setters
    public int getIdPerLic_Emp() {
        return idPerLic_Emp;
    }

    public void setIdPerLic_Emp(int idPerLic_Emp) {
        this.idPerLic_Emp = idPerLic_Emp;
    }

    public Empleado getEmpleado() {
        return empleado;
    }

    public void setEmpleado(Empleado empleado) {
        this.empleado = empleado;
    }

    public PermisoLicencia getPermisoLicencia() {
        return permisoLicencia;
    }

    public void setPermisoLicencia(PermisoLicencia permisoLicencia) {
        this.permisoLicencia = permisoLicencia;
    }

    public boolean isAprobada() {
        return aprobada;
    }

    public void setAprobada(boolean aprobada) {
        this.aprobada = aprobada;
    }

    public boolean isDescontable() {
        return descontable;
    }

    public void setDescontable(boolean descontable) {
        this.descontable = descontable;
    }

    public Date getFechaInicio() {
        return fechaInicio;
    }

    public void setFechaInicio(Date fechaInicio) {
        this.fechaInicio = fechaInicio;
    }

    public Date getFechaFin() {
        return fechaFin;
    }

    public void setFechaFin(Date fechaFin) {
        this.fechaFin = fechaFin;
    }

    public String getDireccionArchivo() {
        return direccionArchivo;
    }

    public void setDireccionArchivo(String direccionArchivo) {
        this.direccionArchivo = direccionArchivo;
    }
}
