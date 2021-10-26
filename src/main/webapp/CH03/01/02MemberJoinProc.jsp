<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%@page import="java.sql.*" %>
	<jsp:useBean id="memberDTO" class="CH03.memberDTO" scope="page"/>
	<jsp:setProperty property="*" name="memberDTO"/>
	<jsp:useBean id="memberDAO" class="CH03.memberDAO" scope="page"/>
	<%
		int result=memberDAO.memberJoin(memberDTO);
		if(result==1)
		{
			out.println("계정가입성공");
		}
		else
		{
			out.println("계정가입실패");
		}	
	%>
</body>
</html>