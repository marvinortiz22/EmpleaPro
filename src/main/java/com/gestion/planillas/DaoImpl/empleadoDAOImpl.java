package com.gestion.planillas.DaoImpl;

import com.gestion.planillas.DAO.empleadoDAO;
import com.gestion.planillas.DAO.usuarioDAO;
import com.gestion.planillas.modelos.Empleado;
import com.gestion.planillas.modelos.ProfesionOficio;
import com.gestion.planillas.modelos.Usuario;
import jakarta.transaction.Transactional;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.ArrayList;
import java.util.List;

@Repository
public class empleadoDAOImpl implements empleadoDAO {
    @Autowired
    private SessionFactory sessionFactory;

    @Override
    public List<Empleado> getEmpleados() {
        Session session=sessionFactory.getCurrentSession();
        Query<Empleado> query=session.createQuery("FROM Empleado ORDER BY nombre1", Empleado.class);
        List<Empleado> empleados= query.getResultList();
        return empleados;
    }

    @Override
    public Empleado getEmpleado(Integer id) {
        Session session=sessionFactory.getCurrentSession();
        Empleado empleado = session.get(Empleado.class,id);
        return empleado;
    }

    @Override
    @Transactional
    public void guardarEmpleado(Empleado empleado) {
        Session session=sessionFactory.getCurrentSession();
        session.saveOrUpdate(empleado);
    }

    @Override
    public List<ProfesionOficio> getProfesionesOficios(Integer id) {
        Empleado empleado = getEmpleado(id);
        return new ArrayList<>(empleado.getProfesionOficios());
    }
}
