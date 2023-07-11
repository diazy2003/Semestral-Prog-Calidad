<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Bienvenida</title>
    <link rel="stylesheet" href="SSEMESSTRAL.css">
    <link rel="icon" type="image/png" href="favicon.png">
</head>
<body>
    <header>
        <img class="LOGO_S2" src="LOGO SEMESTRAL.png" alt="Pila de libros y Solo-Ciencia">
    </header>
    <main>
        <h1>Bienvenido a Solo-Ciencia</h1>
        <form action="login.jsp" method="post">

        <label for="nombre">Nombre:</label>
            <input type="text" id="nombre" name="nombre" required><br><br>
            
        <label for="apellido">Apellido:</label>
            <input type="text" id="apellido" name="apellido" required><br><br>
            
        <label for="password">Contraseña:</label>
            <input type="password" id="password" name="password" required><br><br>
            
        <input type="submit" value="Ingresar">
        </form>
        <br>
    </main>
    <footer  class = "pie_inicio">
        <p>Solo-Ciencia® es un sitio oficial de marca registrada</p>
    </footer>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
 <%@ page import="java.sql.*" %>
  <%-- Obtener los datos del formulario --%>
  <% String nombre = request.getParameter("nombre"); %>
  <% String apellido = request.getParameter("apellido"); %>
  <% String password = request.getParameter("password"); %>

  <%-- Establecer conexión a la base de datos --%>
  <% 
  Class.forName("com.mysql.jdbc.Driver");
  Connection dbconect = DriverManager.getConnection("jdbc:mysql://localhost:3306/semestral","root","");
  try{
	  PreparedStatement consultaP = dbconect.prepareStatement("SELECT * from registro WHERE nombre=? AND apellido=? AND password=?");
	  consultaP.setString(1, nombre);
	  consultaP.setString(2, apellido);
	  consultaP.setString(3, password);
	  ResultSet resultado = consultaP.executeQuery();
	  if(resultado.next()){
		  String redirectURL = "PAGINA HOME/inicio.html";
		  response.sendRedirect(redirectURL);
	  } else{
		  %>
		  <a style="font-style:italic" href="Usuario_Registro.html">¿No está registrado? Registrese aquí</a>
		  <%
		      }
  } catch (Exception e){
	  out.println("ERROR");
	  out.println("Consulta invalida");
  }
  %>