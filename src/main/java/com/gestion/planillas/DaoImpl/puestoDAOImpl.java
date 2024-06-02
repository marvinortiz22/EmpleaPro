package com.gestion.planillas.DaoImpl;

import com.gestion.planillas.DAO.puestoDAO;
import com.gestion.planillas.modelos.Empleado;
import com.gestion.planillas.modelos.Usuario;
import jakarta.transaction.Transactional;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.gestion.planillas.modelos.Puesto;

import java.util.List;

@Repository
public class puestoDAOImpl implements puestoDAO {
    @Autowired
    private SessionFactory sessionFactory;

    @Override
    public Puesto getPuesto(Integer id) {
        Session session=sessionFactory.getCurrentSession();
        Puesto puesto = session.get(Puesto.class,id);
        return puesto;
    }

    @Override
    public List<Puesto> getPuestos() {
        Session session=sessionFactory.getCurrentSession();
        Query<Puesto> query=session.createQuery("from Puesto",Puesto.class);
        List<Puesto> puestos= query.getResultList();
        return puestos;

    }

    @Override
    public List<Puesto> getPuestosActivados() {
        Session session=sessionFactory.getCurrentSession();
        Query<Puesto> query=session.createQuery("from Puesto WHERE estado = true",Puesto.class);
        List<Puesto> puestos= query.getResultList();
        return puestos;

    }

    @Override
    @Transactional
    public void guardarPuesto(Puesto puesto) {
        Session session=sessionFactory.getCurrentSession();
        session.saveOrUpdate(puesto);
    }

    @Override
    public Boolean esUnico(String nombreCampo, String valorCampo) {
        Session session = sessionFactory.openSession();
        Query query = session.createQuery("FROM Puesto WHERE "+nombreCampo+" = :valorCampo",Puesto.class);
        query.setParameter("valorCampo", valorCampo);

        Puesto puesto = (Puesto) query.uniqueResult();
        session.close();

        if (puesto == null) {
            return true;
        }

        return false;
    }

    @Override
    public Boolean esUnico(String nombreCampo, String valorCampo, int id) {
        Session session = sessionFactory.openSession();
        Query query = session.createQuery("FROM Puesto WHERE "+nombreCampo+" = :valorCampo AND idPuesto!=:id",Puesto.class);
        query.setParameter("valorCampo", valorCampo);
        query.setParameter("id", id);

        Puesto puesto = (Puesto) query.uniqueResult();
        session.close();

        if (puesto == null) {
            return true;
        }

        return false;
    }
}
