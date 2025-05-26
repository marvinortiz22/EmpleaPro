package com.gestion.planillas.DTO;

public class DepartamentoDTO {
    private String nombreDepartamento;
    private Long cantidadEmpleados;

    public DepartamentoDTO(String nombreDepartamento, Long cantidadEmpleados) {
        this.nombreDepartamento = nombreDepartamento;
        this.cantidadEmpleados = cantidadEmpleados;
    }

    // Getters y setters
    public String getNombreDepartamento() {
        return nombreDepartamento;
    }

    public void setNombreDepartamento(String nombreDepartamento) {
        this.nombreDepartamento = nombreDepartamento;
    }

    public Long getCantidadEmpleados() {
        return cantidadEmpleados;
    }

    public void setCantidadEmpleados(Long cantidadEmpleados) {
        this.cantidadEmpleados = cantidadEmpleados;
    }
}

