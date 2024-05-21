package com.gestion.planillas.DaoImpl;

import com.gestion.planillas.DAO.empleadoDAO;
import com.gestion.planillas.DAO.usuarioDAO;
import com.gestion.planillas.modelos.Empleado;
import com.gestion.planillas.modelos.Usuario;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

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
}
