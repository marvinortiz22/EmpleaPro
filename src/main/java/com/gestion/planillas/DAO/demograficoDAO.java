package com.gestion.planillas.DAO;

import com.gestion.planillas.modelos.Departamento;
import com.gestion.planillas.modelos.Municipio;

import java.util.List;

public interface demograficoDAO {
    public List<Object> countEmpleadosPorDep();
    public List<Object> countEmpleadosPorMun(int idDepartamento);
    public String depSeleccionado(int idDepartamento);
    public long getNumEmpleados();

    /*public List<Departamento> getDepartamentos();

    public List<Municipio> getMunicipiosPorDepartamento(int idDepartamento);*/
}
