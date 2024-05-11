package com.gestion.planillas.DaoImpl;

import com.gestion.planillas.DAO.puestoDAO;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.gestion.planillas.Modelos.Puesto;

import java.util.List;

@Repository
public class puestoDAOImpl implements puestoDAO {
    @Autowired
    private SessionFactory sessionFactory;
    @Override
    public List<Puesto> getPuestos() {
        Session session=sessionFactory.getCurrentSession();
        Query<Puesto> query=session.createQuery("from Puesto",Puesto.class);
        List<Puesto> puestos= query.getResultList();
        return puestos;

    }
}
