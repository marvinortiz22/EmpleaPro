package com.gestion.planillas.DaoImpl;

import com.gestion.planillas.DAO.departamentoDAO;
import com.gestion.planillas.DAO.municipioDAO;
import com.gestion.planillas.modelos.Departamento;
import com.gestion.planillas.modelos.Empleado;
import com.gestion.planillas.modelos.Municipio;
import com.gestion.planillas.modelos.ProfesionOficio;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.ArrayList;
import java.util.List;

@Repository
public class municipioDAOImpl implements municipioDAO {
    @Autowired
    private SessionFactory sessionFactory;
    @Override
    public List<Municipio> getMunicipios() {
        Session session=sessionFactory.getCurrentSession();
        Query<Municipio> query=session.createQuery("from Municipio", Municipio.class);
        List<Municipio> municipios= query.getResultList();
        return municipios;
    }

    @Override
    public List<Municipio> getMunicipiosXDepartamento(Integer id) {
        Session session = sessionFactory.getCurrentSession();
        String hql = "from Municipio where departamento.idDepartamento = :idDepartamento";
        Query<Municipio> query = session.createQuery(hql, Municipio.class);
        query.setParameter("idDepartamento", id);
        return query.list();
    }
}
