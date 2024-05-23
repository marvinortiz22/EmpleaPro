package com.gestion.planillas.DaoImpl;

import org.hibernate.SessionFactory;
import java.util.List;
import org.hibernate.Session;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.hibernate.query.Query;

import com.gestion.planillas.DAO.tipounidadesDAO;
import com.gestion.planillas.modelos.TipoUnidad;

@Repository
public class tipoUnidadesDAOImp implements tipounidadesDAO {
    @Autowired
    private SessionFactory sessionFactory;

    @Override
    public List<TipoUnidad> getTiposUnidadesList() {
        Session session = sessionFactory.getCurrentSession();
        Query<TipoUnidad> query = session.createQuery("from TipoUnidad", TipoUnidad.class);
        List<TipoUnidad> tiposUnidades = query.getResultList();
        return tiposUnidades;
    }
}
