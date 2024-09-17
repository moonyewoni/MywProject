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
<title>NotificationSummary</title>
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

<script type="text/javascript" src="http://code.jquery.com/jquery.min.js"></script>
<!-- Main CSS File -->
<link href="assets/css/style.css" rel="stylesheet">


<script type="text/javascript">
	
	function notiDelete(id) {
		//alert("삭제");
		var str = '.'+id;
		
		$(str).css("display","none");
		
		var param = {del_id : id};
		
		$.ajax({
            type : "GET",            
            url : "notidelete.action",      
            data : param,           
            success : function(){
            	$(".bi-bell").click();
            	
            	$(".notiCount").each(function() {
                    // 현재 숫자 값을 가져옴
                    var currentCount = parseInt($(this).text());
                    
                    // 숫자가 0보다 크면 1씩 감소
                    if (currentCount > 0) {
                        $(this).text(currentCount - 1);
                    }
                });
            },
            error : function() {
				alert("통신에러");
			}
            
        });
		
		
		
	}
	
</script>

</head>
<body>
<nav class="header-nav ms-auto">
			<ul class="d-flex align-items-center">
				<li class="nav-item d-block d-lg-none"><a
					class="nav-link nav-icon search-bar-toggle " href="#"> <i
						class="bi bi-search"></i>
				</a></li>
				<!-- End Search Icon-->
				<li class="nav-item dropdown"><a class="nav-link nav-icon"
					href="#" data-bs-toggle="dropdown"> <i class="bi bi-bell"></i>
						<span class="badge bg-primary badge-number notiCount">${notiCount }</span>
				</a> <!-- End Notification Icon -->
					<ul
						class="dropdown-menu dropdown-menu-end dropdown-menu-arrow notifications">
						<li class="dropdown-header">You have <span class="notiCount">${notiCount }</span> new notifications <a
							href="#"><span class="badge rounded-pill bg-primary p-2 ms-2">View
									all</span></a>
						</li>
						
						<c:forEach var="item" items="${preInviteNoti }">
						<li class="${item.id }">
							<hr class="dropdown-divider">
						</li>

						<li class="notification-item ${item.id }">
						<i class="bi bi-check-circle text-success"></i>
							<div>
								<h4>${item.user_name }님이 초대를 수락하셨습니다.</h4>
								<p>${item.group_name }</p>
								<p>${item.noti_date }</p>
							</div>
							<a href="javascript:notiDelete('${item.id}')" class="cancelNoti"><i class="bx bxs-x-circle cancelNoti"></i></a>
						</li>
						</c:forEach>
						
												
						<li>
							<hr class="dropdown-divider">
						</li>
						<li class="notification-item"><i
							class="bi bi-exclamation-circle text-warning"></i>
							<div>
								<h4>모먼트 투표가 진행 중입니다.</h4>
								<p>얼른어른 하쇼</p>
								<p>30 min. ago</p>
							</div></li>

						<li>
							<hr class="dropdown-divider">
						</li>

						<li class="notification-item"><i
							class="bi bi-x-circle text-danger"></i>
							<div>
								<h4>가입 신청이 거절되었습니다.</h4>
								<p>하나회</p>
								<p>1 hr. ago</p>
							</div></li>



						<li>
							<hr class="dropdown-divider">
						</li>

						<li class="notification-item"><i
							class="bi bi-info-circle text-primary"></i>
							<div>
								<h4>Dicta reprehenderit</h4>
								<p>Quae dolorem earum veritatis oditseno</p>
								<p>4 hrs. ago</p>
							</div></li>

						<li>
							<hr class="dropdown-divider">
						</li>
						<li class="dropdown-footer"><a href="#">Show all
								notifications</a></li>

					</ul> <!-- End Notification Dropdown Items --></li>
				<!-- End Notification Nav -->
				<li class="nav-item dropdown pe-3"><a
					class="nav-link nav-profile d-flex align-items-center pe-0"
					href="#" data-bs-toggle="dropdown"> <img
						src="assets/img/profile-img.png" alt="Profile"
						class="rounded-circle"> <span
						class="d-none d-md-block dropdown-toggle ps-2">${userinfo.user_name}</span>
				</a> <!-- End Profile Iamge Icon -->

					<ul
						class="dropdown-menu dropdown-menu-end dropdown-menu-arrow profile">
						<li class="dropdown-header">
							<h6>${userinfo.user_name}
							</h6>
						</li>
						<li>
							<hr class="dropdown-divider">
						</li>

						<li><a class="dropdown-item d-flex align-items-center"
							href="users-profile.html"> <i class="bi bi-person"></i> <span>My
									Profile</span>
						</a></li>
						<li>
							<hr class="dropdown-divider">
						</li>

						<li><a class="dropdown-item d-flex align-items-center"
							href="users-profile.html"> <i class="bi bi-gear"></i> <span>Account
									Settings</span>
						</a></li>
						<li>
							<hr class="dropdown-divider">
						</li>
						<li><a class="dropdown-item d-flex align-items-center"
							href="logout.action"> <i class="bi bi-box-arrow-right"></i> <span>Logout</span>
						</a></li>

					</ul> <!-- End Profile Dropdown Items --></li>
				<!-- End Profile Nav -->

			</ul>
		</nav>



</body>
</html>