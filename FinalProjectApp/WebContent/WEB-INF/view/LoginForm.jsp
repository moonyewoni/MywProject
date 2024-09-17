<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
	String match = (String)request.getParameter("match");
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Insert title here</title>
<link href="assets/img/favicon.png" rel="icon">
<link href="assets/img/apple-touch-icon.png" rel="apple-touch-icon">
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

<link href="assets/css/style.css" rel="stylesheet">
<script type="text/javascript" src="http://code.jquery.com/jquery.min.js"></script>
<script type="text/javascript">
	$(function() {
		var match = "<%= match%>";
		
		if (match == "no" ) {
			alert("아이디와 비밀번호를 확인하세요");
			
			$("#my_id").addClass("is-invalid");
			$("#my_id").addClass("is-was-invalidated");
			$("#my_id").addClass("form-control:invalid");
			
			$("#pw").addClass("is-invalid");
			$("#pw").addClass("is-was-invalidated");
			$("#pw").addClass("form-control:invalid");
			
			
		}
			$("#my_id").change(function() {
				$("#my_id").removeClass("is-invalid");
				$("#my_id").removeClass("is-was-invalidated");
				$("#my_id").removeClass("form-control:invalid");
			});
			
			$("#pw").change(function() {
				$("#pw").removeClass("is-invalid");
				$("#pw").removeClass("is-was-invalidated");
				$("#pw").removeClass("form-control:invalid");
			});
	})
</script>
</head>
<body>

	<main>
		<div class="container">
			<section
				class="section register min-vh-100 d-flex flex-column align-items-center justify-content-center py-4">
				<div class="container">
					<div class="row justify-content-center">
						<div class="col-lg-4 col-md-6 d-flex flex-column align-items-center justify-content-center">
							<div class="d-flex justify-content-center py-4">
								<a href="main.action"
									class="logo d-flex align-items-center w-auto"> 
									<img src="assets/img/logo.png" alt=""> 
									<span class="d-none d-lg-block">MOMENT</span>
								</a>
							</div>
							<!-- End Logo -->

							<div class="card mb-3">

								<div class="card-body">

									<div class="pt-4 pb-2">
										<h5 class="card-title text-center pb-0 fs-4">Login to
											Your Account</h5>
										<p class="text-center small">Enter your userID & Password
											to login</p>
									</div>

									<form id="loginForm" role="form" action="login.action"
										method="post" class="row g-3 needs-validation" novalidate>

										<div class="col-12">
											<label for="my_id" class="form-label">UserId</label>
											<div class="input-group has-validation">
												<span class="input-group-text" id="inputGroupPrepend">@</span>
												<input type="text" name="my_id" id="my_id"
													class="form-control" id="my_id" required
													placeholder="아이디를 입력하세요">
												<div class="invalid-feedback">Please enter your
													username.</div>
											</div>
										</div>

										<div class="col-12">
											<label for="pw" class="form-label">Password</label> <input
												type="password" name="pw" class="form-control" id="pw"
												required placeholder="비밀번호를 입력하세요">
											<div class="invalid-feedback">Please enter your
												password!</div>
										</div>

										<div class="col-12">
											<div class="form-check">
												<input class="form-check-input" type="checkbox" name="admin"
													value="1" id="admin"> 
													<label class="form-check-label" for="admin">관리자</label>
											</div>
										</div>
										<div class="col-12">
											<button class="btn btn-primary w-100" type="submit">Login</button>
										</div>
										<div class="col-12">
											<p class="small mb-0">
												Don't have account? 
												<a href="memberinsertform.action">Create an account</a>
											</p>
										</div>
										<div class="col-12">
											<p class="small mb-0">
											Find My
												<a href="findid.action">Id</a>
												/
												<a href="findpw.action">Password</a>
											</p>
										</div>
									</form>

								</div>
							</div>
						</div>
					</div>
				</div>

			</section>

		</div>
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

	<!-- Template Main JS File -->
	<script src="assets/js/main.js"></script>


</body>
</html>