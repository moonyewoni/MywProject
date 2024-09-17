<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
   request.setCharacterEncoding("UTF-8");
   String cp = request.getContextPath();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Gallery.jsp</title>
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
	
	function galleryLink(gallery_id)
	{
		var group_id = document.getElementById("group_id").value;
		var moment_id = document.getElementById("moment_id").value;
		location.href = "gallerypage.action?group_id=" + group_id + "&gallery_id=" + gallery_id
						+ "&moment_id=" + moment_id;
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
		<div class="row">
			<div class="col-3">
			<h1>${momentName } - 갤러리</h1>
			</div>
			<div class="col-9" style="display: flex; justify-content: flex-end;">
			<a href="galleryinsertform.action?moment_id=<%=request.getParameter("moment_id") %>
									&group_id=<%=request.getParameter("group_id") %>
									" role="button" class="btn btn-success btn-xs" id="btnAdd"
									style="${countJoin == 0 ? 'display: none' : 'display: inline' }">게시글 업로드</a>
			</div>
		</div>
		<nav>
			<ol class="breadcrumb">
				<li class="breadcrumb-item"><a href="main.action">Main</a></li>
				<li class="breadcrumb-item"><a href="group.action?group_id=<%=request.getParameter("group_id") %>">그룹</a></li>
				<li class="breadcrumb-item"><a href="momentinfo.action?moment_id=<%=request.getParameter("moment_id") %>&group_id=<%=request.getParameter("group_id") %>">모먼트</a></li>
				<li class="breadcrumb-item active">갤러리</li>
			</ol>
		</nav>
		<div class="pagesubtitle">전체 게시글 수<span class="badge bg-primary badge-number" style="color: white; margin-left: 5px;">${galleryCount }</span></div>
		
		
	</div>

	<section class="section dashboard">
		<div class="row col-lg-12 mb-3">
	    	<c:choose>
			<c:when test="${galleryList != '[]' }">
				<c:forEach var="article" items="${galleryList }">
				<div class="card col-lg-3 mb-3">
					<div class="card-body">
						<div id="carouselExampleSlidesOnly" class="carousel slide" data-bs-ride="carousel">
	                		<div class="carousel-inner">
	                  			<div class="carousel-item active">
									<img onclick="galleryLink('${article.gallery_id}')" src="<%=cp %>${article.root}${article.file_settingname}" class="d-block w-100">
								</div>
							</div>
						</div>
					</div>
				</div>
				</c:forEach>
				</c:when>
			
				<c:when test="${galleryList == '[]' }">
			    	<div style="text-align: center;">
			    		<span style="font-weight: bold; font-size: x-large;">아직 게시글이 없습니다.</span>
			    	</div>
			    </c:when>
        	</c:choose>
        	<input type="hidden" id="group_id" value="<%=request.getParameter("group_id") %>">
        	<input type="hidden" id="moment_id" name="moment_id" value="<%=request.getParameter("moment_id") %>">
        	<input type="hidden" id="countJoin" value="${countJoin }">

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