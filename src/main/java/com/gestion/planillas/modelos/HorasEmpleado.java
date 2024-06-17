package com.gestion.planillas.modelos;
import jakarta.persistence.*;

import java.time.LocalDate;
import java.time.LocalTime;
import java.sql.Time;
import java.sql.Date;

@Entity
@Table(name = "horasempleado")
public class HorasEmpleado {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int idHorasEmpleado;

    @ManyToOne
    @JoinColumn(name = "IDEMPLEADO")
    private Empleado empleado;


    private Date fecha;


    private Time horaIngreso;
    private Time horaSalida;
    public HorasEmpleado() {
    }

    // Getters and Setters
    public int getIdHorasEmpleado() {
        return idHorasEmpleado;
    }

    public void setIdHorasEmpleado(int idHorasEmpleado) {
        this.idHorasEmpleado = idHorasEmpleado;
    }

    public Empleado getEmpleado() {
        return empleado;
    }

    public void setEmpleado(Empleado empleado) {
        this.empleado = empleado;
    }

    public Date getFecha() {
        return fecha;
    }

    public void setFecha(Date fecha) {
        this.fecha = fecha;
    }

    public Time getHoraIngreso() {
        return horaIngreso;
    }

    public void setHoraIngreso(Time horaIngreso) {
        this.horaIngreso = horaIngreso;
    }

    public Time getHoraSalida() {
        return horaSalida;
    }

    public void setHoraSalida(Time horaSalida) {
        this.horaSalida = horaSalida;
    }
}
