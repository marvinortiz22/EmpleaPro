package com.gestion.planillas.DaoImpl;
import com.gestion.planillas.DAO.datosEmpresaDAO;
import com.gestion.planillas.modelos.DatosEmpresa;
import jakarta.persistence.NoResultException;
import jakarta.transaction.Transactional;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import com.gestion.planillas.modelos.DatosEmpresa;

import java.util.List;


@Repository
public class datosEmpresaDAOImpl implements datosEmpresaDAO{
    @Autowired
    private SessionFactory sessionFactory;
    public DatosEmpresa getDatosEmpresa() {
        try {
            Session session = sessionFactory.getCurrentSession();
            Query<DatosEmpresa> query = session.createQuery("FROM DatosEmpresa", DatosEmpresa.class);
            return query.getSingleResult();
        } catch (NoResultException e) {
            return null;
        }
    }
    @Override
    @Transactional
    public void guardarDatosEmpresa(DatosEmpresa datosEmpresa){
        Session session= sessionFactory.getCurrentSession();
        session.saveOrUpdate(datosEmpresa);
    }
}
