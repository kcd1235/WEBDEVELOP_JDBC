<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	String email = request.getParameter("email");
	String pwd = request.getParameter("pwd");
%>

<jsp:useBean id="memberDAO" class="CH03.memberDAO" scope="page" />
	
	<%
		int result=memberDAO.memberDelete(email, pwd);
		if(result!=0)
		{
			//삭제성공
			System.out.println(email+"삭제성공!");
		}
		else
		{
			System.out.println(email+"삭제실패!");
		}
		
	%>














</body>
</html>