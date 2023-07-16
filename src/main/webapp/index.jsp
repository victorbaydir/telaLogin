<%@page import="org.apache.jasper.tagplugins.jstl.core.Out"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="resources/css/styles.css">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-9ndCyUaIbzAi2FUVXJi0CjmCapSmO7SnpJef0486qhLnuZ2cdeRhO02iuK6FUUVM" crossorigin="anonymous">
    
    <title>Login Page</title>
</head>
<body>
<form action="ServletLogin" method="post">
<input type="hidden" id="url" name="usuario" value="<%= request.getParameter("url") %>" />
    <div class="container">
        <div class="mtd">
        	<img style="width: 200px; height:200px;" alt="amico" src="resources/imgs/New entries-amico.svg">

        </div>
        <div class="mtd login">
            <div>
                <div id="titulo" class="campos title">Member Login</div>
                <div id="email" class="campos">
                    
                        <input class="input-campos" type="text" name="login" id="emailID" >
                </div>
                <div id="password" class="campos">
                        <input class="input-campos"type="password" name="senha" id="senhaID">

                </div>
                <div id="opcoes" class="campos opc">
                    <div>
                        <input type="submit"  class="input-campos input-login" value="LOGIN">
                    </div>
                        
                </div>
                <div id="opcoes" class="campos opc">
                        <a>
                            OBS.: PARA SIMULAR O LOGIN, PREENCHA O EMAIL E A SENHA
                        </a> 
                        <h4 style="color: red; width:90%;font-size: 15px;margin-top:10px">${msg}</h4>
                </div>
            </div>
        </div>
    </div>
</form>
</body>
</html>