package servlets;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.google.gson.Gson;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;

import org.apache.commons.fileupload.servlet.ServletFileUpload;

import java.io.PrintWriter;
import model.ModelLogin;
import java.lang.Long;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.sql.SQLException;
import java.util.List;
import jakarta.servlet.annotation.MultipartConfig;


import dao.daoUsuarioRepository;

@MultipartConfig
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
				} 
				else {
					throw new Exception("Usuário vazio");
				}
			} else if(acao != null && acao.equals("editarUsuario")) {
				String idConsultar = request.getParameter("id");
				modelLogin = daoUsuarioRepository.consultarId(idConsultar, false);
				request.setAttribute("modelLogin", modelLogin);
				request.getRequestDispatcher("principal/usuarioCadastro.jsp").forward(request, response);
			}
		
		}catch (Exception e) {
			request.setAttribute("msgErro", e.getMessage());
		}
		finally {
//			request.getRequestDispatcher("principal/usuarioCadastro.jsp").forward(request, response);
		}
			
		
	}

	@SuppressWarnings("unused")
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String acao = request.getParameter("acao") != null ? request.getParameter("acao") : "";
		String id = request.getParameter("id");
		String nome = request.getParameter("nome");
		String login = request.getParameter("login");
		String email = request.getParameter("email");
		String senha = request.getParameter("senha");
		String cep = request.getParameter("cep");
		String logradouro = request.getParameter("logradouro");
		String bairro = request.getParameter("bairro");
		String cidade = request.getParameter("cidade");
		String uf = request.getParameter("uf");
		
		ModelLogin modelLogin = new ModelLogin();
		modelLogin.setId(id != null && !id.isEmpty() ? Long.parseLong(id) : null);
		modelLogin.setNome(nome);
		modelLogin.setLogin(login);
		modelLogin.setEmail(email);
		modelLogin.setSenha(senha);
		modelLogin.setCep(cep);
		modelLogin.setLogradouro(logradouro);
		modelLogin.setBairro(bairro);
		modelLogin.setCidade(cidade);
		modelLogin.setUf(uf);
		
		try {
			if (acao.equalsIgnoreCase("uploadFoto")) {
	            Part filePart = request.getPart("arquivoFoto"); // Obtém o arquivo enviado pelo formulário
	            String fileName = Paths.get(filePart.getSubmittedFileName()).getFileName().toString(); // Extrai o nome do arquivo
	            String uploadDir = "C:\\Users\\victo\\APACHE\\upload\\fotoUsuario\\"+id;
	            File file = new File(uploadDir);
	            try (InputStream fileContent = filePart.getInputStream()) {
	            	if (!file.exists()) { // Verifica se o diretório existe, e caso não existe cria um
						file.mkdir();
					}
	            	modelLogin.getArquivo().setNome(fileName);
	            	modelLogin.getArquivo().setCaminho(uploadDir);
	                Files.copy(fileContent, Paths.get(uploadDir, fileName));
	                
	                acao = "";
	            }
			} else {
				daoUsuarioRepository.persistirUsuario(modelLogin); //Método usado para incluir ou atualizar usuario
				
				request.setAttribute("msg", "Dados gravados com sucesso!");
				request.setAttribute("modelLogin", modelLogin);
				request.getRequestDispatcher("principal/usuarioCadastro.jsp").forward(request, response);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
			request.setAttribute("msgErro", e.getMessage());
			request.getRequestDispatcher("principal/usuarioCadastro.jsp").forward(request, response);
		}
		
		
	}

}
