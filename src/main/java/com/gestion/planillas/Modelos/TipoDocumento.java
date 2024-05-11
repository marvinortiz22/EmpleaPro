package com.gestion.planillas.Modelos;
import jakarta.persistence.*;

@Entity
@Table(name="TIPODOCUMENTO")
public class TipoDocumento {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int idTipoDoc;
    
    private String nombreDoc;

    // Getters y Setters

    public TipoDocumento() {
    }

    public TipoDocumento(int idTipoDoc, String nombreDoc) {
        this.idTipoDoc = idTipoDoc;
        this.nombreDoc = nombreDoc;
    }

    public int getIdTipoDoc() {
        return idTipoDoc;
    }

    public void setIdTipoDoc(int idTipoDoc) {
        this.idTipoDoc = idTipoDoc;
    }

    public String getNombreDoc() {
        return nombreDoc;
    }

    public void setNombreDoc(String nombreDoc) {
        this.nombreDoc = nombreDoc;
    }
}
