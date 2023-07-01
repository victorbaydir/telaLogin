package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import connection.conexaoJDBC;
import model.ModelLogin;

public class daoUsuarioRepository {
	
	private static Connection connection;
	
	public daoUsuarioRepository() {
		connection = conexaoJDBC.getConnection();
	}
	
	public void gravarUsuario(ModelLogin modelLogin) throws SQLException {
		String sql = "insert into \"modelLogin\"(login, senha, nome, email) values (?, ?, ?, ?);";
			PreparedStatement preparedStatement = connection.prepareStatement(sql);
			preparedStatement.setString(1, modelLogin.getLogin());
			preparedStatement.setString(2, modelLogin.getSenha());
			preparedStatement.setString(3, modelLogin.getNome());
			preparedStatement.setString(4, modelLogin.getEmail());
			
			preparedStatement.execute();
			
			connection.commit();
		}
		
	}

