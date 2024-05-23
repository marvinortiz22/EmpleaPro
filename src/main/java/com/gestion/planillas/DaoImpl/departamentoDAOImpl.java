package com.gestion.planillas.DaoImpl;

import com.gestion.planillas.DAO.departamentoDAO;
import com.gestion.planillas.modelos.Departamento;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class departamentoDAOImpl implements departamentoDAO {
    @Autowired
    private SessionFactory sessionFactory;
    @Override
    public List<Departamento> getDepartamentos() {
        Session session=sessionFactory.getCurrentSession();
        Query<Departamento> query=session.createQuery("from Departamento",Departamento.class);
        List<Departamento> departamentos= query.getResultList();
        return departamentos;

    }
}
