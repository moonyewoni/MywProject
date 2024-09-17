<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지사항 상세 내용</title>
<link rel="stylesheet" type="text/css" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<style>

.content-container 
{
    margin: 20px;
    padding: 20px;
    border: 1px solid #ddd;
    border-radius: 5px;
    background-color: #f9f9f9;
    max-height: 500px;
    overflow-y: auto;  /* Allows scrolling if the content exceeds the height */
}
.content-title {
    font-size: 24px;
    font-weight: bold;
    margin-bottom: 20px;
}
.content-body {
    font-size: 16px;
    line-height: 1.6;
    white-space: pre-wrap;  /* Preserves whitespace and line breaks */
}

</style>
</head>
<body>

<div class="container">
    <div class="row">
        <div class="col-md-12">
            <div class="content-container">
                <div class="content-title">내용</div>
                <div class="content-body">
               		▶ ${content}
                </div>
            </div>
        </div>
    </div>
</div>

</body>
</html>