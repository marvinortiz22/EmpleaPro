package com.gestion.planillas.DaoImpl;

import com.gestion.planillas.DAO.estadoCivilDAO;
import com.gestion.planillas.DAO.puestoDAO;
import com.gestion.planillas.modelos.EstadoCivil;
import com.gestion.planillas.modelos.Puesto;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class estadoCivilDAOImpl implements estadoCivilDAO {
    @Autowired
    private SessionFactory sessionFactory;
    @Override
    public List<EstadoCivil> getEstadosCiviles() {
        Session session=sessionFactory.getCurrentSession();
        Query<EstadoCivil> query=session.createQuery("from EstadoCivil",EstadoCivil.class);
        List<EstadoCivil> estadosCiviles= query.getResultList();
        return estadosCiviles;

    }
}
