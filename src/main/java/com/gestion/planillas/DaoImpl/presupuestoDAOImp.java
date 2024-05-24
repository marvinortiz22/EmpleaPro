package com.gestion.planillas.DaoImpl;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.gestion.planillas.DAO.presupuestoDAO;
import com.gestion.planillas.modelos.PresupuestoAnual;

import jakarta.transaction.Transactional;

@Repository
public class presupuestoDAOImp implements presupuestoDAO {
    @Autowired
    SessionFactory sessionFactory;

    @Override
    public List<PresupuestoAnual> getPresupuestosUnidad(int idUnidad) {
        Session session = sessionFactory.getCurrentSession();
        Query<PresupuestoAnual> query = session.createQuery("from PresupuestoAnual where unidad.idUnidad = :idUnidad order by idPresupuesto desc", PresupuestoAnual.class);
        query.setParameter("idUnidad", idUnidad);
        List<PresupuestoAnual> presupuestos = query.getResultList();
        return presupuestos;
    }

    @Override
    @Transactional
    public void agregarEditarPresupuesto(PresupuestoAnual presupuesto) {
        Session session = sessionFactory.getCurrentSession();
        session.saveOrUpdate(presupuesto);
    }

    @Override
    public PresupuestoAnual getPresupuesto(int idPresupuesto) {
        Session session = sessionFactory.getCurrentSession();
        PresupuestoAnual presupuesto = session.get(PresupuestoAnual.class, idPresupuesto);
        return presupuesto;
    }
}
