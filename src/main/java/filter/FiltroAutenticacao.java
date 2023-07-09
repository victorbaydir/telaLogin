package filter;

import java.io.IOException;
import java.sql.Connection;
import java.sql.SQLException;

import connection.conexaoJDBC;
import jakarta.servlet.Filter;
import jakarta.servlet.FilterChain;
import jakarta.servlet.FilterConfig;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.ServletRequest;
import jakarta.servlet.ServletResponse;
import jakarta.servlet.annotation.WebFilter;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;

/**
 *Intercepta todas as requisições para executar fitragens(exemplo, autenticação de senhas)
 */
@WebFilter(urlPatterns = {"/principal/*"})
public class FiltroAutenticacao implements Filter {

	private static Connection conexao;
	
    public FiltroAutenticacao() {
    }

	public void destroy() {
		try {
			conexao.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
		try {
			HttpServletRequest req = (HttpServletRequest) request;
			HttpSession session = req.getSession();
			String usuarioLogado = (String) session.getAttribute("usuario");
			String urlAutenticar = req.getServletPath();
			
			if (usuarioLogado == null && !urlAutenticar.contains("ServletLogin")) {
				RequestDispatcher redireciona = request.getRequestDispatcher("/index.jsp");
				request.setAttribute("msg", "Para acessar o sistema realize o login");
				redireciona.forward(request, response);
				return;
			} else {
				chain.doFilter(request, response);
			}
			conexao.commit();
			
		} catch (Exception e) {
			e.printStackTrace();
			try {
				conexao.rollback();
			} catch (SQLException e1) {
				e1.printStackTrace();
			}
		}
		
		
	}

	public void init(FilterConfig fConfig) throws ServletException {
		conexao = conexaoJDBC.getConnection();
		}

}
