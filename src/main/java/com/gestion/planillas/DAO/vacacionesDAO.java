package com.gestion.planillas.DAO;

import com.gestion.planillas.modelos.Vacacion;

import java.util.List;

public interface vacacionesDAO {
    public List<Vacacion> getVacaciones();
    public List<Vacacion> getVacacionesAñoActual();
    public Vacacion getVacacion(int id);

    public void guardar(Vacacion vacacion);
}
