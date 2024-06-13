package com.gestion.planillas.modelos;
import jakarta.persistence.*;
import java.sql.Date;

@Entity
@Table(name = "VACACION")
public class Vacacion {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int idVacacion;

    @ManyToOne
    @JoinColumn(name = "IDEMPLEADO")
    private Empleado empleado;

    @Temporal(TemporalType.DATE)
    private Date fechaInicio;

    // Getters and Setters
    public int getIdVacacion() {
        return idVacacion;
    }

    public void setIdVacacion(int idVacacion) {
        this.idVacacion = idVacacion;
    }

    public Empleado getEmpleado() {
        return empleado;
    }

    public void setEmpleado(Empleado empleado) {
        this.empleado = empleado;
    }

    public Date getFechaInicio() {
        return fechaInicio;
    }

    public void setFechaInicio(Date fechaInicio) {
        this.fechaInicio = fechaInicio;
    }
}
