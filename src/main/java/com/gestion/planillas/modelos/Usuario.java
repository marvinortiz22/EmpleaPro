package com.gestion.planillas.modelos;
import jakarta.persistence.*;

import java.util.List;
import com.gestion.planillas.DAO.usuarioDAO;
import org.springframework.beans.factory.annotation.Autowired;


@Entity
public class Usuario {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int idUsuario;

    @ManyToOne
    @JoinColumn(name = "IDROL")
    private Rol rol;

    @ManyToOne
    @JoinColumn(name = "IDTIPODOC")
    private TipoDocumento tipoDocumento;
	private String username;
	private String email;
    private String password;
    private String numeroDoc;
    private boolean estado;
    private int intentosLogin;
    
	public Usuario() {
		super();
	}

	public Usuario(int idUsuario, Rol rol, TipoDocumento tipoDocumento, String username, String email, String password, String numeroDoc, boolean estado, int intentosLogin) {
		this.idUsuario = idUsuario;
		this.rol = rol;
		this.tipoDocumento = tipoDocumento;
		this.username = username;
		this.email = email;
		this.password = password;
		this.numeroDoc = numeroDoc;
		this.estado = estado;
		this.intentosLogin = intentosLogin;
	}
	public int getIdUsuario() {
		return idUsuario;
	}
	public void setIdUsuario(int idUsuario) {
		this.idUsuario = idUsuario;
	}
	public Rol getRol() {
		return rol;
	}
	public void setRol(Rol rol) {
		this.rol = rol;
	}
	public TipoDocumento getTipoDocumento() {
		return tipoDocumento;
	}
	public void setTipoDocumento(TipoDocumento tipoDocumento) {
		this.tipoDocumento = tipoDocumento;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getNumeroDoc() {
		return numeroDoc;
	}
	public void setNumeroDoc(String numeroDoc) {
		this.numeroDoc = numeroDoc;
	}
	public boolean isEstado() {
		return estado;
	}
	public void setEstado(boolean estado) {
		this.estado = estado;
	}
	public int getIntentosLogin() {
		return intentosLogin;
	}
	public void setIntentosLogin(int intentosLogin) {
		this.intentosLogin = intentosLogin;
	}



    

    
}
