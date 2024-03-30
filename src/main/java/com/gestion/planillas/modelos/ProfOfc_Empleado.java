package com.gestion.planillas.modelos;
import jakarta.persistence.*;

@Entity
public class ProfOfc_Empleado {
    @Id
    @ManyToOne
    @JoinColumn(name = "IDPROFOFC")
    private ProfesionOficio profesionOficio;

    @Id
    @ManyToOne
    @JoinColumn(name = "IDEMPLEADO")
    private Empleado empleado;

    public ProfesionOficio getProfesionOficio() {
        return profesionOficio;
    }

    public void setProfesionOficio(ProfesionOficio profesionOficio) {
        this.profesionOficio = profesionOficio;
    }

    public Empleado getEmpleado() {
        return empleado;
    }

    public void setEmpleado(Empleado empleado) {
        this.empleado = empleado;
    }

    public ProfOfc_Empleado(ProfesionOficio profesionOficio, Empleado empleado) {
        this.profesionOficio = profesionOficio;
        this.empleado = empleado;
    }

    public ProfOfc_Empleado() {
    }
}
