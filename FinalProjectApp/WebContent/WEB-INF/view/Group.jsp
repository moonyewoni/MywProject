<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%
   request.setCharacterEncoding("UTF-8");
   String cp = request.getContextPath();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Group.jsp</title>

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

	
<link rel="stylesheet" type="text/css" href="<%=cp %>/css/jquery-ui.css">
<script type="text/javascript" src="http://code.jquery.com/jquery.min.js"></script>
<script type="text/javascript" src="<%=cp %>/js/util.js"></script>
<script type="text/javascript" src="<%=cp %>/js/jquery-ui.js"></script>

<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=4833730b76b007bdcf9d4907fd005673&libraries=services"></script>
<script type="text/javascript">

	//팝업 창 열기
	function openAnnContentPopup(groupId, annId) 
	{
	    window.open
	    (
	        'anncontent.action?group_id=' + groupId + '&ann_id=' + annId,
	        'AnnouncementContentPopup', 'width=800,height=600,scrollbars=yes,resizable=yes'
	   	);
	    
	}

	
	$(document).ready(function()
	{
		$(".btn-success").click(function()
		{
			var moment_id = $(this).val();
			var className = $("#" + moment_id).attr("class");
			
			if (className == "MH01")
			{
				$(location).attr("href", "momentoper.action?moment_id=" + $(this).val() + "&group_id=" + $("#group_id").val());
			}
			else if (className == "MH02")
			{
				$(location).attr("href", "momentbuild.action?moment_id=" + $(this).val() + "&group_id=" + $("#group_id").val());
			}
			else if (className == "MH03")
			{
				$(location).attr("href", "momentinfo.action?moment_id=" + $(this).val() + "&group_id=" + $("#group_id").val());
			}
			
		});
		
		// 팝업 창 열기
        $(".open-popup").click(function() 
        {
            var groupId = $(this).data('group-id');
            var voteId = $(this).data('vote-id');
            var matchId = $(this).data('match-id');

            window.open("managervote.action?group_id=" + groupId + "&vote_id=" + voteId + "&match_id=" + matchId,
                		"ManagerVotePopup", "width=600,height=600,scrollbars=yes,resizable=yes");
        });
		
     	// 팝업 창 열기
        $(".open-popup-status").click(function() 
        {
        	var groupId = $(this).data('group-id');
            var voteId = $(this).data('vote-id');
            var matchId = $(this).data('match-id');  
            var memberTotalCount = $("#memberTotalCount").val();
            
            window.open("votestatus.action?vote_id=" + voteId + "&memberTotalCount=" + memberTotalCount,
                        "VoteStatusPopup", "width=400,height=250,scrollbars=yes,resizable=yes");
        });
		
		
		$("#searchMomentName").click(function()
		{
			//alert("test");
			$("#nameErr").css("display", "none");
			$("#noneErr").css("display", "none");
			if ($("#name").val() == "")
			{
				$("#nameErr").css("display", "inline");
				return;
			}
			
			var group_id = "<%=request.getParameter("group_id") %>";
			var params = "name=" + $("#name").val() + "&group_id=" + group_id;
			
			$.ajax(
			{
				type: "POST"
				, url : "momentnamecount.action"
				, data : params
				, dataType : "xml"
				, success : function(count)
				{
					var isMomentExist = false;
					
					$(count).find("lists").each(function()
					{
						var lists = $(this);
						var count = lists.find("count").text();

						
						if (parseInt(count) == 0)
						{
							$("#noneErr").css("display", "inline");
							isMomentExist = false;
							return false;
							
						}
						else
						{
							isMomentExist = true;
							
						}
						
					});
					
				
			
				if (isMomentExist == true)
				{
					$("#searchForm").submit();
				}
				
			}
				, error : function(e)
				{
					alert( "AJAX 실패" + e.responseText);	
				}
				
				
			}); 
			
		});
		
	});
	
	// 그룹 초대 관련 코드
	function copyToClipboard()
	{
		// 복사할 URL 설정
		var inviteUrl = document.getElementById("inviteUrl").innerText;
		
		var tempTextArea = document.createElement("textarea");
		tempTextArea.value = inviteUrl;
		document.body.appendChild(tempTextArea);
		
        tempTextArea.select();
        document.execCommand("copy");
        
        document.body.removeChild(tempTextArea);
        
        alert("초대 URL이 클립보드에 복사되었습니다!");

	}

	
	/*
	<!-- 그룹 모먼트 일정 달력 -->
								<div class="card col-12" style="${myList == null ? 'display: none' : 'display: inline'}">
									<div class="panel panel-default text-center" style="height: 100%;">
										<div class="panel-heading">
											<p style="font-weight: bold; font-size: 22px;">그룹 모먼트 일정 달력</p>
										</div>
										<div class="panel-body" style="height: 100%;">
											<div id="calendar" style="height: 100%;">
												<c:forEach var="mmList" items="${momentList}">
													<p>${mmList.date_name} - ${mmList.moment_name}</p>
												</c:forEach>
											</div>
										</div>
									</div>
								</div>
	
	*/
	
	
</script>

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
		var geocoder = new kakao.maps.services.Geocoder();

		<c:forEach var="mmList" items="${momentList}">
		// 주소로 좌표를 검색합니다
		geocoder.addressSearch("${mmList.place_name}", function(result, status) {

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
			            content: '<div style="width:150px;text-align:center;padding:6px 0;">모먼트장소</div>'
			        });
			        infowindow.open(map, marker);

			        // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
				       map.setCenter(coords);
			     }
			
			});
			</c:forEach>
		
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
		<div class="row">
			<div class="col-3">
			<h1>${groupName }</h1>
			</div>
			<div class="col-9" style="display: flex; justify-content: flex-end;">
			<a href="galleryinsertform.action?moment_id=<%=request.getParameter("moment_id") %>
									&group_id=<%=request.getParameter("group_id") %>
									" role="button" class="btn btn-success btn-xs">가입버튼(임시)</a>
			</div>
		</div>
		<nav>
			<ol class="breadcrumb">
				<li class="breadcrumb-item"><a href="main.action">Main</a></li>
				<li class="breadcrumb-item active">그룹</li>
			</ol>
		</nav>
	</div>
	
	<section class="section dashboard">
			<div class="row">
	
				<!-- Left side column -->
				<div class="col-lg-8">
					<div class="row">
					
						<!-- 참가인원이 가장 많았던 모먼트 -->
								<div class="col-xxl-4 col-md-6">
									<div class="card info-card sales-card">
										<div class="card-body">
											<h5 class="card-title">Most People <span> | Group</span></h5>
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
										<c:forEach var="moment1" items="${moment1 }">
											<div class="swiper-slide">
												<div class="d-flex align-items-center">
													<div
														class="card-icon rounded-circle d-flex align-items-center justify-content-center">
														<i class="bi bi-people"></i>
													</div>
													<div class="ps-3">
														<h6>${moment1.moment_name }</h6>
													
														<div class="text-center">
															<button type="button" class="btn btn-success" value="${moment1.moment_id }" style="${myList == null ? 'display: none' : 'display: inline'}">조회</button>
														</div>
													</div>
												</div>
											</div>
										</c:forEach>
										</div>
									</div>
								</div>
							</div>
						</div>	
					
								
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
											<c:forEach var="moment2" items="${moment2 }">
											<h6>
												${moment2.moment_name }
											</h6>
											<div class="text-center">
												<button type="button" class="btn btn-success" value="${moment2.moment_id }" style="${myList == null ? 'display: none' : 'display: inline'}">조회</button>
											</div>
											</c:forEach>
										</div>
									</div>
								</div>

							</div>
						</div>
								
								<!-- Customers Card -->
						<div class="col-xxl-4 col-xl-12">

							<div class="card info-card customers-card">
								<div class="card-body">
									<h5 class="card-title">
										News <span>| MOMENT</span>
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
										<c:forEach var="moment4" items="${moment4 }">
											<div class="swiper-slide">
												<div class="d-flex align-items-center">
													<div
														class="card-icon rounded-circle d-flex align-items-center justify-content-center">
														<i class="bi bi-people"></i>
													</div>
													<div class="ps-3">
														<h6>
															${moment4.moment_name }
														</h6>
														<div class="text-center">
															<button type="button" class="btn btn-success" value="${moment4.moment_id }"
																 style="${myList == null ? 'display: none' : 'display: inline'}">조회</button>
														</div>
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
										Callendar <span> | Group</span>
									</h5>

									<!-- Line Chart -->
									<div id="calendar"></div>
									<!-- End Line Chart -->

								</div>

							</div>
						</div>
						<!-- End Reports -->		
								
					

							
								
							
								
								
								<!-- 김세연  -->
								<!-- 모먼트 검색창 -->
								<%-- <div class="card col-md-4">
									<div class="panel panel-default">
										<form class="form-inline" action="searchmoment.action" method="get" id="searchForm">
											<div class="form-group" style="${myList == null ? 'display: none' : 'display: inline'}">
												<label for="name">모먼트 검색: </label>
												<input type="text" class="form-control" id="name" name="name" placeholder="모먼트명을 입력하세요">
												<input type="text" class="form-control" id="group_id" name="group_id" value="<%=request.getParameter("group_id") %>">
											</div>
											<button type="button" class="btn btn-default" id="searchMomentName"
											style="${myList == null ? 'display: none' : 'display: inline'}">검색</button>
											<span class="errMsg" id="nameErr" style="display: none; color: red;">검색어가 없습니다.</span>
											<span class="errMsg" id="noneErr" style="display: none; color: red;">해당 모먼트이가존재하지 않습니다.</span>
										</form>
									</div>
								</div> --%>
				
					
					
						<div class="card">
							<div class="card-body">
									<div class="card-title" >
										<span class="card-title">
											모먼트 리스트 <span> | Group</span>
										</span> 
										<span style="display: flex; justify-content: flex-end;"> 
											<a href="momentoperform.action?group_id=<%=request.getParameter("group_id") %>" role="button" class="btn btn-success btn-xs" id="btnAdd" 
											style="vertical-align: bottom; ${myList == null ? 'display: none' : 'display: inline'}">모먼트 생성</a>
										</span>
									</div>
					
									<!-- 초대 URL을 표시할 요소 -->
									<div id="inviteUrl" style="display: none;">
										http://localhost:8090<%=cp %>/groupinvite.action?typeId=GJ02&matchId=${gmId}
									</div>
									<button onclick="copyToClipboard()" role="button" class="btn btn-success btn-xs"
									style="${myList == null ? 'display: none' : 'display: inline'}">초대(URL)</button>
					
									<div class="panel-body" style="${myList == null ? 'display: none' : 'display: inline'}">
										내가 참여 중인 모먼트 수 <span class="badge">${myCount }</span>
									</div>
										<table class="table datatable">
											<thead>
											<tr>
												<th>모먼트 명</th>
												<th>단계</th>
												<th>일시</th>
												<th>장소</th>
												<th>현재 멤버</th>
												<th>최소 인원</th>
												<th>최대 인원</th>
												<th>계획 마감 일시</th>
												<th></th>
											</tr>
											</thead>
											<tbody>
											<c:forEach var="moment" items="${myList }">
												<tr id="${moment.moment_id }" class="${moment.phase_id }">
													<td>${moment.moment_name }</td>
													<td>${moment.phase }</td>
													<td>${moment.date_name }</td>
													<td>${moment.place_name }</td>
													<td>${moment.parti_num }</td>
													<td>${moment.min_participant }</td>
													<td>${moment.max_participant == null ? "미정" : moment.max_participant}</td>
													<td>${moment.plan_end_date }</td>
													<td>
														<button type="button" class="btn btn-success" value="${moment.moment_id }">조회</button>
													</td>
												</tr>
											</c:forEach>
											</tbody>
										</table>
									</div>
									<div class="panel-body">
										전체 모먼트 수 <span class="badge">${allCount }</span>
									</div>
					
									<div class="panel-body">
										<table class="table datatable">
											<thead>
											<tr>
												<th>모먼트 명</th>
												<th>단계</th>
												<th>일시</th>
												<th>장소</th>
												<th>현재 멤버</th>
												<th>최소 인원</th>
												<th>최대 인원</th>
												<th>계획 마감 일시</th>
												<th><input type="hidden" id="group_id"
													value="<%=request.getParameter("group_id") %>"></th>
											</tr>
											</thead>
											<tbody>
											<c:forEach var="moment" items="${allList }">
												<tr id="${moment.moment_id }" class="${moment.phase_id }">
													<td>${moment.moment_name }</td>
													<td>${moment.phase }</td>
													<td>${moment.date_name }</td>
													<td>${moment.place_name }</td>
													<td>${moment.parti_num }</td>
													<td>${moment.min_participant }</td>
													<td>${moment.max_participant == null ? "미정" : moment.max_participant}</td>
													<td>${moment.plan_end_date }</td>
													<td>
														<button type="button" class="btn btn-success"
														style="${myList == null ? 'display: none' : 'display: inline'}"
														value="${moment.moment_id }">조회</button>
													</td>
												</tr>
											</c:forEach>
											</tbody>
										</table>
									</div>
								</div>
					
					
						<!-- 건의사항 및 그룹 신고 섹션 (가로로 나란히) -->
						<div class="card" style="${myList == null ? 'display: none' : 'display: inline'}">
							<div class="row">
								<!-- 건의사항 작성 버튼 -->
								<div class="col-md-3">
									<div class="panel panel-default">
										<div class="panel-heading">건의사항 작성</div>
										<div class="panel-body">
											<button type="button" class="btn btn-warning">건의사항 작성</button>
										</div>
									</div>
								</div>
					
								<!-- 건의사항 조회 버튼 -->
								<div class="col-md-3">
									<div class="panel panel-default">
										<div class="panel-heading">건의사항 조회</div>
										<div class="panel-body">
											<button type="button" class="btn btn-warning">건의사항 조회</button>
										</div>
									</div>
								</div>
					
								<!-- 그룹 신고 버튼 -->
								<div class="col-md-3">
									<div class="panel panel-default">
										<div class="panel-heading">그룹 신고</div>
										<div class="panel-body">
											<button type="button" class="btn btn-danger">그룹 신고</button>
										</div>
									</div>
								</div>
					
								<!-- 그룹 신청서 입력/수정 -->
								<div class="col-md-3">
									<div class="panel panel-default">
										<div class="panel-heading">그룹 신청서</div>
										<div class="panel-body">
											<div id="applicationForm">
												<a
													href="signupdecision.action?group_id=<%=request.getParameter("group_id") %>"
													role="button" class="btn btn-success btn-xs" id="btnAdd"
													style="vertical-align: bottom;">그룹 가입 신청 결정
												</a>
											</div>
										</div>
									</div>
								</div>
								
							</div>
						</div>
					
						</div><!-- row -->
					</div><!-- col-lg-8 -->
				
					<!-- 엔드 래프트 사이드 -->
				
						<!-- Right side columns -->
							<div class="col-lg-4">
			
								<!-- Next MOMENT -->
								<div class="card">
									<div class="card-body">
										<h5 class="card-title">
											Announcement <span>| Group</span>
										</h5>
										<div class="activity">
											<ul>
											<c:forEach var="ann" items="${annList}" varStatus="status">
													<li>
														<a href="#" ${myList == null ? 'display: none' : "onclick='openAnnContentPopup('${group_id}', '${ann.id}');'"}>
																${ann.title}</a>
													</li>
												
											</c:forEach>
											</ul>
											<!-- End activity item-->
										</div>
			
									</div>
								</div>
								<!-- End Recent Activity -->
								
								
								
								<!-- 그룹 멤버 리스트 -->
								<div class="card mb-3" >
									<div class="card-body">
										<div class="card-title">
											<h5 class="card-title">Member <span> | Group</span></h5>
										</div>
										<div class="card-header">
											<span class="card-header">
													최소 충족 인원 수 :
													<c:choose>
														<c:when test="${memberTotalCount >= 5 && memberTotalCount <= 20}">
						                                	1명
						                           		</c:when>
														<c:when test="${memberTotalCount >= 21 && memberTotalCount <= 40}">
						                                	2명
						                            	</c:when>
														<c:when test="${memberTotalCount >= 41 && memberTotalCount <= 60}">
						                                	3명
						                            	</c:when>
														<c:when test="${memberTotalCount >= 61 && memberTotalCount <= 80}">
						                                	4명
						                            	</c:when>
														<c:when test="${memberTotalCount >= 81 && memberTotalCount <= 100}">
						                                	5명
						                            	</c:when>
														<c:otherwise>
						                               		매니저 없음 
														</c:otherwise>
													</c:choose>
												
												현재 인원 수 : ${managerCount}명</span>
										</div>
											
											
												<!-- 매니저 리스트 -->
														<ul>
														<c:forEach var="mrList" items="${managerList}">
															<div style="display: flex;">
																<li>${mrList.name}
																<!-- 왕관 아이콘 추가 -->
																<i class="bx bxs-crown" style="color: pink;"></i>
																</li>
															</div>
														</c:forEach>
														</ul>
					
												<!-- 구분선 -->
												<hr />
					
												<!-- 그룹원 리스트 -->
															<ul>
														<c:forEach var="gmList" items="${generalMemberList}">
																<li class="member-name">${gmList.name}
					                							<c:forEach var="mrList" items="${managerList}">
																	<c:choose>
																		<c:when test="${gmId == mrList.match_id}">
									                                             <button class="transfer-btn">매니저 양도</button>
									                                             <button class="prohibit-btn">제재</button>
																		</c:when>
																	</c:choose>
																</c:forEach>
																</li>
														</c:forEach>
															</ul>
										</div>
									</div>

						<div class="card">
							<div class="card-body pb-0">
								<h5 class="card-title">
									Place <span>| Map</span>
								</h5>
								<div id="map" style="min-height: 400px;" class="map"></div>
							</div>
						</div>
						
						

				</div>	<!-- End Right side columns -->
						
			</div><!-- end row -->
	</section>
	
	<%--ava.util.Date → String 변환 --%>
						<fmt:formatDate value="${currentDate}" pattern="yyyy-MM-dd HH:mm:ss" var="formattedCurrentDate" />
						<fmt:formatDate value="${endDate}" pattern="yyyy-MM-dd HH:mm:ss" var="formattedEndDate" />
						<fmt:formatDate value="${updateEndDate}" pattern="yyyy-MM-dd HH:mm:ss" var="formattedUpdateEndDate" />
				
						<%-- String → java.util.Date 변환 --%>
						<fmt:parseDate value="${formattedCurrentDate}" pattern="yyyy-MM-dd HH:mm:ss" var="parsedCurrentDate" />
						<fmt:parseDate value="${formattedEndDate}" pattern="yyyy-MM-dd HH:mm:ss" var="parsedEndDate" />
						<fmt:parseDate value="${formattedUpdateEndDate}" pattern="yyyy-MM-dd HH:mm:ss" var="parsedUpdateEndDate" />
						
						<!-- 매니저 최소 인원이 충족되지 못하면 경고 메시지와 버튼 표시 -->
						
						<c:choose>
							<%-- 그룹 멤버가 5명 미만일 때 경고 메시지 표시 --%>
							<c:when test="${memberTotalCount < 5}">
								
									<div class="alert alert-info">
										<%-- 중앙에 정렬 --%>
										<span>
											<%-- 경고 메시지 --%>
											그룹 멤버를 초대하여 인원을 충족하세요!
										</span>
									</div>
							</c:when>
			
							<c:when test="${ (parsedUpdateEndDate > parsedCurrentDate || parsedEndDate > parsedCurrentDate) &&  
										  ((memberTotalCount >= 5 && memberTotalCount <= 20 && managerCount < 3) ||
			                      	      (memberTotalCount >= 21 && memberTotalCount <= 40 && managerCount < 2) ||
			                              (memberTotalCount >= 41 && memberTotalCount <= 60 && managerCount < 3) ||
			                              (memberTotalCount >= 61 && memberTotalCount <= 80 && managerCount < 4) ||
			                              (memberTotalCount >= 81 && memberTotalCount <= 100 && managerCount < 5)) }">
								 
									<%-- 중앙에 정렬 --%>
										
										<%-- 경고 메시지 --%>
										
										<c:forEach var="usList" items="${userMatchIdList}">
											<c:choose>
											
												<%-- 해당 그룹의 멤버인지 확인 --%>
												<c:when test="${usList.match_id == member_id}">
													<%-- 해당 멤버가 이미 투표했는지 확인 --%>
													<c:set var="alreadyVoted" value="false" />
													
													<c:forEach var="voters" items="${voterList}">
														<c:if test="${voters.voter_id == member_id}">
														<div class="alert alert-info row" style="${myList == null ? 'display: none' : 'display: inline'}">
															<div>
															<span style="font-size: 32px;">매니저 최소 인원 수가 부족합니다. 투표로 매니저를 선발해주세요.</span>
															</div>
															<%-- 이미 투표한 사람일 경우 "투표현황" 버튼 표시 --%>
															<c:set var="alreadyVoted" value="true" />
															<div style="display: flex; justify-content: flex-end;">
															<button type="button" class="btn btn-primary open-popup-status"
																	data-vote-id="${vote_id}">투표현황
															</button>
															</div>
														</div>
															
														</c:if>
													</c:forEach>
							
													<%-- 아직 투표하지 않은 경우 "투표하기" 버튼 표시 --%>
													<c:if test="${!alreadyVoted}">
														<div class="alert alert-info row" style="${myList == null ? 'display: none' : 'display: inline'}">
															<div>
															<span style="font-size: 32px;">매니저 최소 인원 수가 부족합니다. 투표로 매니저를 선발해주세요.</span>
															</div>
															<div style="display: flex; justify-content: flex-end;">
																<button type="button" class="btn btn-danger open-popup"
																		data-group-id="${group_id}" 
																		data-vote-id="${vote_id}"
																		data-match-id="${member_id}">투표하기
																</button>
															</div>
													</div>
													</c:if>
													
												</c:when>
											
											</c:choose>
										</c:forEach>
							</c:when>
						</c:choose>
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

<!-- 값을 넘기기 위해 hidden으로 처리 -->
	<input type="hidden" id="memberTotalCount" value="${memberTotalCount}" />
</body>
</html>