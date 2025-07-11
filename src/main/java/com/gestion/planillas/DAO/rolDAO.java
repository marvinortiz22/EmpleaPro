package com.gestion.planillas.DAO;

import java.util.List;
import com.gestion.planillas.modelos.*;

public interface rolDAO {
    public List<Rol> getRolesValidos();
    public Rol getRol(int id);
    public List<Object[]> getRolConJoin();
    public void guardarRol(Rol rol);
    public Rol getByNombre(String nombre);
}
