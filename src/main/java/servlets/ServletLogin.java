package servlets;

import java.io.IOException;

import dao.daoLoginRepository;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.ModelLogin;

/**
 * @WebServlet identifica que é uma Servlet. Esse é um exemplo de classe Controle
 */
@jakarta.servlet.annotation.WebServlet(urlPatterns = {"/ServletLogin", "/principal/ServletLogin"})
public class ServletLogin extends HttpServlet {
	private static final long serialVersionUID = 1L;
    public ServletLogin() {
        super();
    }

    /*Recebe os dados da URL em parâmetros*/
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		/*Na tela, utiliza a função  href="" que quando acessada faz uma requisição através do método doGet()*/
		
		String acao = request.getParameter("acao");
		if (acao != null && !acao.isEmpty() && acao.equals("logout")) {
			request.getSession().invalidate();
		} else {
			doPost(request, response);
		}
		RequestDispatcher redirecionar = request.getRequestDispatcher("/index.jsp");
		redirecionar.forward(request, response);
	}
	
	/*Recebe os dados do formulário*/
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String login = request.getParameter("login");
		String senha = request.getParameter("senha");
		String url = request.getParameter("url");
		ModelLogin modelLogin = new ModelLogin();
		modelLogin.setLogin(login);
		modelLogin.setSenha(senha);
		daoLoginRepository dao = new daoLoginRepository();

		
		try {
			
			if (login != null && !login.isEmpty() && senha != null && !senha.isEmpty()) {
				if (dao.validarUsuario(modelLogin)) {
					
					request.getSession().setAttribute("usuario", modelLogin.getLogin());
					
					if (url == null || url.isEmpty() || url.contains("null")) {
						url = "/principal/visaoPrincipal.jsp";
					}
					RequestDispatcher redirecionar = request.getRequestDispatcher(url);
					redirecionar.forward(request, response);
					/*Estamos inicializando um RequestDispatcher com as informações do request
					 * Ele irá ser usado para lançar uma request para o servidor, e redirecionar para uma response*/
				} else {
					RequestDispatcher redirecionar = request.getRequestDispatcher("index.jsp");
					request.setAttribute("msg", " Por favor, informe o LOGIN e SENHA");
					redirecionar.forward(request, response);
				}
			} else {
				RequestDispatcher redirecionar = request.getRequestDispatcher("index.jsp");
				request.setAttribute("msg", " Por favor, informe o LOGIN e SENHA");
				redirecionar.forward(request, response);
				
				/*O RequestDispatcher irá redirecionar para uma página determinada*/
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		
	}

}
