package com.gestion.planillas.DAO;

import java.util.List;

import com.gestion.planillas.modelos.Unidad;

public interface unidadesDAO {
    public List<Unidad> getUnidades();
    public List<Unidad> getUnidadesActivadas();
    public List<Unidad> getUnidadesList();
    public void agregarEditarUnidad(Unidad unidad);
    public Unidad getUnidad(int idUnidad);
}
