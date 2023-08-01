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
	private daoArquivoRepository daoArquivoRepository = new daoArquivoRepository();
	
	public daoUsuarioRepository() {
		connection = conexaoJDBC.getConnection();
	}
	
	public void persistirUsuario(ModelLogin modelLogin) throws Exception {
		if (usuarioExiste(modelLogin)) {
			atualizarUsuario(modelLogin);
		} else {
			inserirUsuario(modelLogin);
		}
//			daoArquivoRepository.gravarArquivo(modelLogin);
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
	
	public Boolean usuarioExiste(ModelLogin modelLogin) throws Exception {
		String sql = "select * from \"modelLogin\" where login = ?";
		PreparedStatement preparedStatement = connection.prepareStatement(sql);
		preparedStatement.setString(1, modelLogin.getLogin());
		
		ResultSet resultado = preparedStatement.executeQuery();
	
	return resultado.next();
	}
	
	
	public ModelLogin consultarId(String id, Boolean retornarExcecao) throws Exception {
		String sql = "select * from \"modelLogin\" where id = ?";
		
		PreparedStatement preparedStatement = connection.prepareStatement(sql);
		preparedStatement.setLong(1, Long.parseLong(id));
		ResultSet resultado = preparedStatement.executeQuery();
	
		ModelLogin modelLogin = new ModelLogin();
		if(resultado.next()) {
			modelLogin.setId(resultado.getLong("id"));
			modelLogin.setEmail(resultado.getString("email"));
			modelLogin.setLogin(resultado.getString("login"));
			modelLogin.setSenha(resultado.getString("senha"));
			modelLogin.setNome(resultado.getString("nome"));
			modelLogin.setCep(resultado.getString("cep"));
			modelLogin.setLogradouro(resultado.getString("logradouro"));
			modelLogin.setBairro(resultado.getString("bairro"));
			modelLogin.setCidade(resultado.getString("cidade"));
			modelLogin.setUf(resultado.getString("uf"));
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
	
	public void inserirUsuario(ModelLogin modelLogin) throws SQLException {
		StringBuilder sql = new StringBuilder();
		sql.append("insert into \"modelLogin\"(login, senha, nome, email, cep, logradouro, bairro, cidade, uf) values (?, ?, ?, ?, ?, ?, ?, ?, ?);");
		PreparedStatement preparedStatement = connection.prepareStatement(sql.toString());
		preparedStatement.setString(1, modelLogin.getLogin());
		preparedStatement.setString(2, modelLogin.getSenha());
		preparedStatement.setString(3, modelLogin.getNome());
		preparedStatement.setString(4, modelLogin.getEmail());
		preparedStatement.setString(5, modelLogin.getCep());
		preparedStatement.setString(6, modelLogin.getLogradouro());
		preparedStatement.setString(7, modelLogin.getBairro());
		preparedStatement.setString(8, modelLogin.getCidade());
		preparedStatement.setString(9, modelLogin.getUf());
		
		preparedStatement.execute();
		
	}
	
	public void atualizarUsuario(ModelLogin modelLogin) throws SQLException {
		StringBuilder sql = new StringBuilder();
		sql.append(" update \"modelLogin\" set login=?, senha=?, nome=?, email=?, cep=?,");
		sql.append(" logradouro=?, bairro=?, cidade=?, uf=? where id = ?;");
		PreparedStatement preparedStatement = connection.prepareStatement(sql.toString());
		preparedStatement.setString(1, modelLogin.getLogin());
		preparedStatement.setString(2, modelLogin.getSenha());
		preparedStatement.setString(3, modelLogin.getNome());
		preparedStatement.setString(4, modelLogin.getEmail());
		preparedStatement.setString(5, modelLogin.getCep());
		preparedStatement.setString(6, modelLogin.getLogradouro());
		preparedStatement.setString(7, modelLogin.getBairro());
		preparedStatement.setString(8, modelLogin.getCidade());
		preparedStatement.setString(9, modelLogin.getUf());
		preparedStatement.setLong(10, modelLogin.getId());
		
		preparedStatement.execute();
		
		connection.commit();
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
		


