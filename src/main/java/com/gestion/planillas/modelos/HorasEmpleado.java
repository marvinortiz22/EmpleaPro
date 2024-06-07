package com.gestion.planillas.modelos;
import jakarta.persistence.*;
import java.util.Date;

@Entity
@Table(name = "HORASEMPLEADO")
public class HorasEmpleado {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int idHorasEmpleado;

    @ManyToOne
    @JoinColumn(name = "IDEMPLEADO")
    private Empleado empleado;

    @Temporal(TemporalType.DATE)
    private Date fecha;

    @Temporal(TemporalType.TIME)
    private Date horaIngreso;

    @Temporal(TemporalType.TIME)
    private Date horaSalida;
    public HorasEmpleado() {
    }
    public HorasEmpleado(int idHorasEmpleado, Empleado empleado, Date fecha, Date horaIngreso, Date horaSalida) {
        this.idHorasEmpleado = idHorasEmpleado;
        this.empleado = empleado;
        this.fecha = fecha;
        this.horaIngreso = horaIngreso;
        this.horaSalida = horaSalida;
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

    public Date getHoraIngreso() {
        return horaIngreso;
    }

    public void setHoraIngreso(Date horaIngreso) {
        this.horaIngreso = horaIngreso;
    }

    public Date getHoraSalida() {
        return horaSalida;
    }

    public void setHoraSalida(Date horaSalida) {
        this.horaSalida = horaSalida;
    }
}
