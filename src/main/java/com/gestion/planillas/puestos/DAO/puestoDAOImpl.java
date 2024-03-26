package com.gestion.planillas.puestos.DAO;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.gestion.planillas.modelos.Puesto;

import java.util.ArrayList;
import java.util.List;
import java.util.concurrent.CopyOnWriteArrayList;

@Repository
public class puestoDAOImpl implements puestoDAO {
    @Autowired
    private SessionFactory sessionFactory;
    @Override
    public List<Puesto> getPuestos() {
        Session session=sessionFactory.openSession();
        Query<Puesto> query=session.createQuery("from Puesto",Puesto.class);
        List<Puesto> puestos= query.getResultList();
        session.close();
        return puestos;

    }
}
