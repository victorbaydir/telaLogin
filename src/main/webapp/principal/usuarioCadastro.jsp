<%@page import="org.apache.jasper.tagplugins.jstl.core.Out"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
	<jsp:include page="head.jsp" ></jsp:include>
	
	<body>
		<div class="pre-loader">
			<div class="pre-loader-box">
				<div class="loader-logo">
					<img src="vendors/images/deskapp-logo.svg" alt="" />
				</div>
				<div class="loader-progress" id="progress_div">
					<div class="bar" id="bar1"></div>
				</div>
				<div class="percent" id="percent1">0%</div>
				<div class="loading-text">Loading...</div>
			</div>
		</div>

		<jsp:include page="navHead.jsp"></jsp:include>

		

		
		<div class="mobile-menu-overlay"></div>
		<jsp:include page="navLateral.jsp"></jsp:include>

		<div class="main-container">
			<div class="xs-pd-20-10 pd-ltr-20">
				<div class="title pb-20">
					<h2 class="h3 mb-0">Central</h2>
				</div>
				<div class="pd-20 card-box mb-30">
						<div class="clearfix">
							<div class="pull-left">
								<h4 class="text-blue h4">Cadastro Usuário</h4>
							</div>
						</div>
						<form action="<%= request.getContextPath()%>/ServletUsuarioController" method="post" id="formUser">
						<input name="acao" id="idAcao" type="hidden" value="">
							<div class="form-group row">
								<label class="col-sm-12 col-md-2 col-form-label">ID</label>
								<div class="col-md-2">
									<input
										class="form-control"
										type="text"
										placeholder="ID" value="${modelLogin.id}" name="id" id="idUsuario" readonly="readonly"
									/>
								</div>
							</div>
							
							<div class="form-group row">
								<label class="col-sm-12 col-md-2 col-form-label">Nome</label>
								<div class="col-md-6">
									<input
										class="form-control"
										type="text"
										placeholder="Nome" value="${modelLogin.nome}" name="nome" id="nomeUsuario"
									/>
								</div>
							</div>
							<div class="form-group row">
								<label class="col-sm-12 col-md-2 col-form-label">Login</label>
								<div class="col-md-6">
									<input
										class="form-control"
										type="text"
										placeholder="Login" value="${modelLogin.login}" name="login" id="loginUsuario"
									/>
								</div>
							</div>
							<div class="form-group row">
								<label class="col-sm-12 col-md-2 col-form-label">Senha</label>
								<div class="col-md-6">
									<input
										class="form-control"
										type="text"
										placeholder="Senha" value="${modelLogin.senha}" name="senha" id="senhaUsuario"
									/>
								</div>
							</div>
							<div class="form-group row">
								<label class="col-sm-12 col-md-2 col-form-label">Email</label>
								<div class="col-md-6">
									<input
										class="form-control"
										type="text"
										placeholder="Email value="${modelLogin.email}" name="email" id="emailUsuario"
									/>
								</div>
							</div>
							<button type="button" name="novo" id="btnNovo" onclick="novoForm()" class="btn btn-info">Novo</button>
							<button name="salvar" id="btnSalvar" class="btn btn-success">Salvar</button>
							<button type="button" name="excluir" onclick="deletar()" class="btn btn-danger">Excluir</button>
							<button type="button" data-toggle="modal" data-target="#modalConsultaUser" class="btn btn-secondary">Consultar</button>
						</form>
				</div>
			</div>
			<span style="display:block;color: blue; width:100%;font-size: 15px;">${msg}</span>
            <span style="display:block;color: red; width:100%;font-size: 15px;">${msgErro}</span>
		</div>
		
		
		<div
		class="modal fade"
		id="modalConsultaUser"
		tabindex="-1"
		role="dialog"
		aria-labelledby="myLargeModalLabel"
		aria-hidden="true"
		>
			<div class="modal-dialog modal-dialog-centered">
				<div class="modal-content">
				<input type="hidden" value="" id="idTipoConsulta" name="nameTipoConsulta">
					<div class="modal-header">
						<h4 class="modal-title" id="myLargeModalLabel" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
							Consultar Usuário
						</h4>
						<button
							type="button"
							class="close"
							data-dismiss="modal"
							aria-hidden="true"
						>
							×
						</button>
					</div>
					<div class="modal-body">
						
						
						<div class="form-group row">
							
							<div class="col-md-9">
								<input
									class="form-control"
									type="text"
									placeholder="Digite o Login" id="campoConsultas"
								/>
							</div>
								<button type="button" class="btn btn-info">Consultar</button>
						</div>
						
						<table class="table">
						  <thead>
						    <tr>
						      <th scope="col">ID</th>
						      <th scope="col">Nome</th>
						      <th scope="col">Login</th>
						      <th scope="col">Opções</th>
						    </tr>
						  </thead>
						</table>
						
						
					</div>
				</div>
			</div>
		</div>
								
		<jsp:include page="javaScript.jsp"></jsp:include>
		 <script >
   
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
   	
   	function consultarUsuario(){
   		var selectElement = document.getElementById("tipoConsulta");
   	 	var selectedIndex = selectElement.selectedIndex;
   	 	var selectedOption = selectElement.options[selectedIndex].innerText;
   	 	
   	 	var inputConsulta = document.getElementById("campoConsulta");
   	 	
   	 	inputConsulta.placeholder = selectedOption;
   		console.log("Opção selecionada: " + selectedOption);
   		
   	}
   	
   </script>
	</body>
</html>
    