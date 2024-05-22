package com.gestion.planillas.modelos;
import jakarta.persistence.*;
import java.math.BigDecimal;
import java.util.Date;
import java.util.List;

@Entity
@Table(name="EMPLEADO")
public class Empleado {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int idEmpleado;

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
    private Empleado supervisor;

    @ManyToOne
    @JoinColumn(name = "IDTIPODOC")
    private TipoDocumento tipoDocumento;

    private String nombre1;
    private String nombre2;
    private String apellido1;
    private String apellido2;
    private String apellidoCasada;
    private String sexo;
    private Date fechaNacimiento;
    private Date fechaIngreso;
    private String numeroDoc;
    private String nit;
    private String isss;
    private String nup;
    private BigDecimal salario;
    private String correoInstitucional;
    private String correoPersonal;
    private boolean estado = true;
    @ManyToMany
    @JoinTable(
            name="PROFOFC_EMPLEADO",
            joinColumns =@JoinColumn(name="idEmpleado"),
            inverseJoinColumns = @JoinColumn(name="idProfOfc")
    )
    private List<ProfesionOficio> profesionOficios;

    public int getIdEmpleado() {
        return idEmpleado;
    }

    public void setIdEmpleado(int idEmpleado) {
        this.idEmpleado = idEmpleado;
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

    public Empleado getSupervisor() {
        return supervisor;
    }

    public void setSupervisor(Empleado supervisor) {
        this.supervisor = supervisor;
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

    public String getSexo() {
        return sexo;
    }

    public void setSexo(String sexo) {
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

    public BigDecimal getSalario() {
        return salario;
    }

    public void setSalario(BigDecimal salario) {
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

    public List<ProfesionOficio> getProfesionOficios() {
        return profesionOficios;
    }

    public void setProfesionOficios(List<ProfesionOficio> profesionOficios) {
        this.profesionOficios = profesionOficios;
    }

    public Empleado(int idEmpleado, Puesto puesto, Municipio municipio, EstadoCivil estadoCivil, Empleado supervisor, TipoDocumento tipoDocumento, String nombre1, String nombre2, String apellido1, String apellido2, String apellidoCasada, String sexo, Date fechaNacimiento, Date fechaIngreso, String numeroDoc, String nit, String isss, String nup, BigDecimal salario, String correoInstitucional, String correoPersonal, boolean estado) {
        this.idEmpleado = idEmpleado;
        this.puesto = puesto;
        this.municipio = municipio;
        this.estadoCivil = estadoCivil;
        this.supervisor = supervisor;
        this.tipoDocumento = tipoDocumento;
        this.nombre1 = nombre1;
        this.nombre2 = nombre2;
        this.apellido1 = apellido1;
        this.apellido2 = apellido2;
        this.apellidoCasada = apellidoCasada;
        this.sexo = sexo;
        this.fechaNacimiento = fechaNacimiento;
        this.fechaIngreso = fechaIngreso;
        this.numeroDoc = numeroDoc;
        this.nit = nit;
        this.isss = isss;
        this.nup = nup;
        this.salario = salario;
        this.correoInstitucional = correoInstitucional;
        this.correoPersonal = correoPersonal;
        this.estado = estado;
    }

    public Empleado() {
    }
}
