<%@page import="java.util.ArrayList"%>
<%@page import="java.util.Calendar"%>
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
<title>MomentInfo.jsp</title>
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
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=4833730b76b007bdcf9d4907fd005673&libraries=services"></script>


<script type="text/javascript">

		$(document).ready(function()
		{
			$("#joinBtn").click(function()
			{
				if (parseInt($("#max_participant").val()) <= parseInt($("#parti_num").val()))
				{
					alert("이미 최대인원이 채워졌습니다. 참여가 불가능합니다.");
					return;
				}
				
				
				if ($(this).val() < 1)
				{
					if ($("#planEndMoment").val() != null && $("#planEndMoment").val() != "" && parseInt($("#planEndMoment").val()) < 1
						&& ($("#endMoment").val() == null || $("#endMoment").val() == ""))
					{
						alert("이미 계획기간이 끝난 모먼트에 참여할 수 없습니다.");
						return;
					}
					else if ($("#endMoment").val() != null && $("#endMoment").val() != "" && parseInt($("#endMoment").val()) < 1)
					{
						if (confirm("모먼트에 실제로 참석하지 않았는데 어플리케이션 상에서 참여를 신청할 경우 패널티를 받을 수 있습니다. 그래도 해당 모먼트에 참여하시겠습니까?"))
						{
							$("#myForm").submit();
						}
					}
					else
					{
						if (confirm("해당 모먼트에 참여하시겠습니까?"))
						{
							$("#myForm").submit();
						}
					}
				}
				else
				{
					if ($("#planEndMoment").val() != null && $("#planEndMoment").val() != "" && parseInt($("#planEndMoment").val()) < 1)
					{
						alert("이미 계획기간이 끝난 모먼트의 참여를 취소할 수 없습니다.");
						return;
					}
					else if (confirm("해당 모먼트의 참여를 취소하시겠습니까?"))
					{
						location.href = "momentcancel.action?moment_id=" + $("#moment_id").val() + "&group_id=" + $("#group_id").val();
					}
				}
			});
			
			$("#gallery").click(function()
			         {
			            $(location).attr("href", "gallery.action?group_id=" + $("#group_id").val() + "&moment_id=" + $("#moment_id").val()
			                        + "&countJoin=" + $("#joinBtn").val());
			         });
			
			
			$(".btn-success").click(function()
			{
				$(location).attr("href", "group.action?group_id=" + $("#group_id").val());
			});
			
			if ($("#endMoment").val() != null && $("#endMoment").val() != "")
			{
				$("#endThing").css("display", "inline");
				
				if ($(".btn-primary").val() > 0)
				{
					$("#adjustment").css("display", "inline");
				}
			}

			
		});

</script>


<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=4833730b76b007bdcf9d4907fd005673&libraries=services"></script>


<script type="text/javascript">
	document.addEventListener('DOMContentLoaded', function() {
		
		container = document.getElementById("map");
		mapCenter = new kakao.maps.LatLng(37.5565389, 126.9195136);
		options = {
			center : mapCenter,
			level : 3,
			draggable: false,
		};
		map = new kakao.maps.Map(container, options);
		
		var geocoder = new kakao.maps.services.Geocoder();
	
		// 주소로 좌표를 검색합니다
		geocoder.addressSearch( $("#place_name").val(), function(result, status) {
	
		    // 정상적으로 검색이 완료됐으면 
		     if (status === kakao.maps.services.Status.OK) {
	
		        var coords = new kakao.maps.LatLng(result[0].y, result[0].x);
	
		        // 결과값으로 받은 위치를 마커로 표시합니다
		        var marker = new kakao.maps.Marker({
		            map: map,
		            position: coords
		        });
	
		        // 인포윈도우로 장소에 대한 설명을 표시합니다
		        var infowindow = new kakao.maps.InfoWindow({
		            content: '<div style="width:150px;text-align:center;padding:6px 0;">약속장소</div>'
		        });
		        infowindow.open(map, marker);
	
		        // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
		        map.setCenter(coords);
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
		<h1>모먼트 인포</h1>
		<nav>
			<ol class="breadcrumb">
				<li class="breadcrumb-item"><a href="main.action">Main</a></li>
				<li class="breadcrumb-item"><a href="group.action?group_id=<%=request.getParameter("group_id") %>">그룹</a></li>
				<li class="breadcrumb-item active">모먼트 인포</li>
			</ol>
		</nav>
	</div>
		<!-- End Page Title -->
	<section class="section dashboard">
		<div class="row">
			<!-- main columns -->
				<div class="col-lg-8">
					<div class="row">

						<!-- Most Recent Card -->
						<div class="col-xxl-4 col-md-6">
							<div class="card info-card sales-card">
								<div class="card-body">
									<h5 class="card-title" >
										DATE<span> | MOMENT</span>
									</h5>

									<div class="d-flex align-items-center">
										<div
											class="card-icon rounded-circle d-flex align-items-center justify-content-center">
											<i class="bi bi-calendar-check"></i>
										</div>
										<div class="ps-3">
											<h6 style="font-size: clamp(12px, 5vw, 22px);">
												${momentList.date_name }
											</h6>
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
										PLACE <span>| MOMENT</span>
									</h5>

									<div class="d-flex align-items-center">
										<div
											class="card-icon rounded-circle d-flex align-items-center justify-content-center">
											<i class="bi bi-map"></i>
										</div>
										<div class="ps-3">
											<h6 style="font-size: clamp(12px, 5vw, 22px);">
												${momentList.place_name }
											</h6>
										</div>
									</div>
								</div>

							</div>
						</div>
						<!-- End Revenue Card -->
						
						<!-- Revenue Card -->
						<div class="col-xxl-4 col-md-6">
							<div class="card info-card customers-card">
								<div class="card-body">
									<h5 class="card-title">
										MEMBER_RANGE <span>| MOMENT</span>
									</h5>

									<div class="d-flex align-items-center">
										<div
											class="card-icon rounded-circle d-flex align-items-center justify-content-center">
											<i class="bi bi-person-plus"></i>
										</div>
										<div class="ps-3">
											<h6>
												${momentList.min_participant } ~ ${momentList.max_participant } 명
											</h6>
										</div>
									</div>
								</div>

							</div>
						</div>
						<!-- End Revenue Card -->
					</div>
					<div class="card text-center">
						<div class="card-body">
							
							
							<div class="card-title">
								<h5 class="card-title">
									${momentList.moment_name }
								</h5>
							</div>
							
							<div style="${countDate > 0  && countJoin < 1 ? 'display: inline;' : 'display: none;' }">
								<span style="color: red; font-weight: bold;">해당 모먼트의 일시에 이미 일정이 존재합니다.<br>
								신중하게 참여를 결정해주세요.</span>
							</div>
							
								
								<form action="momentjoin.action?group_id=<%=request.getParameter("group_id") %>" method="post" id="myForm">
								
									<div class="input-group mb-3">
										<span class="input-group-text" id="basic-addon2" style="width: 100px; font-weight: bold;">
											모먼트명
										</span>
										<input type="text" id="moment_name" name="moment_name" class="form-control" readonly="readonly"
										value="${momentList.moment_name }" style="width: 1000px;">
									</div>
						
									<div class="input-group mb-3">
										<span class="input-group-text" id="basic-addon2" style="width: 100px; font-weight: bold;">
											일시
										</span>
										<input type="text" id="date_name" name="date_name" class="form-control" readonly="readonly"
										value="${momentList.date_name }" style="width: 1000px;">
										<b style="font-size: small; color: purple;">인포 마감 : ${momentList.plan_end_date}</b>
									</div>
							
									<div class="input-group mb-3">
										<span class="input-group-text" id="basic-addon2" style="width: 100px; font-weight: bold;">
											장소
										</span>
										<input type="text" id="place_name" name="place_name" class="form-control" readonly="readonly"
										value="${momentList.place_name }" style="width: 1000px;">
									</div>
									<div class="card">
											<div id="map" style="min-height: 400px;" class="map"></div>
									</div>
									<div class="input-group mb-3">
										<span class="input-group-text" id="basic-addon2" style="width: 100px; font-weight: bold;">
											최소 인원
										</span>
										<input type="text" id="min_participant" name="min_participant" class="form-control" readonly="readonly"
										value="${momentList.min_participant }" style="width: 1000px;">
									</div>
						
									<div class="input-group mb-3">
										<span class="input-group-text" id="basic-addon2" style="width: 100px; font-weight: bold;">
											최대 인원
										</span>
										<input type="text" id="max_participant" name="max_participant" class="form-control" readonly="readonly"
										value="${momentList.max_participant }" style="width: 1000px;">
									</div>
				
									<div class="input-group mb-3">
										<span class="input-group-text" id="basic-addon2" style="width: 100px; font-weight: bold;">
											참고사항
										</span>
										<textarea rows="10" cols="200" id="note" name="note" class="form-control"
										 readonly="readonly" style="text-align: left;">${momentList.note }</textarea>
									</div>
							
								<div style="text-align: center;">
									<button type="button" class="btn btn-primary" id="joinBtn" value="${countJoin }">
									${countJoin > 0 ? "참여 취소" : "참여" }</button>
									<button type="button" id="gallery" class="btn btn-primary">갤러리</button>
									<button type="button" class="btn btn-success">목록으로</button>
									<input type="hidden" id="moment_id" name="moment_id" value="${momentList.moment_id }">
									<input type="hidden" id="phase" name="phase"value="${momentList.phase }">
									<input type="hidden" id="group_id" value="<%=request.getParameter("group_id") %>">
									<input type="hidden" id="endMoment" value="${endMoment }">
									<input type="hidden" id="planEndMoment" value="${planEndMoment }">
								</div>
	
								</form>
							
							
						</div><!-- end card-body -->
					</div><!-- end card -->


			</div><!-- end lg-8 -->
			
			
			<div class="col-lg-4">
			<div class="card">
				<div class="card-header">
					<h5 class="card-title">${endMoment <= 0 ? '참여한' : '참여 중인'} 멤버 <span class="badge bg-primary badge-number" style="color: white;">${momentList.parti_num }</span></h5>
					<div>
						<ul>
						<c:forEach var="parti" items="${partiList }">
							<li> ${parti.participant_name }</li>
						</c:forEach>
						</ul>
						<input type="hidden" id="parti_num" value="${momentList.parti_num }">
					</div>
				</div> 
			</div>
			
			<div class="card">
				<div class="card-header">
					<h5 class="card-title">나의 일정</h5>
					<c:import url="/personalcalendar.action"></c:import>
				</div> 
			</div>
			
		
		</div>
		</div><!--end .row -->
	</section><!-- 섹션 엔드 --> 
</main>


<!-- Vendor JS Files -->
	<script src="assets/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
	<script src="assets/vendor/quill/quill.js"></script>
	<script src="assets/vendor/tinymce/tinymce.min.js"></script>
	<script src="assets/vendor/php-email-form/validate.js"></script>
	<script src="assets/vendor/swiper/swiper-bundle.min.js"></script>
	<!-- Template Main JS File -->
	<script src="assets/js/main.js"></script>

</body>
</html> 