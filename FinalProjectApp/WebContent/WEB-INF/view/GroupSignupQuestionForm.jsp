<%@page import="org.apache.jasper.tagplugins.jstl.core.ForEach"%>
<%@page import="com.test.prj.GroupDTO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.HashMap"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
   request.setCharacterEncoding("UTF-8");
   String cp = request.getContextPath();
%>
<%
	String group_id = request.getParameter("id");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>GroupSignupQuestionForm.jsp</title>
<link rel="stylesheet" type="text/css" href="<%=cp%>/css/main.css">
<link rel="stylesheet" type="text/css" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">

<script type="text/javascript" src="http://code.jquery.com/jquery.min.js"></script>
<script type="text/javascript" src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>


</head>
<body>

<div class="panel title">
	<h1>그룹가입신청서</h1>
</div>

<!-- 메인 메뉴 영역 -->
<nav class="navbar navbar-default">
	<div class="container-fluid">
		<div class="navbar-header">
			<a class="navbar-brand" href="#">Home</a>
		</div>
		<div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
			<ul class="nav navbar-nav">
				<li class="active">
					<a href="grouplist.action">
						그룹 관리 <span class="sr-only">(current)</span>
					</a>
				</li>
				<li>
					<a href="groupcreationform.action">
						그룹 생성 
					</a>
				</li>
				<li>
					<a href="groupcreationList.action">
						가개설 그룹 리스트 
					</a>
				</li>
			</ul>
		</div><!-- .collapse .navbar-collapse -->
		
	</div><!-- .container-fluid -->
</nav>

<div class="container">
	<div class="panel-group">
		<div class="panel panel-default">
			<div class="panel-heading" style="height: 60px;">
				<span style="font-size: 17px; font-weight: bold;" class="col-md-3">
					그룹 신청서 입력
				</span>
				<span class="col-md-9">
					<a href="grouplist.action" role="button" class="btn btn-success btn-xs" id="btnAdd"
					style="vertical-align: bottom;">그룹 리스트 출력</a>
				</span>
			</div>
			
			<div class="panel-body">
				<form action="groupsignupinsert.action" method="post" id="myForm">
					<table class="table table-striped">
						<tr>
							<td>
								<div class="input-group" role="group">
									<span class="input-group-addon" id="basic-addon1">
										그룹 매치 번호 
									</span>
									<input type="text" id="match_id" name="match_id" class="form-control"
									placeholder="GM00" maxlength="30" required="required" readonly="readonly" value="${nextGMId }">
									<span class="input-group-addon"></span>
								</div>
							</td>
						</tr>
						
						<tr>
							<td>
								<div class="input-group" role="group">
									<span class="input-group-addon" id="basic-addon1">
										그룹 매치 유형 번호 
									</span>
									<input type="text" id="type_id" name="type_id" class="form-control"
									placeholder="GJ03" maxlength="30" required="required" readonly="readonly" value="GJ03">
									<span class="input-group-addon"></span>
								</div>
							</td>
						</tr>
						
						<tr>
							<td>
								<div class="input-group" role="group">
									<span class="input-group-addon" id="basic-addon1">
										그룹 가입 번호 
									</span>
									<input type="text" id="signup_id" name="signup_id" class="form-control"
									placeholder="SU00" maxlength="30" required="required" readonly="readonly" value="${nextSUId }">
									<span class="input-group-addon"></span>
								</div>
							</td>
						</tr>
					
						<tr>
							<td>
								<div class="input-group" role="group">
									<span class="input-group-addon" id="basic-addon1">
										그룹 번호 
									</span>
									<input type="text" id="group_id" name="group_id" class="form-control"
									placeholder="groupId" maxlength="30" required="required" readonly="readonly" value="<%=group_id %>">
									<span class="input-group-addon"></span>
								</div>
							</td>
						</tr>
						
						<c:forEach var="question" items="${question }">
						
						<tr style="height: 10px;">
						</tr>
						
						<tr>
							<td>
								<div class="input-group" role="group">
									<span class="input-group-addon" id="basic-addon1">
										질문 번호 
									</span>
									<input type="text" id=${question.id } name="questionIds" class="form-control"
									placeholder="question_id" maxlength="30" required="required" readonly="readonly" value=${question.id }>
									<span class="input-group-addon"></span>
								</div>
							</td>
						</tr>
						<tr style="height: 10px;">
						</tr>
						
						<tr>
							<td>
								<div class="input-group" role="group">
									<span class="input-group-addon" id="basic-addon2" style="width: 100px;">
										${question.id } : ${question.content } <sup style="color: red;">※</sup>
									</span>
									<input type="text" id="${question.id }" name="answers" class="form-control"
									placeholder="ex) 좋습니다." maxlength="30" required="required">
								</div>
								
							</td>
						</tr>
						
						</c:forEach>
						
						
						<tr>
							<td>
								<span style="font-size: small;">(※)는 필수입력 사항입니다.</span>
							</td>
						</tr>
						
						<tr>
							<td style="text-align: center;">
								<button type="submit" class="btn btn-success">등록</button>
								<button type="reset" class="btn btn-default">취소</button>
								<br>
								
								
								<span style="font-size: small; color: red; display: none;">
									필수 입력 사항을 모두 입력해야 합니다.
								</span>
							</td>
						</tr>
					</table>
				</form>
			</div>
		</div>
	</div>
</div>
</body>
</html>























