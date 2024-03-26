package com.gestion.planillas.modelos;
import jakarta.persistence.*;

@Entity
public class TipoDocumento {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int idTipoDoc;
    
    private String nombreDoc;

    // Getters y Setters
}
