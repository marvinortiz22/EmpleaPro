package com.gestion.planillas.DaoImpl;

import com.gestion.planillas.DAO.tipoDocumentoDAO;
import com.gestion.planillas.Modelos.TipoDocumento;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class tipoDocumentoDAOImpl implements tipoDocumentoDAO {
    @Autowired
    private SessionFactory sessionFactory;

    @Override
    public List<TipoDocumento> getTipoDocumentos() {
        Session session=sessionFactory.getCurrentSession();
        Query<TipoDocumento> query=session.createQuery("from TipoDocumento",TipoDocumento.class);
        List<TipoDocumento> tipoDocumentos= query.getResultList();
        return tipoDocumentos;
    }

    @Override
    public TipoDocumento getTipoDocumento(int idTipoDoc) {
        Session session=sessionFactory.getCurrentSession();
        TipoDocumento tipoDocumento=session.get(TipoDocumento.class,idTipoDoc);
        return tipoDocumento;
    }
}
