package com.gestion.planillas.DAO;

import java.util.List;
import com.gestion.planillas.modelos.*;

public interface rolDAO {
    public List<Rol> getRolesValidos();
    public List<Object[]> getRolConJoin();
}
