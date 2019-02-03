<%@page import="com.greenIt.Model.Employe"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<link href="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-GJzZqFGwb1QTTN6wy59ffF1BuGJpLSa9DkKMp0DgiMDm4iYMj70gZWKYbI706tWS" crossorigin="anonymous">

<meta charset="ISO-8859-1">
<title>Profile</title>
</head>
<body>
	
	
	<div class="form-row">
    <div class="form-group col-md-6">
      <label >Nom</label>
       <label ><%= ((Employe)session.getAttribute("employe")).getNom_empl() %></label>
    </div>
    <div class="form-group col-md-6">
      <label >Prenom</label>
      <label ><%= ((Employe)session.getAttribute("employe")).getPrenom_empl() %></label>
    </div>
  </div>
  <div class="form-group">
    <label >Address Email </label>
    <label ><%= ((Employe)session.getAttribute("employe")).getEmail_empl() %> </label>
  </div>
  <div class="form-group">
  <label >Role</label>
    <label ><%= ((Employe)session.getAttribute("employe")).getRole_empl() %></label>
  </div>
    <div class="form-group">
    <label >Date Naissance</label>
    <label ><%= ((Employe)session.getAttribute("employe")).getDate_naissance_empl() %></label>
  </div>
  <div class="form-group">
    <label >Equipe</label>
    <label ><%= ((Employe)session.getAttribute("employe")).getEquipe().getNom_equipe() %></label>
  </div>
  

</body>
</html>