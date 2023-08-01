package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import connection.conexaoJDBC;
import model.Arquivo;
import model.ModelLogin;

public class daoArquivoRepository {

	private static Connection connection;
	
	public daoArquivoRepository() {
		connection = conexaoJDBC.getConnection();
	}
	
	public void inserirArquivo(Arquivo arquivo) throws SQLException {
		String sql = "insert into \"arquivo\"(nome, caminho, modelLogin) values(?, ?, ?) ";
			PreparedStatement preparedStatement = connection.prepareStatement(sql);
			preparedStatement.setString(1, arquivo.getNome());
			preparedStatement.setString(2, arquivo.getCaminho());
			preparedStatement.setInt(3, arquivo.getModelLogin().getId().intValue());
			
			preparedStatement.execute();
			
			connection.commit();
	}
}
