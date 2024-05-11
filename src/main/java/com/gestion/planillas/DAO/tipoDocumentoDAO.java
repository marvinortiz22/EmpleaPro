package com.gestion.planillas.DAO;

import com.gestion.planillas.Modelos.TipoDocumento;

import java.util.List;

public interface tipoDocumentoDAO {
    public List<TipoDocumento> getTipoDocumentos();
    public TipoDocumento getTipoDocumento(int id);
}
