<%@page import="org.apache.jasper.tagplugins.jstl.core.Out"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
	<jsp:include page="head.jsp" ></jsp:include>
	<body>
	<jsp:include page="navHead.jsp"></jsp:include>
	
	<!--Formul�rio de Cadastro de Usu�rio -->
	<main>
		<form id="formUser" action="<%=request.getContextPath()%>/ServletUsuarioController"
			method="post" id="formUser" enctype="multipart/form-data">
			<input name="acao" id="idAcao" type="hidden" value="">
			<div class="title">
				<h1>Cadastro de Usu�rio</h1>
			</div>
			<div class="divider"></div>
			<div class="form-row">
				<div class="form-group col-md-2">
					<label>C�digo Usu�rio</label> <input placeholder="ID"
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
			<div class="form-row">
				<div class="form-group col-md-4">
					<label>Foto de Perfil</label>
					<div class="input-group mb-3">
						<div class="custom-file">
							<input onchange="enviarFoto()" type="file" class="custom-file-input" name="arquivoFoto" id="arquivoFoto">
							<label class="custom-file-label" for="arquivoFoto">${modelLogin.arquivo.nomeArquivo}</label>
						</div>
					</div>

				</div>
			</div>
			<div class="form-row">
				<div class="form-group col-md-4">
					<label>CEP</label> <input onblur="pesquisacep(this.value);" placeholder="CEP"
						value="${modelLogin.cep}" name="cep" id="cepUsuario" 
						type="text" class="form-control" >
				</div>
				<div class="form-group col-md-8">
					<label>Logradouro</label> <input placeholder="Logradouro"
						value="${modelLogin.logradouro}" name="logradouro" id="logradouroUsuario" 
						type="text" class="form-control" >
				</div>
			</div>
			<div class="form-row">
				<div class="form-group col-md-4">
					<label>Bairro</label> <input placeholder="Bairro"
						value="${modelLogin.bairro}" name="bairro" id="bairroUsuario" 
						type="text" class="form-control" >
				</div>
				<div class="form-group col-md-4">
					<label>Cidade</label> <input placeholder="Cidade"
						value="${modelLogin.cidade}" name="cidade" id="cidadeUsuario" 
						type="text" class="form-control" >
				</div>
				<div class="form-group col-md-4">
					<label>UF</label> <input placeholder="Bairro"
						value="${modelLogin.uf}" name="uf" id="ufUsuario" 
						type="text" class="form-control" >
				</div>
			</div>
			<div class="form-row">
				
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

	<!-- Modal Consulta Usu�rio -->
	<div class="modal fade" id="modalConsultaUser" tabindex="-1"
		role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLabel">Consultar Usu�rio</h5>
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
									<th scope="col">C�digo</th>
									<th scope="col">Nome</th>
									<th scope="col">Login</th>
									<th scope="col">Op��es</th>
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
			if (loginConsultar != '') {
				$.ajax({
					url: url+"?acao=consultarUserTodos&loginConsultar="+loginConsultar,
					type: "GET",
					dataType: "json",
					success: function(data) {
						// Limpa a tabela antes de preench�-la novamente
						$("#tabelaResultado tbody").empty();
						
						// Preenche a tabela com os resultados recebidos em formato JSON
						for (var i = 0; i < data.length; i++) {
							var row = "<tr><td>" + data[i].id + "</td><td>" + data[i].nome + "</td><td>" + data[i].login + "</td><td><button onclick=\"editarUsuario("+data[i].id+")\" type=\"button\" class=\"btn btn-info\" data-dismiss=\"modal\">Editar</button></td></tr>";
							$("#tabelaResultado tbody").append(row);
						}
					},
					error: function() {
						alert("Erro ao realizar a consulta."); // Adicione uma mensagem de erro apropriada.
					}
				});
			} else {
				alert('Para consultar, digite o LOGIN de um Usu�rio')
			}
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
	   	
	   	function editarUsuario(id){
	   		var url = document.querySelector('#formUser').action
	   		window.location.href = url+'?acao=editarUsuario&id='+id
	   	}
  		
	   	function enviarFoto(){
	   		let caminhoArquivo = document.querySelector('#arquivoFoto').value
	   		document.getElementById('idAcao').value = 'uploadFoto'
			document.getElementById('formUser').submit()
	   	}
	   	
	   	function pesquisacep(valor) {
	        var cep = valor.replace(/\D/g, '');
	        
	        if (cep != "") {
	            var validacep = /^[0-9]{8}$/; //Express�o regular para validar o CEP.
	            
	            if(validacep.test(cep)) {
	                $.getJSON("https://viacep.com.br/ws/"+ cep +"/json/?callback=?", function(dados) {

                        if (!("erro" in dados)) {
                            $("#logradouroUsuario").val(dados.logradouro);
                            $("#bairroUsuario").val(dados.bairro);
                            $("#cidadeUsuario").val(dados.localidade);
                            $("#ufUsuario").val(dados.uf);
                        } //end if.
                        else {
                            alert("CEP n�o encontrado.");
                        }
                        console.log(dados);
                    });
	            }
	            else {
	                alert("Formato de CEP inv�lido.");
	            }
	        }
	   	}
	   	
// 	   	function meu_callback(conteudo) {
// 	        if (!("erro" in conteudo)) {
// 	            //Atualiza os campos com os valores.
// 	            document.getElementById('rua').value=(conteudo.logradouro);
// 	            document.getElementById('bairro').value=(conteudo.bairro);
// 	            document.getElementById('cidade').value=(conteudo.localidade);
// 	            document.getElementById('uf').value=(conteudo.uf);
// 	            document.getElementById('ibge').value=(conteudo.ibge);
// 	        } //end if.
// 	        else {
// 	            //CEP n�o Encontrado.
// 	            limpa_formul�rio_cep();
// 	            alert("CEP n�o encontrado.");
// 	        }
// 	    }
	   	
   </script>
   
	</body>
</html>
    