<%@ page contentType="text/html; charset=UTF-8"
%><%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" 
%><%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
	
	// MomentPlaceAjax.jsp
	
	String place_id = request.getParameter("place_id");
	String place_name = request.getParameter("place_name");
	
	response.setContentType("text/xml");
	
%><?xml version="1.0" encoding="UTF-8"?>
<lists>
	<place_id><%=place_id %></place_id>
	<place_name><%=place_name %></place_name>
</lists>
