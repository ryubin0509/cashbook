<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<% 
	 int cashNum = Integer.valueOf(request.getParameter("cashNo")); 
	 String cashDate = request.getParameter("cashDate");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>파일 등록</title>
</head>
<body>
<h2>파일 등록하기</h2>
<form action="/cashbook/insertReceitAction.jsp?cashNo=<%=cashNum%>&cashDate=<%=cashDate%>"  method="post" enctype="multipart/form-data">
 <div>이미지:  <input type="file"  name ="imagefile"   > </div>
  
<button type ="submit" >파일 등록하기</button>

</form>
</body>
</html>