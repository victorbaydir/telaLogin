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
		try {
		String acao = request.getParameter("acao");
		ModelLogin modelLogin = new ModelLogin();
		modelLogin.setLogin(request.getParameter("login"));
		
		if (acao != null && acao.equals("deletar")) {
			modelLogin = daoUsuarioRepository.consultarLogin(modelLogin, false);
			if (modelLogin.getId() != null) {
				daoUsuarioRepository.deletarUsuario(modelLogin);
				request.setAttribute("msg", "Dados deletados com sucesso!");
			} else {
				throw new Exception("Nenhum usuário encontrado");
			}
		} 
		
		}catch (Exception e) {
			request.setAttribute("msgErro", e.getMessage());
		}
		finally {
			request.getRequestDispatcher("principal/usuarioCadastro.jsp").forward(request, response);
		}
			
		
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
			daoUsuarioRepository.validarLogin(modelLogin, true);
			modelLogin = daoUsuarioRepository.gravarUsuario(modelLogin);
			request.setAttribute("msg", "Dados gravados com sucesso!");
		} catch (Exception e) {
			e.printStackTrace();
			request.setAttribute("msgErro", e.getMessage());
		}
		
		request.setAttribute("modelLogin", modelLogin);
		
		request.getRequestDispatcher("principal/usuarioCadastro.jsp").forward(request, response);
		
	}

}
