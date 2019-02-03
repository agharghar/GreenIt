<%@page import="com.greenIt.Model.Employe"%>
<%@page import="java.text.DateFormat"%>
<%@page import="com.greenIt.Model.Tache"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
	<label for="code_pro">Code Projet</label>
	<select name="code_pro" id="code_pro" required="required">	
		<c:forEach items='<%=((Employe)session.getAttribute("employe")).getProjects() %>' var="project">
			<option value="${project.getCode_pro()}">${project.getCode_pro()}</option>
		</c:forEach>
	</select>
</div>
<div>
	<label for="charge">Charge Horraire </label>
	<input type="text" id="charge" 
	value=" <%= ((com.greenIt.Model.Tache) session.getAttribute("tacheToEdit")).getCharge_horaire_tache() %> " required="required"/>
</div>
<div>
	<label for="prop">Proprité</label>
	<input type="text" id="prop" 
	value=" <%= ((com.greenIt.Model.Tache) session.getAttribute("tacheToEdit")).getPriorite_tache() %> " required="required"/>
</div>
<div>
	<label for="desc">Description</label>
	<input type="text" id="desc" 
	value=" <%= ((com.greenIt.Model.Tache) session.getAttribute("tacheToEdit")).getDescription_tache() %> " required="required"/>
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

DateFormat dateFormat = new SimpleDateFormat("yyyy-mm-dd") ; 
String debut , fin ; 
if(((com.greenIt.Model.Tache) session.getAttribute("tacheToEdit")).getDate_debut_tache() != null){
	 debut = dateFormat.format(((com.greenIt.Model.Tache) session.getAttribute("tacheToEdit")).getDate_debut_tache()) ; 
	 debut = "<input type='date' value='"+debut+"' name='debut' >" ; 
}else{
	debut = "<input type='date' name='debut' >"  ; 
	
}
if(((com.greenIt.Model.Tache) session.getAttribute("tacheToEdit")).getDate_fin_tache() != null ){
	 fin = dateFormat.format(((com.greenIt.Model.Tache) session.getAttribute("tacheToEdit")).getDate_fin_tache()) ; 
	fin = "<input type='date' value='"+fin+"' name='fin' >" ; 
}else{
	fin = "<input type='date' name='fin' >"  ; 
}


%>

<div>
	<label>date debut</label>
	<%= debut%>
	<label>date debut</label>
	<%= fin%>

</div>

<input type="submit" value="submit">
</form>

<%= request.getParameter("tacheId") %>
Page edition

</body>
</html>