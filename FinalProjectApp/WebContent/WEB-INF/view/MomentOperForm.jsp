<%@page import="java.util.ArrayList"%>
<%@page import="java.util.Calendar"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
   request.setCharacterEncoding("UTF-8");
   String cp = request.getContextPath();
%>
<%
	Calendar cal = Calendar.getInstance();

	int year = cal.get(Calendar.YEAR);
	int month = cal.get(Calendar.MONTH) + 1;
	int date = cal.get(Calendar.DATE);

    ArrayList<Integer> yearArr = new ArrayList<Integer>();
    for (int i = 0; i < 3; i++)
    	yearArr.add(i, year + i);
    
	ArrayList<Integer> monthArr = new ArrayList<Integer>();
    for (int i = 0; i < 12; i++)
    	monthArr.add(i, i + 1);
    
    ArrayList<String> timeArr = new ArrayList<String>();
    for (int i = 0; i < 24; i++)
    {
    	if (i < 10)
    	{
    		timeArr.add(i,  String.format("0%s:00:00", i));
    	}
    	else
    		timeArr.add(i,  String.format("%s:00:00", i));
    }
    	
	
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>MomentOperForm.jsp</title>
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
			$("#error").css("display", "none");
			$("#date_edit").css("display", "none");
			$("#place_edit").css("display", "none");
			$("#doublePlan").css("display", "none");
			
			var startYear = $("year").val();
			var today = new Date();
			var todayYear = today.getFullYear();
			var todayMonth = today.getMonth() + 1;
			var todayDate = today.getDate();
			
			var index = 0;
			for(var y = startYear; y <= todayYear; y++)
			{
				document.getElementById("year").options[index] = new Option(y, y);
				index++;
			}
			
			index = 0;
			
			for(var m= 1 ; m <= 12; m++){
				document.getElementById("month").options[index] = new Option(m, m);
				index++;
			}
			
			lastday();
			
			$("#year").val(todayYear).attr("selected", "selected");
			$("#month").val(todayMonth).attr("selected", "selected");
			$("#day").val(-1).attr("selected", "selected");
			$("#time").val(-1).attr("selected", "selected");
			
			var oldDay = $("#day").val();
			
			$("#year").change(function()
			{
				if (($("#year").val() == todayYear + 2 && $("#month").val() > todayMonth)
					|| ($("#year").val() == todayYear + 2 && $("#month").val() == todayMonth && $("#day").val() > todayDate)
					|| ($("#day").val() != -1 && $("#year").val() == todayYear && $("#month").val() == todayMonth && $("#day").val() <= todayDate + 2)
					|| ($("#day").val() != -1 && $("#year").val() == todayYear && $("#month").val() < todayMonth))
				{
					alert("오늘로부터 3일 뒤 ~ 2년 이내의 날짜만 입력 가능합니다.");
					$("#year").val(todayYear).attr("selected", "selected");
					$("#month").val(todayMonth).attr("selected", "selected");
					$("#day").val(oldDay).attr("selected", "selected");
					$("#time").val(-1).attr("selected", "selected");
				}
			});
			
			$("#month").change(function()
			{
				// 1. 연도가 오늘로부터 2년 뒤인데 월이 현재 월보다 이후일 경우
				// 2. 연도가 올해인데 월이 현재 월보다 이전일 경우
				if (($("#year").val() == todayYear + 2 && $("#month").val() > todayMonth)
					|| ($("#year").val() == todayYear && $("#month").val() < todayMonth))
				{
					alert("오늘로부터 3일 뒤 ~ 2년 이내의 날짜만 입력 가능합니다.");
					$("#year").val(todayYear).attr("selected", "selected");
					$("#month").val(todayMonth).attr("selected", "selected");
					$("#day").val(oldDay).attr("selected", "selected");
					$("#time").val(-1).attr("selected", "selected");
				}
			});
			
			$("#day").change(function()
			{
				if (($("#day").val() != -1 && $("#year").val() == todayYear + 2 && $("#month").val() == todayMonth && $("#day").val() > todayDate)
					|| ($("#day").val() != -1 && $("#year").val() == todayYear && $("#month").val() == todayMonth && $("#day").val() <= todayDate + 2))
				{
					alert("오늘로부터 3일 뒤 ~ 2년 이내의 날짜만 입력 가능합니다.");
					$("#year").val(todayYear).attr("selected", "selected");
					$("#month").val(todayMonth).attr("selected", "selected");
					$("#day").val(oldDay).attr("selected", "selected");
					$("#time").val(-1).attr("selected", "selected");
				}
			});
			
			
			$(".dateSubmit").click(function()
					{
						// 테스트
						//alert("확인");
						
						var params = "year=" + $("#year").val() + "&month=" + $("#month").val()
							+ "&day=" + $("#day").val() + "&time=" + $("#time").val();
						
						$.ajax(
						{
							type : "POST"
							, url : "momentdateinsert.action"
							, data : params
							, dataType : "xml"
							, success : function(date)
							{
								
								$(date).find("lists").each(function()
								{
									var lists = $(this);
									var date_id = lists.find("date_id").text();
									var year = lists.find("year").text();
									var month = lists.find("month").text();
									var day = lists.find("day").text();
									var time = lists.find("time").text();
									var doublePlan = lists.find("doublePlan").text();
									
									$("#date_id").val(date_id);
									$("#year").val(year).attr("selected", "selected");
									$("#month").val(month).attr("selected", "selected");
									$("#day").val(day).attr("selected", "selected");
									$("#time").val(time).attr("selected", "selected");
									
									// 선택한 일자에 이미 일정이 존재한다면
									if (parseInt(doublePlan) > 0)
									{
										// 이중약속 경고 메시지 표시
										$("#doublePlan").css("display", "inline");
									}
									else
										$("#doublePlan").css("display", "none");
									
									$("#date_submit").css("display", "none");
									$("#date_edit").css("display", "inline");
								});

								
							}
							, error : function(e)
							{
								alert(e.responseText);
							}
							
						});
				});
			
			
			$("#date_edit").click(function()
			{
				$("#date_submit").css("display", "inline");
				$("#date_edit").css("display", "none");
				$("#date_id").val("");
			});
			
			
			$(".placeSelect").click(function()
			{
				 
				if ($(this).val() == 2)
				{
					$("#juso").css("display", "inline");
					$("#place_name").val("");
					$("#place_name").attr("readonly", true);
					$("#place_name").attr("placeholder", "주소 찾기 버튼을 눌러 주소를 검색해주세요.");
				}
				else
				{
					$("#juso").css("display", "none");
					$("#place_name").val("");
					$("#place_name").attr("readonly", false);
					$("#place_name").attr("placeholder", "ex) 홍대 맛집");
				}
				
			});
			
			
			$(".placeSubmit").click(function()
			{
				
				if ($("#place_name").val() == "")
				{
					alert("장소를 입력한 후에 추가해주세요.");
					return;
				}
				
				var params = "place_name=" + $("#place_name").val() + "&detail_id=" + $("input:radio[name='place']:checked").val();
				$.ajax(
				{
					type : "POST"
					, url : "momentplaceinsert.action"
					, data : params
					, dataType : "xml"					//-- check
					, success : function(place)
					{
						
						$(place).find("lists").each(function()
						{
							var lists = $(this);
							var place_id = lists.find("place_id").text();
							var place_name = lists.find("place_name").text();
							
							$("#place_id").val(place_id);
							$("#place_name").val(place_name);
							
							$("#place_name").attr("readonly", true);
							$("#place_submit").css("display", "none");
							$("#place_edit").css("display", "inline");
							
						});

					}
					, error : function(e)
					{
						alert(e.responseText);
					}
					
				});
			});
			
			$("#place_edit").click(function()
			{
				$("#place_name").attr("readonly", false);
				$("#place_submit").css("display", "inline");
				$("#place_edit").css("display", "none");
				$("#place_id").val("");
				
			});
			
			
			$(".btn-success").click(function()
			{
				if ($("#moment_name").val() == "" || $("#min_participant").val() == "")
				{
					$("#error").css("display", "inline");
					return false;
				}
				
				if (parseInt($("#min_participant").val()) < 2)
				{
					alert("최소 인원은 2명 이상이어야 합니다.");
					$("#min_participant").focus();
					return false;
				}
				
				if ($("#max_participant").val() != "" && parseInt($("#max_participant").val()) > parseInt($("#countMember").val()))
				{
					alert("최대 인원은 그룹원 수보다 많을 수 없습니다.");
					$("#max_participant").focus();
					return false;
				}
				
				if ($("#max_participant").val() != "" && parseInt($("#min_participant").val()) > parseInt($("#max_participant").val()))
				{
					alert("최소 인원은 최대 인원보다 많을 수 없습니다.");
					$("#min_participant").focus();
					return false;
				}
				
				
				if ($("#date_id").val() == "")
				{
					alert("추가 버튼을 눌러 일시를 추가해주세요.");
					$("#year").focus();
					return false;
				}
				
				if ($("#place_id").val() == "")
				{
					alert("추가 버튼을 눌러 장소를 추가해주세요.");
					$("#place").focus();
					return false;
				}
				
			});
			
			$(".btn-default").click(function()
			{
				$(location).attr("href", "group.action?group_id=" + $("#group_id").val());
			});

			
		});
		
		
		function lastday()
		{ 
			var year = document.getElementById("year").value;
			var month = document.getElementById("month").value;
			var day = new Date(new Date(year,month,1) - 86400000).getDate();
			
			var today = new Date();
			var todayDate = today.getDate();
			
		    /* = new Date(new Date(Year,Month,0)).getDate(); */
		    
		    document.getElementById("day").innerHTML = "";
		    
			var dayindexLen = document.getElementById("day").length;
			if (day > dayindexLen)
			{
				document.getElementById("day").innerHTML += "<option value='" + -1 + "' selected='selected'>" + "선택 없음" + "</option>";
				for (var i = (dayindexLen + 1); i <= day; i++)
				{
					document.getElementById("day").innerHTML += "<option value=' " + i + "'>" + i + "</option>";
				}
			}
			else if (day < dayindexLen)
			{
				for (var i=dayindexLen; i >= day; i--)
				{
					document.getElementById("day").options[i] = null;
				}
			}
		}

</script>
<script type="text/javascript" src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>

<!-- 주소 검색, 지도 표시 기능 구현 -->
<script type="text/javascript">	
    function getAddr()
    {
        new daum.Postcode(
        {
            oncomplete: function(data) 
            {
                addr = data.address;
                
                // 받아온 주소 넣기 
                document.getElementById("place_name").value = addr;
                
            }
        }).open();
        
       
    }
    
    $(function() {
    	
    	container = document.getElementById("map");
		mapCenter = new kakao.maps.LatLng(37.5565389, 126.9195136);
		options = {
			center : mapCenter,
			level : 3,
		};
		map = new kakao.maps.Map(container, options);
    	
		$("#place_submit").click(function() {
			// 주소-좌표 변환 객체를 생성합니다
			var geocoder = new kakao.maps.services.Geocoder();

			// 주소로 좌표를 검색합니다
			geocoder.addressSearch( addr, function(result, status) {

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
<div class="panel title">
	<h1>모먼트 생성</h1>
</div>

<!-- 메인 메뉴 영역 -->
<main id="main" class="main">
	<div class="pagetitle">
		<h1>모먼트 오퍼 생성</h1>
		<nav>
			<ol class="breadcrumb">
				<li class="breadcrumb-item"><a href="main.action">Main</a></li>
				<li class="breadcrumb-item"><a href="group.action?group_id=<%=request.getParameter("group_id") %>">그룹</a></li>
				<li class="breadcrumb-item active">모먼트 오퍼 생성</li>
			</ol>
		</nav>
	</div>
	
	<section class="section dashboard">
	<div class="row">
		<!-- main columns -->
		<div class="col-lg-8">
			
			<!-- 카드 시작 -->
			<div class="card text-center">
				<div class="card-body">
					<div class="card-title">
							<h5 class="card-title">
								모먼트 데이터 입력
							</h5>
					</div>	
					<div>
						<form action="momentinsert.action?group_id=<%=request.getParameter("group_id") %>" method="post" id="myForm" class="row g-3">
							
							<div class="col-md-12 input-group mb-3">
								<span class="input-group-text">모먼트명 <sup style="color: red;">※</sup></span>
								<input type="text" id="moment_name" name="moment_name" class="form-control"
								placeholder="ex) 놀자~" maxlength="30" required="required">
								<span class="input-group-text">30자 이내</span>
							</div>
					
							<div class="col-md-12 row">
								<div class="col-md-3">
									<div class="input-group">
										<select id="year" name="year" class="form-select" onchange="lastday()" required="required">
									
											<!--  
											<option value="1">2024</option>
											<option value="2">2025</option>
											<option value="3">2026</option>
											 -->
											<%
											for (int i : yearArr)
											{
											%>
											<option value="<%=i %>">
											<%=i %>
											</option>
											<%
											}
											%>
										</select>
										<span class="input-group-text">
											년<sup style="color: red;">※</sup>
										</span>
									</div>
								</div>
								<div class="col-md-5 row">
									<div class="col-md-6">
										<div class="input-group">
										<select id="month" name="month" class="form-select" onchange="lastday()" required="required"> 
											<%
											for (int i : monthArr)
											{
												if (i == month)
												{
											%>
											<option value="<%=i %>" selected="selected">
											<%=i %>
											</option>
											<%
												}
												else
												{
											%>
											<option value="<%=i %>">
											<%=i %>
											</option>
											<%
												}
											}
											%>
										</select>
										<span class="input-group-text">
											월 <sup style="color: red;">※</sup>
										</span>
										</div>
									</div>
									<div class="col-md-6">
										<div class="input-group">
										<select id="day" name="day" class="form-select"> 
										</select>
										<span class="input-group-text">
											일
										</span>
										</div>
									</div>
								</div>
								<div class="col-md-4">
									<div class="input-group">
										<span class="input-group-text" >
											시간
										</span>
										<select id="time" name="time" class="form-select">
											<option value="-1" selected="selected">선택 없음</option>
											<%
											for (String i : timeArr)
											{
											%>
											<option value="<%=i %>">
											<%=i %>
											</option>
											<%
											}
											%>
										</select>
										<input type="hidden" id="date_id" name="date_id" class="form-select">
										<div style="margin-left: 10px;">
											<button type="button" class="dateSubmit btn btn-primary" id="date_submit">추가</button>
											<button type="button" class="dateEdit btn btn-warning" id="date_edit" style="display: none;">수정</button>
										</div>
									</div>
								</div>
								
										
								
							</div>
							<div class="col-12">
								<span id="doublePlan" style="color: red; font-weight: bold; display: none;">
									해당 모먼트의 일시에 이미 일정이 존재합니다. 신중하게 참여를 결정해주세요.
								</span>
							</div>
					
							<div class="col-12">						
								<div class="input-group" role="group">
									<div class="form-check" style="padding-left: 0px;">
									<input type="radio" id="abstractPlace" name="place" value="1" checked="checked" class="placeSelect form-check-input"
									style="margin-left: 0px;">
									<label for="abstractPlace" class="form-check-label"
									style="margin-left: 5px;">대충 등록!</label>
									</div>
									<div class="form-check" style="padding-left: 10px;">
									<input type="radio" id="fullPlace" name="place" value="2" class="placeSelect form-check-input"
									style="margin-left: 5px;">
									<label for="fullPlace" class="form-check-label"
									style="margin-left: 10px;">자세히 등록!</label>
									</div>
								</div>
								
								
								<div class="input-group" role="group" id="placeTr">
									<span class="input-group-text">
										장소 <sup style="color: red;">※</sup>
									</span>
									<input type="text" id="place_name" name="place_name" class="form-control"
										 placeholder="ex) 홍대 맛집" required="required">
									<div style="margin-left: 10px;">
										<button type="button" class="placeSubmit btn btn-primary" id="place_submit">추가</button>
										<button type="button" class="placeEdit btn btn-warning" id="place_edit" style="display: none;">수정</button>
										<button type="button" class="btn btn-primary" onclick="getAddr()" id="juso" style="display: none;">주소 찾기</button>
									</div>
									<input type="hidden" id="place_id" name="place_id">
								</div>
							</div>
							
							<div class="col-12">
								<div class="input-group mb-3" role="group">
									<span class="input-group-text">
										최소 인원 <sup style="color: red;">※</sup>
									</span>
									<input type="text" id="min_participant" name="min_participant" class="form-control"
									placeholder="ex) 2" maxlength="30" required="required">
									<span class="input-group-text">최소 2명</span>
								</div>
			
								<div class="input-group mb-3" role="group">
									<span class="input-group-text">
										최대 인원
									</span>
									<input type="text" id="max_participant" name="max_participant" class="form-control"
									placeholder="ex) 5" maxlength="30">
									<span class="input-group-text">최대 ${countMember }명</span>
								</div>
							</div>
							
							<div class="col-12">
								<div class="input-group" role="group">
									<span class="input-group-text" id="basic-addon2">
										참고사항
									</span>
									<textarea id="note" name="note" class="form-control" cols="30" rows="10"
									placeholder="ex) 노트북 챙겨와!" maxlength="200"></textarea>
									<span class="input-group-text">200자 이내</span>
								</div>	

								<span style="font-size: small; color: red;">※은 필수입력 사항입니다.</span>
							</div>
							
							
							<div class="col-12">
							<button type="submit" class="btn btn-primary">등록</button>
							<button type="reset" class="btn btn-success">취소</button>
							<br>
							
							<span style="font-size: small; color: red; display: none;" id="error">
								필수입력 사항을 모두 입력해야 합니다.
							</span>
							</div>
							<div class="col-12">
							<input type="hidden" value="${countMember }" id="countMember">
							<input type="hidden" id="group_id" value="<%=request.getParameter("group_id") %>">
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
		<!-- ENd main columns -->
		
		<div class="col-lg-4">
			<div class="card">
				<div class="card-header">
					<h5 class="card-title">나의 일정 </h5>
					<c:import url="/personalcalendar.action"></c:import>
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
		</div>
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