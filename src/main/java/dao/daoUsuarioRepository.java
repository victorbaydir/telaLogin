package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.*;

import connection.conexaoJDBC;
import model.ModelLogin;

public class daoUsuarioRepository {
	
	private static Connection connection;
	
	public daoUsuarioRepository() {
		connection = conexaoJDBC.getConnection();
	}
	
	public ModelLogin gravarUsuario(ModelLogin modelLogin) throws Exception {
		String sql = "insert into \"modelLogin\"(login, senha, nome, email) values (?, ?, ?, ?);";
			PreparedStatement preparedStatement = connection.prepareStatement(sql);
			preparedStatement.setString(1, modelLogin.getLogin());
			preparedStatement.setString(2, modelLogin.getSenha());
			preparedStatement.setString(3, modelLogin.getNome());
			preparedStatement.setString(4, modelLogin.getEmail());
			
			preparedStatement.execute();
			
			connection.commit();
			
			
			return this.consultarLogin(modelLogin, false);
		}
	
	public ModelLogin consultarLogin(ModelLogin modelLogin, Boolean retornarExcecao) throws Exception {
		String sql = "select * from \"modelLogin\" where login = ?";
		PreparedStatement preparedStatement = connection.prepareStatement(sql);
		preparedStatement.setString(1, modelLogin.getLogin());
		
		ResultSet resultado = preparedStatement.executeQuery();
	
		if(resultado.next()) {
			modelLogin.setId(resultado.getLong("id"));
			modelLogin.setEmail(resultado.getString("email"));
			modelLogin.setLogin(resultado.getString("login"));
			modelLogin.setSenha(resultado.getString("senha"));
			modelLogin.setNome(resultado.getString("nome"));;
		}
	return modelLogin;
	}
	
	public List<ModelLogin> consultarUserPorLogin(String login, Boolean retornarExcecao) throws Exception {
		String sql = "select * from \"modelLogin\" where login ilike ?";
		PreparedStatement preparedStatement = connection.prepareStatement(sql);
		preparedStatement.setString(1, login);
		
		ResultSet resultado = preparedStatement.executeQuery();
		List<ModelLogin> listaModelLogin = new ArrayList<>();
		while(resultado.next()) {
			ModelLogin modelLogin = new ModelLogin();
			modelLogin.setId(resultado.getLong("id"));
			modelLogin.setEmail(resultado.getString("email"));
			modelLogin.setLogin(resultado.getString("login"));
			modelLogin.setNome(resultado.getString("nome"));
			listaModelLogin.add(modelLogin);
		}
	return listaModelLogin;
	}
	
	public void validarLogin(ModelLogin modelLogin, Boolean retornarExcecao) throws Exception {
		String sql = "select * from \"modelLogin\" where login = ?";
		PreparedStatement preparedStatement = connection.prepareStatement(sql);
		preparedStatement.setString(1, modelLogin.getLogin());
		
		preparedStatement.executeQuery();
		
		ResultSet resultado = preparedStatement.executeQuery();
		
		if(resultado.next() && retornarExcecao) {
			throw new Exception("Já existe um usuário com login: "+modelLogin.getLogin().toString());
		} 
	}
	
	public void deletarUsuario(ModelLogin modelLogin) throws Exception {
		consultarLogin(modelLogin, null);
		String sql = "delete from \"modelLogin\"where id = ?;";
			PreparedStatement preparedStatement = connection.prepareStatement(sql);
			preparedStatement.setLong(1, modelLogin.getId());
			preparedStatement.executeUpdate();
			connection.commit();
		}
		
}
		


