package com.gestion.planillas.DaoImpl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.hibernate.Session;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.gestion.planillas.DAO.unidadesDAO;
import com.gestion.planillas.modelos.PresupuestoAnual;
import com.gestion.planillas.modelos.Unidad;

import jakarta.transaction.Transactional;

@Repository
public class unidadesDAOImp implements unidadesDAO {
    @Autowired
    private SessionFactory sessionFactory;
    
    @Override
    public List<Unidad> getUnidades() {
        Session session = sessionFactory.getCurrentSession();
        Query<Unidad> query = session.createQuery("from Unidad", Unidad.class);
        List<Unidad> unidades = query.getResultList();
        return unidades;
    }

    @Override
    public List<Unidad> getUnidadesList() {
        Session session = sessionFactory.getCurrentSession();
        Query<Unidad> query = session.createQuery("from Unidad", Unidad.class);
        List<Unidad> unidades = query.getResultList();
        return unidades;
    }

    @Override
    @Transactional
    public void agregarEditarUnidad(Unidad unidad) {
        Session session = sessionFactory.getCurrentSession();
        if (unidad.getUnidadPadre().getIdUnidad() == 0) {
            unidad.setUnidadPadre(null);
        }
        session.saveOrUpdate(unidad);
    }

    @Override
    public Unidad getUnidad(int idUnidad) {
        Session session = sessionFactory.getCurrentSession();
        Unidad unidad = session.get(Unidad.class, idUnidad);
        return unidad;
    }
}
