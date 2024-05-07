package com.gestion.planillas.DAO;

import com.gestion.planillas.modelos.Departamento;
import com.gestion.planillas.modelos.Municipio;

import java.util.List;

public interface demograficoDAO {
    public List<Departamento> getDepartamentos();
    public String depSeleccionado(int idDepartamento);
    public List<Object> countEmpleadosPorMun(int idDepartamento);
    public List<Municipio> getMunicipiosPorDepartamento(int idDepartamento);
}
