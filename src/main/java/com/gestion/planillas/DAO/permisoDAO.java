package com.gestion.planillas.DAO;

import com.gestion.planillas.modelos.Permiso;

import java.util.List;

public interface permisoDAO {

    public Permiso getPermiso(int id);
    public List<Permiso> getPermisos();
    public List<Permiso> getPermisosPorRol(int idRol);

}
