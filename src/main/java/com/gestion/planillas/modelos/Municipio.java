package com.gestion.planillas.modelos;
import jakarta.persistence.*;

@Entity
@Table(name="MUNICIPIO")
public class Municipio {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int idMunicipio;

    @ManyToOne
    @JoinColumn(name = "IDDEPARTAMENTO")
    private Departamento departamento;

    private String nombreMunicipio;

    public int getIdMunicipio() {
        return idMunicipio;
    }

    public void setIdMunicipio(int idMunicipio) {
        this.idMunicipio = idMunicipio;
    }

    public Departamento getDepartamento() {
        return departamento;
    }

    public void setDepartamento(Departamento departamento) {
        this.departamento = departamento;
    }

    public String getNombreMunicipio() {
        return nombreMunicipio;
    }

    public void setNombreMunicipio(String nombreMunicipio) {
        this.nombreMunicipio = nombreMunicipio;
    }

    public Municipio(int idMunicipio, Departamento departamento, String nombreMunicipio) {
        this.idMunicipio = idMunicipio;
        this.departamento = departamento;
        this.nombreMunicipio = nombreMunicipio;
    }

    public Municipio() {
    }
}
