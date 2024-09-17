<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
   request.setCharacterEncoding("UTF-8");
   String cp = request.getContextPath();
%>
<%
	String projectPath = getServletContext().getRealPath("/");
	projectPath = projectPath.replace("\\", "!!!");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>GroupCreationForm.jsp</title>
<link rel="stylesheet" type="text/css" href="<%=cp%>/css/main.css">
<link rel="stylesheet" type="text/css" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">

<script type="text/javascript" src="http://code.jquery.com/jquery.min.js">
<script type="text/javascript" src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>

</head>
<body>

<div class="panel title">
	<h1>그룹생성신청폼</h1>
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
				<li class="active">
					<a href="groupcreationform.action">
						그룹 생성 <span class="sr-only">(current)</span>
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
					그룹 데이터 입력
				</span>
				<span class="col-md-9">
					<a href="grouplist.action" role="button" class="btn btn-success btn-xs" id="btnAdd"
					style="vertical-align: bottom;">그룹 리스트 출력</a>
				</span>
			</div>
			
			<div class="panel-body">
				<form action="groupcreationinsert.action?path=<%=projectPath %>"
				 method="post" id="myForm" enctype="multipart/form-data">
					<input type="hidden" id="match_id" name="match_id" class="form-control" placeholder="GM00" maxlength="30" required="required" readonly="readonly" value="${nextGMId }">
					<input type="hidden" id="type_id" name="type_id" class="form-control" placeholder="GJ01" maxlength="30" required="required" readonly="readonly" value="GJ01">
					<input type="hidden" id="id" name="id" class="form-control" placeholder="groupId" maxlength="30" required="required" readonly="readonly" value="${nextGCId }">
					<input type="hidden" id="group_id" name="group_id" class="form-control" maxlength="30" required="required" readonly="readonly">
					<table class="table table-striped">
			 
						<tr style="height: 10px;">
						</tr>
						
						<tr>
							<td>
								<div class="input-group" role="group">
									<span class="input-group-addon" id="basic-addon2" style="width: 100px;">
										그룹 명 <sup style="color: red;">※</sup>
									</span>
									<input type="text" id="name" name="name" class="form-control"
									placeholder="ex) SIST" maxlength="30" required="required">
									<span class="input-group-addon">1 ~ 30 이내</span>
								</div>
							</td>
						</tr>
						
						
						
						<tr>
							<td>
								<div class="input-group" role="group">
									<span class="input-group-addon" id="basic-addon3" style="width: 100px;">
										소개글 <sup style="color: red;">※</sup>
									</span>
									<input type="text" id="introduction" name="introduction" class="form-control"
									placeholder="ex) 안녕하세요" maxlength="40" required="required">
									<span class="input-group-addon">1 ~ 30 이내</span>
								</div>
							</td>
						</tr>
						<tr>
							<td>
								<div class="input-group" role="group">
									<span class="input-group-addon" id="basic-addon3" style="width: 100px;">
										그룹 아이콘  <sup style="color: red;">※</sup>
									</span>
									<input type="text" id="root" name="root" class="form-control"
									placeholder="파일 첨부" maxlength="40" readonly="readonly">
								<span class="input-group-addon"><input name="file" type="file" accept="image/jpeg,image/png" value="파일"></span>
								</div>
							</td>
						</tr>
						
						<tr style="height: 10px;">
						</tr>
						
						<tr>
							<td>
								<span style="font-size: small;">(※)는 필수입력 사항입니다.</span>
							</td>
						</tr>
						
						<tr>
							<td style="text-align: center;">
							<c:choose>
		                      <c:when test="${count > 0}">
		                        <button type="submit" class="btn btn-success" disabled="disabled">등록</button>
		                      </c:when>
		                      <c:otherwise>
		                        <button type="submit" class="btn btn-success">등록</button>
		                      </c:otherwise>
		                    </c:choose>
								<button type="reset" class="btn btn-default">취소</button>
								<br>
								
								
								<span style="font-size: small; color: red; display: none;">
									필수 입력 사항을 모두 입력해야 합니다.
								</span>
								<br><br>
						
								<span id="error" style="color: red; font-weight: bold; display: none;"></span>
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




















