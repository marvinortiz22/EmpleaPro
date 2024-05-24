package com.gestion.planillas.DAO;

import java.util.List;

import com.gestion.planillas.modelos.PresupuestoAnual;

public interface presupuestoDAO {
    public List<PresupuestoAnual> getPresupuestosUnidad(int idUnidad);
    public void agregarEditarPresupuesto(PresupuestoAnual presupuesto);
    public PresupuestoAnual getPresupuesto(int idPresupuesto);
}
