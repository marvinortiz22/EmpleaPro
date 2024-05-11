package com.gestion.planillas.DaoImpl;
import com.gestion.planillas.DAO.oficioDAO;
import com.gestion.planillas.modelos.ProfesionOficio;
import jakarta.transaction.Transactional;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class oficioDAOImpl implements oficioDAO {
    @Autowired
    private SessionFactory sessionFactory;

    @Override
    public List<ProfesionOficio> getProfyOficios(){
        Session session=sessionFactory.getCurrentSession();
        Query<ProfesionOficio> query = session.createQuery("FROM ProfesionOficio ORDER BY idProfOfc", ProfesionOficio.class);
        return query.getResultList();
    }

    @Override
    public ProfesionOficio getOficio(int id) {
        Session session=sessionFactory.getCurrentSession();
        ProfesionOficio oficio=session.get(ProfesionOficio.class,id);
        return oficio;
    }

    @Override
    @Transactional
    public void guardarOficio(ProfesionOficio oficio) {
        Session session= sessionFactory.getCurrentSession();
        session.saveOrUpdate(oficio);
    }

}
