package servlets;

import java.io.IOException;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.google.gson.Gson;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.PrintWriter;
import model.ModelLogin;
import java.lang.Long;
import java.sql.SQLException;
import java.util.List;


import dao.daoUsuarioRepository;

@jakarta.servlet.annotation.WebServlet("/ServletUsuarioController")
public class ServletUsuarioController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	private daoUsuarioRepository daoUsuarioRepository = new daoUsuarioRepository();

    public ServletUsuarioController() {
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String acao = request.getParameter("acao");
		ModelLogin modelLogin = new ModelLogin();
		modelLogin.setLogin(request.getParameter("login"));
		try {
		
			if (acao != null && acao.equals("deletar")) {
				modelLogin = daoUsuarioRepository.consultarLogin(modelLogin, false);
				if (modelLogin.getId() != null) {
					daoUsuarioRepository.deletarUsuario(modelLogin);
					request.setAttribute("msg", "Dados deletados com sucesso!");
				} else {
					throw new Exception("Nenhum usuário encontrado");
				}
			} else if (acao != null && acao.equals("consultarUserTodos")) {
				String campoConsulta = request.getParameter("loginConsultar");
				if (campoConsulta != null) {
					try {
						List<ModelLogin> listaModelLogin = daoUsuarioRepository.consultarUserPorLogin(campoConsulta, false);
						ObjectMapper mapper = new ObjectMapper();
						String json = mapper.writeValueAsString(listaModelLogin);
						response.getWriter().write(json);
					} catch (SQLException e) {
						e.printStackTrace();
					}
				} else {
					throw new Exception("Usuário vazio");
				}
			}
		
		}catch (Exception e) {
			request.setAttribute("msgErro", e.getMessage());
		}
		finally {
//			request.getRequestDispatcher("principal/usuarioCadastro.jsp").forward(request, response);
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
