package com.gestion.planillas.DAO;

import com.gestion.planillas.modelos.Permiso;

import java.util.List;

public interface permisoDAO {
    public List<Permiso> getPermisosPorRol(int idRol);
}
