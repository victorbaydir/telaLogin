<%@page import="org.apache.jasper.tagplugins.jstl.core.Out"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html >
<head>
<meta charset="ISO-8859-1">
<title>Curso JSP</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-9ndCyUaIbzAi2FUVXJi0CjmCapSmO7SnpJef0486qhLnuZ2cdeRhO02iuK6FUUVM" crossorigin="anonymous">

</head>

<style>
	body{
	
		height:100vh;
		display: flex;
		flex-direction: column;
		justify-content: center;
		align-items: center;
	}

	.sqr-login{
		width: 300px;
		height: 300px;
		display: flex;
		flex-direction: column;
		justify-content: center;
		align-items: center;
        box-shadow: 0px 0px 2px black;
        position: relative;
		
	}
	
	.sdw-one{
	width: 20px;
	height: 290px;
    position: absolute;
    translate: -160px 5px;
    background-color: rgba(128, 128, 128, 0.555);
	}

    .sdw-two{
	width: 310px;
	height: 20px;
    position: absolute;
    translate: -15px 160px;
    background-color: rgba(128, 128, 128, 0.555);
	}
	

</style>
<body>

	
		
	<form action="ServletLogin" method="post">
	<input type="hidden" id="url" name="usuario" value="<%= request.getParameter("url") %>" />
	
		<div class="sqr-login">
		<div class="sdw-one"></div>
            <div class="sdw-two"></div>
		  <div class="row mb-3" style="margin: 10px">
		    <label for="inputEmail3" class="col-sm-2 col-form-label" style="width: 300px;">Email</label>
		    <div class="col-sm-10" style="width:100%;">
		      <input name="login" type="text" class="form-control" id="inputEmail3">
		    </div>
		  </div>
		  <div class="row mb-3" style="margin: 10px">
		    <label for="inputPassword3" class="col-sm-2 col-form-label" style="width: 300px;">Password</label>
		    <div class="col-sm-10" style="width:100%;">
		      <input name="senha" type="password" class="form-control" id="inputPassword3" >
		    </div>
		  </div>
		  <button type="submit" class="btn btn-primary" style="width:93%;">Sign in</button>
			<h4 style="color: red; width:90%;font-size: 15px;margin-top:10px">${msg}</h4>
		</div>
	</form>

</body>
</html>