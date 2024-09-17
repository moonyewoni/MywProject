<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>MomentPage.jsp</title>
<link rel="stylesheet" type="text/css" href="<%=cp%>/css/main.css">
<style type="text/css">
body 
{
    font-family: Arial, sans-serif;
    background-color: #f4f4f4;
    margin: 0;
    padding: 0;
    text-align: center;
}

.container 
{
    background-color: #ffffff;
    margin: 20px auto;
    padding: 20px;
    border-radius: 8px;
    box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
    max-width: 600px;
}

.header 
{
    font-size: 2em;
    font-weight: bold;
    color: #333;
    margin-bottom: 20px;
}

.group-id 
{
    font-size: 1.2em;
    margin-bottom: 20px;
    color: #666;
}

.vote 
{
    background-color: #007bff;
    color: #ffffff;
    border: none;
    padding: 10px 20px;
    font-size: 1em;
    border-radius: 5px;
    cursor: pointer;
    transition: background-color 0.3s ease;
}

.vote:hover 
{
    background-color: #0056b3;
}

</style>
<script type="text/javascript" src="http://code.jquery.com/jquery.min.js"></script>
<script type="text/javascript">
	
	$(document).ready(function()
	{
		$(".vote").click(function()
		{
			if (confirm("매니저 임명투표를 진행하시겠습니까?"))
			{
				$(location).attr("href", "managervote.action?group_id=" + $(this).val());
			}
			
		}); 
		
	});
</script>
</head>
<body>

<div class="container">
	<p class="header">그룹 페이지</p>
	<hr>
	<p>Group ID : ${group_id}</p>
	<p>Match ID : ${match_id}</p>
	
	<br><br>
	
	<p>Manager Count : ${managerCount }</p>
	<c:forEach var="mgList" items="${managerList }">
		<p>Manager List : ${mgList.name }</p>	
	</c:forEach>

	<form role="form" action="managervote.action" method="get">
		<button type="button" class="vote" value="${group_id}">투표하기</button>
	</form>
</div>

</body>
</html>