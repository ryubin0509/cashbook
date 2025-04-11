<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import = "dto.*" %>
<%@ page import = "model.*" %>
<%@ page import = "java.util.*" %>
<%
	// dateList.jsp -> 수입/지출 입력(String cashDate) ->
	
	String cashDate = request.getParameter("cashDate");
	ArrayList<Category> list = new ArrayList<Category>();
	// insertCashFrom.jsp -> kind 선택(String kind)
	String kind = request.getParameter("kind");
	if(kind != null) { // insertCashForm.jsp 에서 kind 선택 후 재요청
		// DB : 선택된 Kind의 title 목록
		CategoryDao categoryDao = new CategoryDao();
		 list = categoryDao.selectCategoryListByKind(kind);
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
		<h1>수입/지출 선택</h1>
		<form  method="post" action="/cashbook/insertCashForm.jsp">
			<input type = "hidden" name="cashDate"  value="<%=cashDate%>">
 			kind
			<select  name="kind">
				 <option value="">선택</option>
				 <option>수입</option>
				 <option>지출</option>
			</select>
			<button type="submit">수입/지출 선택</button>
		</form>
		
		<hr>
		
		<h1>cash 이력 추가</h1>
		<form action="/cashbook/insertCashAction.jsp"  method="post">
			cashDate : <input type= "text"  name = "cashDate"  value="<%=cashDate%>"  readonly >
			category  :
			<select name ="categoryNo">
				<%
					if(list  != null){
					for(Category c : list ){
				%>
					<option value="<%=c.getNum()%>"><%=c.getTitle() %></option>
				<%
					 }
					}
				%>
			</select>
		
		<button type = "submit">수입/지출 입력</button>
		</form>
</body>
</html>