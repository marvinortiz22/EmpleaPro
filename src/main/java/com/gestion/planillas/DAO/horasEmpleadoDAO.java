package com.gestion.planillas.DAO;

import com.gestion.planillas.modelos.HorasEmpleado;

import java.util.List;

public interface horasEmpleadoDAO {
    public List<HorasEmpleado> getHorasEmpleadoList();
    public List<HorasEmpleado> getHorasEmpleadoHoy();
    public HorasEmpleado getHorasEmpleado(int id);
    public void guardar(HorasEmpleado horasEmpleado);
}
