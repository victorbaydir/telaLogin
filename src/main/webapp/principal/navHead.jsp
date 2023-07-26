  <nav class="navbar fixed-top navbar-expand-lg navbar-dark bg-dark">
    <div class="navbar-brand" href="#">
      <span class="material-symbols-outlined">
        rocket_launch
      </span>
    </div>
    <a class="navbar-brand" href="#">Curso-JSP</a>
    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>
  
    <div class="collapse navbar-collapse" id="navbarSupportedContent">
      <ul class="navbar-nav mr-auto">
        <li class="nav-item active">
          <a class="nav-link" href="#">Home <span class="sr-only">(current)</span></a>
        </li>
        <li class="nav-item active">
          <a class="nav-link" href="#">Contato<span class="sr-only">(current)</span></a>
        </li>
        <li class="nav-item active">
          <a class="nav-link" href="#"> <span class="sr-only">(current)</span></a>
        </li>
        <li class="nav-item active dropdown">
          <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
            Central
          </a>
          <div class="dropdown-menu" aria-labelledby="navbarDropdown">
            <a class="dropdown-item" href="<%= request.getContextPath()%>/principal/usuarioCadastro.jsp">Cadastro Usuário</a>
            <a class="dropdown-item" href="#">Sair</a>
            <div class="dropdown-divider"></div>
            <a class="dropdown-item" href="#">Opções</a>
          </div>
        </li>
      </ul>
      <div class="form-inline my-2 my-lg-0">
        <input class="form-control mr-sm-2" type="search" placeholder="Search" aria-label="Search">
        <button class="btn btn-outline-success my-2 my-sm-0" type="submit">Search</button>
      </div>
    </div>
  </nav>