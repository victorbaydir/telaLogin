package connection;

import java.sql.Connection;
import java.sql.DriverManager;

public class conexaoJDBC {

	public static String banco = "jdbc:postgresql://localhost:5433/cursoJSP?autoReconnect=true";
	public static String username = "postgres";
	public static String senha = "234588";
	public static Connection conexao = null;
	
	public static Connection getConnection() {
		conectar();
		return conexao;
	}
	
	
	static {
		conectar();
	}
	
	public conexaoJDBC() {
		conectar();
	}
	
	
	public static void conectar() {
		try {
			if (conexao == null) {
				Class.forName("org.postgresql.Driver");
				conexao = DriverManager.getConnection(banco, username, senha);
				conexao.setAutoCommit(false);
				
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
}
