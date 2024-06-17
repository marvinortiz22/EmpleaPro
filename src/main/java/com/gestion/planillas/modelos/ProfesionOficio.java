package com.gestion.planillas.modelos;
import jakarta.persistence.*;

import java.util.List;

@Entity
@Table(name="profesionoficio")
public class ProfesionOficio {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int idProfOfc;

    private String nombreProfOfc;
    @ManyToMany(mappedBy = "profesionOficios")
    private List<Empleado> empleados;

    public int getIdProfOfc() {
        return idProfOfc;
    }

    public void setIdProfOfc(int idProfOfc) {
        this.idProfOfc = idProfOfc;
    }

    public String getNombreProfOfc() {
        return nombreProfOfc;
    }

    public void setNombreProfOfc(String nombreProfOfc) {
        this.nombreProfOfc = nombreProfOfc;
    }

    public ProfesionOficio(int idProfOfc, String nombreProfOfc) {
        this.idProfOfc = idProfOfc;
        this.nombreProfOfc = nombreProfOfc;
    }

    public ProfesionOficio() {
    }
}
