package com.gestion.planillas.DAO;

import java.util.List;

import com.gestion.planillas.modelos.Empleado;
import com.gestion.planillas.modelos.Puesto;

public interface puestoDAO {
    public Puesto getPuesto(Integer id);
    public List<Puesto> getPuestos();
    public void guardarPuesto(Puesto puesto);
    Boolean esUnico(String nombreCampo, String valorCampo);
    public Boolean esUnico(String nombreCampo, String valorCampo, int id);
}
