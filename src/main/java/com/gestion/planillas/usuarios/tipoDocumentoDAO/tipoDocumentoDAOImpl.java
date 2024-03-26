package com.gestion.planillas.usuarios.tipoDocumentoDAO;

import com.gestion.planillas.modelos.TipoDocumento;
import com.gestion.planillas.modelos.Usuario;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class tipoDocumentoDAOImpl implements tipoDocumentoDAO{
    @Autowired
    private SessionFactory sessionFactory;

    @Override
    public List<TipoDocumento> getTipoDocumentos() {
        Session session=sessionFactory.openSession();
        Query<TipoDocumento> query=session.createQuery("from TipoDocumento",TipoDocumento.class);
        List<TipoDocumento> tipoDocumentos= query.getResultList();
        session.close();
        return tipoDocumentos;
    }

    @Override
    public TipoDocumento getTipoDocumento(int idTipoDoc) {
        Session session=sessionFactory.openSession();
        TipoDocumento tipoDocumento=session.get(TipoDocumento.class,idTipoDoc);
        return tipoDocumento;
    }
}
