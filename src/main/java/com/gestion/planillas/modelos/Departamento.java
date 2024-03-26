package com.gestion.planillas.modelos;

import jakarta.persistence.*;

@Entity
@Table(name="DEPARTAMENTO")
public class Departamento {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name="IDDEPARTAMENTO")
    private int idDepartamento;
    @Column(name="NOMBREDEPARTAMENTO")
    private String nombreDepartamento;

    public int getIdDepartamento() {
        return idDepartamento;
    }

    public void setIdDepartamento(int idDepartamento) {
        this.idDepartamento = idDepartamento;
    }

    public String getNombreDepartamento() {
        return nombreDepartamento;
    }

    public void setNombreDepartamento(String nombreDepartamento) {
        this.nombreDepartamento = nombreDepartamento;
    }
}
