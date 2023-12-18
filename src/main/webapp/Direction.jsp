<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
     
<% response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate"); // HTTP 1.1.
response.setHeader("Pragma", "no-cache"); // HTTP 1.0.
response.setDateHeader("Expires", 0);

if(session.getAttribute("username")!=null){
	if(session.getAttribute("role").equals("admin")){
		 response.sendRedirect("Admin_profile.jsp");
		 }
	else{
		 response.sendRedirect("client_profile.jsp");
		 }
}
	
else {
	 response.sendRedirect("Login.jsp");
}
%>