<%@page import="com.greenIt.Dao.Tache"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>edition</title>
</head>
<body>


<form action="${pageContext.request.contextPath}/dashBoard/editTache" method="post">
<div>
	<label for="id">ID Tache </label>
	<input type="text" id="id" name="tacheId"
	value=" <%= ((com.greenIt.Model.Tache) session.getAttribute("tacheToEdit")).getId() %> " readonly />
</div>
<div>
	<label for="cod">Code projet </label>
	<input type="text" id="code" 
	value=" <%= ((com.greenIt.Model.Tache) session.getAttribute("tacheToEdit")).getProject() == null ? 
			"--" : ((com.greenIt.Model.Tache) session.getAttribute("tacheToEdit")).getProject().getCode_pro() %> " readonly="readonly"/>
</div>
<div>
	<label for="charge">Charge Horraire </label>
	<input type="text" id="charge" 
	value=" <%= ((com.greenIt.Model.Tache) session.getAttribute("tacheToEdit")).getCharge_horaire_tache() %> " readonly="readonly"/>
</div>
<div>
	<label for="prop">Proprité</label>
	<input type="text" id="prop" 
	value=" <%= ((com.greenIt.Model.Tache) session.getAttribute("tacheToEdit")).getPriorite_tache() %> " readonly="readonly"/>
</div>
<div>
	<label for="desc">Description</label>
	<input type="text" id="desc" 
	value=" <%= ((com.greenIt.Model.Tache) session.getAttribute("tacheToEdit")).getDescription_tache() %> " readonly="readonly"/>
</div>
	

<div>
<%
	String myStatus = ((com.greenIt.Model.Tache) session.getAttribute("tacheToEdit")).getStatut_tache()  ;
	String myStatutLabel ; 
	String secoundStatus , secoundStatusLabel ;
	String thirdStatus , thirdStatusLabel ; 
	
			
	if(myStatus.equals("ter")){
		myStatutLabel = "Terminer" ; 
		secoundStatus = "cours";
		secoundStatusLabel = "En Cours"; 
		thirdStatus = "faire" ; 
		thirdStatusLabel = "A Faire"; 
		
	}else if(myStatus.equals("cours")){
		myStatutLabel = "En Cours" ; 
		secoundStatus = "ter";
		secoundStatusLabel = "Terminer"; 
		thirdStatus = "faire" ; 
		thirdStatusLabel = "A Faire"; 
		
	}else{
		myStatutLabel = "A Faire" ; 
		secoundStatus = "cours";
		secoundStatusLabel = "En Cours"; 
		thirdStatus = "ter" ; 
		thirdStatusLabel = "Terminer"; 
		
		
	}
			
%>
	<label for="status" >Status</label>
	<select id="status" name="statut">
		<option value="<%=myStatus %>" selected="selected"> <%=myStatutLabel %> </option>
		<option value="<%=secoundStatus %>" > <%=secoundStatusLabel %> </option>
		<option value="<%=thirdStatus %>" > <%=thirdStatusLabel %> </option>
	
	</select>

</div>

<%

String debut = new SimpleDateFormat("yyyy-MM-dd").format(((com.greenIt.Model.Tache) session.getAttribute("tacheToEdit")).getDate_debut_tache()) ; 
String fin = new SimpleDateFormat("yyyy-MM-dd").format(((com.greenIt.Model.Tache) session.getAttribute("tacheToEdit")).getDate_fin_tache()) ; 
%>

<div>
	<label>date debut</label>
	<input type="date" value="<%=debut %>" name="debut" >
	<label>date debut</label>
	<input type="date" value="<%=fin %>" name="fin">

</div>

<input type="submit" value="submit">
</form>

<%= request.getParameter("tacheId") %>
Page edition

</body>
</html>