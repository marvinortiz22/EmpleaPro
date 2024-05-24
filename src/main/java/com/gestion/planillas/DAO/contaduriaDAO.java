package com.gestion.planillas.DAO;
import java.util.List;
public interface contaduriaDAO {
    public List<Object[]> planilla(String fecha1,String fecha2);
}
