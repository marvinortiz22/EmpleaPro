package com.gestion.planillas.estadisticas.departamentos_municipios.repositorios;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.gestion.planillas.modelos.Departamento;
import org.springframework.stereotype.Service;

@Repository
public interface departamentoRepositorio extends JpaRepository<Departamento, Integer> {
}