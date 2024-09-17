<%@page import="java.util.ArrayList"%>
<%@page import="java.util.Calendar"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>GalleryPage.jsp</title>
<link href="assets/img/favicon.png" rel="icon">
<link href="assets/img/apple-touch-icon.png" rel="apple-touch-icon">

<!-- Google Fonts -->
<link href="https://fonts.gstatic.com" rel="preconnect">
<link
	href="https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i|Nunito:300,300i,400,400i,600,600i,700,700i|Poppins:300,300i,400,400i,500,500i,600,600i,700,700i"
	rel="stylesheet">

<!-- Vendor CSS Files -->
<link href="assets/vendor/bootstrap/css/bootstrap.min.css"
	rel="stylesheet">
<link href="assets/vendor/bootstrap-icons/bootstrap-icons.css"
	rel="stylesheet">
<link href="assets/vendor/boxicons/css/boxicons.min.css"
	rel="stylesheet">
<link href="assets/vendor/quill/quill.snow.css" rel="stylesheet">
<link href="assets/vendor/quill/quill.bubble.css" rel="stylesheet">
<link href="assets/vendor/remixicon/remixicon.css" rel="stylesheet">
<link href="assets/vendor/simple-datatables/style.css" rel="stylesheet">
<link href="assets/vendor/swiper/swiper-bundle.min.css" rel="stylesheet">

<!-- Main CSS File -->
<link href="assets/css/style.css" rel="stylesheet">

<script type="text/javascript" src="http://code.jquery.com/jquery.min.js"></script>
<script type="text/javascript" src="<%=cp %>/js/util.js"></script>
<script type="text/javascript" src="<%=cp %>/js/jquery-ui.js"></script>

<style type="text/css">

	img
	{
		display: block;
		width: 1000px;
		height: 1000px;
	}
	

</style>

<script type="text/javascript" src="http://code.jquery.com/jquery.min.js"></script>

<script type="text/javascript" src="<%=cp %>/js/util.js"></script>
<script type="text/javascript" src="<%=cp %>/js/jquery-ui.js"></script>

<script type="text/javascript">

		$(document).ready(function()
		{
			
			$("#back").click(function()
			{
				$(location).attr("href", "gallery.action?group_id=" + $("#group_id").val() + "&moment_id=" + $("#moment_id").val()
							+ "&countJoin=" + $("#countJoin").val());
			});
			
			$("#submitBtn").click(function()
			{
				if (confirm("댓글을 등록하시겠습니까?"))
				{
					$(location).attr("href", "gallerycommentinsert.action?group_id=" + $("#group_id").val()
							+ "&gallery_id=" + $("#gallery_id").val() + "&contents=" + $("#comment").val()
							+ "&moment_id=" + $("#moment_id").val());
				}
			});
			
			$("#deleteGallery").click(function()
			{
				if (confirm("게시글을 삭제하시겠습니까?"))
				{
					$(location).attr("href", "galleryremove.action?group_id=" + $("#group_id").val()
							+ "&gallery_id=" + $("#gallery_id").val() + "&moment_id=" + $("#moment_id").val()
							+ "&path=" + $("#projectPath").val());
				}
				
			});
			
			$("#deleteComment").click(function()
			{
				if (confirm("댓글을 삭제하시겠습니까?"))
				{
					$(location).attr("href", "gallerycommentremove.action?group_id=" + $("#group_id").val()
							+ "&gallery_id=" + $("#gallery_id").val() + "&moment_id=" + $("#moment_id").val()
							+ "&comment_id=" + $(this).val());
				}
				
			});
			
			
		});

</script>

</head>
<body>

<header>
<c:import url="/header.action"></c:import>
</header>
<aside id="sidebar" class="sidebar">
<c:import url="/aside.action"></c:import>
</aside>

<main id="main" class="main">
	<div class="pagetitle">
		<h1>${momentName } - 갤러리 페이지 조회</h1>
		<nav>
			<ol class="breadcrumb">
				<li class="breadcrumb-item"><a href="main.action">Main</a></li>
				<li class="breadcrumb-item"><a href="group.action?group_id=<%=request.getParameter("group_id") %>">그룹</a></li>
				<li class="breadcrumb-item"><a href="momentinfo.action?moment_id=<%=request.getParameter("moment_id") %>&group_id=<%=request.getParameter("group_id") %>">모먼트</a></li>
				<li class="breadcrumb-item active">갤러리</li>
			</ol>
		</nav>
	</div>
	<section class="section dashboard">
		<div class="row">
			<!-- main columns -->
				<div class="col-lg-8">		
			
			
											
				<div class="card mb-3">
					<div class="card-body mb-3">
						<form id="myForm">
							<div class="card-header">
								<div class="input-group mb-3" role="group">
									<span class="input-group-text" id="basic-addon2">
										작성자
									</span>
									<input type="text" id="participant_name" class="form-control" readonly="readonly"
									value="${myGalleryList.participant_name }">
								</div>
								
								<div class="input-group mb-3" role="group">
									<span class="input-group-text" id="basic-addon2">
										작성일
									</span>
									<input type="text" id="upload_date" class="form-control" readonly="readonly"
									value="${myGalleryList.upload_date }" >
								</div>
	
								<div>
									<button type="button" class="btn btn-default" 
									style="${deleteOk == 1 ? 'display: inline' : 'display: none'}"
									 id="deleteGallery">삭제</button>
								</div>
							</div>
							<div id="carouselExampleSlidesOnly" class="carousel slide" data-bs-ride="carousel">
		                		<div class="carousel-inner">
		                  			<div class="carousel-item active">
										<img id="image" src="<%=cp %>/images/img/gallery/${myGalleryList.file_settingname}"
										 class="img">
									</div>
								</div>
							</div>
							
							<br>
							<div>
								댓글 
								<span class="badge bg-primary badge-number" style="color: white; margin-left: 5px;"">${countComment }</span>
							</div>
							<br>
							
							<div>
								<c:forEach var="comment" items="${commentList }">
								<div class="input-group form-floating" role="group">
									<span class="input-group-text" id="basic-addon2" >
										${comment.writer_name }
									</span>
									<input type="text" name="contents" id="contents"class="form-control" readonly="readonly"
									value="${comment.contents }">
									<%-- <label for="contents" style="margin-left: 950px; text-align: left;">작성일 : ${comment.write_date }</label> --%>
									<button type="button" class="btn btn-danger" value="${comment.comment_id }"
									style="${comment.my_count == 0 ? 'display: none' : 'display: inline'}"
									id="deleteComment">삭제</button>
									<button type="button" class="btn btn-danger"
									style="${comment.my_count == 1 ? 'display: none' : 'display: inline'}">신고</button>
								</div>
								<br>
								</c:forEach>
							</div>
							
							<div class="input-group" role="group">
								<span class="input-group-text" id="basic-addon2" style="width: 100px; font-weight: bold;">
									댓글
								</span>
								<textarea rows="5" cols="200" id="comment" class="form-control"
								 style="text-align: left;" maxlength="200"></textarea>
							</div>
							<br>
							<div>
								<button type="button" class="btn btn-success" id="submitBtn">등록</button>
								<button type="reset" class="btn btn-default"
								style="background-color: gray; color: white;">취소</button>
								<button type="button" class="btn btn-default" id="back"
								style="background-color: navy; color: white;">목록으로</button>
							</div>

							<input type="hidden" id="moment_id" name="moment_id" value="${myGalleryList.moment_id }">
							<input type="hidden" id="group_id" value="<%=request.getParameter("group_id") %>">
							<input type="hidden" id="gallery_id" value="<%=request.getParameter("gallery_id") %>">
							<input type="hidden" id="projectPath" value="<%=projectPath %>">
							<input type="hidden" id="countJoin" value="${countJoin }">

						</form>
					</div>
				</div>
			</div>
		</div>
	</section>
 </main>

	<!-- Vendor JS Files -->
	<script src="assets/vendor/apexcharts/apexcharts.min.js"></script>
	<script src="assets/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
	<script src="assets/vendor/chart.js/chart.umd.js"></script>
	<script src="assets/vendor/echarts/echarts.min.js"></script>
	<script src="assets/vendor/quill/quill.js"></script>
	<script src="assets/vendor/simple-datatables/simple-datatables.js"></script>
	<script src="assets/vendor/tinymce/tinymce.min.js"></script>
	<script src="assets/vendor/php-email-form/validate.js"></script>
	<script src="assets/vendor/swiper/swiper-bundle.min.js"></script>
	<!-- Template Main JS File -->
	<script src="assets/js/main.js"></script>


</body>
</html>