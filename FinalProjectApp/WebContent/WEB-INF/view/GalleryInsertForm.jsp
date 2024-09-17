<%@page import="java.util.Iterator"%>
<%@page import="java.util.Enumeration"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@page import="java.util.ArrayList"%>
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
<title>GalleryInsertForm.jsp</title>
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

<script type="text/javascript">

		var num = 1;
		
		$(document).ready(function()
		{
			$("#submitBtn").click(function()
			{
				if (!confirm("게시글을 등록하시겠습니까?"))
					return false;
			});
			
			$("#cancelBtn").click(function()
			{
				$(location).attr("href", "gallery.action?group_id=" + $("#group_id").val() + "&moment_id=" + $("#moment_id").val()
								+ "&countJoin=" + $("#countJoin").val());
			});

		});
	    
		function uploadFile(input)
	    {
			document.getElementById("countFile").value = num;
			files = document.getElementById("files");
			num++;
			result = "<input type='file' name='file" + num + "' accept='image/*' onchange='uploadFile()'><br>";
			files.insertAdjacentHTML("beforeend", result);
			
			if (input.files && input.files[0]) {
			    var reader = new FileReader();
			    reader.onload = function(e) {
			      document.getElementById('preview').src = e.target.result;
			    };
			    reader.readAsDataURL(input.files[0]);
			  } else {
			    document.getElementById('preview').src = "";
			  }
			
			
	    }

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
		<h1>갤러리 업로드</h1>
		<nav>
			<ol class="breadcrumb">
				<li class="breadcrumb-item"><a href="main.action">Main</a></li>
				<li class="breadcrumb-item"><a href="group.action?group_id=<%=request.getParameter("group_id") %>">그룹</a></li>
				<li class="breadcrumb-item"><a href="momentinfo.action?moment_id=<%=request.getParameter("moment_id") %>&group_id=<%=request.getParameter("group_id") %>">모먼트</a></li>
				<li class="breadcrumb-item active">갤러리 업로드</li>
			</ol>
		</nav>
	</div>
			
	<section class="section dashboard">
		<div class="row">
			<!-- main columns -->
				<div class="col-lg-8 card">	

					<div class="card-title">
						<h1 class="card-title" style="font-weight: bold;">
							&nbsp;&nbsp;&nbsp;${momentName } - 갤러리 사진 업로드
						</h1>
					</div>
					
					<div class="card-body">
						<form action="galleryinsert.action?path=<%=projectPath %>"
						 method="post" enctype="multipart/form-data" id="myForm">
							<div id="files">
								<input type="file" id="file1" name="file1"
								accept="image/gif, image/jpeg, image/png" required="required" onchange="uploadFile(this)">
								<!-- <button type="submit" class="btn btn-success" id="upload">사진 업로드</button> -->
							</div>
							
							<div id="carouselExampleSlidesOnly" class="carousel slide" data-bs-ride="carousel">
		                		<div class="carousel-inner">
		                  			<div class="carousel-item active">
										<img id="preview" />
									</div>
								</div>
							</div>
							
							<button type="submit" class="btn btn-success" id="submitBtn">작성</button>
							<button type="reset" class="btn btn-default" id="cancelBtn" 
							style="background-color: gray; color: white;">취소</button>
							<br>
							
							<input type="hidden" id="group_id" name="group_id" value="<%=request.getParameter("group_id") %>">
							<input type="hidden" id="moment_id" name="moment_id" value="<%=request.getParameter("moment_id") %>">
							<input type="hidden" id="participant_id" name="participant_id" value="<%=request.getParameter("participant_id") %>">
							<input type="hidden" id="countFile" name="countFile" value="0">
							<input type="hidden" id="countJoin" name="countJoin" value="${countJoin }">
						</form>
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