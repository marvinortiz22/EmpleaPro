package com.gestion.planillas.DAO;
import com.gestion.planillas.modelos.ProfesionOficio;
import java.util.List;

public interface oficioDAO {
    public List<ProfesionOficio> getProfyOficios();
    public ProfesionOficio getOficio(int id);
    public void guardarOficio(ProfesionOficio oficio);
}
