<html>
<head>
  <title>Formulario de registro enviado</title>
</head>
<body>
  <%-- Obtener los datos del formulario --%>
  <% String nombre = request.getParameter("nombre"); %>
  <% String apellido = request.getParameter("apellido"); %>
  <% String edad = request.getParameter("edad"); %>
  <% String password = request.getParameter("password"); %>

  <%-- Establecer conexión a la base de datos --%>
  <%@ page import="java.sql.*" %>
  <% 
  Class.forName("com.mysql.jdbc.Driver");
  Connection dbconect = DriverManager.getConnection("jdbc:mysql://localhost:3306/semestral","root","");
  Statement dbstatement = dbconect.createStatement();
  String insertarsql = "INSERT INTO registro (nombre,apellido,edad,password) VALUES('" +nombre+ "','" +apellido+ "','" +edad+ "', '" +password+ "')";
  dbstatement.executeUpdate(insertarsql);
  String redirectURL = "Bienvenida.html";
  response.sendRedirect(redirectURL);
  %>
</body>
</html>