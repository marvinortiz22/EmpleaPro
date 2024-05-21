package com.gestion.planillas.modelos;
import jakarta.persistence.*;

@Entity
@Table(name = "DEDUCCIONBENEFICIO")
public class DeduccionBeneficio {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int idDeducBenef;

    private String nombreDeducBenef;


    private String tipo;

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

    public String getTipo() {
        return tipo;
    }

    public void setTipo(String tipo) {
        this.tipo = tipo;
    }
}
