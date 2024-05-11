package com.gestion.planillas.Modelos;
import jakarta.persistence.*;

@Entity
@Table(name="DATOSEMPRESA")
public class DatosEmpresa {
    @Id
    private int idEmpresa;
    private String nombreEmpresa;
    private String direccion;
    private String nombreRepresentante;
    private String nit;
    private String nic;
    private String telefono;
    private String paginaWeb;
    private String email;

    // Getters y Setters

    public int getIdEmpresa() {
        return idEmpresa;
    }

    public void setIdEmpresa(int idEmpresa) {
        this.idEmpresa = idEmpresa;
    }

    public String getNombreEmpresa() {
        return nombreEmpresa;
    }

    public void setNombreEmpresa(String nombreEmpresa) {
        this.nombreEmpresa = nombreEmpresa;
    }

    public String getDireccion() {
        return direccion;
    }

    public void setDireccion(String direccion) {
        this.direccion = direccion;
    }

    public String getNombreRepresentante() {
        return nombreRepresentante;
    }

    public void setNombreRepresentante(String nombreRepresentante) {
        this.nombreRepresentante = nombreRepresentante;
    }

    public String getNit() {
        return nit;
    }

    public void setNit(String nit) {
        this.nit = nit;
    }

    public String getNic() {
        return nic;
    }

    public void setNic(String nic) {
        this.nic = nic;
    }

    public String getTelefono() {
        return telefono;
    }

    public void setTelefono(String telefono) {
        this.telefono = telefono;
    }

    public String getPaginaWeb() {
        return paginaWeb;
    }

    public void setPaginaWeb(String paginaWeb) {
        this.paginaWeb = paginaWeb;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public DatosEmpresa(int idEmpresa, String nombreEmpresa, String direccion, String nombreRepresentante, String nit, String nic, String telefono, String paginaWeb, String email) {
        this.idEmpresa = idEmpresa;
        this.nombreEmpresa = nombreEmpresa;
        this.direccion = direccion;
        this.nombreRepresentante = nombreRepresentante;
        this.nit = nit;
        this.nic = nic;
        this.telefono = telefono;
        this.paginaWeb = paginaWeb;
        this.email = email;
    }

    public DatosEmpresa() {
    }
}

