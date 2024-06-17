package com.gestion.planillas.modelos;

import jakarta.persistence.*;
import jakarta.validation.constraints.*;
import org.springframework.data.relational.core.sql.In;

import java.math.BigDecimal;

@Entity
@Table(name="puesto")
public class Puesto {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer idPuesto;

    @ManyToOne
    @JoinColumn(name = "IDUNIDAD")
    private Unidad unidad;

    @NotBlank(message = "El campo es obligatorio")
    @Size(max = 50, message = "El campo no puede tener más de 50 caracteres")
    private String nombrePuesto;

    @NotNull(message = "El salario mínimo es obligatorio")
    @DecimalMin(value = "0.01", inclusive = true, message = "El salario mínimo debe ser mayor o igual que 0.01")
    private BigDecimal salarioMin;

    @NotNull(message = "El salario máximo es obligatorio")
    @DecimalMin(value = "0.01", inclusive = true, message = "El salario máximo debe ser mayor o igual que 0.01")
    private BigDecimal salarioMax;

    private boolean estado=true;

    // Getters y Setters

    public Integer getIdPuesto() {
        return idPuesto;
    }

    public void setIdPuesto(Integer idPuesto) {
        this.idPuesto = idPuesto;
    }

    public Unidad getUnidad() {
        return unidad;
    }

    public void setUnidad(Unidad unidad) {
        this.unidad = unidad;
    }

    public String getNombrePuesto() {
        return nombrePuesto;
    }

    public void setNombrePuesto(String nombrePuesto) {
        this.nombrePuesto = nombrePuesto;
    }

    public BigDecimal getSalarioMin() {
        return salarioMin;
    }

    public void setSalarioMin(BigDecimal salarioMin) {
        this.salarioMin = salarioMin;
    }

    public BigDecimal getSalarioMax() {
        return salarioMax;
    }

    public void setSalarioMax(BigDecimal salarioMax) {
        this.salarioMax = salarioMax;
    }

    public boolean isEstado() {
        return estado;
    }

    public void setEstado(boolean estado) {
        this.estado = estado;
    }
}

