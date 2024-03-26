package com.gestion.planillas.usuarios.tipoDocumentoDAO;

import com.gestion.planillas.modelos.TipoDocumento;

import java.util.List;

public interface tipoDocumentoDAO {
    public List<TipoDocumento> getTipoDocumentos();
    public TipoDocumento getTipoDocumento(int id);
}
