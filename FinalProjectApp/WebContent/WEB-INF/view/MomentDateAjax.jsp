<%@ page contentType="text/html; charset=UTF-8"
%><%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" 
%><%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
	
	// MomentDateAjax.jsp
	
	String date_id = request.getParameter("date_id");
	String year = request.getParameter("year");
	String month = request.getParameter("month");
	String day = request.getParameter("day");
	String time = request.getParameter("time");
	String doublePlan = request.getParameter("doublePlan");
	
	if (doublePlan == "-1")
		doublePlan = "0";
	
	if(day.equals(""))
		day = "-1";

	if(time.equals(""))
		time = "-1";
	
	response.setContentType("text/xml");
	
%><?xml version="1.0" encoding="UTF-8"?>
<lists>
	<date_id><%=date_id %></date_id>
	<year><%=year %></year>
	<month><%=month %></month>
	<day><%=day %></day>
	<time><%=time %></time>
	<doublePlan><%=doublePlan %></doublePlan>
</lists>
