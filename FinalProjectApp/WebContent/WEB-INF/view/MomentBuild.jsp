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
<title>MomentBuild.jsp</title>
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



<script type="text/javascript">


		$(document).ready(function()
		{
			// 임시 
			/*
			$("#sv_date_name").datepicker(
						{
							dateFormat : "yy-mm-dd"
							, changeYear : true
							, changeMonth : true
							, minDate : +3
							, maxDate : +730
				});
				
				$("#sv_impossible_date").datepicker(
						{
							dateFormat : "yy-mm-dd"
							, changeYear : true
							, changeMonth : true
							, minDate : +3
							, maxDate : +730
			});
			
			*/ 
			// 여기까지
			
			if ($("#countJoin").val() < 1)
			{
				$(".btn-info").css("display", "none");
			}
			
			if ($("#moment_name_survey_id").val() > 0)
			{
				
				$("#cr_moment_name").css("display", "none");
				/*
				result = createMoment_nameSurvey();
				document.getElementById("result_moment_name").innerHTML = result;
				*/
				$("#result_moment_name").css("display", "inline");
				
				if ($("#moment_name_response_id").val() != "" && $("#moment_name_response_id").val() > 0)
				{
					$("#sm_moment_name").attr("disabled", "disabled");
					$("#sm_moment_name").text("제출 완료");
					
					if ($("#moment_name_response").val() == "")
						$("#sv_moment_name").val("의견 없음");
					else
						$("#sv_moment_name").val($("#moment_name_response").val());
					
					if ($("#moment_name_others").val() == "")
						$("#sv_moment_name_others").val("의견 없음");
					else
						$("#sv_moment_name_others").val($("#moment_name_others").val());
					
					$("#sv_moment_name").attr("readonly", "readonly");
					$("#sv_moment_name_others").attr("readonly", "readonly");
				}
			}
			
			if ($("#date_name_survey_id").val() > 0)
			{
				$("#cr_date_name").css("display", "none");
				/*
				result = createDate_nameSurvey();
				document.getElementById("result_date_name").innerHTML = result;
				
				$("#sv_date_name").datepicker(
						{
							dateFormat : "yy-mm-dd"
							, changeYear : true
							, changeMonth : true
							, minDate : +3
							, maxDate : +730
				});
				
				$("#sv_impossible_date").datepicker(
						{
							dateFormat : "yy-mm-dd"
							, changeYear : true
							, changeMonth : true
							, minDate : +3
							, maxDate : +730
				});
				*/
				
				$("#result_date_name").css("display", "inline");
				
				// 얘만 있으면 에러생김..왜그러냐
				$("#sv_date_name").datepicker(
						{
							dateFormat : "yy-mm-dd"
							, changeYear : true
							, changeMonth : true
							, minDate : +3
							, maxDate : +730
				});
				
				$("#sv_impossible_date").datepicker(
						{
							dateFormat : "yy-mm-dd"
							, changeYear : true
							, changeMonth : true
							, minDate : +3
							, maxDate : +730
				});
				
				if ($("#date_name_response_id").val() > 0)
				{
					$("#sm_date_name").attr("disabled", "disabled");
					$("#sm_date_name").text("제출 완료");
					
					if ($("#date_name_response").val() == "")
						$("#sv_date_name").val("의견 없음");
					else
						$("#sv_date_name").val($("#date_name_response").val());
					
					if ($("#date_name_others").val() == "")
						$("#sv_date_name_others").val("의견 없음");
					else
						$("#sv_date_name_others").val($("#date_name_others").val());
						
					if ($("#date_name_impossible_date").val() == "")
						$("#sv_impossible_date").val("의견 없음");
					else
						$("#sv_impossible_date").val($("#date_name_impossible_date").val().replace("00:00:00", ""));
					
					$("#sv_time").css("display", "none");
					
					$("#sv_date_name").attr("readonly", "readonly");
					$("#sv_date_name_others").attr("readonly", "readonly");
					$("#sv_impossible_date").attr("readonly", "readonly");
				}
			}
			
			
			if ($("#place_name_survey_id").val() > 0)
			{
				$("#cr_place_name").css("display", "none");
				/*
				result = createPlace_nameSurvey();
				document.getElementById("result_place_name").innerHTML = result;
				*/
				$("#result_place_name").css("display", "inline");
				
				if ($("#place_name_response_id").val() > 0)
				{
					$("#sm_place_name").attr("disabled", "disabled");
					$("#sm_place_name").text("제출 완료");
					
					if ($("#place_name_response").val() == "")
						$("#sv_place_name").val("의견 없음");
					else
						$("#sv_place_name").val($("#place_name_response").val());
					
					if ($("#place_name_others").val() == "")
						$("#sv_place_name_others").val("의견 없음");
					else
						$("#sv_place_name_others").val($("#place_name_others").val());
					
					$("#sv_place_name").attr("readonly", "readonly");
					$("#juso").css("display", "none");
					$("#sv_place_name_others").attr("readonly", "readonly");
				}
			}
			
			if ($("#min_participant_survey_id").val() > 0)
			{
				$("#cr_min_participant").css("display", "none");
				/*
				result = createMin_participantSurvey();
				document.getElementById("result_min_participant").innerHTML = result;
				*/
				$("#result_min_participant").css("display", "inline");
				
				if ($("#min_participant_response_id").val() > 0)
				{
					$("#sm_min_participant").attr("disabled", "disabled");
					$("#sm_min_participant").text("제출 완료");
					
					if ($("#smin_participant_response").val() == "")
						$("#sv_min_participant").val("의견 없음");
					else
						$("#sv_min_participant").val($("#min_participant_response").val());
					
					if ($("#min_participant_others").val() == "")
						$("#sv_min_participant_others").val("의견 없음");
					else
						$("#sv_min_participant_others").val($("#min_participant_others").val());
					
					$("#sv_min_participant").attr("readonly", "readonly");
					$("#sv_min_participant_others").attr("readonly", "readonly");
				}
			}
			
			if ($("#max_participant_survey_id").val() > 0)
			{
				$("#cr_max_participant").css("display", "none");
				/*
				result = createMax_participantSurvey();
				document.getElementById("result_max_participant").innerHTML = result;
				*/
				$("#result_max_participant").css("display", "inline");
				
				if ($("#max_participant_response_id").val() > 0)
				{
					$("#sm_max_participant").attr("disabled", "disabled");
					$("#sm_max_participant").text("제출 완료");
					
					if ($("#max_participant_response").val() == "")
						$("#sv_max_participant").val("의견 없음");
					else
						$("#sv_max_participant").val($("#max_participant_response").val());
					
					if ($("#max_participant_others").val() == "")
						$("#sv_max_participant_others").val("의견 없음");
					else
						$("#sv_max_participant_others").val($("#max_participant_others").val());
					
					$("#sv_max_participant").attr("readonly", "readonly");
					$("#sv_max_participant_others").attr("readonly", "readonly");
				}
			}
			
			if ($("#note_survey_id").val() > 0)
			{
				$("#cr_note").css("display", "none");
				/*
				result = createNoteSurvey();
				document.getElementById("result_note").innerHTML = result;
				*/
				$("#result_note").css("display", "inline");
				
				if ($("#note_response_id").val() > 0)
				{
					$("#sm_note").attr("disabled", "disabled");
					$("#sm_note").text("제출 완료");
					
					if ($("#note_response").val() == "")
						$("#sv_note").val("의견 없음");
					else
						$("#sv_note").val($("#note_response").val());
					
					if ($("#note_others").val() == "")
						$("#sv_note_others").val("의견 없음");
					else
						$("#sv_note_others").val($("#note_others").val());
					
					$("#sv_note").attr("readonly", "readonly");
					$("#sv_note_others").attr("readonly", "readonly");
				}
			}
			
			$(".btn-success").click(function()
			{
				if (parseInt($("#max_participant").val()) <= parseInt($("#parti_num").val()))
				{
					alert("이미 최대인원이 채워졌습니다. 참여가 불가능합니다.");
					return;
				}
				
				if ($(this).val() < 1)
				{
					if (confirm("해당 모먼트에 참여하시겠습니까?"))
					{
						$("#myForm").submit();
					}
				}
				else
				{
					if (confirm("해당 모먼트의 참여를 취소하시겠습니까?"))
					{
						location.href = "momentcancel.action?moment_id=" + $("#moment_id").val() + "&group_id=" + $("#group_id").val();
					}
				}
			});
			
			
			$("#cr_moment_name").click(function()
			{
				if (confirm("모먼트명 설문을 생성하시겠습니까?"))
				{
					$("#result_moment_name").css("display", "inline");
					/*
					result = createMoment_nameSurvey();
					document.getElementById("result_moment_name").innerHTML = result;
					*/
					location.href = "momentsurveyinsert.action?moment_id=" + $("#moment_id").val() + "&type_id=" + $(this).val()
									 + "&group_id=" + $("#group_id").val();
					$(this).css("display", "none");
					
					alert("설문이 생성되었습니다.");
				}
			});
			
			$("#cr_date_name").click(function()
			{
				if (confirm("일시 설문을 생성하시겠습니까?"))
				{
					$("#result_date_name").css("display", "inline");
					location.href = "momentsurveyinsert.action?moment_id=" + $("#moment_id").val() + "&type_id=" + $(this).val()
									 + "&group_id=" + $("#group_id").val();
					$(this).css("display", "none");
					
					alert("설문이 생성되었습니다.");
				}
			});
			
			$("#cr_place_name").click(function()
			{
				if (confirm("장소 설문을 생성하시겠습니까?"))
				{
					$("#result_place_name").css("display", "inline");
					location.href = "momentsurveyinsert.action?moment_id=" + $("#moment_id").val() + "&type_id=" + $(this).val()
					 				+ "&group_id=" + $("#group_id").val();
					$(this).css("display", "none");
					
					alert("설문이 생성되었습니다.");
				}
			});
			
			
			$("#cr_min_participant").click(function()
			{
				if (confirm("최소 인원 설문을 생성하시겠습니까?"))
				{
					$("#result_min_participant").css("display", "inline");
					location.href = "momentsurveyinsert.action?moment_id=" + $("#moment_id").val() + "&type_id=" + $(this).val()
					 				 + "&group_id=" + $("#group_id").val();
					$(this).css("display", "none");
					
					alert("설문이 생성되었습니다.");
				}

			});
		
			$("#cr_max_participant").click(function()
			{
				if (confirm("최대 인원 설문을 생성하시겠습니까?"))
				{
					$("#result_max_participant").css("display", "inline");
					location.href = "momentsurveyinsert.action?moment_id=" + $("#moment_id").val() + "&type_id=" + $(this).val()
									 + "&group_id=" + $("#group_id").val();
					$(this).css("display", "none");
					
					alert("설문이 생성되었습니다.");
				}
			});
			
			$("#cr_note").click(function()
			{
				if (confirm("참고사항 설문을 생성하시겠습니까?"))
				{
					$("#result_note").css("display", "inline");
					location.href = "momentsurveyinsert.action?moment_id=" + $("#moment_id").val() + "&type_id=" + $(this).val()
									 + "&group_id=" + $("#group_id").val();
					$(this).css("display", "none");
					
					alert("설문이 생성되었습니다.");
				}

			});
			
		$(".btn-survey").click(function()
		{
			if (confirm("답변을 제출하시겠습니까? 제출 후 수정이 불가능합니다."))
			{
				switch ($(this).val())
				{
				case "ST01": $(location).attr("href", "momentsurveyresponseinsert.action?moment_id=" + $("#moment_id").val()
						 	 + "&type_id=" + $(this).val() + "&response=" + $("#sv_moment_name").val()
						 	 + "&group_id=" + $("#group_id").val()  + "&others=" + $("#sv_moment_name_others").val());
					break;
				case "ST02": 
				if ($("#sv_date_name").val() == "" && $("#sv_time").val() != "")
				{
					alert("시간만 선택하는 것은 불가능합니다.");
					break;
				} 
				else
				{
					$(location).attr("href", "momentsurveyresponseinsert.action?moment_id=" + $("#moment_id").val()
				 	 + "&type_id=" + $(this).val() + "&response=" + $("#sv_date_name").val() + $("#sv_time").val()
				 	 + "&others=" + $("#sv_date_name_others").val()
				 	 + "&impossible_date=" + $("#sv_impossible_date").val() + "&group_id=" + $("#group_id").val());
				}
				
				break;
				case "ST03": $(location).attr("href", "momentsurveyresponseinsert.action?moment_id=" + $("#moment_id").val()
						 	 + "&type_id=" + $(this).val() + "&response=" + $("#sv_place_name").val()
						 	 + "&group_id=" + $("#group_id").val() + "&others=" + $("#sv_place_name_others").val());
					break;
				case "ST04": $(location).attr("href", "momentsurveyresponseinsert.action?moment_id=" + $("#moment_id").val()
						 	 + "&type_id=" + $(this).val() + "&response=" + $("#sv_min_participant").val()
						 	 + "&group_id=" + $("#group_id").val() + "&others=" + $("#sv_min_participant_others").val());
					break;
				case "ST05": $(location).attr("href", "momentsurveyresponseinsert.action?moment_id=" + $("#moment_id").val()
						 	 + "&type_id=" + $(this).val() + "&response=" + $("#sv_max_participant").val()
						 	 + "&group_id=" + $("#group_id").val() + "&others=" + $("#sv_max_participant_others").val());
					break;
				case "ST06": $(location).attr("href", "momentsurveyresponseinsert.action?moment_id=" + $("#moment_id").val()
						 	 + "&type_id=" + $(this).val() + "&response=" + $("#sv_note").val()
						 	 + "&group_id=" + $("#group_id").val() + "&others=" + $("#sv_note_others").val());
					break;
				}
				
				alert("제출이 완료되었습니다.");
				
			}
				
		});
				
		
		// 투표 생성 이후
		if ($("#moment_name_voteNum").val() != "" && $("#moment_name_voteNum").val() > 0)
		{
			$("#voteResult_moment_name").attr("disabled", "disabled");
			$("#voteResult_moment_name").text("투표 완료");
			$("#" + $("#moment_name_selectId").val()).attr("checked", "checked");
		}
		if ($("#date_name_voteNum").val() != "" && $("#date_name_voteNum").val() > 0)
		{
			$("#voteResult_date_name").attr("disabled", "disabled");
			$("#voteResult_date_name").text("투표 완료");
			$("#" + $("#date_name_selectId").val()).attr("checked", "checked");
			
		}
		if ($("#place_name_voteNum").val() != "" && $("#place_name_voteNum").val() > 0)
		{
			$("#voteResult_place_name").attr("disabled", "disabled");
			$("#voteResult_place_name").text("투표 완료");
			$("#" + $("#place_name_selectId").val()).attr("checked", "checked");
			
		}
		if ($("#min_participant_voteNum").val() != "" && $("#min_participant_voteNum").val() > 0)
		{
			$("#voteResult_min_participant").attr("disabled", "disabled");
			$("#voteResult_min_participant").text("투표 완료");
			$("#" + $("#min_participant_selectId").val()).attr("checked", "checked");
			
		}
		if ($("#max_participant_voteNum").val() != "" && $("#max_participant_voteNum").val() > 0)
		{
			$("#voteResult_max_participant").attr("disabled", "disabled");
			$("#voteResult_max_participant").text("투표 완료");
			$("#" + $("#max_participant_selectId").val()).attr("checked", "checked");
			
		}
		if ($("#note_voteNum").val() != "" && $("#note_voteNum").val() > 0)
		{
			$("#voteResult_note").attr("disabled", "disabled");
			$("#voteResult_note").text("투표 완료");
			$("#" + $("#note_selectId").val()).attr("checked", "checked");
			
		}
		
		
		if ($("#moment_name_check").val() != "[]" && $("#moment_name_check").val() != "" && $("#moment_name_check").val() != null)
		{
			$("#result_moment_name").css("display", "none");
			$("#vote_moment_name").css("display", "inline");
		}
		if ($("#date_name_check").val() != "[]" && $("#date_name_check").val() != "" && $("#date_name_check").val() != null)
		{
			$("#result_date_name").css("display", "none");
			$("#vote_date_name").css("display", "inline");
		}
		if ($("#place_name_check").val() != "[]" && $("#place_name_check").val() != "" && $("#place_name_check").val() != null)
		{
			$("#result_place_name").css("display", "none");
			$("#vote_place_name").css("display", "inline");
		}
		if ($("#min_participant_check").val() != "[]" && $("#min_participant_check").val() != "" && $("#min_participant_check").val() != null)
		{
			$("#result_min_participant").css("display", "none");
			$("#vote_min_participant").css("display", "inline");
		}
		if ($("#max_participant_check").val() != "[]" && $("#max_participant_check").val() != "" && $("#max_participant_check").val() != null)
		{
			$("#result_max_participant").css("display", "none");
			$("#vote_max_participant").css("display", "inline");
		}
		if ($("#note_check").val() != "[]" && $("#note_check").val() != "" && $("#note_check").val() != null)
		{
			$("#result_note").css("display", "none");
			$("#vote_note").css("display", "inline");
		}
	
		// 투표 끝나서 모먼트 요소 확정됐는지
		if ($("#moment_name_complete").val() != "" && $("#moment_name_complete").val() != null && parseInt($("#moment_name_complete").val()) > 0)
		{
			$("#vote_moment_name").css("display", "none");
			$("#result_moment_name").css("display", "none");
			$("#").text("확정");
			$("#").attr("disabled", "disabled");
			
		}
		
		if ($("#date_name_complete").val() != "" && $("#date_name_complete").val() != null && parseInt($("#date_name_complete").val()) > 0)
		{
			$("#vote_date_name").css("display", "none");
			$("#result_date_name").css("display", "none");
			$("#cr_date_name").text("확정");
			$("#cr_date_name").attr("disabled", "disabled");
		}
		if ($("#place_name_complete").val() != "" && $("#place_name_complete").val() != null && parseInt($("#place_name_complete").val()) > 0)
		{
			$("#vote_place_name").css("display", "none");
			$("#result_place_name").css("display", "none");
			$("#cr_place_name").text("확정");
			$("#cr_place_name").attr("disabled", "disabled");
		}
		
		if ($("#min_participant_complete").val() != "" && $("#min_participant_complete").val() != null && parseInt($("#min_participant_complete").val()) > 0)
		{
			$("#vote_min_participant").css("display", "none");
			$("#result_min_participant").css("display", "none");
			$("#cr_min_participant").text("확정");
			$("#cr_min_participant").attr("disabled", "disabled");
		}
		if ($("#max_participant_complete").val() != "" && $("#max_participant_complete").val() != null && parseInt($("#max_participant_complete").val()) > 0)
		{
			$("#vote_max_participant").css("display", "none");
			$("#result_max_participant").css("display", "none");
			$("#cr_max_participant").text("확정");
			$("#cr_max_participant").attr("disabled", "disabled");
		}
		if ($("#note_complete").val() != "" && $("#note_complete").val() != null && parseInt($("#note_complete").val()) > 0)
		{
			$("#vote_note").css("display", "none");
			$("#result_note").css("display", "none");
			$("#cr_note").text("확정");
			$("#cr_note").attr("disabled", "disabled");
		}
		
		$(".btn-vote").click(function()
		{
			if ($("input:radio[name='vote_name']:checked").val() == "" || $("input:radio[name='vote_name']:checked").val() == null)
			{
				alert("선택 후 투표 제출이 가능합니다.");
				return;
			}
			else if (confirm("투표를 완료하시겠습니까? 제출 후 수정이 불가능합니다."))
			{
				switch ($(this).val())
				{
				case "ST01": $(location).attr("href", "momentvoteresponseinsert.action?moment_id=" + $("#moment_id").val()
							 + "&survey_response_id=" + $("input:radio[name='vote_name']:checked").val()
							 + "&type_id=" + $(this).val() + "&survey_id=" + $("#moment_name_svId").val()
						 	 + "&group_id=" + $("#group_id").val());
					break;
				case "ST02": $(location).attr("href", "momentvoteresponseinsert.action?moment_id=" + $("#moment_id").val()
							 + "&survey_response_id=" + $("input:radio[name='vote_name']:checked").val()
							 + "&type_id=" + $(this).val() + "&survey_id=" + $("#date_name_svId").val()
						 	 + "&group_id=" + $("#group_id").val());
					break;
				case "ST03": $(location).attr("href", "momentvoteresponseinsert.action?moment_id=" + $("#moment_id").val()
							 + "&survey_response_id=" + $("input:radio[name='vote_name']:checked").val()
							 + "&type_id=" + $(this).val() + "&survey_id=" + $("#place_name_svId").val()
						 	 + "&group_id=" + $("#group_id").val());
					break;
				case "ST04": $(location).attr("href", "momentvoteresponseinsert.action?moment_id=" + $("#moment_id").val()
							 + "&survey_response_id=" + $("input:radio[name='vote_name']:checked").val()
							 + "&type_id=" + $(this).val() + "&survey_id=" + $("#min_participant_svId").val()
						 	 + "&group_id=" + $("#group_id").val());
					break;
				case "ST05": $(location).attr("href", "momentvoteresponseinsert.action?moment_id=" + $("#moment_id").val()
							 + "&survey_response_id=" + $("input:radio[name='vote_name']:checked").val()
							 + "&type_id=" + $(this).val() + "&survey_id=" + $("#max_participant_svId").val()
						 	 + "&group_id=" + $("#group_id").val());
					break;
				case "ST06": $(location).attr("href", "momentvoteresponseinsert.action?moment_id=" + $("#moment_id").val()
							 + "&survey_response_id=" + $("input:radio[name='vote_name']:checked").val()
							 + "&type_id=" + $(this).val() + "&survey_id=" + $("#note_svId").val()
						 	 + "&group_id=" + $("#group_id").val());
					break;
				}
				
				alert("제출이 완료되었습니다.");
				
			}
			
		});

		$("#infoChange").click(function()
		{
			if (confirm("인포 페이지로 전환하시겠습니까? 전환 후 모먼트 요소 수정이 불가능합니다."))
			{
				$(location).attr("href", "momentinfochange.action?moment_id=" + $("#moment_id").val() + "&group_id=" + $("#group_id").val());
			}
			
		});
		
		$(".btn-default").click(function()
		{
			$(location).attr("href", "group.action?group_id=" + $("#group_id").val());
		});
		
			
		});
		
		/*
		function createMoment_nameSurvey()
		{
			result = "<td><h4 style='font-weight: bold;'>내 답변</h4>";
			result += "<input type='text' id='sv_moment_name' name='sv_moment_name' class='form-control'";
			result += "placeholder='모먼트명 입력' maxlength='30' style='width: 970px;'>";
			result += "<br><h4 style='font-weight: bold;'>기타 의견</h4>";
			result += "<input type='text' id='sv_moment_name_others' placeholder='ex) 내 이름 넣어줘~' name='sv_moment_name_others' class='form-control'";
			result += "style='width: 970px;'>";
			result += "<br><button type='button' class='btn btn-primary btn-survey' id='sm_moment_name'";
			result += "style='font-size: 12pt; font-weight: bold; width: 100px; height: 35px;' value='ST01'>제출</button></td>";
			
			return result;
		}
		
		
		function createDate_nameSurvey()
		{
			
			result = "<td><h4 style='font-weight: bold;'>내 답변</h4>";
			result += "<input type='text' id='sv_date_name' placeholder='일자 선택' name='sv_date_name' class='form-control'";
			result += "style='width: 261px;'><br>";
			result += "<select id='sv_time' name='sv_time' class='form-control' style='width: 261px;'>";
			result += "<option value='-1' selected='selected'>시간 선택</option>";
			
			for (var i = 0; i < 24; i++)
			{
				if (i < 10)
				{
					result += "<option value=' " + "0" + i + ":00:00'>" + "0" + i + ":00:00</option>";
				}
				else
					result += "<option value=' " + i + ":00:00'>" + i + ":00:00</option>";
			}
			
			result += "</select><br>";
			
			result += "<h4 style='font-weight: bold;'>불가능 날짜</h4>";
			result += "<input type='text' id='sv_impossible_date' placeholder='일자 선택' name='sv_impossible_date' class='form-control'";
			result += "style='width: 261px;'>";
			result += "<br><h4 style='font-weight: bold;'>기타 의견</h4>";
			result += "<input type='text' id='sv_date_name_others' placeholder='ex) 이왕이면 주말이 좋아요.' name='sv_date_name_others' class='form-control'";
			result += "style='width: 970px;'>";
			
			result += "<br><button type='button' class='btn btn-primary btn-survey' id='sm_date_name'";
			result += "style='font-size: 12pt; font-weight: bold; width: 100px; height: 35px;' value='ST02'>제출</button></td>";
			
			return result;
		}

		function createPlace_nameSurvey()
		{
			result = "<td><h4 style='font-weight: bold;'>내 답변</h4>";
			result += "<input type='text' id='sv_place_name' name='sv_place_name' class='form-control'";
			result += "placeholder='주소 찾기 버튼을 눌러 주소를 검색해주세요.' style='width: 970px;' readonly='readonly'>";
			result += "<br><button type='button' onclick='getAddr()' id='juso'>주소 찾기</button>";
			result += "<br><h4 style='font-weight: bold;'>기타 의견</h4>";
			result += "<input type='text' id='sv_place_name_others' placeholder='ex) 인천 사람 배려 좀;;' name='sv_place_name_others' class='form-control'";
			result += "style='width: 970px;'>";
			result += "<br><button type='button' class='btn btn-primary btn-survey' id='sm_place_name'";
			result += "style='font-size: 12pt; font-weight: bold; width: 100px; height: 35px;' value='ST03'>제출</button></td>";
			
			return result;
		}
		
		function createMin_participantSurvey()
		{
			result = "<td><h4 style='font-weight: bold;'>내 답변</h4>";
			result += "<input type='text' id='sv_min_participant' name='sv_min_participant' class='form-control'";
			result += "placeholder='ex) 2' maxlength='30' style='width: 970px;'>";
			result += "<br><h4 style='font-weight: bold;'>기타 의견</h4>";
			result += "<input type='text' id='sv_min_participant_others' placeholder='ex) 3명 밑으로 만나면 난 빠질게' name='sv_min_participant_others' class='form-control'";
			result += "style='width: 970px;'>";
			result += "<br><button type='button' class='btn btn-primary btn-survey' id='sm_min_participant'";
			result += "style='font-size: 12pt; font-weight: bold; width: 100px; height: 35px;' value='ST04'>제출</button></td>";
			
			return result;
		}
		
		function createMax_participantSurvey()
		{
			result = "<td><h4 style='font-weight: bold;'>내 답변</h4>";
			result += "<input type='text' id='sv_max_participant' name='sv_max_participant' class='form-control'";
			result += "placeholder='ex) 5' maxlength='30' style='width: 970px;'>";
			result += "<br><h4 style='font-weight: bold;'>기타 의견</h4>";
			result += "<input type='text' id='sv_max_participant_others' placeholder='ex) 5명 이상은 좀 부담스러워 ㅠoㅠ' name='sv_max_participant_others' class='form-control'";
			result += "style='width: 970px;'>";
			result += "<br><button type='button' class='btn btn-primary btn-survey' id='sm_max_participant'";
			result += "style='font-size: 12pt; font-weight: bold; width: 100px; height: 35px;' value='ST05'>제출</button></td>";
			
			return result;
		}
		
		function createNoteSurvey()
		{
			result = "<td><h4 style='font-weight: bold;'>내 답변</h4>";
			result += "<textarea id='sv_note' name='sv_note' class='form-control' cols='101' rows='10'";
			result += "placeholder='ex) 노트북 챙겨와!' maxlength='200'";
			result += "style='text-align: left; width: 970px; resize: none;'></textarea>";
			result += "<br><h4 style='font-weight: bold;'>기타 의견</h4>";
			result += "<input type='text' id='sv_note_others' placeholder='ex) 드레스코드 정하자' name='sv_note_others' class='form-control'";
			result += "style='width: 261px;'>";
			result += "<br><button type='button' class='btn btn-primary btn-survey' id='sm_note'";
			result += "style='font-size: 12pt; font-weight: bold; width: 100px; height: 35px;' value='ST06'>제출</button></td>";
			
			return result;
		}
		*/
		

</script>

<!-- 주소 검색, 지도 표시 기능 구현 -->
<script type="text/javascript" src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script type="text/javascript">

    function getAddr()
    {
        new daum.Postcode(
        {
            oncomplete: function(data) 
            {
                var addr = data.address;
                
                // 받아온 주소 넣기 
                document.getElementById("sv_place_name").value = addr;
                
            }
        }).open();
    }
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
			<h1>모먼트 빌드</h1>
			<nav>
				<ol class="breadcrumb">
					<li class="breadcrumb-item"><a href="main.action">Main</a></li>
					<li class="breadcrumb-item"><a href="group.action?group_id=<%=request.getParameter("group_id") %>">그룹</a></li>
					<li class="breadcrumb-item active">모먼트 빌드</li>
				</ol>
			</nav>
		</div>
		<!-- End Page Title -->

		<section class="section dashboard">
			<div class="row">
				<div class="col-lg-8">
					<div class="row">

						<!-- Most Recent Card -->
						<div class="col-xxl-4 col-md-6">
							<div class="card info-card sales-card">
								<div class="card-body">
									<h5 class="card-title">
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
							<div class="card-title" style="height: 100px;">
								<h5 class="card-title">
									${momentList.moment_name }
								</h5>
									
								<div style="${countDate > 0  && countJoin < 1 ? 'display: inline;' : 'display: none;' }">
								<span style="color: red; font-weight: bold;">해당 모먼트의 일시에 이미 일정이 존재합니다.<br>
								신중하게 참여를 결정해주세요.</span>
								</div>
							</div>
							<form action="momentjoin.action?group_id=<%=request.getParameter("group_id") %>" method="post" id="myForm">
								
							<div class="input-group mb-3" role="group">
								<span class="input-group-text" id="basic-addon2">
									모먼트명
								</span>
								<input type="text" id="moment_name" name="moment_name" class="form-control" readonly="readonly"
								value="${momentList.moment_name }">
								<button type="button" class="btn btn-info" id="cr_moment_name" value="ST01">설문 생성</button>
								<input type="hidden" id="moment_name_survey_id" class="survey_id" value="${countSurvey[0] }">
								<input type="hidden" id="moment_name_response_id" class="response_id" value="${countResponseNum1 }">
								<input type="hidden" id="moment_name_response" class="response" value="${countResponse1.response }">
								<input type="hidden" id="moment_name_others" class="others" value="${countResponse1.others }">
							</div>
							<div class="card" id="result_moment_name" style="display: none;">
								<div class="card-body">
									<h5 class="card-header">설문</h5>			
										<div id="result_moment_name" class="input-group mb-3" role="group">
											<span class="input-group-text">내 답변</span>
											<input type='text' id='sv_moment_name' name='sv_moment_name' class='form-control' placeholder='모먼트명 입력' maxlength='30'>
											<span class="input-group-text">기타 의견</span>
											<input type='text' id='sv_moment_name_others' placeholder='ex) 내 이름 넣어줘~' 
											name='sv_moment_name_others' class='form-control'>
										</div>
								
									<div>
										<button type='button' class='btn btn-primary btn-survey' id='sm_moment_name' value='ST01'>제출</button>
									</div>
								</div>
							</div>
									
							<div id="vote_moment_name" class="card mb-3" style="display: none;">
							<h5 class="card-title">
								모먼트명을 골라주세요. (택 1)
							</h5>
								<div class="card-body">
								<c:set var="moment"  value="${voteReponse1 }" />
								
				              	<ul class="nav nav-tabs nav-tabs-bordered" id="borderedTab" role="tablist">
                					<li class="nav-item" role="presentation">
                  					<button class="nav-link active" id="home-tab" data-bs-toggle="tab" data-bs-target="#bordered-home" type="button" role="tab" aria-controls="home" aria-selected="true">투표</button>
                					</li>
                					<li class="nav-item" role="presentation">
                  					<button class="nav-link" id="profile-tab" data-bs-toggle="tab" data-bs-target="#bordered-profile" type="button" role="tab" aria-controls="profile" aria-selected="false">기타 의견</button>
                					</li>
              					</ul>
              					<div class="tab-content pt-2" id="borderedTabContent">
									<c:if test="${not empty moment }">
									<div class="tab-pane fade show active" id="bordered-home" role="tabpanel" aria-labelledby="home-tab">
									<c:forEach var="selection" items="${voteReponse1 }">
										<div class="form-check mb-3" style="text-align: left;">
											<input type="radio" value="${selection.survey_response_id }" id="${selection.survey_response_id }"
											name="vote_name" style="${selection.response == null ? 'display: none;' : 'display: inline;'}">
											<label  class="input-group-label" style="${selection.response == null ? 'display: none;' : 'display: inline;'}" 
											for="${selection.survey_response_id }">&nbsp; ${selection.response }</label>
											<input type="hidden" value="${selection.survey_id }" id="moment_name_svId">
										</div>
									</c:forEach>
									<button type="button" class="btn btn-primary btn-vote" id="voteResult_moment_name" value="ST01">투표 제출</button>
									</div>
									
									<div class="tab-pane fade" id="bordered-profile" role="tabpanel" aria-labelledby="profile-tab">
									<div class="card-header">
									<ul style="text-align: left;">
									<c:forEach var="selection" items="${voteReponse1 }">
										<li style="${selection.others == null ? 'display: none;' : 'display: inline;'}"> ${selection.others }</li><br>
									</c:forEach>
									</ul>	
									</div>
									</div>
									</c:if>
								</div>
								<input type="hidden" id="moment_name_voteNum" class="voteNum" value="${voteResponseNum1 }">
								<input type="hidden" value="${voteReponse1 }" id="moment_name_check">
								<input type="hidden" value="${voteSelectId1 }" id="moment_name_selectId">
								<input type="hidden" value="${check1 }" id="moment_name_complete">
								</div>
							</div>
							
							<div style="text-align: left">
							<b style="font-size: small; color: purple;">빌드 마감 : ${momentList.plan_end_date}</b>
							</div>		
							<div class="input-group mb-3" role="group">
								<span class="input-group-text" id="basic-addon2">
									일시
								</span>
								<input type="text" id="date_name" name="date_name" class="form-control" readonly="readonly"
								value="${momentList.date_name }">
								<button type="button" class="btn btn-info" id="cr_date_name" value="ST02">설문 생성</button>
								<input type="hidden" id="date_name_survey_id" class="survey_id" value="${countSurvey[1] }">
								<input type="hidden" id="date_name_response_id" class="response_id" value="${countResponseNum2 }">
								<input type="hidden" id="date_name_response" class="response" value="${countResponse2.response }">
								<input type="hidden" id="date_name_others" class="others" value="${countResponse2.others }">
								<input type="hidden" id="date_name_impossible_date" class="impossible_date" value="${countResponse2.impossible_date }">
							</div>
							<div id="result_date_name" class="card" style="display: none;">
							<div class="card-body">
								<h5 class="card-header">설문</h5>
									<div class="input-group mb-3">
										<span class="input-group-text">내 답변</span>
										<input type='text' id='sv_date_name' placeholder='일자 선택' name='sv_date_name' class='form-control'>
										<select id='sv_time' name='sv_time' class='form-control'>
											<option value='-1' selected='selected'>시간 선택</option>
											<option value="00:00:00">00:00:00</option>
											<option value="01:00:00">01:00:00</option>
											<option value="02:00:00">02:00:00</option>
											<option value="03:00:00">03:00:00</option>
											<option value="04:00:00">04:00:00</option>
											<option value="05:00:00">05:00:00</option>
											<option value="06:00:00">06:00:00</option>
											<option value="07:00:00">07:00:00</option>
											<option value="08:00:00">08:00:00</option>
											<option value="09:00:00">09:00:00</option>
											<option value="10:00:00">10:00:00</option>
											<option value="11:00:00">11:00:00</option>
											<option value="12:00:00">12:00:00</option>
											<option value="13:00:00">13:00:00</option>
											<option value="14:00:00">14:00:00</option>
											<option value="15:00:00">15:00:00</option>
											<option value="16:00:00">16:00:00</option>
											<option value="17:00:00">17:00:00</option>
											<option value="18:00:00">18:00:00</option>
											<option value="19:00:00">19:00:00</option>
											<option value="20:00:00">20:00:00</option>
											<option value="21:00:00">21:00:00</option>
											<option value="22:00:00">22:00:00</option>
											<option value="23:00:00">23:00:00</option>
										</select>
									</div>
									<div class="input-group mb-3">
										<span class="input-group-text">불가능 날짜</span>
										<input type='text' id='sv_impossible_date' placeholder='일자 선택' 
										name='sv_impossible_date' class='form-control' style='width: 261px;'>
									</div>
									<div class="input-group mb-3">
										<span class="input-group-text">기타 의견</span>
										<input type='text' id='sv_date_name_others' placeholder='ex) 이왕이면 주말이 좋아요.' 
										name='sv_date_name_others' class='form-control'>
		
									</div>
									<div>
									<button type='button' class='btn btn-primary btn-survey' id='sm_date_name' value='ST02'>제출</button>
									</div>
								</div>
							</div>
									
							<div id="vote_date_name" class="card mb-3" style="display: none;">
								<h5 class="card-title">일시를 골라주세요. (택 1)</h5>
								<div class="card-body">
									<ul class="nav nav-tabs nav-tabs-bordered" id="borderedTab" role="tablist">
	                					<li class="nav-item" role="presentation">
	                  					<button class="nav-link active" id="home-tab" data-bs-toggle="tab" data-bs-target="#bordered-home" type="button" role="tab" aria-controls="home" aria-selected="true">투표</button>
	                					</li>
	                					<li class="nav-item" role="presentation">
	                  					<button class="nav-link" id="profile-tab" data-bs-toggle="tab" data-bs-target="#bordered-profile" type="button" role="tab" aria-controls="profile" aria-selected="false">기타 의견</button>
	                					</li>
	                					<li class="nav-item" role="presentation">
						                  <button class="nav-link" id="contact-tab" data-bs-toggle="tab" data-bs-target="#bordered-contact" type="button" role="tab" aria-controls="contact" aria-selected="false">불가능 일자</button>
						                </li>
              						</ul>
              						<div class="tab-content pt-2" id="borderedTabContent" style="text-align: left;">
									<c:set var="date"  value="${voteReponse2 }" />
									<c:if test="${not empty date }">
									<div class="tab-pane fade show active" id="bordered-home" role="tabpanel" aria-labelledby="home-tab">	
									<c:forEach var="selection" items="${voteReponse2 }">
									<div class="input-group mb-3" role="group">
										<input type="radio" value="${selection.survey_response_id }" id="${selection.survey_response_id }"
										name="vote_name" style="${selection.response == null ? 'display: none;' : 'display: inline;'}">
										<label class="input-group-label" style="${selection.response == null ? 'display: none;' : 'display: inline;'}" 
										for="${selection.survey_response_id }">&nbsp; ${selection.response }</label>
										<input type="hidden" value="${selection.survey_id }" id="date_name_svId">
									</div>
									</c:forEach>
										<button type="button" class="btn btn-primary btn-vote" id="voteResult_date_name" value="ST02">투표 제출</button>
									</div>
									<div class="tab-pane fade" id="bordered-profile" role="tabpanel" aria-labelledby="profile-tab">
				                		<ul>
				                		<c:forEach var="selection" items="${voteReponse2 }">
											<li style="${selection.others == nulll ? 'display: none;' : 'display: inline;'}">${selection.others }</li><br />
										</c:forEach>
										</ul>
					                </div>
					                <div class="tab-pane fade" id="bordered-contact" role="tabpanel" aria-labelledby="contact-tab">
										<ul>
										<c:forEach var="selection" items="${voteReponse2 }">
											<li style="${selection.impossible_date == nulll ? 'display: none;' : 'display: inline;'}">${selection.impossible_date }</li><br />
										</c:forEach>	
										</ul>
					                </div>
									</c:if>
									<input type="hidden" id="date_name_voteNum" class="voteNum" value="${voteResponseNum2 }">
									<input type="hidden" value="${voteReponse2 }" id="date_name_check">
									<input type="hidden" value="${voteSelectId2 }" id="date_name_selectId">
									<input type="hidden" value="${check2 }" id="date_name_complete">
									</div>
								</div>
							</div>
							
									

							<div class="input-group mb-3" role="group">
								<span class="input-group-text" id="basic-addon2">
									장소
								</span>
								<input type="text" id="place_name" name="place_name" class="form-control" readonly="readonly"
								value="${momentList.place_name }">
								<button type="button" class="btn btn-info" id="cr_place_name" value="ST03">설문 생성</button>
								<input type="hidden" id="place_name_survey_id" class="survey_id" value="${countSurvey[2] }">
								<input type="hidden" id="place_name_response_id" class="response_id" value="${countResponseNum3 }">
								<input type="hidden" id="place_name_response" class="response" value="${countResponse3.response }">
								<input type="hidden" id="place_name_others" class="others" value="${countResponse3.others }">
							</div>

							<div id="result_place_name" class="card mb-3" style="display: none;">
								<h4 class="card-title">내 답변</h4>
								<div class="card-body">
									<div class="input-group mb-3" role="group">
									<input type='text' id='sv_place_name' name='sv_place_name' class='form-control'
									placeholder='주소 찾기 버튼을 눌러 주소를 검색해주세요.' readonly='readonly'>
									<button type='button' onclick='getAddr()' id='juso' class="btn btn-info">주소 찾기</button>
									</div>
									<div class="input-group" role="group">
									<span class="input-group-text">기타 의견</span>
									<input type='text' id='sv_place_name_others' placeholder='ex) 인천 사람 배려 좀;;' 
									name='sv_place_name_others' class='form-control'>
									</div>
									<div>
										<button type='button' class='btn btn-primary btn-survey' id='sm_place_name' value='ST03'>제출</button>
									</div>
								</div>
							</div>
									
							<div id="vote_place_name" class="card mb-3" style="display: none;">
								<h4 class="card-title">장소를 골라주세요. (택 1)</h4>
								<div class="card-body">
									<ul class="nav nav-tabs nav-tabs-bordered" id="borderedTab" role="tablist">
	                					<li class="nav-item" role="presentation">
	                  					<button class="nav-link active" id="home-tab" data-bs-toggle="tab" data-bs-target="#bordered-place" type="button" role="tab" aria-controls="home" aria-selected="true">투표</button>
	                					</li>
	                					<li class="nav-item" role="presentation">
	                  					<button class="nav-link" id="profile-tab" data-bs-toggle="tab" data-bs-target="#bordered-placeETC" type="button" role="tab" aria-controls="profile" aria-selected="false">기타 의견</button>
	                					</li>
              						</ul>
              						<div class="tab-content pt-2" id="borderedTabContent" style="text-align: left;">
              							<div class="tab-pane fade show active" id="bordered-place" role="tabpanel" aria-labelledby="home-tab">
											<c:set var="place"  value="${voteReponse3 }" />
											<c:if test="${not empty place }">
											<c:forEach var="selection" items="${voteReponse3 }">
											<div class="input-group" role="group">
												<input type="radio" value="${selection.survey_response_id }" id="${selection.survey_response_id }"
												name="vote_name" style="${selection.response == null ? 'display: none;' : 'display: inline;'}">
												<label class="input-group-label" style="${selection.response == null ? 'display: none;' : 'display: inline;'}" 
												for="${selection.survey_response_id }">&nbsp; ${selection.response }</label>
												<input type="hidden" value="${selection.survey_id }" id="place_name_svId">
											</div>
											</c:forEach>
											</c:if>
											<br>
											<button type="button" class="btn btn-primary btn-vote" id="voteResult_place_name" value="ST03">투표 제출</button>
											<input type="hidden" id="place_name_voteNum" class="voteNum" value="${voteResponseNum3 }">
											<input type="hidden" value="${voteReponse3 }" id="place_name_check">
											<input type="hidden" value="${voteSelectId3 }" id="place_name_selectId">
											<input type="hidden" value="${check3 }" id="place_name_complete">
										</div>
										<div class="tab-pane fade" id="bordered-placeETC" role="tabpanel" aria-labelledby="profile-tab">
											<c:if test="${not empty place }">
											<ul style="text-align: left;">
											<c:forEach var="selection" items="${voteReponse3 }">
											<li style="${selection.others == null ? 'display: none;' : 'display: inline;'}"> ${selection.others }</li><br>
											</c:forEach>
											</ul>
											</c:if>
										</div>
									</div>
								</div>
							</div>

							
							<div class="input-group mb-3" role="group">
								<span class="input-group-text" id="basic-addon2">
									최소 인원
								</span>
								<input type="text" id="min_participant" name="min_participant" class="form-control" readonly="readonly"
								value="${momentList.min_participant }">
								<button type="button" class="btn btn-info" id="cr_min_participant" value="ST04">설문 생성</button>
								<input type="hidden" id="min_participant_survey_id" class="survey_id" value="${countSurvey[3] }">
								<input type="hidden" id="min_participant_response_id" class="response_id" value="${countResponseNum4 }">
								<input type="hidden" id="min_participant_response" class="response" value="${countResponse4.response }">
								<input type="hidden" id="min_participant_others" class="others" value="${countResponse4.others }">
							</div>
							
							<div class="card mb-3" id="result_min_participant" style="display: none;">
								<h4 class="card-title">내 답변</h4>
								<div class="card-body">
									<div class="input-group mb-3" role="group">
										<span class="input-group-text">최소인원</span>
										<input type='text' id='sv_min_participant' name='sv_min_participant' class='form-control'
										placeholder='ex) 2' maxlength='30'>
										<span class="input-group-text">기타 의견</span>
										<input type='text' id='sv_min_participant_others' placeholder='ex) 3명 밑으로 만나면 난 빠질게' name='sv_min_participant_others' class='form-control'>
									</div>
									<div>
									<button type='button' class='btn btn-primary btn-survey' id='sm_min_participant' value='ST04'>제출</button>
									</div>
								</div>
							</div>
							
							<div id="vote_min_participant" class="card mb-3" style="display: none;">
								<h4 class="card-title">최소 인원을 골라주세요. (택 1)</h4>
								<div class="card-body">
									<ul class="nav nav-tabs nav-tabs-bordered" id="borderedTab" role="tablist">
	                					<li class="nav-item" role="presentation">
	                  					<button class="nav-link active" id="home-tab" data-bs-toggle="tab" data-bs-target="#bordered-min" type="button" role="tab" aria-controls="home" aria-selected="true">투표</button>
	                					</li>
	                					<li class="nav-item" role="presentation">
	                  					<button class="nav-link" id="profile-tab" data-bs-toggle="tab" data-bs-target="#bordered-minETC" type="button" role="tab" aria-controls="profile" aria-selected="false">기타 의견</button>
	                					</li>
              						</ul>
									<div class="tab-content pt-2" id="borderedTabContent" style="text-align: left;">
              							<div class="tab-pane fade show active" id="bordered-min" role="tabpanel" aria-labelledby="home-tab">
											<c:set var="min"  value="${voteReponse4 }" />
											<c:if test="${not empty min }">
											<c:forEach var="selection" items="${voteReponse4 }">
												<div class="input-group" role="group">
												<input type="radio" value="${selection.survey_response_id }" id="${selection.survey_response_id }"
												name="vote_name" style="width: 972px; 
												${selection.response == null ? 'display: none;' : 'display: inline;'}">
												<label style="${selection.response == null ? 'display: none;' : 'display: inline;'}" 
												for="${selection.survey_response_id }">&nbsp; ${selection.response }</label>
												<input type="text" readonly="readonly" value="${selection.others }" 
												style="${selection.others == nulll ? 'display: none;' : 'display: inline;'}">
												</div>
												<input type="hidden" value="${selection.survey_id }" id="min_participant_svId">
											</c:forEach>
											</c:if>
											<input type="hidden" id="min_participant_voteNum" class="voteNum" value="${voteResponseNum4 }">
											<input type="hidden" value="${voteReponse4 }" id="min_participant_check">
											<input type="hidden" value="${voteSelectId4 }" id="min_participant_selectId">
											<input type="hidden" value="${check4 }" id="min_participant_complete">
											<br>
											<button type="button" class="btn btn-primary btn-vote" id="voteResult_min_participant" value="ST04">투표 제출</button>
										</div>
										<div class="tab-pane fade" id="bordered-minETC" role="tabpanel" aria-labelledby="profile-tab">
											<c:if test="${not empty min }">
											<ul>
											<c:forEach var="selection" items="${voteReponse4 }">
												<li style="${selection.others == nulll ? 'display: none;' : 'display: inline;'}">${selection.others }</li><br>
											</c:forEach>
											</ul>
											</c:if>
										</div>
									</div>
								</div>
							</div>
							
							<div class="input-group mb-3" role="group">
								<span class="input-group-text" id="basic-addon2">
									최대 인원
								</span>
								<input type="text" id="max_participant" name="max_participant" class="form-control" readonly="readonly"
								value="${momentList.max_participant }">
								<button type="button" class="btn btn-info" id="cr_max_participant" value="ST05">설문 생성</button>
								<input type="hidden" id="max_participant_survey_id" class="survey_id" value="${countSurvey[4] }">
								<input type="hidden" id="max_participant_response_id" class="response_id" value="${countResponseNum5 }">
								<input type="hidden" id="max_participant_response" class="response" value="${countResponse5.response }">
								<input type="hidden" id="max_participant_others" class="others" value="${countResponse5.others }">
							</div>
							
							
							<div class="card mb-3" id="result_max_participant" style="display: none;">
								<h4 class="card-title">내 답변</h4>
								<div class="card-body">
									<div class="input-group mb-3" role="group">
										<span class="input-group-text">최대인원</span>
										<input type='text' id='sv_max_participant' name='sv_max_participant' class='form-control'
										placeholder='ex) 5' maxlength='30'>
										<span class="input-group-text">기타 의견</span>
										<input type='text' id='sv_max_participant_others' placeholder='ex) 5명 이상은 좀 부담스러워 ㅠoㅠ' name='sv_max_participant_others' class='form-control'>
									</div>
									<br>
									<div>
										<button type='button' class='btn btn-primary btn-survey' id='sm_max_participant' value='ST05'>제출</button>
									</div>
								</div>
							</div>
							
							<div id="vote_max_participant" class="card" style="display: none;">
								<h4 class="card-title">최대 인원을 골라주세요. (택 1)</h4>
								<div class="card-body">
									<ul class="nav nav-tabs nav-tabs-bordered" id="borderedTab" role="tablist">
	                					<li class="nav-item" role="presentation">
	                  					<button class="nav-link active" id="home-tab" data-bs-toggle="tab" data-bs-target="#bordered-max" type="button" role="tab" aria-controls="home" aria-selected="true">투표</button>
	                					</li>
	                					<li class="nav-item" role="presentation">
	                  					<button class="nav-link" id="profile-tab" data-bs-toggle="tab" data-bs-target="#bordered-maxETC" type="button" role="tab" aria-controls="profile" aria-selected="false">기타 의견</button>
	                					</li>
              						</ul>
									<div class="tab-content pt-2" id="borderedTabContent" style="text-align: left;">
              							<div class="tab-pane fade show active" id="bordered-max" role="tabpanel" aria-labelledby="home-tab">
	
											<c:set var="max"  value="${voteReponse5 }" />
											<c:if test="${not empty max }">
											<c:forEach var="selection" items="${voteReponse5 }">
											<div class="input-group" role="group">										
												<input type="radio" value="${selection.survey_response_id }" id="${selection.survey_response_id }"
												name="vote_name" style="${selection.response == null ? 'display: none;' : 'display: inline;'}">
												<label style="${selection.response == null ? 'display: none;' : 'display: inline;'}" 
												for="${selection.survey_response_id }">&nbsp; ${selection.response }</label>
												<input type="hidden" value="${selection.survey_id }" id="max_participant_svId">
											</div>	
											</c:forEach>
											</c:if>
											<input type="hidden" id="max_participant_voteNum" class="voteNum" value="${voteResponseNum5 }">
											<input type="hidden" value="${voteReponse5 }" id="max_participant_check">
											<input type="hidden" value="${voteSelectId5 }" id="max_participant_selectId">
											<input type="hidden" value="${check5 }" id="max_participant_complete">
											<br>
											<button type="button" class="btn btn-primary btn-vote" id="voteResult_max_participant" value="ST05">투표 제출</button>
										</div>
									</div>
									
									<div class="tab-pane fade" id="bordered-maxETC" role="tabpanel" aria-labelledby="profile-tab">
									<c:if test="${not empty max }">
										<ul>
										<c:forEach var="selection" items="${voteReponse5 }">
											<li style="${selection.others == nulll ? 'display: none;' : 'display: inline;'}">${selection.others }</li><br>
										</c:forEach>
										</ul>
									</c:if>
									</div>
								</div>
							</div>
	
							<div class="input-group mb-3" role="group">
								<span class="input-group-text" id="basic-addon2">
									참고사항
								</span>
								<textarea rows="10" cols="101" id="note" name="note" class="form-control"
								 readonly="readonly" style="text-align: left;">${momentList.note }</textarea>
								<button type="button" class="btn btn-info" id="cr_note" value="ST06">설문 생성</button>
								<input type="hidden" id="note_survey_id" class="survey_id" value="${countSurvey[5] }">
								<input type="hidden" id="note_response_id" class="response_id" value="${countResponseNum6 }">
								<input type="hidden" id="note_response" class="response" value="${countResponse6.response }">
								<input type="hidden" id="note_others" class="others" value="${countResponse6.others }">
							</div>
							
							<div class="card mb-3" id="result_note" style="display: none;">
								<h4 class="card-title">내 답변</h4>
								<div class="card-body">
									<div class="input-group mb-3" role="group">
										<span class="input-group-text">참고사항</span>
										<input type='text' id='sv_note' name='sv_note' class='form-control'
										placeholder='ex)  노트북 챙겨와!' maxlength='30'>
										<span class="input-group-text">기타 의견</span>
										<input type='text' id='sv_note_others' placeholder='ex)  드레스코드 정하자' name='sv_note_others' class='form-control'>
									</div>
									<br>
									<div>
										<button type='button' class='btn btn-primary btn-survey' id='sm_note' value='ST06'>제출</button>
									</div>
								</div>
							</div>
							
							
							<div id="vote_note" class="card mb-3" style="display: none;">
								<h4 class="card-title">참고사항을 골라주세요. (택 1)</h4>
								<div class="card-body">
									<ul class="nav nav-tabs nav-tabs-bordered" id="borderedTab" role="tablist">
	                					<li class="nav-item" role="presentation">
	                  					<button class="nav-link active" id="home-tab" data-bs-toggle="tab" data-bs-target="#bordered-note" type="button" role="tab" aria-controls="home" aria-selected="true">투표</button>
	                					</li>
	                					<li class="nav-item" role="presentation">
	                  					<button class="nav-link" id="profile-tab" data-bs-toggle="tab" data-bs-target="#bordered-noteETC" type="button" role="tab" aria-controls="profile" aria-selected="false">기타 의견</button>
	                					</li>
              						</ul>
									<div class="tab-content pt-2" id="borderedTabContent" style="text-align: left;">
              							<div class="tab-pane fade show active" id="bordered-note" role="tabpanel" aria-labelledby="home-tab">
								
								
										<c:set var="note"  value="${voteReponse6 }" />
										<c:if test="${not empty note }">
										<c:forEach var="selection" items="${voteReponse6 }">
											<div class="input-group mb-3" role="group">
												<input type="radio" value="${selection.survey_response_id }" id="${selection.survey_response_id }"
												name="vote_name" style="${selection.response == null ? 'display: none;' : 'display: inline;'}">
												<label style="${selection.response == null ? 'display: none;' : 'display: inline;'}" 
												for="${selection.survey_response_id }">&nbsp; ${selection.response }</label>
												<input type="hidden" value="${selection.survey_id }" id="note_svId">
											</div>
										</c:forEach>
										</c:if>
										<input type="hidden" id="note_voteNum" class="voteNum" value="${voteResponseNum6 }">
										<input type="hidden" value="${voteReponse6 }" id="note_check">
										<input type="hidden" value="${voteSelectId6 }" id="note_selectId">
										<input type="hidden" value="${check6 }" id="note_complete">
										<br>
										<button type="button" class="btn btn-primary btn-vote" id="voteResult_note" value="ST06">투표 제출</button>
										
										</div>
										
										<div class="tab-pane fade" id="bordered-noteETC" role="tabpanel" aria-labelledby="profile-tab">
										<c:if test="${not empty max }">
											<ul>
											<c:forEach var="selection" items="${voteReponse6 }">
												<li style="${selection.others == nulll ? 'display: none;' : 'display: inline;'}">${selection.others }</li><br>
											</c:forEach>
											</ul>
										</c:if>
										</div>
									</div>
										
										
										
										
										
								</div>
							</div>
							
							<button type="button" id="countJoin" class="btn btn-success" value="${countJoin }">
							${countJoin > 0 ? "참여 취소" : "참여" }</button>
							<button type="button" id="infoChange" class="btn btn-warning" 
							style="${infoCheck == 1 ? 'display: inline' : 'display: none'}">인포 전환</button>
							<button type="button" class="btn btn-default">목록으로</button>
							<input type="hidden" id="moment_id" name="moment_id" value="${momentList.moment_id }">
							<input type="hidden" id="phase" name="phase" value="${momentList.phase }">
							<input type="hidden" id="group_id" value="<%=request.getParameter("group_id") %>">
								
							</form>
							
						</div><!-- END CARD_BODY -->
					</div><!-- END CARD -->
				</div><!-- END col-lg-8 -->
				
				
				<input type="hidden" id="parti_num" value="${momentList.parti_num }">
			
				<div class="col-lg-4">
					<div class="card">
						<div class="card-header">
							<h5 class="card-title">현재 참여 중인 멤버 <span class="badge bg-primary badge-number" style="color: white;">${momentList.parti_num }</span></h5>
							<div>
								<ul>
								<c:forEach var="parti" items="${partiList }">
									<li> ${parti.participant_name }</li>
								</c:forEach>
								</ul>
							</div>
						</div> 
					</div>
					
					<div class="card">
						<div class="card-header">
							<h5 class="card-title">나의 일정</h5>
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