package com.gestion.planillas.modelos;
import jakarta.persistence.*;

@Entity
public class Permiso {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int idPermiso;
    
    private String nombrePermiso;

    // Getters y Setters
}
