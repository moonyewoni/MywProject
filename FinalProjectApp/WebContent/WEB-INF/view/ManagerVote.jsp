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
<title>ManagerVote.jsp</title>
<link rel="stylesheet" type="text/css" href="<%=cp%>/css/main.css">
<link rel="stylesheet" type="text/css" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">

<style type="text/css">
body 
{
    font-family: Arial, sans-serif;
    margin: 0;
    padding: 0;
    text-align: center;
}

.container 
{
    margin-top: 20px;
}

.title 
{
    font-size: 36px;
    font-weight: bold; 
    margin: 0;
}

.list-container 
{
    margin: 20px auto;
    width: 80%; 
}

.list-title 
{
    font-size: 24px; 
    font-weight: bold; 
    margin-bottom: 10px;
}

.list-table 
{
    width: 100%; 
    border-collapse: collapse;
    margin: 0 auto; 
}

.list-table td 
{
    padding: 10px;
    border: 1px solid #ddd; 
}

.voteFin[disabled] 
{
    background-color: #ddd;
    color: #aaa;
    cursor: not-allowed;
    opacity: 0.8;
    filter: blur(0.5px);
}
</style>

<script type="text/javascript" src="http://code.jquery.com/jquery.min.js"></script>
<script type="text/javascript" src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<script type="text/javascript">
    $(document).ready(function() 
    {
        $(".voteFin").click(function() 
        {
            var selectedMatch_id = $("input[name='selectedMatch_id']:checked").val();
            
            if (!selectedMatch_id) 
            {
                alert("투표할 후보를 선택해주세요.");
                return;
            }
            
            $("form").submit();
        });
    });
</script>
</head>
<body>

<div class="container">
    <div class="panel panel-default">
        <div class="panel-heading">
            <h2 class="title">매니저 임명 후보리스트</h2>
        </div>
        <div class="panel-body">
            <p>Group ID: ${group_id}</p>
            <p>Vote ID: ${vote_id}</p>
            <p>Match ID: ${match_id}</p>

            <form action="managervotefin.action" method="post">
                <input type="hidden" name="group_id" value="${group_id}" />
                <input type="hidden" name="vote_id" value="${vote_id}" />
                <input type="hidden" name="gmvote_id" value="${vote_id}"/>
                <input type="hidden" name="match_id" value="${match_id}" />
                <input type="hidden" name="voter_id" value="${match_id}" />

                <div class="list-container">
                    <div class="list-title">후보 목록</div>
                    <table class="list-table">
                        <c:forEach var="candi" items="${candidates}">
                            <tr>
                                <td>
                                    <input type="radio" name="selectedMatch_id" value="${candi.match_id}" /> ${candi.name}(${candi.match_id})
                                </td>
                            </tr>
                        </c:forEach>
                    </table>
                </div>

                <button type="button" class="btn btn-danger voteFin">투표 완료</button>
            </form>
        </div>
    </div>
</div>

</body>
</html>