<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>투표 완료</title>
<script type="text/javascript">
    
    // 팝업 닫기와 부모 창 리다이렉트
    window.onload = function() 
    {
        alert("투표가 완료되었습니다!"); 
        window.opener.location.href = "group.action?group_id=${group_id}"; 
        window.close();
    };
    
</script>
</head>
<body>
    <h2>투표가 완료되었습니다.</h2>
</body>
</html>