package com.gestion.planillas.DAO;
import java.util.List;
public interface contaduriaDAO {
    public List<Object[]> planilla(String fecha1,String fecha2);
    public Object[] planillaEmpleado(String fecha1,String fecha2, int id);
    public Object[] planillaEmpleado2(String fecha1,String fecha2, String numerodoc);
    public Double getSalarioNeto(String fecha1,String fecha2, int id);
}
