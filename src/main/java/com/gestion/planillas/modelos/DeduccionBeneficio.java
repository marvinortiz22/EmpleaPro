package com.gestion.planillas.modelos;
import jakarta.persistence.*;

@Entity
@Table(name = "DEDUCCIONBENEFICIO")
public class DeduccionBeneficio {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int idDeducBenef;

    private String nombreDeducBenef;

    @Enumerated(EnumType.STRING)
    private Tipo tipo;

    // Enum for TIPO column
    public enum Tipo {
        D, B
    }

    // Getters and Setters
    public int getIdDeducBenef() {
        return idDeducBenef;
    }

    public void setIdDeducBenef(int idDeducBenef) {
        this.idDeducBenef = idDeducBenef;
    }

    public String getNombreDeducBenef() {
        return nombreDeducBenef;
    }

    public void setNombreDeducBenef(String nombreDeducBenef) {
        this.nombreDeducBenef = nombreDeducBenef;
    }

    public Tipo getTipo() {
        return tipo;
    }

    public void setTipo(Tipo tipo) {
        this.tipo = tipo;
    }
}
