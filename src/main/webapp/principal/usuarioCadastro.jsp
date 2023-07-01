<%@page import="org.apache.jasper.tagplugins.jstl.core.Out"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">

<jsp:include page="head.jsp"></jsp:include>

  <body>
  <!-- Pre-loader start -->
  <div class="theme-loader">
      <div class="loader-track">
          <div class="preloader-wrapper">
              <div class="spinner-layer spinner-blue">
                  <div class="circle-clipper left">
                      <div class="circle"></div>
                  </div>
                  <div class="gap-patch">
                      <div class="circle"></div>
                  </div>
                  <div class="circle-clipper right">
                      <div class="circle"></div>
                  </div>
              </div>
              <div class="spinner-layer spinner-red">
                  <div class="circle-clipper left">
                      <div class="circle"></div>
                  </div>
                  <div class="gap-patch">
                      <div class="circle"></div>
                  </div>
                  <div class="circle-clipper right">
                      <div class="circle"></div>
                  </div>
              </div>
            
              <div class="spinner-layer spinner-yellow">
                  <div class="circle-clipper left">
                      <div class="circle"></div>
                  </div>
                  <div class="gap-patch">
                      <div class="circle"></div>
                  </div>
                  <div class="circle-clipper right">
                      <div class="circle"></div>
                  </div>
              </div>
            
              <div class="spinner-layer spinner-green">
                  <div class="circle-clipper left">
                      <div class="circle"></div>
                  </div>
                  <div class="gap-patch">
                      <div class="circle"></div>
                  </div>
                  <div class="circle-clipper right">
                      <div class="circle"></div>
                  </div>
              </div>
          </div>
      </div>
  </div>
  <!-- Pre-loader end -->
  <div id="pcoded" class="pcoded">
      <div class="pcoded-overlay-box"></div>
      <div class="pcoded-container navbar-wrapper">
          <jsp:include page="navHead.jsp"></jsp:include>

          <div class="pcoded-main-container">
              <div class="pcoded-wrapper">
                  <jsp:include page="navLateral.jsp"></jsp:include>
                  
                  
                  <div class="pcoded-content">
                      <!-- Page-header start -->
                      <div class="page-header">
                          <div class="page-block">
                              <div class="row align-items-center">
                                  <div class="col-md-8">
                                      <div class="page-header-title">
                                          <h5 class="m-b-10">Dashboard</h5>
                                          <p class="m-b-0">Welcome to Mega Able</p>
                                      </div>
                                  </div>
                                  <div class="col-md-4">
                                      <ul class="breadcrumb-title">
                                          <li class="breadcrumb-item">
                                              <a href="index.html"> <i class="fa fa-home"></i> </a>
                                          </li>
                                          <li class="breadcrumb-item"><a href="#!">Dashboard</a>
                                          </li>
                                      </ul>
                                  </div>
                              </div>
                          </div>
                      </div>
                      <!-- Page-header end -->
                      <div class="pcoded-inner-content">
                            <!-- Main-body start -->
                            <div class="main-body">
                                <div class="page-wrapper">
                                    <!-- Page-body start -->
                                    <div class="page-body">
                                            <!-- task, page, download counter  start -->
                                            
                                            <h1>Cadastro de Usuário</h1>
                                            <div class="row">
	                                            <div class="col-sm-12">
	                                                <!-- Basic Form Inputs card start -->
	                                                <div class="card">
	                                                    <div class="card-block">
	                                                        <h4 class="sub-title">Dados Básicos</h4>
				                                            <form action="<%= request.getContextPath()%>/ServletUsuarioController" method="post">
				                                            	<div class="form-group row">
	                                                                <label class="col-sm-1 col-form-label">ID</label>
	                                                                <div class="col-sm-1">
	                                                                    <input name="id" id="idUsuario" type="text" class="form-control" readonly="readonly" value="${modelLogin.id}">
	                                                                </div>
                                                            	</div>
                                                            	<div class="form-group row">
	                                                                <label class="col-sm-12 col-form-label">Nome</label>
	                                                                <div class="col-sm-5">
	                                                                    <input name="nome" id="nomeUsuario" type="text" class="form-control"  required="required" value="${modelLogin.nome}"
	                                                                    placeholder="Usuário">
	                                                                </div>
                                                            	</div>
                                                            	<div class="form-group row">
	                                                                <label class="col-sm-12 col-form-label">Login</label>
	                                                                <div class="col-sm-5">
	                                                                    <input name="login" id="loginUsuario" type="text" class="form-control"  required="required" value="${modelLogin.login}"
	                                                                    placeholder="Usuário">
	                                                                </div>
                                                            	</div>
                                                            	<div class="form-group row">
	                                                                <label class="col-sm-12 col-form-label">Senha</label>
	                                                                <div class="col-sm-5">
	                                                                    <input name="senha" id="senhaUsuario" type="password" class="form-control" required="required" value="${modelLogin.senha}"
	                                                                    placeholder="Senha">
	                                                                </div>
                                                            	</div>
                                                            	<div class="form-group row">
	                                                                <label class="col-sm-12 col-form-label">Email</label>
	                                                                <div class="col-sm-5">
	                                                                    <input name="email" id="emailUsuario" type="text" class="form-control" required="required" value="${modelLogin.email}"
	                                                                    placeholder="Email">
	                                                                </div>
                                                            	</div>
                                                            	<button name="novo" id="btnNovo" class="btn btn-primary waves-effect waves-light">Novo</button>
                                                            	<button name="salvar" id="btnSalvar" class="btn btn-success waves-effect waves-light">Salvar</button>
                                                            	<button name="excluir" id="btnExcluir" class="btn btn-danger waves-effect waves-light">Excluir</button>
				                                           </form>
			                                           </div>
		                                           </div>
	                                           </div>
                                           </div>
                                    </div>
                                            
                                            
                                    <!-- Page-body end -->
                                </div>
                                <div id="styleSelector"> </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- Warning Section Starts -->
    <!-- Older IE warning message -->
    <!--[if lt IE 10]>
    <div class="ie-warning">
        <h1>Warning!!</h1>
        <p>You are using an outdated version of Internet Explorer, please upgrade <br/>to any of the following web browsers to access this website.</p>
        <div class="iew-container">
            <ul class="iew-download">
                <li>
                    <a href="http://www.google.com/chrome/">
                        <img src="<%= request.getContextPath() %>/assets/images/browser/chrome.png" alt="Chrome">
                        <div>Chrome</div>
                    </a>
                </li>
                <li>
                    <a href="https://www.mozilla.org/en-US/firefox/new/">
                        <img src="<%= request.getContextPath() %>/assets/images/browser/firefox.png" alt="Firefox">
                        <div>Firefox</div>
                    </a>
                </li>
                <li>
                    <a href="http://www.opera.com">
                        <img src="<%= request.getContextPath() %>/assets/images/browser/opera.png" alt="Opera">
                        <div>Opera</div>
                    </a>
                </li>
                <li>
                    <a href="https://www.apple.com/safari/">
                        <img src="<%= request.getContextPath() %>/assets/images/browser/safari.png" alt="Safari">
                        <div>Safari</div>
                    </a>
                </li>
                <li>
                    <a href="http://windows.microsoft.com/en-us/internet-explorer/download-ie">
                        <img src="<%= request.getContextPath() %>/assets/images/browser/ie.png" alt="">
                        <div>IE (9 & above)</div>
                    </a>
                </li>
            </ul>
        </div>
        <p>Sorry for the inconvenience!</p>
    </div>
    <![endif]-->
    <!-- Warning Section Ends -->
    
    <!-- Required Jquery -->
   <jsp:include page="javaScript.jsp"></jsp:include>
</body>

</html>
    s