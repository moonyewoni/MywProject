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
<title>SignupDecision.jsp</title>
<link rel="stylesheet" type="text/css" href="<%=cp%>/css/main.css">
<link rel="stylesheet" type="text/css" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">

<script type="text/javascript" src="http://code.jquery.com/jquery.min.js">
<script type="text/javascript" src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
</head>
<body>
<div class="container">
	<div class="panel-group">
		<div class="panel panel-default">
		
			<!-- <div class="panel-heading row"> -->
			<div class="panel-heading" style="height: 60px;">
				<span style="font-size: 17pt; font-weight: bold;" class="col-md-3">
					응답 리스트 
				</span>
			</div>
			
			<div class="panel-body">
				<table class="table table-hover table-striped">
					<tr class="trTitle">
						<th>가입 ID</th>
						<th>신청자</th>
						<th>질문</th>
						<th>응답</th>
						<th>응답 일자</th>
					</tr>
					
					 <c:forEach var="answer" items="${answerList }">
						 <tr>
						 	<td>${answer.signup_id }</td>
						 	<td>${answer.name }</td>
						 	<td>${answer.question }</td>
						 	<td>${answer.answer }</td>
						 	<td>${answer.answer_date }</td>
						 	
						 	<td>
						 		<a href="signupResult.action?&signup_id=${answer.signup_id }&response='SW01'">수락</a>
						 	</td>
						 	<td>
						 		<a href="signupResult.action?&signup_id=${answer.signup_id }&response='SW02'">거절</a>
						 	</td>
						 </tr>
					 </c:forEach>
				</table>
			</div>
		</div>
	</div>
</div>
</body>
</html>