<%@ page contentType="text/html; charset=UTF-8"
%><%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" 
%><%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
	
	// MyIdCountAjax.jsp
	
	String count = request.getParameter("count");
	
	response.setContentType("text/xml");
	
%><?xml version="1.0" encoding="UTF-8"?>
<lists>
	<count><%=count %></count>
</lists>
