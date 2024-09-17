<%@page import="java.util.ArrayList"%>
<%@page import="java.util.Calendar"%>
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
<title>MemberInsertForm.jsp</title>
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
<link rel="stylesheet" type="text/css" href="<%=cp %>/css/jquery-ui.css">
<script type="text/javascript" src="http://code.jquery.com/jquery.min.js"></script>
<script type="text/javascript" src="<%=cp %>/js/util.js"></script>
<script type="text/javascript" src="<%=cp %>/js/jquery-ui.js"></script>
<script type="text/javascript">
	$(document)
			.ready(
					function() {
						$("#nullError").css("display", "none");

						$("#birth_date").datepicker({
							dateFormat : "yy-mm-dd",
							changeYear : true,
							changeMonth : true,
							maxDate : 0
						});

						// ajax 처리 통해 아이디 실시간 중복 검사
						$("#my_id").change(function() 
						{
							$("#idError1").css("display", "none");
							$("#idError2").css("display", "none");
							$("#idError3").css("display", "none");

							var my_id = $("#my_id").val();

							var params = "my_id=" + my_id;
							$.ajax(
							{
								type : "POST",
								url : "memberidcount.action",
								data : params,
								dataType : "xml"
								,
								success : function(id) 
								{
									$(id).find("lists").each(function() 
									{
										var lists = $(this);
										var countId = lists.find("count").text();
											
										// 같은 아이디가 0개 이상이라면
										if (countId != "" && parseInt(countId) > 0) 
										{
											// 에러 메시지 보여주기
											$("#idError1").css("display", "inline");
											$("#my_id").addClass("is-invalid");
											$("#my_id").addClass("is-was-invalidated");
											$("#my_id").addClass("form-control:invalid");
											$("#my_id").focus();
											return;
										}
										else
										{
											$("#my_id").removeClass("is-invalid");
											$("#my_id").removeClass("is-was-invalidated");
											$("#my_id").removeClass("form-control:invalid");
											$("#my_id").addClass("is-valid");
											$("#my_id").addClass("is-was-validated");
											$("#my_id").addClass("form-control:valid");
									
										}
									});
	
								},
								error : function(e) 
								{
									alert(e.responseText);
								}

							});

							if (my_id.length < 6) {
								$("#idError2").css("display",
										"inline");
								$("#my_id").addClass("is-invalid");
								$("#my_id").addClass("is-was-invalidated");
								$("#my_id").addClass("form-control:invalid");
								$("#my_id").focus();
								return;
							}
							else
							{
								$("#my_id").removeClass("is-invalid");
								$("#my_id").removeClass("is-was-invalidated");
								$("#my_id").removeClass("form-control:invalid");
								$("#my_id").addClass("is-valid");
								$("#my_id").addClass("is-was-validated");
								$("#my_id").addClass("form-control:valid");
						
							}

							let checkNum = /[0-9]/;
							let checkEng = /[a-zA-Z]/;
							let checkSpc = /[~!@#$%^&*()_+|<>?:{}]/;
							let checkKor = /[ㄱ-ㅎ|ㅏ-ㅣ|가-힣]/;

							var flagSpc = checkSpc.test(my_id);
							var flagKor = checkKor.test(my_id);

							if (flagSpc || flagKor) 
							{
								$("#idError3").css("display", "inline");
								$("#my_id").addClass("is-invalid");
								$("#my_id").addClass("is-was-invalidated");
								$("#my_id").addClass("form-control:invalid"); 
								$("#my_id").focus();
								return;
							}
							else
							{
								$("#my_id").removeClass("is-invalid");
								$("#my_id").removeClass("is-was-invalidated");
								$("#my_id").removeClass("form-control:invalid");
								$("#my_id").addClass("is-valid");
								$("#my_id").addClass("is-was-validated");
								$("#my_id").addClass("form-control:valid");
							}
						});

						$("#pw").change(function() 
						{
							$("#pwError1").css("display", "none");
							$("#pwError2").css("display", "none");
							$("#pwError3").css("display", "none");

							var pw = $("#pw").val();

							if (pw.length < 8) 
							{
								$("#pwError1").css("display", "inline");
								$("#pw").addClass("is-invalid");
								$("#pw").addClass("is-was-invalidated");
								$("#pw").addClass("form-control:invalid");
								
								$("#pw").focus();
								return;
							}
							else
							{
								$("#pw").removeClass("is-invalid");
								$("#pw").removeClass("is-was-invalidated");
								$("#pw").removeClass("form-control:invalid");
								$("#pw").addClass("is-valid");
								$("#pw").addClass("is-was-validated");
								$("#pw").addClass("form-control:valid");
							}
							
							// 입력된 비밀번호 문자열 체크 정규표현식(영어, 숫자)
							let checkNum = /[0-9]/;
							let checkEng = /[a-zA-Z]/;

							// 숫자, 영어가 둘 다 포함되어 있는지(true or false) 확인
							var flagNum = checkNum.test(pw);
							var flagEng = checkEng.test(pw);
							
							// 숫자, 영어 중 포함되지 않은 문자열이 있다면
							if (!flagNum || !flagEng) 
							{
								// 에러 메시지 표시
								$("#pwError2").css("display", "inline");
								$("#pw").addClass("is-invalid");
								$("#pw").addClass("is-was-invalidated");
								$("#pw").addClass("form-control:invalid");
								
								$("#pw").focus();
								return;
							}
							else
							{
								$("#pw").removeClass("is-invalid");
								$("#pw").removeClass("is-was-invalidated");
								$("#pw").removeClass("form-control:invalid");
								$("#pw").addClass("is-valid");
								$("#pw").addClass("is-was-validated");
								$("#pw").addClass("form-control:valid");
							}
						});

						$("#user_name")
								.change(
										function() {
											$("#nameError1").css("display",
													"none");
											$("#nameError2").css("display",
													"none");

											var user_name = $("#user_name")
													.val();

											if (user_name.length < 2) {
												$("#nameError1").css("display",
														"inline");
												$("#user_name").addClass("is-invalid");
												$("#user_name").addClass("is-was-invalidated");
												$("#user_name").addClass("form-control:invalid");
												
												$("#user_name").focus();
												return;
											}
											else
											{
												$("#user_name").removeClass("is-invalid");
												$("#user_name").removeClass("is-was-invalidated");
												$("#user_name").removeClass("form-control:invalid");
												$("#user_name").addClass("is-valid");
												$("#user_name").addClass("is-was-validated");
												$("#user_name").addClass("form-control:valid");
											}

											var params = "user_name="
													+ user_name;
											$
													.ajax({
														type : "POST",
														url : "membernamecount.action",
														data : params,
														dataType : "xml",
														success : function(name) {

															$(name)
																	.find(
																			"lists")
																	.each(
																			function() {
																				var lists = $(this);
																				var count = lists
																						.find(
																								"count")
																						.text();

																				if (parseInt(count) > 0) {
																					$(
																							"#nameError2")
																							.css(
																									"display",
																									"inline");
																					$("#user_name").addClass("is-invalid");
																					$("#user_name").addClass("is-was-invalidated");
																					$("#user_name").addClass("form-control:invalid");
																					
																					$("#user_name").focus();
																					return;
																				}
																				else
																				{
																					$("#user_name").removeClass("is-invalid");
																					$("#user_name").removeClass("is-was-invalidated");
																					$("#user_name").removeClass("form-control:invalid");
																					$("#user_name").addClass("is-valid");
																					$("#user_name").addClass("is-was-validated");
																					$("#user_name").addClass("form-control:valid");
																				
																				}
																			});

														},
														error : function(e) {
															alert(e.responseText);
														}

													});
										});

						$("#answer").change(function() {
							$("#answerError").css("display", "none");

							if ($("#answer").val().length < 2) {
								$("#answerError").css("display", "inline");
								$("#answer").addClass("is-invalid");
								$("#answer").addClass("is-was-invalidated");
								$("#answer").addClass("form-control:invalid");
								
								$("#answer").focus();
								return;
							}
							else
							{
								$("#answer").removeClass("is-invalid");
								$("#answer").removeClass("is-was-invalidated");
								$("#answer").removeClass("form-control:invalid");
								$("#answer").addClass("is-valid");
								$("#answer").addClass("is-was-validated");
								$("#answer").addClass("form-control:valid");
							}

						});

						$(".btn-success")
								.click(
										function() {
											var flag = true;

											if ($("#my_id").val() == ""
													|| $("#pw").val() == ""
													|| $("#user_name").val() == ""
													|| $("#answer").val() == ""
													|| $("#birth_date").val() == "") {
												$("#nullError").css("display",
														"inline");
												flag = false;
											}

											if ($("#idError1").css("display") == "inline"
													|| $("#idError2").css(
															"display") == "inline"
													|| $("#idError3").css(
															"display") == "inline"
													|| $("#pwError1").css(
															"display") == "inline"
													|| $("#pwError2").css(
															"display") == "inline"
													|| $("#nameError1").css(
															"display") == "inline"
													|| $("#nameError1").css(
															"display") == "inline"
													|| $("#answerError").css(
															"display") == "inline"
													|| $("#birthDateError")
															.css("display") == "inline") {
												flag = false;
											}

											if (flag) {
												$("#myForm").submit();
											}

										});

					});
</script>

</head>
<body>

<main>
    <div class="container">

      <section class="section register min-vh-100 d-flex flex-column align-items-center justify-content-center py-4">
        <div class="container">
          <div class="row justify-content-center">
            <div class="col-lg-4 col-md-6 d-flex flex-column align-items-center justify-content-center">

              <div class="d-flex justify-content-center py-4">
                <a href="index.html" class="logo d-flex align-items-center w-auto">
                  <img src="assets/img/logo.png" alt="">
                  <span class="d-none d-lg-block">MOMENT</span>
                </a>
              </div><!-- End Logo -->

              <div class="card mb-3">

                <div class="card-body">

                  <div class="pt-4 pb-2">
                    <h5 class="card-title text-center pb-0 fs-4">Create an Account</h5>
                    <p class="text-center small">Enter your personal details to create account</p>
                  </div>

                  <form  action="memberinsert.action" method="post" id="myForm" class="row g-3 needs-validation" novalidate>
                    <div class="col-12">
                      <label for="my_id" class="form-label">아이디</label>
                      <input type="text" name="my_id" class="form-control" id="my_id" required
                      placeholder="6 ~ 12자 / 영어, 숫자 사용 가능" maxlength="12">
                      <div style="display: none;" id="idError1" class="error invalid-feedback">
	                      <span style="font-size: small; color: red;">※ 이미 존재하는 아이디입니다.</span>
                      </div>
                      <div style="display: none;" id="idError2" class="error invalid-feedback">
	                      <span style="font-size: small; color: red;">※ 6자 이상 입력해야 합니다.</span>
                      </div>
                      <div style="display: none;" id="idError3" class="error invalid-feedback">
	                      <span style="font-size: small; color: red;">※ 사용 불가능한 문자입니다.</span>
                      </div>
                    </div>

                    <div class="col-12">
                      <label for="pw" class="form-label">비밀번호</label>
                      <input type="password" class="form-control" id="pw" name="pw" maxlength="16" 
                      placeholder="8 ~ 16자 / 영어, 숫자 필수(특수문자 사용가능) " required>
                      <div style="display: none;" id="pwError1" class="error invalid-feedback">
                      	<span style="font-size: small; color: red;">※ 8자 이상 입력해야 합니다.</span>
					  </div>
					  <div style="display: none;" id="pwError2" class="error invalid-feedback"><span
									style="font-size: small; color: red;">※ 영어, 숫자가 포함되어야 합니다.</span>
					</div>
           
                    </div>

                    <div class="col-12">
                      <label for="user_name" class="form-label">닉네임</label>
                      <div class="input-group has-validation">
                        <input type="text" name="user_name" class="form-control" id="user_name" required
                        placeholder="2 ~ 30자 / 중복 불가" maxlength="30" >
                        <div style="display: none;" id="nameError1" class="error invalid-feedback">
                        <span style="font-size: small; color: red;">※ 2자 이상 입력해야 합니다.</span>
						</div>
						<div style="display: none;" id="nameError2" class="error invalid-feedback">
							<span style="font-size: small; color: red;">※ 이미 존재하는 닉네임입니다.</span>
						</div>
                      </div>
                    </div>
                    
                    <div class="col-12">
                      <label for="user_name" class="form-label">생년월일</label>
                      <div class="input-group has-validation">
                        <input type="text" name="birth_date" class="form-control" id="birth_date" required
                        placeholder="생년월일" >
						</div>
                     </div>
                     
                     <div class="col-12">
                      <label for="male" class="form-label">성별</label>
                      	<div class="input-group has-validation">
                      		<div class="form-check">
                       		<input type="radio" id="male" name="gender_id"
									value="GD01" checked="checked" class="gender form-check-input"> 
									<label for="male" style="font-size: 14px;" class="form-check-label">  남성</label> 
									</div>
									&nbsp;
									<div class="form-check">
									<input
									type="radio" id="female" name="gender_id" value="GD02"
									class="gender form-check-input"> 
									<label for="female"
									style="font-size: 14px;" class="form-check-label">  여성</label>
									</div>
						</div>
                     </div>
                     
                     <div class="col-12">
                      <label for="male" class="form-label">비밀번호 찾기 질문 / 답변</label>
                      	<div class="input-group has-validation">
                       		<div>
                       		<select id="find_id" name="find_id" class="form-select">
										<c:forEach var="find" items="${findList }">
											<option value="${find.find_id }">${find.question }</option>
										</c:forEach>
							</select> <input type="text" id="answer" name="answer"
									class="form-control" placeholder="답변" maxlength="100"
									required="required">
                       		</div>
                       		<div style="display: none;" id="answerError" class="error invalid-feedback">
									<span style="font-size: small; color: red;">※ 2자 이상 입력해야
										합니다.</span>
							</div>
						</div>
                     </div>

                  

                    <div class="col-12">
                      <div class="form-check">
                        <input class="form-check-input" name="terms" type="checkbox" value="" id="acceptTerms" required>
                        <label class="form-check-label" for="acceptTerms">I agree and accept the <a href="#">terms and conditions</a></label>
                        <div class="invalid-feedback">You must agree before submitting.</div>
                      </div>
                    </div>
                    <div class="col-12">
                      <button class="btn btn-primary w-100" type="submit">등록</button>
                    </div>
                    <div class="col-12">
                      <p class="small mb-0">Already have an account? <a href="loginform.action">Log in</a></p>
                    </div>
                  </form>

                </div>
              </div>
            </div>

          </div>
        </div>

      </section>

    </div>
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