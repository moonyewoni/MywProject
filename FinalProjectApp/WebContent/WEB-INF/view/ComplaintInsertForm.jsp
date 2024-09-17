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
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>ComplaintInsertForm.jsp </title>
<link rel="stylesheet" type="text/css" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">

<script type="text/javascript" src="http://code.jquery.com/jquery.min.js"></script>
<script type="text/javascript" src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
</head>
<body>


<div class="container">
	<div class="panel-group">
		<div class="panel panel-default">
			<div class="panel-heading" id="title">
				신고사항입력
			</div>
			<div class="panel-body">
				<form role="form" action="Complaintinsert.action" method="post">
					<div class="form-group">
						<label for="name">
							신고자 
						</label>
						<input type="text" name="name" id="name" class="form-control" />
					</div>
					<div class="form-group">
						<label for="name">
							피신고자 
						</label>
						<input type="text" name="" id="" class="form-control" />
					</div>
					
					<div class="form-group">
						<label for="telephone">
							신고사유번호 
						</label>
						<select name="" id="" class="form-control">
							<option>불법행위를 조장하는 콘텐츠</option>
							<option>스팸홍보/도배 콘텐츠</option>
							<option>음란물 콘텐츠</option>
							<option>청소년에게 유해한 콘텐츠</option>
							<option>인신공격/생명경시/혐오/차별 행위 콘텐츠</option>
						</select>
					</div>
		
					<div class="form-group">
						<label for="telephone">
							신고내용 
						</label>
						<textarea name="" id="" cols="30" rows="10" class="form-control"></textarea>
					</div>
					
					<button type="submit" class="btn btn-default btn-sm">SUBMIT</button>
					<button type="button" class="btn btn-default btn-sm btnCancel">CANCEL</button>
				</form>
			</div>
		</div><!-- close .panel .panel default -->
	</div>
</div>





</body>
</html>