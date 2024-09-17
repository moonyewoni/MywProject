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
<title>GroupList.jsp</title>
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

<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=4833730b76b007bdcf9d4907fd005673&libraries=services"></script>
<link rel="stylesheet" type="text/css" href="<%=cp %>/css/jquery-ui.css">
<script type="text/javascript" src="http://code.jquery.com/jquery.min.js"></script>
<script type="text/javascript" src="<%=cp %>/js/util.js"></script>
<script type="text/javascript" src="<%=cp %>/js/jquery-ui.js"></script>
<!-- <script type="text/javascript">
	
	$(document).ready(function()
	{
		$("#searchGroupName").click(function()
		{
			//alert("test");
			$("#nameErr").css("display", "none");
			$("#noneErr").css("display", "none");
			if ($("#name").val() == "")
			{
				$("#nameErr").css("display", "inline");
				return;
			}
			
			
			var params = "name=" + $("#name").val();
			
			$.ajax(
			{
				type: "POST"
				, url : "groupnamecount.action"
				, data : params
				, dataType : "xml"
				, success : function(count)
				{
					var isGroupExist = false;
					
					$(count).find("lists").each(function()
					{
						var lists = $(this);
						var count = lists.find("count").text();
						
						if (parseInt(count) == 0)
						{
							$("#noneErr").css("display", "inline");
							isGroupExist = false;
							return false;
							
						}
						else
						{
							isGroupExist = true;
							
						}
						
					});
					
				
			
				if (isGroupExist == true)
				{
					$("#searchForm").submit();
				}
			}
				, error : function(e)
				{
					alert(e.responseText);	
				}
				
				
			});
			
			
			
			
		});
		
	});


</script> -->
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
			<h1>그룹리스트</h1>
			</div>
			<div class="col-9" style="display: flex; justify-content: flex-end;">
			<a href="groupcreationform.action" role="button" class="btn btn-success btn-xs">그룹 생성</a>
			</div>
		</div>
		<nav>
			<ol class="breadcrumb">
				<li class="breadcrumb-item"><a href="main.action">Main</a></li>
				<li class="breadcrumb-item active">그룹</li>
			</ol>
		</nav>
	</div>
	<section class="dashboard">
		<div class="row">
			
			<!-- Left side -->
			<div class="col-lg-8">
					<div class="row">	
				
						<!-- 인포 모먼트 수가 많은 그룹 (활성화된 그룹) -->
						<div class="col-xxl-4 col-md-6">
							<div class="card info-card sales-card">
								<div class="card-body">
									<h5 class="card-title">
										Most ACTIVATE<span> | Group</span>
									</h5>
	
									<div class="d-flex align-items-center">
										<div
											class="card-icon rounded-circle d-flex align-items-center justify-content-center" style="overflow: hidden;">
											<img alt="" src="<%=cp %>${activeGroup.root }" style="max-width: 100%; max-height: 100%; width: auto; height: auto; display: block; border-radius: 50%">						
										</div>
										<div class="ps-3">
											<h6>
												<a href="group.action?group_id=${activeGroup.id }" style="color: black; font-size: clamp(12px, 5vw, 22px);">${activeGroup.name }</a>
											</h6>
											<span class="text-success small pt-1 fw-bold">${activeGroup.open_date }</span><br>
											<span class="text-muted small pt-2 ps-1">${activeGroup.introduction }</span>
										</div>
									</div>
								</div>
	
							</div>
						</div>
						
						
						<div class="col-xxl-4 col-md-6">
							<div class="card info-card revenue-card">
								<div class="card-body">
									<h5 class="card-title">
										Most People<span> | Group</span>
									</h5>
	
									<div class="d-flex align-items-center">
										<div
											class="card-icon rounded-circle d-flex align-items-center justify-content-center" style="overflow: hidden;">
											<img alt="" src="<%=cp %>${largeGroup.root }" style="max-width: 100%; max-height: 100%; width: auto; height: auto; display: block; border-radius: 50%">						
										</div>
										<div class="ps-3">
											<h6>
												<a href="group.action?group_id=${largeGroup.id }" style="color: black; font-size: clamp(12px, 5vw, 22px);">${largeGroup.name }</a>
											</h6>
											<span class="text-success small pt-1 fw-bold">${largeGroup.open_date }</span><br>
											<span class="text-muted small pt-2 ps-1">${largeGroup.introduction }</span>
										</div>
									</div>
								</div>
	
							</div>
						</div>
						
						
						<div class="col-xxl-4 col-xl-12">

							<div class="card info-card customers-card">
								<div class="card-body">
									<h5 class="card-title">
										Recently Created<span>| Groups</span>
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
										<c:forEach var="recentGroup" items="${recentList }">
											<div class="swiper-slide">
												<div class="d-flex align-items-center">
													<div class="card-icon rounded-circle d-flex align-items-center justify-content-center" style="overflow: hidden;">
														<img alt="" src="<%=cp %>${recentGroup.root }" style="max-width: 100%; max-height: 100%; width: auto; height: auto; display: block; border-radius: 50%">
													</div>
													<div class="ps-3">
														<h6>
															<a href="group.action?group_id=${recentGroup.id }" style="color: black;font-size: clamp(12px, 5vw, 22px);">${recentGroup.name }</a>
														</h6>
														<span class="text-success small pt-1 fw-bold">${recentGroup.open_date }</span><br>
														<span class="text-muted small pt-2 ps-1">${recentGroup.introduction }</span>
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
						<!--ENd Recently Create -->
				</div>
				
				<!-- 그룹 리스트 -->
				<div class="col-12">
					<div class="col-12">
						<div class="card recent-sales overflow-auto">
							<div class="card-body">
								<h5 class="card-title">
									그룹 리스트 <span> | In App</span> <span class="badge">${count }</span>
								</h5>
								
								<table class="table table-sm">
									<thead>
										<tr>
											<th scope="col">그룹ID</th>
											<th scope="col">그룹명</th>
											<th scope="col">소개글</th>
											<th scope="col">개설 일자</th>
											<th scope="col">그룹원 수</th>
											<th scope="col">그룹 홈</th>
											<th scope="col">가입</th>
											<th scope="col">관리</th>
										</tr>
									</thead>
									 <tbody>
									 <c:forEach var="group" items="${list }">
									 <tr>
									 	<td>${group.id }</td>
									 	<td>${group.name }</td>
									 	<td>${group.introduction }</td>
									 	<td>${group.open_date }</td>
									 	<td>${group.memberCount }</td>
									 	<td>
											<a href="group.action?group_id=${group.id }" role="button" class="btn btn-default">그룹 홈</a>
									 	</td>
									 	<td>
										    <c:set var="isFound" value="false" />
										    <c:forEach var="findGroup" items="${findGroup }">
										        <c:if test="${findGroup.group_id == group.id}">
										            <c:set var="isFound" value="true" />
										        </c:if>
										    </c:forEach>
										    
										    <c:choose>
										        <c:when test="${isFound}">
										            <a href="groupsignupquestionform.action?group_id=${group.id }" role="button" class="btn btn-default" disabled="disabled">가입</a>
										        </c:when>
										        <c:otherwise>
										            <a href="groupsignupquestionform.action?group_id=${group.id }" role="button" class="btn btn-default">가입</a>
										        </c:otherwise>
										    </c:choose>
										</td>
									 	<td>
											<a href="complaintinsert.action?group_id=${group.id }" role="button" class="btn btn-default">신고</a>
									 	</td>
									 </tr>
									 </c:forEach>
									 </tbody>
								</table>
							</div>
						</div>
					</div>
				</div>
				
					<div class="col-12">
					<div class="col-12">
						<div class="card recent-sales overflow-auto">
							<div class="card-body">
								<h5 class="card-title">
										가개설 그룹 리스트 <span> | In App</span> <span class="badge">${creationCount }</span>
								</h5>
								
								<table class="table table-sm">
									<thead>
									<tr>
										<th scope="col">가개설 그룹ID</th>
										<th scope="col">개설자</th>
										<th scope="col">그룹명</th>
										<th scope="col">소개글</th>
										<th scope="col">가개설 일자</th>
										<th scope="col">개설 마감 일자</th>
										<th scope="col">초기 그룹원 수</th>
									<tr>
									</thead>
									 <tbody>
									 <c:forEach var="group" items="${creationList }">
									 	<c:if test="${group.count == '1' or group.count == '2' or group.count == '3' or group.count == '4' or group.end_date > sysdate}">
										 <tr>
										 	<td>${group.id }</td>
										 	<td>${group.user_id }</td>
										 	<td>${group.name }</td>
										 	<td>${group.introduction }</td>
										 	<td>${group.creation_date }</td>
										 	<td>${group.end_date }</td>
										 	<td>${group.count }</td>
										 </tr>
									 	</c:if>
									 </c:forEach>
									 </tbody>
								</table>
							</div>
						</div>
					</div>
					
					
					
				</div>
				<!--End Left side -->
				
				
			</div>			
	</section>
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
	