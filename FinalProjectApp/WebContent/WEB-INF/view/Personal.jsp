<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
request.setCharacterEncoding("UTF-8");
String cp = request.getContextPath();

String user_id = (String) request.getSession().getAttribute("user_id");
String admin = (String) request.getSession().getAttribute("admin");

if (user_id == null && admin == null) {
	response.sendRedirect("loginform.action");
}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>개인페이지</title>
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
<script
	src='https://cdn.jsdelivr.net/npm/fullcalendar@6.1.15/index.global.min.js'></script>
<script type="text/javascript"
	src="//dapi.kakao.com/v2/maps/sdk.js?appkey=4833730b76b007bdcf9d4907fd005673"></script>
<script>
	document.addEventListener('DOMContentLoaded', function() {
		var calendarEl = document.getElementById('calendar');
		var calendar = new FullCalendar.Calendar(calendarEl, {
			themeSystem : 'bootstrap5',
			initialView : 'dayGridMonth',
			headerToolbar : {
				left : 'prev next today',
				center : 'title',
				right : 'dayGridMonth timeGridWeek timeGridDay'
			},
			events : 
			[ 
				// 모먼트 날짜 찍어주기
				<c:forEach var="item" items="${momentList}">
				{
				title : '${item.moment_name}', // a property!
				start : '${item.date_name}', // a property!
				end : '${item.date_name}' // a property! ** see important note below about 'end' **
				}
				<c:if test="${!Status.last }">
				,
				</c:if>
				
				</c:forEach>
				
				
			]
		});
		calendar.render();
		

		container = document.getElementById("map");
		mapCenter = new kakao.maps.LatLng(37.5565389, 126.9195136);
		options = {
			center : mapCenter,
			level : 3,
		};
		map = new kakao.maps.Map(container, options);

	});
</script>

</head>
<body>
	
	<!-- ======= Header ======= -->
	<header id="header" class="header fixed-top d-flex align-items-center">
		<div class="d-flex align-items-center justify-content-between">
			<a href="main.action" class="logo d-flex align-items-center"> <img
				src="assets/img/logo.png" alt=""> <span
				class="d-none d-lg-block">MOMENT</span>
			</a> <i class="bi bi-list toggle-sidebar-btn"></i>
		</div>
		<!-- End Logo -->
		<div class="search-bar">
			<form class="search-form d-flex align-items-center" method="POST"
				action="#">
				<input type="text" name="query" placeholder="Search"
					title="Enter search keyword">
				<button type="submit" title="Search">
					<i class="bi bi-search"></i>
				</button>
			</form>
		</div>
		<!-- End Search Bar -->
		<c:import url="/notification.action"></c:import>
		
		<!-- End Icons Navigation -->

	</header>
	<!-- End Header -->

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

	<main id="main" class="main">
		<div class="pagetitle">
			<h1>개인페이지</h1>
			<nav>
				<ol class="breadcrumb">
					<li class="breadcrumb-item"><a href="main.action">Main</a></li>
					<li class="breadcrumb-item active">개인페이지</li>
				</ol>
			</nav>
		</div>
		<!-- End Page Title -->

		<section class="section dashboard">
			<div class="row">

				<!-- Left side columns -->
				<div class="col-lg-8">
					<div class="row">

						<!-- Most Recent Card -->
						<div class="col-xxl-4 col-md-6">
							<div class="card info-card sales-card">
								<div class="card-body">
									<h5 class="card-title">
										Most Recent<span> | MOMENT</span>
									</h5>

									<div class="d-flex align-items-center">
										<div
											class="card-icon rounded-circle d-flex align-items-center justify-content-center">
											<i class="bi bi-cart"></i>
										</div>
										<div class="ps-3">
											<h6>
												<a href="momentinfo.action?moment_id=${recentMoment.moment_id }&group_id=${recentMoment.group_id}" style="color: black;font-size: clamp(12px, 5vw, 22px);">${recentMoment.moment_name }</a>
											</h6>
											<span class="text-success small pt-1 fw-bold">${recentMoment.date_name }</span><br>
											<span class="text-muted small pt-2 ps-1">${recentMoment.group_name }</span>
										</div>
									</div>
								</div>

							</div>
						</div>
						<!-- End Most Recent Card -->

						<!-- Revenue Card -->
						<div class="col-xxl-4 col-md-6">
							<div class="card info-card revenue-card">
								<div class="card-body">
									<h5 class="card-title">
										Nearest Next <span>| MOMENT</span>
									</h5>

									<div class="d-flex align-items-center">
										<div
											class="card-icon rounded-circle d-flex align-items-center justify-content-center">
											<i class="bi bi-currency-dollar"></i>
										</div>
										<div class="ps-3">
											<h6>
												<a href="momentinfo.action?moment_id=${nextMoment.moment_id }&group_id=${nextMoment.group_id}" style="color: black;font-size: clamp(12px, 5vw, 22px);">${nextMoment.moment_name }</a>
											</h6>
											<span class="text-success small pt-1 fw-bold">${nextMoment.date_name }</span><br>
											<span class="text-muted small pt-2 ps-1">${nextMoment.group_name }</span>

										</div>
									</div>
								</div>

							</div>
						</div>
						<!-- End Revenue Card -->

						<!-- Customers Card -->
						<div class="col-xxl-4 col-xl-12">

							<div class="card info-card customers-card">
								<div class="card-body">
									<h5 class="card-title">
										BuildUp <span>| MOMENT</span>
									</h5>

									<div class="swiper init-swiper">
										<script type="application/json" class="swiper-config">
            {
              "loop": false,
              "speed": 600,
              "autoplay": {
                "delay": 3000
              },
              "slidesPerView": "auto",
              "pagination": {
                "el": ".swiper-pagination",
                "type": "bullets",
                "clickable": true
              },
              "breakpoints": {
                "320": {
                  "slidesPerView": 1,
                  "spaceBetween": 40
                },
                "480": {
                  "slidesPerView": 1,
                  "spaceBetween": 60
                },
                "640": {
                  "slidesPerView": 1,
                  "spaceBetween": 80
                },
                "992": {
                  "slidesPerView": 1,
                  "spaceBetween": 120
                },
                "1200": {
                  "slidesPerView": 1,
                  "spaceBetween": 120
                }
              }
            }
          </script>
										<div class="swiper-wrapper align-items-center">
										<c:forEach var="item" items="${buildingMoment }">
											<div class="swiper-slide">
												<div class="d-flex align-items-center">
													<div
														class="card-icon rounded-circle d-flex align-items-center justify-content-center">
														<i class="bi bi-people"></i>
													</div>
													<div class="ps-3">
														<h6>
															<a href="momentbuild.action?moment_id=${item.moment_id }&group_id=${item.group_id}" style="color: black;font-size: clamp(12px, 5vw, 22px);">${item.moment_name }</a>
														</h6>
														<span class="text-success small pt-1 fw-bold">${item.date_name }</span><br>
														<span class="text-muted small pt-2 ps-1">${item.group_name }</span>
													</div>
												</div>
											</div>
										</c:forEach>	
										</div>
									</div>
								</div>
								<!-- end cardbody -->
							</div>

						</div>
						<!-- End Customers Card -->

						<!-- Callendar -->
						<div class="col-12">
							<div class="card">
								<div class="card-body">
									<h5 class="card-title">
										Callendar <span>/Today</span>
									</h5>

									<!-- Line Chart -->
									<div id="calendar"></div>
									<!-- End Line Chart -->

								</div>

							</div>
						</div>
						<!-- End Reports -->

						<!-- Group List -->
						<div class="col-12">
							<div class="card recent-sales overflow-auto">
								<div class="card-body">
									<h5 class="card-title">
										Group List <span>| My Group</span>
									</h5>

									<table class="table table-sm">
										<thead>
											<tr>
												<th scope="col">Num</th>
												<th scope="col">Name</th>
												<th scope="col">Introduction</th>
												<th scope="col">Count</th>
												<th scope="col">Since</th>
											</tr>
										</thead>
										<tbody>
											<c:forEach var="item" items="${groupList }" varStatus="status">
											<tr>
												<th scope="row">${status.count }</th>
												<td><a href="group.action?group_id=${item.group_id }" class="text-primary">${item.name }</a></td>
												<td>${item.introduction }</td>
												<td>${item.count }</td>
												<td>${item.creation_date }</td>
											</tr>
											</c:forEach>
										</tbody>
									</table>
								</div>
							</div>
						</div>
						<!-- End GroupList -->

						<!-- Moment List -->
						<div class="col-12">
							<div class="col-12">
								<div class="card recent-sales overflow-auto">
									<div class="card-body">
										<h5 class="card-title">
											MOMENT List <span>| My MOMENT</span>
										</h5>
										<table class="table table-sm">
											<thead>
												<tr>
													<th scope="col">Num</th>
													<th scope="col">Name</th>
													<th scope="col">Group</th>
													<th scope="col">Phase</th>
													<th scope="col">PLACE</th>
													<th scope="col">DATE</th>
												</tr>
											</thead>
											<tbody>
												<c:forEach var="item" items="${momentList }" varStatus="status">
												<tr>
													<th scope="row">${status.count }</th>
													<td>
														<c:if test="${item.phase_id == 'MH01' }">
														<a href="momentoper.action?moment_id=${item.moment_id }&group_id=${item.group_id}" class="text-primary">${item.moment_name }</a>
														</c:if>
														<c:if test="${item.phase_id == 'MH02' }">
														<a href="momentbuild.action?moment_id=${item.moment_id }&group_id=${item.group_id}" class="text-primary">${item.moment_name }</a>
														</c:if>
														<c:if test="${item.phase_id == 'MH03' }">
														<a href="momentinfo.action?moment_id=${item.moment_id }&group_id=${item.group_id}" class="text-primary">${item.moment_name }</a>
														</c:if>
													</td>
													<td>${item.group_name }</td>
													<td>${item.phase }</td>
													<td>${item.place_name }</td>
													<td>${item.date_name }</td>
												</tr>
												</c:forEach>	
											</tbody>
										</table>
									</div>
								</div>
							</div>

						</div>
						<!-- End Moment List -->

					</div>
				</div>
				<!-- End Left side columns -->

				<!-- Right side columns -->
				<div class="col-lg-4">

					<!-- Next MOMENT -->
					<div class="card">
						<div class="card-body">
							<h5 class="card-title">
								Next MOMENT <span>| Summary</span>
							</h5>
							<div class="activity">
								<c:forEach var="item" items="${summaryMoment }">
								<div class="activity-item d-flex">
									<div class="activite-label" style="font-size: clamp(5px, 5vw, 10px);">${item.date_name }</div>
									<i
										class='bi bi-circle-fill activity-badge text-success align-self-start'></i>
									<div class="activity-content" style="font-size: clamp(5px, 5vw, 10px);">
										${item.group_name } 
										<a href="momentinfo.action?moment_id=${item.moment_id }&group_id=${item.group_id}" class="fw-bold text-dark">${item.moment_name }</a>
										${item.place_name }
									</div>
								</div>
								<!-- End activity item-->
								</c:forEach>
							</div>

						</div>
					</div>
					<!-- End Recent Activity -->

					<!-- Maps -->
					<div class="card">
						<div class="card-body pb-0">
							<h5 class="card-title">
								Favorite Place <span>| Map</span>
							</h5>
							<div id="map" style="min-height: 400px;" class="map"></div>
						</div>
					</div>
					<!-- End Maps -->

					<!-- Gallery -->
					<div class="card">
						<div class="card-body pb-0">
							<h5 class="card-title">
								Favorite Picture <span>| Gallery</span>
							</h5>
							<div class="swiper init-swiper">
								<script type="application/json" class="swiper-config">
            {
              "loop": false,
              "speed": 600,
              "autoplay": {
                "delay": 3000
              },
              "slidesPerView": "auto",
              "pagination": {
                "el": ".swiper-pagination",
                "type": "bullets",
                "clickable": true
              },
              "breakpoints": {
                "320": {
                  "slidesPerView": 1,
                  "spaceBetween": 40
                },
                "480": {
                  "slidesPerView": 1,
                  "spaceBetween": 60
                },
                "640": {
                  "slidesPerView": 1,
                  "spaceBetween": 80
                },
                "992": {
                  "slidesPerView": 1,
                  "spaceBetween": 120
                },
                "1200": {
                  "slidesPerView": 1,
                  "spaceBetween": 120
                }
              }
            }
          </script>
								<div class="swiper-wrapper align-items-center">
									<div class="swiper-slide" style="background-color: black">
										<img src="<%=cp%>/images/sampleimage/sample1.jpg" alt=""
											class="img-fluid" />
									</div>
									<div class="swiper-slide" style="background-color: black">
										<img src="<%=cp%>/images/sampleimage/sample2.jpg" alt=""
											class="img-fluid" />
									</div>
									<div class="swiper-slide" style="background-color: black">
										<img src="<%=cp%>/images/sampleimage/sample3.jpg" alt=""
											class="img-fluid" />
									</div>
									<div class="swiper-slide" style="background-color: black">
										<img src="<%=cp%>/images/sampleimage/sample4.jpg" alt=""
											class="img-fluid"/>
									</div>
									<div class="swiper-slide" style="background-color: black">
										<img src="<%=cp%>/images/sampleimage/sample5.jpg" alt=""
											class="img-fluid" />
									</div>
									<div class="swiper-slide" style="background-color: black">
										<img src="<%=cp%>/images/sampleimage/sample6.jpg" alt=""
											class="img-fluid" />
									</div>
								</div>
							</div>
						</div>
					</div>
					<!-- End Favorite Ficture -->
				</div>
				<!-- End Right side columns -->
			</div>
		</section>

	</main>
	<!-- End #main -->

	

	<a href="#"
		class="back-to-top d-flex align-items-center justify-content-center"><i
		class="bi bi-arrow-up-short"></i></a>

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