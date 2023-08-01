package model;

import java.io.Serializable;

public class Arquivo implements Serializable{

	private static final long serialVersionUID = 1L;
	
	private Integer id;
	private String nome;
	private String caminho;
	private ModelLogin modelLogin;
	
	public Integer getId() {
		if (id == null) {
			id = 0;
		}
		return id;
	}
	
	public void setId(Integer id) {
		this.id = id;
	}

	public String getNome() {
		if (nome == null) {
			nome = "";
		}
		return nome;
	}
	
	public void setNome(String nome) {
		this.nome = nome;
	}

	public String getCaminho() {
		if (caminho == null) {
			caminho = "";
		}
		return caminho;
	}
	
	public void setCaminho(String caminho) {
		this.caminho = caminho;
	}

	public ModelLogin getModelLogin() {
		if (modelLogin == null) {
			modelLogin = new ModelLogin();
		}
		return modelLogin;
	}

	public void setModelLogin(ModelLogin modelLogin) {
		this.modelLogin = modelLogin;
	}
	
	

}
