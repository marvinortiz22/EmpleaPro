package com.gestion.planillas.DaoImpl;
import com.gestion.planillas.DAO.auditoriaDAO;
import com.gestion.planillas.modelos.Auditoria_DeduccionBeneficioEmpleado;
import com.gestion.planillas.modelos.Auditoria_Empleado;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class auditoriaDAOImpl implements auditoriaDAO{
    @Autowired
    private SessionFactory sessionFactory;

    @Override
    public List<Auditoria_Empleado> getAuditoriaEmps() {
        Session session=sessionFactory.getCurrentSession();
        Query<Auditoria_Empleado> query = session.createQuery("FROM Auditoria_Empleado", Auditoria_Empleado.class);
        return query.getResultList();
    }

    @Override
    public Auditoria_Empleado getAuditoriaEmp(Integer id) {
        Session session=sessionFactory.getCurrentSession();
        return session.get(Auditoria_Empleado.class,id);
    }

    @Override
    public List<Auditoria_DeduccionBeneficioEmpleado> getAuditoriaDecBenEmp() {
        Session session = sessionFactory.getCurrentSession();
        Query<Auditoria_DeduccionBeneficioEmpleado> query = session.createQuery("FROM Auditoria_DeduccionBeneficioEmpleado", Auditoria_DeduccionBeneficioEmpleado.class);
       return query.getResultList();
    }
}
