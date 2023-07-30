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
	
	public void gravarArquivo(ModelLogin modelLogin) throws SQLException {
		Arquivo arquivo = new Arquivo();
		arquivo.setNome(modelLogin.getNome());
		arquivo.setCaminho(modelLogin.getArquivo().getCaminho());
		String sql = "insert into \"arquivo\"(nome, caminho) values(?, ?) ";
			PreparedStatement preparedStatement = connection.prepareStatement(sql);
			preparedStatement.setString(1, modelLogin.getArquivo().getNome());
			preparedStatement.setString(2, modelLogin.getArquivo().getCaminho());
			
			preparedStatement.execute();
			
			connection.commit();
	}
}
