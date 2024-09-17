<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%
request.setCharacterEncoding("UTF-8");
String cp = request.getContextPath();

String admin_id = (String) request.getSession().getAttribute("admin_id");

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta content="width=device-width, initial-scale=1.0" name="viewport">

<title>관리자 페이지</title>
<meta content="" name="description">
<meta content="" name="keywords">

<!-- Favicons -->
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

<!-- Template Main CSS File -->
<link href="assets/css/style.css" rel="stylesheet">
<body>
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
		<nav class="header-nav ms-auto">
			<ul class="d-flex align-items-center">
				<li class="nav-item d-block d-lg-none"><a
					class="nav-link nav-icon search-bar-toggle " href="#"> <i
						class="bi bi-search"></i>
				</a></li>
				<!-- End Search Icon-->
				<li class="nav-item dropdown"><a class="nav-link nav-icon"
					href="#" data-bs-toggle="dropdown"> <i class="bi bi-bell"></i>
						<span class="badge bg-primary badge-number">4</span>
				</a> <!-- End Notification Icon -->
					<ul
						class="dropdown-menu dropdown-menu-end dropdown-menu-arrow notifications">
						<li class="dropdown-header">You have 4 new notifications <a
							href="#"><span class="badge rounded-pill bg-primary p-2 ms-2">View
									all</span></a>
						</li>
						<li>
							<hr class="dropdown-divider">
						</li>
						<li class="notification-item"><i
							class="bi bi-exclamation-circle text-warning"></i>
							<div>
								<h4>Lorem Ipsum</h4>
								<p>Quae dolorem earum veritatis oditseno</p>
								<p>30 min. ago</p>
							</div></li>

						<li>
							<hr class="dropdown-divider">
						</li>

						<li class="notification-item"><i
							class="bi bi-x-circle text-danger"></i>
							<div>
								<h4>Atque rerum nesciunt</h4>
								<p>Quae dolorem earum veritatis oditseno</p>
								<p>1 hr. ago</p>
							</div></li>

						<li>
							<hr class="dropdown-divider">
						</li>

						<li class="notification-item"><i
							class="bi bi-check-circle text-success"></i>
							<div>
								<h4>Sit rerum fuga</h4>
								<p>Quae dolorem earum veritatis oditseno</p>
								<p>2 hrs. ago</p>
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
						class="d-none d-md-block dropdown-toggle ps-2"><%=admin_id %></span>
				</a> <!-- End Profile Iamge Icon -->

					<ul
						class="dropdown-menu dropdown-menu-end dropdown-menu-arrow profile">
						<li class="dropdown-header">
							<h6><%=admin_id %>
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
		<!-- End Icons Navigation -->

	</header>
	<!-- End Header -->
	
	
	 <!-- ======= Sidebar ======= -->
  <aside id="sidebar" class="sidebar">

    <ul class="sidebar-nav" id="sidebar-nav">

      <li class="nav-item">
        <a class="nav-link " href="admin.action">
          <i class="bi bi-grid"></i>
          <span>ADMIN</span>
        </a>
      </li><!-- End Dashboard Nav -->
      
      <li class="nav-item">
        <a class="nav-link " href="admin.action">
          <i class="bi bi-grid"></i>
          <span>신고처리</span>
        </a>
      </li>

      <li class="nav-item">
        <a class="nav-link collapsed" data-bs-target="#components-nav" data-bs-toggle="collapse" href="#">
          <i class="bi bi-menu-button-wide"></i><span>둘러보기</span><i class="bi bi-chevron-down ms-auto"></i>
        </a>
        <ul id="components-nav" class="nav-content collapse " data-bs-parent="#sidebar-nav">
          <li>
            <a href="components-alerts.html">
              <i class="bi bi-circle"></i><span>전체 그룹리스트</span>
            </a>
          </li>
          <li>
            <a href="components-accordion.html">
              <i class="bi bi-circle"></i><span>전체 모먼트 리스트</span>
            </a>
          </li>
        </ul>
      </li><!-- End Components Nav -->

      


  </aside><!-- End Sidebar-->
	<main id="main" class="main">

    <div class="pagetitle">
      <h1>ADMIN</h1>
      <nav>
        <ol class="breadcrumb">
          <li class="breadcrumb-item"><a href="main.action">Home</a></li>
          <li class="breadcrumb-item active">ADMIN</li>
        </ol>
      </nav>
    </div><!-- End Page Title -->

    <section class="section dashboard">
      <div class="row">

        <!-- Left side columns -->
        <div class="col-lg-8">
          <div class="row">
          
          <!-- Customers Card -->
            <div class="col-xxl-4 col-xl-12">

              <div class="card info-card customers-card">
                <div class="card-body">
                  <h5 class="card-title"> User <span>| In App</span></h5>

                  <div class="d-flex align-items-center">
                    <div class="card-icon rounded-circle d-flex align-items-center justify-content-center">
                      <i class="bx bxs-face"></i>
                    </div>
                    <div class="ps-3">
                      <h6>${countUser }</h6>
                      <c:set var="percentage" value="${(countNewUser / countUser) * 100}" />
						<span class="text-success small pt-1 fw-bold">
						    ${fn:substring(percentage, 0, fn:indexOf(percentage, '.'))}% / ${countNewUser }명
						</span> <br />
                      <span class="text-muted small pt-2 ps-1">increase In Month</span>
                    </div>
                  </div>

                </div>
              </div>

            </div><!-- End Customers Card -->

            <!-- Sales Card -->
            <div class="col-xxl-4 col-md-6">
              <div class="card info-card sales-card">

                <div class="card-body">
                  <h5 class="card-title">Group <span>| In App</span></h5>

                  <div class="d-flex align-items-center">
                    <div class="card-icon rounded-circle d-flex align-items-center justify-content-center">
                      <i class="bx bxs-group"></i>
                    </div>
                    <div class="ps-3">
                      <h6>${countGroup }</h6>
                      <c:set var="percentage" value="${(countNewGroup / countGroup) * 100}" />
						<span class="text-success small pt-1 fw-bold">
						    ${fn:substring(percentage, 0, fn:indexOf(percentage, '.'))}% / ${countNewGroup } 그룹
						</span> <br />
                      <span class="text-muted small pt-2 ps-1">increase In Month</span>
                    </div>
                  </div>
                </div>

              </div>
            </div><!-- End Sales Card -->

            <!-- Revenue Card -->
            <div class="col-xxl-4 col-md-6">
              <div class="card info-card revenue-card">
                <div class="card-body">
                  <h5 class="card-title">MOMENT <span>| In App</span></h5>

                  <div class="d-flex align-items-center">
                    <div class="card-icon rounded-circle d-flex align-items-center justify-content-center">
                      <i class="bx bx-calendar-check"></i>
                    </div>
                    <div class="ps-3">
                      <h6>${countMoment }</h6>
                      <c:set var="percentage" value="${(countNewMoment / countMoment) * 100}" />
						<span class="text-success small pt-1 fw-bold">
						    ${fn:substring(percentage, 0, fn:indexOf(percentage, '.'))}% / ${countNewMoment } MOMENT
						</span> <br />
                      <span class="text-muted small pt-2 ps-1">increase In Month</span>
                    </div>
                  </div>
                </div>

              </div>
            </div><!-- End Revenue Card -->

            

            <!-- Reports -->
            <div class="col-12">
              <div class="card">
                <div class="card-body">
                  <h5 class="card-title">APP Reports <span>| IN 7DAYS</span></h5>

                  <!-- Line Chart -->
                  <div id="reportsChart"></div>

                  <script>
                    document.addEventListener("DOMContentLoaded", () => {
                    	
                    	
                      new ApexCharts(document.querySelector("#reportsChart"), {
                        series: [{
                          name: 'User',
                          data: [
                        	  <c:forEach var ="item" items="${countUserChange}" varStatus="Status">
                        	  ${item.num_records}
                        		<c:if test="${!Status.last }">
              					,
              					</c:if>
                        	  </c:forEach>
                          ]
                        }, {
                          name: 'Group',
                          data: [
                        	  <c:forEach var ="item" items="${countGroupChange}" varStatus="Status">
                        	  ${item.num_records}
                        		<c:if test="${!Status.last }">
              					,
              					</c:if>
                        	  </c:forEach>
                        	  
                          		]
                        }, {
                          name: 'Moment',
                          data: [
                        	  <c:forEach var ="item" items="${countMomentChange}" varStatus="Status">
                        	  ${item.num_records}
                        		<c:if test="${!Status.last }">
              					,
              					</c:if>
                        	  </c:forEach>
                          ]
                        }],
                        chart: {
                          height: 350,
                          type: 'area',
                          toolbar: {
                            show: false
                          },
                        },
                        markers: {
                          size: 4
                        },
                        colors: ['#4154f1', '#2eca6a', '#ff771d'],
                        fill: {
                          type: "gradient",
                          gradient: {
                            shadeIntensity: 1,
                            opacityFrom: 0.3,
                            opacityTo: 0.4,
                            stops: [0, 90, 100]
                          }
                        },
                        dataLabels: {
                          enabled: false
                        },
                        stroke: {
                          curve: 'smooth',
                          width: 2
                        },
                        xaxis: {
                          type: 'datetime',
                          categories: [
                        	  <c:forEach var ="item" items="${countGroupChange}" varStatus="Status">
                        	  '${item.generated_date}T00:00:00.000Z'
                        		<c:if test="${!Status.last }">
              					,
              					</c:if>
                        	  </c:forEach>
                        	 		 ]
                        },
                        tooltip: {
                          x: {
                            format: 'YY-MM-dd'
                          },
                        }
                      }).render();
                    });
                  </script>
                  <!-- End Line Chart -->

                </div>

              </div>
            </div><!-- End Reports -->

            <!-- Complaint List -->
            <div class="col-12">
              <div class="card recent-sales overflow-auto">
                <div class="card-body">
                  <h5 class="card-title">Complaint List <span>| In App</span></h5>

                  <table class="table table-borderless datatable">
                    <thead>
                      <tr>
                        <th scope="col">번호</th>
                        <th scope="col">신고자</th>
                        <th scope="col">피신고자</th>
                        <th scope="col">신고내용</th>
                        <th scope="col">신고사유</th>
                        <th scope="col">처리결과</th>
                      </tr>
                    </thead>
                    <tbody>
                    
                      <tr>
                        <th scope="row">1</th>
                        <td>문예원</td>
                        <td>문대진</td>
                        <td><a href="#" class="text-primary complaint-content">과도한팀프로젝트 업무를 주고 방관한 죄! 해온걸 다시 다른걸로 바꾸라한 죄!</a></td>
                        <td>CR005</td>
                        <td><span class="badge bg-success">처리 완료</span></td>
                      </tr>
                      <tr>
                        <th scope="row">2</th>
                        <td>문예원</td>
                        <td>문대진</td>
                        <td><a href="#" class="text-primary complaint-content">과도한팀프로젝트 업무를 주고 방관한 죄! 해온걸 다시 다른걸로 바꾸라한 죄!</a></td>
                        <td>CR005</td>
                        <td><span class="badge bg-danger">미처리</span></td>
                      </tr>
                      <tr>
                        <th scope="row">1</th>
                        <td>문예원</td>
                        <td>문대진</td>
                        <td><a href="#" class="text-primary complaint-content">과도한팀프로젝트 업무를 주고 방관한 죄! 해온걸 다시 다른걸로 바꾸라한 죄!</a></td>
                        <td>CR005</td>
                        <td><span class="badge bg-success">처리 완료</span></td>
                      </tr>
                      <tr>
                        <th scope="row">2</th>
                        <td>문예원</td>
                        <td>문대진</td>
                        <td><a href="#" class="text-primary complaint-content">과도한팀프로젝트 업무를 주고 방관한 죄! 해온걸 다시 다른걸로 바꾸라한 죄!</a></td>
                        <td>CR005</td>
                        <td><span class="badge bg-danger">미처리</span></td>
                      </tr>
                      <tr>
                        <th scope="row">1</th>
                        <td>문예원</td>
                        <td>문대진</td>
                        <td><a href="#" class="text-primary complaint-content">과도한팀프로젝트 업무를 주고 방관한 죄! 해온걸 다시 다른걸로 바꾸라한 죄!</a></td>
                        <td>CR005</td>
                        <td><span class="badge bg-success">처리 완료</span></td>
                      </tr>
                      <tr>
                        <th scope="row">2</th>
                        <td>문예원</td>
                        <td>문대진</td>
                        <td><a href="#" class="text-primary complaint-content">과도한팀프로젝트 업무를 주고 방관한 죄! 해온걸 다시 다른걸로 바꾸라한 죄!</a></td>
                        <td>CR005</td>
                        <td><span class="badge bg-danger">미처리</span></td>
                      </tr>
                      <tr>
                        <th scope="row">1</th>
                        <td>문예원</td>
                        <td>문대진</td>
                        <td><a href="#" class="text-primary complaint-content">과도한팀프로젝트 업무를 주고 방관한 죄! 해온걸 다시 다른걸로 바꾸라한 죄!</a></td>
                        <td>CR005</td>
                        <td><span class="badge bg-success">처리 완료</span></td>
                      </tr>
                      <tr>
                        <th scope="row">2</th>
                        <td>문예원</td>
                        <td>문대진</td>
                        <td><a href="#" class="text-primary complaint-content">과도한팀프로젝트 업무를 주고 방관한 죄! 해온걸 다시 다른걸로 바꾸라한 죄!</a></td>
                        <td>CR005</td>
                        <td><span class="badge bg-danger">미처리</span></td>
                      </tr>
                      <tr>
                        <th scope="row">1</th>
                        <td>문예원</td>
                        <td>문대진</td>
                        <td><a href="#" class="text-primary complaint-content">과도한팀프로젝트 업무를 주고 방관한 죄! 해온걸 다시 다른걸로 바꾸라한 죄!</a></td>
                        <td>CR005</td>
                        <td><span class="badge bg-success">처리 완료</span></td>
                      </tr>
                      <tr>
                        <th scope="row">2</th>
                        <td>문예원</td>
                        <td>문대진</td>
                        <td><a href="#" class="text-primary complaint-content">과도한팀프로젝트 업무를 주고 방관한 죄! 해온걸 다시 다른걸로 바꾸라한 죄!</a></td>
                        <td>CR005</td>
                        <td><span class="badge bg-danger">미처리</span></td>
                      </tr>
                      <tr>
                        <th scope="row">1</th>
                        <td>문예원</td>
                        <td>문대진</td>
                        <td><a href="#" class="text-primary complaint-content">과도한팀프로젝트 업무를 주고 방관한 죄! 해온걸 다시 다른걸로 바꾸라한 죄!</a></td>
                        <td>CR005</td>
                        <td><span class="badge bg-success">처리 완료</span></td>
                      </tr>
                      <tr>
                        <th scope="row">2</th>
                        <td>문예원</td>
                        <td>문대진</td>
                        <td><a href="#" class="text-primary complaint-content">과도한팀프로젝트 업무를 주고 방관한 죄! 해온걸 다시 다른걸로 바꾸라한 죄!</a></td>
                        <td>CR005</td>
                        <td><span class="badge bg-danger">미처리</span></td>
                      </tr>
                      
                      
                    </tbody>
                  </table>

                </div>

              </div>
            </div><!-- End complaintList -->
			 <!-- Group List -->
            <div class="col-12">
              <div class="card top-selling overflow-auto">
                <div class="card-body">
                  <h5 class="card-title">Group List <span>| In App</span></h5>

                  <table class="table table-borderless datatable">
                   <thead>
                      <tr>
                        <th scope="col">Num</th>
                        <th scope="col">Image</th>
                        <th scope="col">Name</th>
                        <th scope="col">introduction</th>
                        <th scope="col">Count</th>
                        <th scope="col">Since</th>
                      </tr>
                    </thead>
                    <tbody>
                    <c:forEach var="item" items="${groupList }" varStatus="status">
                      <tr>
                        <td>${status.count }</td>
                        <th scope="row"><a href="#"><img src="assets/img/product-1.jpg" alt=""></a></th>
                        <!-- <th scope="row"><a href="#"><img src="${item.root}" alt=""></a></th> -->
                        <td><a href="#" class="text-primary fw-bold">${item.name }</a></td>
                        <td>${item.introduction }</td>
                        <td class="fw-bold">${item.count }</td>
                        <td>${item.open_date }</td>
                      </tr>
                      </c:forEach>
                    </tbody>
                  </table>

                </div>

              </div>
            </div><!-- End Recent Sales -->
			
        </div>
        </div>
        <!-- End Left Side columns -->
        
        
        <!-- Right side columns -->
        <div class="col-lg-4">
        <!-- MomentPhase -->
          <div class="card">
            <div class="card-body pb-0">
              <h5 class="card-title">MOMENT PHASE <span>| In App</span></h5>

              <div id="phaseChart" style="min-height: 400px;" class="echart"></div>

              <script>
                document.addEventListener("DOMContentLoaded", () => {
                  echarts.init(document.querySelector("#phaseChart")).setOption({
                    tooltip: {
                      trigger: 'item'
                    },
                    legend: {
                      top: '5%',
                      left: 'center'
                    },
                    series: [{
                      name: 'Phase',
                      type: 'pie',
                      radius: ['40%', '70%'],
                      avoidLabelOverlap: false,
                      label: {
                        show: false,
                        position: 'center'
                      },
                      emphasis: {
                        label: {
                          show: true,
                          fontSize: '18',
                          fontWeight: 'bold'
                        }
                      },
                      labelLine: {
                        show: false
                      },
                      data: [{
                          value: ${countPhaseMoment[0]},
                          name: 'Oper'
                        },
                        {
                          value: ${countPhaseMoment[1]},
                          name: 'Build'
                        },
                        {
                          value: ${countPhaseMoment[2]},
                          name: 'Info'
                        }
                      ]
                    }]
                  });
                });
              </script>

            </div>
          </div><!-- End MomentPhase -->
          
          <!-- GenderCount -->
          <div class="card">
            <div class="card-body pb-0">
              <h5 class="card-title">Gender Count <span>| In App</span></h5>

              <div id="genderChart" style="min-height: 400px;" class="echart"></div>

              <script>
                document.addEventListener("DOMContentLoaded", () => {
                  echarts.init(document.querySelector("#genderChart")).setOption({
                    tooltip: {
                      trigger: 'item'
                    },
                    legend: {
                      top: '5%',
                      left: 'center'
                    },
                    series: [{
                      name: 'Gender',
                      type: 'pie',
                      radius: ['40%', '70%'],
                      avoidLabelOverlap: false,
                      label: {
                        show: false,
                        position: 'center'
                      },
                      emphasis: {
                        label: {
                          show: true,
                          fontSize: '18',
                          fontWeight: 'bold'
                        }
                      },
                      labelLine: {
                        show: false
                      },
                      data: [{
                          value: ${countGender[0]},
                          name: 'Male',
                          itemStyle: {color: '#03bafc'}
                        },
                        {
                          value: ${countGender[1]},
                          name: 'Female',
                       	  itemStyle: {color: '#fc0390'},
                          
                        }
                     
                      ]
                    }]
                  });
                });
              </script>

            </div>
          </div><!-- End GenderCount -->

          

          <!-- Complaint Report -->
          <div class="card">
            <div class="card-body pb-0">
              <h5 class="card-title">Complaint Report <span>| This Month</span></h5>

              <div id="complaintChart" style="min-height: 400px;" class="echart"></div>

              <script>
                document.addEventListener("DOMContentLoaded", () => {
                  var budgetChart = echarts.init(document.querySelector("#complaintChart")).setOption({
                    legend: {
                      data: ['Recept Complaint', 'Completed Complaint']
                    },
                    radar: {
                      // shape: 'circle',
                      indicator: [{
                          name: '불법행위를 조장하는 콘텐츠',
                          max: 100
                        },
                        {
                          name: '스팸홍보/도배 콘텐츠',
                          max: 100
                        },
                        {
                          name: '음란물 콘텐츠',
                          max: 100
                        },
                        {
                          name: '청소년에게 유해한 콘텐츠',
                          max: 100
                        },
                        {
                          name: '인신공격/생명경시/혐오/차별 행위 콘텐츠',
                          max: 100
                        }
                      ]
                    },
                    series: [{
                      name: 'Completed Ratio',
                      type: 'radar',
                      data: [{
                          value: [70, 50, 20, 60, 90],
                          name: 'Recept Complaint'
                        },
                        {
                          value: [40, 30, 20, 55, 19],
                          name: 'Completed Complaint'
                        }
                      ]
                    }]
                  });
                });
              </script>

            </div>
          </div><!-- End Budget Report -->

        </div><!-- End Right side columns -->

      </div>
    </section>

  </main><!-- End #main -->
	
 <!-- Vendor JS Files -->
  <script src="assets/vendor/apexcharts/apexcharts.min.js"></script>
  <script src="assets/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
  <script src="assets/vendor/chart.js/chart.umd.js"></script>
  <script src="assets/vendor/echarts/echarts.min.js"></script>
  <script src="assets/vendor/quill/quill.js"></script>
  <script src="assets/vendor/simple-datatables/simple-datatables.js"></script>
  <script src="assets/vendor/tinymce/tinymce.min.js"></script>
  <script src="assets/vendor/php-email-form/validate.js"></script>

  <!-- Template Main JS File -->
  <script src="assets/js/main.js"></script>

</body>
</html>