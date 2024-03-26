package com.gestion.planillas.modelos;
import jakarta.persistence.*;

@Entity
public class Rol {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int idRol;
    
    private String nombreRol;

    // Getters y Setters
}
