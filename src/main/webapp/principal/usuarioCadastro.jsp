<%@page import="org.apache.jasper.tagplugins.jstl.core.Out"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
	<jsp:include page="head.jsp" ></jsp:include>
	<body>
	<jsp:include page="navHead.jsp"></jsp:include>
	
	<!--Formulário de Cadastro de Usuário -->
	<main>
		<form id="formUser" action="<%=request.getContextPath()%>/ServletUsuarioController"
			method="post" id="formUser">
			<input name="acao" id="idAcao" type="hidden" value="">
			<div class="title">
				<h1>Cadastro de Usuário</h1>
			</div>
			<div class="divider"></div>
			<div class="form-row">
				<div class="form-group col-md-2">
					<label>Código Usuário</label> <input placeholder="ID"
						value="${modelLogin.id}" name="id" id="idUsuario" readonly
						type="text" class="form-control">
				</div>
			</div>
			<div class="form-row">
				<div class="form-group col-md-7">
					<label>Nome Completo</label> <input placeholder="Nome"
						value="${modelLogin.nome}" name="nome" id="nomeUsuario"
						type="text" class="form-control">
				</div>
				<div class="form-group col-md-5">
					<label>Email</label> <input placeholder="Email"
						value="${modelLogin.email}" name="email" id="emailUsuario"
						type="text" class="form-control">
				</div>
			</div>
			<div class="form-row">
				<div class="form-group col-md-6">
					<label>Login</label> <input placeholder="Login"
						value="${modelLogin.login}" name="login" id="loginUsuario"
						type="text" class="form-control">
				</div>
				<div class="form-group col-md-6">
					<label>Senha</label> <input placeholder="Senha"
						value="${modelLogin.senha}" name="senha" id="senhaUsuario"
						type="text" class="form-control">
				</div>
			</div>
			<button name="novo" id="btnNovo" onclick="novoForm()" type="button"
				class="btn btn-info">
				<div>
					<span class="material-symbols-outlined"> add </span> Novo
				</div>
			</button>
			<button name="salvar" id="btnSalvar" class="btn btn-success">
				<div>
					<span class="material-symbols-outlined"> save </span> Salvar
				</div>
			</button>
			<button name="excluir" onclick="deletar()" type="button"
				class="btn btn-danger">
				<div>
					<span class="material-symbols-outlined"> delete </span> Excluir
				</div>
			</button>
			<button data-toggle="modal" data-target="#modalConsultaUser"
				type="button" class="btn btn-secondary">
				<div>
					<span class="material-symbols-outlined"> search </span> Consultar
				</div>
			</button>
		</form>
		<span
			style="display: block; color: blue; width: 100%; font-size: 15px;">${msg}</span>
		<span
			style="display: block; color: red; width: 100%; font-size: 15px;">${msgErro}</span>
	</main>

	<!-- Modal Consulta Usuário -->
	<div class="modal fade" id="modalConsultaUser" tabindex="-1"
		role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLabel">Consultar Usuário</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<form id="formUsuario"
					action="<%=request.getContextPath()%>/ServletUsuarioController"
					method="GET">
					<div class="modal-body">
						<div class="input-group mb-3">
							<input id="loginConsultar" type="text" class="form-control"
								placeholder="Digite o Login" aria-label="Recipient's username"
								aria-describedby="basic-addon2">
							<div class="input-group-append">
								<button onclick="consultar()" id="btnConsultar" class="btn btn-outline-success" type="button">Consultar</button>
							</div>
						</div>
						<table id="tabelaResultado" class="table">
							<thead>
								<tr>
									<th scope="col">Código</th>
									<th scope="col">Nome</th>
									<th scope="col">Login</th>
									<th scope="col">Opções</th>
								</tr>
							</thead>
							<tbody>

							</tbody>
						</table>
					</div>
				</form>
				<div class="modal-footer">
					<button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
				</div>
			</div>
		</div>
	</div>

	<jsp:include page="javaScript.jsp"></jsp:include>
	<script>
	
		function consultar() {
			var url = document.querySelector('#formUser').action
			var loginConsultar = document.querySelector('#loginConsultar').value
			$.ajax({
				url: url+"?acao=consultarUserTodos&loginConsultar="+loginConsultar,
				type: "GET",
				dataType: "json",
				success: function(data) {
					// Limpa a tabela antes de preenchê-la novamente
					$("#tabelaResultado tbody").empty();
					
					// Preenche a tabela com os resultados recebidos em formato JSON
					for (var i = 0; i < data.length; i++) {
						var row = "<tr><td>" + data[i].id + "</td><td>" + data[i].nome + "</td><td>" + data[i].login + "</td></tr>";
						$("#tabelaResultado tbody").append(row);
					}
				},
				error: function() {
					alert("Erro ao realizar a consulta."); // Adicione uma mensagem de erro apropriada.
				}
			});
		}
	
		function deletar(){
			   
			   if (confirm('Deseja realmente deletar este registro?')) {
				document.getElementById('formUser').method = 'get'
				document.getElementById('idAcao').value = 'deletar'
				document.getElementById('formUser').submit()
			}
		   }
	   
	   	function novoForm(){
	   		document.getElementById('idUsuario').value = '';
	   		document.getElementById('nomeUsuario').value = '';
	   		document.getElementById('loginUsuario').value = '';
	   		document.getElementById('senhaUsuario').value = '';
	   		document.getElementById('emailUsuario').value = '';
	   	}
	   	
  
   </script>
   
	</body>
</html>
    