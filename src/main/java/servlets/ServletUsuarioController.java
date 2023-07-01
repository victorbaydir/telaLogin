package servlets;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.ModelLogin;
import java.lang.Long;
import java.sql.SQLException;

import dao.daoUsuarioRepository;

@jakarta.servlet.annotation.WebServlet("/ServletUsuarioController")
public class ServletUsuarioController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	private daoUsuarioRepository daoUsuarioRepository = new daoUsuarioRepository();

    public ServletUsuarioController() {
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String id = request.getParameter("id");
		String nome = request.getParameter("nome");
		String login = request.getParameter("login");
		String email = request.getParameter("email");
		String senha = request.getParameter("senha");
		
		ModelLogin modelLogin = new ModelLogin();
		modelLogin.setId(id != null && !id.isEmpty() ? Long.parseLong(id) : null);
		modelLogin.setNome(nome);
		modelLogin.setLogin(login);
		modelLogin.setEmail(email);
		modelLogin.setSenha(senha);
		
		try {
			daoUsuarioRepository.gravarUsuario(modelLogin);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		request.setAttribute("modelLogin", modelLogin);
		
		request.getRequestDispatcher("principal/usuarioCadastro.jsp").forward(request, response);
		
	}

}
