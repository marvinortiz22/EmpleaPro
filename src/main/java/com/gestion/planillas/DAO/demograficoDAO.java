package com.gestion.planillas.DAO;

import java.util.List;

public interface demograficoDAO {
    public List<Object> countEmpleadosPorDep();
    public List<Object> countEmpleadosPorMun(int idDepartamento);
    public List<Object[]> countEmpleadosPorEstadoCivil();
    public String depSeleccionado(int idDepartamento);
    public long getNumEmpleados();

    /*public List<Departamento> getDepartamentos();

    public List<Municipio> getMunicipiosPorDepartamento(int idDepartamento);*/
}
