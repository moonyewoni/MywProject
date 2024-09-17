<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
   request.setCharacterEncoding("UTF-8");
   String cp = request.getContextPath();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>GroupInvite.jsp</title>
<script type="text/javascript" src="http://code.jquery.com/jquery.min.js"></script>

</head>
<body>
   <%
        // URL 파라미터에서 matchId와 gtId 추출
        String matchId = request.getParameter("matchId");
        String typeId = request.getParameter("typeId");
        
        if (matchId == null | typeId == null) 
        {
            out.println("정상적인 초대 URL이 아닙니다.");
            return;
        }
    %>

<h1>초대 응답 페이지</h1>
    
    

    <div class="button-container">

    	<p>그룹 초대 요청이 들어왔습니다. 수락 / 거절 버튼 중 하나를 눌러주세요.</p>
        <%
            if ("GJ01".equals(typeId) && Integer.parseInt(request.getParameter("creationGroupMemberCount")) < 5) 
            {
        %>
                <a href="grouppreinvitewhetherinsert.action?matchId=<%=matchId%>&typeId=<%=typeId%>&response=SW01" class="button accept">수락</a>
                <a href="grouppreinvitewhetherinsert.action?matchId=<%=matchId%>&typeId=<%=typeId%>&response=SW02" class="button decline">거절</a>
        <%
            }

            else if("GJ02".equals(typeId)) 
            {
        %>
               <a href="groupinvitewhetherinsert.action?matchId=<%=matchId%>&typeId=<%=typeId%>&response=SW01" class="button accept">수락</a>
                <a href="groupinvitewhetherinsert.action?matchId=<%=matchId%>&typeId=<%=typeId%>&response=SW02" class="button decline">거절</a>
        <%
            }
         %>
      	
      	<%
            if ("GJ01".equals(typeId) && Integer.parseInt(request.getParameter("creationGroupMemberCount")) >= 5) 
            {
        %>
        	초대 인원이 다 찼습니다.
        <%
            }
        %>
    </div>

</body>
</html>