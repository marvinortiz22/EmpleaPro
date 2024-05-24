package com.gestion.planillas.modelos;
import jakarta.persistence.*;
import java.util.Date;

@Entity
@Table(name = "AUDITORIA_EMPLEADO")
public class Auditoria_Empleado {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "IDAUDITORIA_EMPLEADO")
    private int idAuditoriaEmpleado;

    @ManyToOne
    @JoinColumn(name = "IDEMPLEADO")
    private Empleado empleado;

    @ManyToOne
    @JoinColumn(name = "IDPUESTO")
    private Puesto puesto;

    @ManyToOne
    @JoinColumn(name = "IDMUNICIPIO")
    private Municipio municipio;

    @ManyToOne
    @JoinColumn(name = "IDESTADOCIVIL")
    private EstadoCivil estadoCivil;

    @ManyToOne
    @JoinColumn(name = "EMP_IDEMPLEADO")
    private Empleado empIdEmpleado;

    @ManyToOne
    @JoinColumn(name = "IDTIPODOC")
    private TipoDocumento tipoDocumento;

    private String nombre1;
    private String nombre2;
    private String apellido1;
    private String apellido2;
    private String apellidoCasada;
    private char sexo;
    private Date fechaNacimiento;
    private Date fechaIngreso;
    private String numeroDoc;
    private String nit;
    private String isss;
    private String nup;
    private double salario;
    private String correoInstitucional;
    private String correoPersonal;
    private boolean estado;
    private Date fechaModificacion;
    private String tipoDeOperacion;

    @ManyToOne
    @JoinColumn(name = "USUARIOREGISTRA")
    private Usuario usuarioRegistra;

    public int getIdAuditoriaEmpleado() {
        return idAuditoriaEmpleado;
    }

    public void setIdAuditoriaEmpleado(int idAuditoriaEmpleado) {
        this.idAuditoriaEmpleado = idAuditoriaEmpleado;
    }

    public Empleado getEmpleado() {
        return empleado;
    }

    public void setEmpleado(Empleado empleado) {
        this.empleado = empleado;
    }

    public Puesto getPuesto() {
        return puesto;
    }

    public void setPuesto(Puesto puesto) {
        this.puesto = puesto;
    }

    public Municipio getMunicipio() {
        return municipio;
    }

    public void setMunicipio(Municipio municipio) {
        this.municipio = municipio;
    }

    public EstadoCivil getEstadoCivil() {
        return estadoCivil;
    }

    public void setEstadoCivil(EstadoCivil estadoCivil) {
        this.estadoCivil = estadoCivil;
    }

    public Empleado getEmpIdEmpleado() {
        return empIdEmpleado;
    }

    public void setEmpIdEmpleado(Empleado empIdEmpleado) {
        this.empIdEmpleado = empIdEmpleado;
    }

    public TipoDocumento getTipoDocumento() {
        return tipoDocumento;
    }

    public void setTipoDocumento(TipoDocumento tipoDocumento) {
        this.tipoDocumento = tipoDocumento;
    }

    public String getNombre1() {
        return nombre1;
    }

    public void setNombre1(String nombre1) {
        this.nombre1 = nombre1;
    }

    public String getNombre2() {
        return nombre2;
    }

    public void setNombre2(String nombre2) {
        this.nombre2 = nombre2;
    }

    public String getApellido1() {
        return apellido1;
    }

    public void setApellido1(String apellido1) {
        this.apellido1 = apellido1;
    }

    public String getApellido2() {
        return apellido2;
    }

    public void setApellido2(String apellido2) {
        this.apellido2 = apellido2;
    }

    public String getApellidoCasada() {
        return apellidoCasada;
    }

    public void setApellidoCasada(String apellidoCasada) {
        this.apellidoCasada = apellidoCasada;
    }

    public char getSexo() {
        return sexo;
    }

    public void setSexo(char sexo) {
        this.sexo = sexo;
    }

    public Date getFechaNacimiento() {
        return fechaNacimiento;
    }

    public void setFechaNacimiento(Date fechaNacimiento) {
        this.fechaNacimiento = fechaNacimiento;
    }

    public Date getFechaIngreso() {
        return fechaIngreso;
    }

    public void setFechaIngreso(Date fechaIngreso) {
        this.fechaIngreso = fechaIngreso;
    }

    public String getNumeroDoc() {
        return numeroDoc;
    }

    public void setNumeroDoc(String numeroDoc) {
        this.numeroDoc = numeroDoc;
    }

    public String getNit() {
        return nit;
    }

    public void setNit(String nit) {
        this.nit = nit;
    }

    public String getIsss() {
        return isss;
    }

    public void setIsss(String isss) {
        this.isss = isss;
    }

    public String getNup() {
        return nup;
    }

    public void setNup(String nup) {
        this.nup = nup;
    }

    public double getSalario() {
        return salario;
    }

    public void setSalario(double salario) {
        this.salario = salario;
    }

    public String getCorreoInstitucional() {
        return correoInstitucional;
    }

    public void setCorreoInstitucional(String correoInstitucional) {
        this.correoInstitucional = correoInstitucional;
    }

    public String getCorreoPersonal() {
        return correoPersonal;
    }

    public void setCorreoPersonal(String correoPersonal) {
        this.correoPersonal = correoPersonal;
    }

    public boolean isEstado() {
        return estado;
    }

    public void setEstado(boolean estado) {
        this.estado = estado;
    }

    public Date getFechaModificacion() {
        return fechaModificacion;
    }

    public void setFechaModificacion(Date fechaModificacion) {
        this.fechaModificacion = fechaModificacion;
    }

    public String getTipoDeOperacion() {
        return tipoDeOperacion;
    }

    public void setTipoDeOperacion(String tipoDeOperacion) {
        this.tipoDeOperacion = tipoDeOperacion;
    }

    public Usuario getUsuarioRegistra() {
        return usuarioRegistra;
    }

    public void setUsuarioRegistra(Usuario usuarioRegistra) {
        this.usuarioRegistra = usuarioRegistra;
    }

    @Override
    public String toString() {
        String s = "Auditoria_Empleado{" +
                "idAuditoriaEmpleado=" + idAuditoriaEmpleado +
                ", empleado=" + empleado +
                ", puesto=" + puesto +
                ", municipio=" + municipio +
                ", estadoCivil=" + estadoCivil +
                ", empIdEmpleado=" + empIdEmpleado +
                ", tipoDocumento=" + tipoDocumento +
                ", nombre1='" + nombre1 + '\'' +
                ", nombre2='" + nombre2 + '\'' +
                ", apellido1='" + apellido1 + '\'' +
                ", apellido2='" + apellido2 + '\'' +
                ", apellidoCasada='" + apellidoCasada + '\'' +
                ", sexo=" + sexo +
                ", fechaNacimiento=" + fechaNacimiento +
                ", fechaIngreso=" + fechaIngreso +
                ", numeroDoc='" + numeroDoc + '\'' +
                ", nit='" + nit + '\'' +
                ", isss='" + isss + '\'' +
                ", nup='" + nup + '\'' +
                ", salario=" + salario +
                ", correoInstitucional='" + correoInstitucional + '\'' +
                ", correoPersonal='" + correoPersonal + '\'' +
                ", estado=" + estado +
                ", fechaModificacion=" + fechaModificacion +
                ", tipoDeOperacion='" + tipoDeOperacion + '\'' +
                ", usuarioRegistra=" + usuarioRegistra +
                '}';
        return s;
    }
}
