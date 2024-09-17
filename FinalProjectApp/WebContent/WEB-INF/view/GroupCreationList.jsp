<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
   request.setCharacterEncoding("UTF-8");
   String cp = request.getContextPath();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>GroupCreationList.jsp</title>
<link rel="stylesheet" type="text/css" href="<%=cp%>/css/main.css">
<link rel="stylesheet" type="text/css" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">

<script type="text/javascript" src="http://code.jquery.com/jquery.min.js">
<script type="text/javascript" src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<script type="text/javascript">

	function copyToClipboard()
	{
		// 복사할 URL 설정
		var inviteUrl = document.getElementById("inviteUrl").innerText;
		
		var tempTextArea = document.createElement("textarea");
		tempTextArea.value = inviteUrl;
		document.body.appendChild(tempTextArea);
		
        tempTextArea.select();
        document.execCommand("copy");
        
        document.body.removeChild(tempTextArea);
        
        alert("초대 URL이 클립보드에 복사되었습니다!");

	}




</script>

</head>
<body>

<div class="panel title">
	<h1>GroupCreationList 페이지</h1>
</div>

<!-- 메인 메뉴 영역 -->
<nav class="navbar navbar-default">
	<div class="container-fluid">
		<div class="navbar-header">
			<a class="navbar-brand" href="#">Home</a>
		</div>
		<div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
			<ul class="nav navbar-nav">
				<li>
					<a href="grouplist.action">
						그룹 관리 
					</a>
				</li>
				<li>
					<a href="groupcreationform.action">
						그룹 생성 
					</a>
				</li>
				<li class="active">
					<a href="groupcreationList.action">
						가개설 그룹 리스트 <span class="sr-only">(current)</span>
					</a>
				</li>
			</ul>
		</div><!-- .collapse .navbar-collapse -->
		
	</div><!-- .container-fluid -->
	
</nav>


<div class="container">
	<div class="panel-group">
		<div class="panel panel-default">
		
			<!-- <div class="panel-heading row"> -->
			<div class="panel-heading" style="height: 60px;">
				<span style="font-size: 17pt; font-weight: bold;" class="col-md-3">
					가개설 그룹 리스트 
				</span>
			</div>
			
			<div class="panel-body">
				전체 가개설 그룹 수
				<span class="badge">${count }</span>
			</div>
			
			<div class="panel-body">
				<table class="table table-hover table-striped">
					<tr class="trTitle">
						<th>가개설 그룹ID</th>
						<th>개설자</th>
						<th>그룹명</th>
						<th>소개글</th>
						<th>아이콘</th>
						<th>가개설 일자</th>
						<th>개설 마감 일자</th>
						<th>초기 그룹원 수</th>
						<th>초대</th>

					</tr>
					
						
					 
					 <c:forEach var="group" items="${list }">
					 	<c:if test="${group.count == '1' or group.count == '2' or group.count == '3' or group.count == '4' or group.end_date > sysdate}">
						 <tr>
						 	<td>${group.id }</td>
						 	<td>${group.user_id }</td>
						 	<td>${group.name }</td>
						 	<td>${group.introduction }</td>
						 	<td>${group.root }</td>
						 	<td>${group.creation_date }</td>
						 	<td>${group.end_date }</td>
						 	<td>${group.count }</td>
						 	
						 	
						 	<!-- 초대 URL을 표시할 요소 -->
	    					<div id="inviteUrl" style="display: none;">
	    						http://localhost:8090<%=cp %>/groupinvite.action?typeId=GJ02&matchId=${gmId}
	    					</div>
	    					<td>
						 	 <c:choose>
			                      <c:when test="${user_id == group.user_id}">
			                        <button onclick="copyToClipboard()" role="button" class="btn btn-success">초대(URL)</button>
			                      </c:when>
			                      <c:otherwise>
			                        <button onclick="copyToClipboard()" role="button" class="btn btn-success" disabled="disabled">초대(URL)</button>
			                      </c:otherwise>
                    		</c:choose>
                    		</td>

						 </tr>
					 	</c:if>
					 </c:forEach>
				</table>
			</div>
		</div>
	</div>
</div>
</body>
</html>




















