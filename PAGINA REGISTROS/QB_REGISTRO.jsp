<html>
<head>
  <title>Formulario de quimica y biologia enviado</title>
</head>
<body>
  <%-- Obtener los datos del formulario --%>
  <% String nombre = request.getParameter("nombre"); %>
  <% String cedula = request.getParameter("cedula"); %>
  <% String experiencia_virtual = request.getParameter("experiencia_virtual"); %>

  <%-- Establecer conexión a la base de datos --%>
  <%@ page import="java.sql.*" %>
  <% 
  Class.forName("com.mysql.jdbc.Driver");
  Connection dbconect = DriverManager.getConnection("jdbc:mysql://localhost:3306/semestral","root","");
  Statement dbstatement = dbconect.createStatement();
  String insertarsql = "INSERT INTO qb (nombre,cedula,experiencia_virtual) VALUES('" +nombre+ "','" +cedula+ "','" +experiencia_virtual+ "')";
  dbstatement.executeUpdate(insertarsql);
  String redirectURL = "../PAGINA HOME/inicio.html";
  response.sendRedirect(redirectURL);
  %>
</body>
</html>