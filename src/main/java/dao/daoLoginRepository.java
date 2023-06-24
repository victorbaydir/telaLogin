package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import connection.conexaoJDBC;
import model.ModelLogin;

public class daoLoginRepository {
	
	private static Connection connection;
	
	public daoLoginRepository() {
		connection = conexaoJDBC.getConnection();
	}
	
	public static Boolean validarUsuario(ModelLogin modelLogin) throws Exception{
		String sql = "select * from \"modelLogin\" where login = ? and senha = ?";
		PreparedStatement statement = connection.prepareStatement(sql);
		statement.setString(1, modelLogin.getLogin());
		statement.setString(2, modelLogin.getSenha());
		
		ResultSet resultado = statement.executeQuery();
		
		if (resultado.next()) {
			return true;
		}
		
		return false; 
	}
	
}
	
