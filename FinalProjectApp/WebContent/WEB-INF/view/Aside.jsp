<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
request.setCharacterEncoding("UTF-8");
String cp = request.getContextPath();

String user_id = (String) request.getSession().getAttribute("user_id");
String admin = (String) request.getSession().getAttribute("admin");

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Aside</title>
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
</head>
<body>
	<!-- ======= Sidebar ======= -->
	<aside id="sidebar" class="sidebar">

		<ul class="sidebar-nav" id="sidebar-nav">

			<li class="nav-item"><a class="nav-link " href="personal.action">
					<i class="bi bi-grid"></i> <span>개인페이지</span>
			</a></li>
			<!-- End Personal Nav -->

			<li class="nav-item"><a class="nav-link collapsed"
				data-bs-target="#components-nav" data-bs-toggle="collapse" href="#">
					<i class="bi bi-menu-button-wide"></i>
					<span>그룹리스트</span>
					<i class="bi bi-chevron-down ms-auto"></i></a>
				<ul id="components-nav" class="nav-content collapse "
					data-bs-parent="#sidebar-nav">
					<c:if test="${groupList != null }">
					<c:forEach var="item" items="${ groupList}">
					<li>
						<a href="group.action?group_id=${item.group_id }"> 
							<i class="bi bi-circle"></i>
							<span>${item.name }</span>
						</a>
					</li>
					</c:forEach>
					</c:if>
					<c:if test="${groupList == null }">
						<li>
						<a href="#"> 
							<i class="bi bi-circle"></i>
							<span>소속된 그룹이 없습니다.</span>
						</a>
					</li>
					</c:if>
					
				</ul></li>
			<!-- End Components Nav -->

			<li class="nav-item"><a class="nav-link collapsed"
				data-bs-target="#forms-nav" data-bs-toggle="collapse" href="#">
					<i class="bi bi-journal-text"></i> <span>즐겨찾기</span> <i
					class="bi bi-chevron-down ms-auto"></i>
			</a>
				<ul id="forms-nav" class="nav-content collapse "
					data-bs-parent="#sidebar-nav">
					<li><a class="nav-link collapsed"
						data-bs-target="#fv_grouplist" data-bs-toggle="collapse" href="#">
							<i class="bi bi-circle"></i> <span>즐겨찾기한 그룹</span> <i
							class="bi bi-chevron-down ms-auto"></i>
					</a>
						<ul id="fv_grouplist" class="nav-content collapse "
							data-bs-parent="#forms-nav">
							<li>
								<a class="padding" href="personal.action"><i class="bi bi-circle"></i>SIST</a>
							</li>
							<li><a class="padding" href="grouplist.action"><i class="bi bi-circle"></i>대학동기</a></li>
							<li><a class="padding" href="#"><i class="bi bi-circle"></i>군대 동기</a></li>
							<li><a class="padding" href="#"><i class="bi bi-circle"></i>Dropdown 4</a></li>
						</ul></li>
					<li>
						<a class="nav-link collapsed"
					data-bs-target="#fv_momentlist" data-bs-toggle="collapse" href="#">
						<i class="bi bi-circle"></i>
						<span>즐겨찾기한 모먼트</span>
						<i class="bi bi-chevron-down ms-auto"></i>
						</a>
						<ul id="fv_momentlist" class="nav-content collapse "
					data-bs-parent="#forms-nav">
							<li><a class="padding" href="personal.action"><i class="bi bi-circle"></i>겨울여행</a></li>
							<li><a class="padding" href="grouplist.action"><i class="bi bi-circle"></i>여름여행</a></li>
							<li><a class="padding" href="#"><i class="bi bi-circle"></i>봄여행</a></li>
							<li><a class="padding" href="#"><i class="bi bi-circle"></i>저녁모임</a></li>
						</ul>
					</li>
					<li>
						<a class="nav-link collapsed"
					data-bs-target="#fv_gallerylist" data-bs-toggle="collapse" href="#">
						<i class="bi bi-circle"></i>
						<span>즐겨찾기한 갤러리</span>
						<i class="bi bi-chevron-down ms-auto"></i>
						</a>
						<ul id="fv_gallerylist" class="nav-content collapse "
					data-bs-parent="#forms-nav">
							<li><a href="personal.action">ㅇㅇ 모먼트의 갤러리</a></li>
							<li><a href="grouplist.action">ㅇㅇ 모먼트의 갤러리</a></li>
							<li><a href="#">ㅇㅇ 모먼트의 갤러리</a></li>
							<li><a href="#">ㅇㅇ 모먼트의 갤러리</a></li>
						</ul>
					</li>
				</ul>
			</li>
			<!-- End Forms Nav -->	
		</ul>

	</aside>
	<!-- End Sidebar-->


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