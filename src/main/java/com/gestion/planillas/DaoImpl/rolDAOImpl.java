package com.gestion.planillas.DaoImpl;
import com.gestion.planillas.DAO.rolDAO;
import com.gestion.planillas.modelos.Rol;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import java.util.List;
import org.springframework.stereotype.Repository;

@Repository
public class rolDAOImpl implements rolDAO {
    @Autowired
    private SessionFactory sessionFactory;
    @Override
    public List<Rol> getRoles() {
        Session session=sessionFactory.getCurrentSession();
        Query<Rol> query=session.createQuery("from Rol",Rol.class);
        List<Rol> puestos= query.getResultList();
        return puestos;
    }
}
