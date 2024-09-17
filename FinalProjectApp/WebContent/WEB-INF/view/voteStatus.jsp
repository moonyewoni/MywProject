<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>투표자 현황 보기</title>
<script type="text/javascript">

    // 닫기 버튼 클릭 시 팝업 닫기
    function closeWindow() 
    {
        window.close();  // 팝업 창 닫기
    }
    
</script>
<style>

body 
{
	font-family: Arial, sans-serif;
	margin: 0;
	padding: 20px;
	text-align: center;
}

.content 
{
	margin: 20px;
}
    
.close-button 
{
	margin-top: 20px;
	padding: 10px 20px;
	font-size: 16px;
}

</style>
</head>
<body>

<div class="content">
    <h2>투표자 현황</h2>
    <p>현재 투표 참여자 수: <strong>${voterCount}</strong>명</p>
    <p>[${voterCount} / ${memberTotalCount}]</p>
    
    <!-- 닫기 버튼 -->
    <button type="button" class="close-button" onclick="closeWindow()">닫기</button>
</div>

</body>
</html>