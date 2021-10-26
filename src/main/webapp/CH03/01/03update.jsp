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
	<!-- bean을 이용해서 한번에 파라미터 전달하기 -->
	<jsp:useBean id="memberDTO" class="CH03.memberDTO" scope="page" />
	<jsp:setProperty name="memberDTO" property="*" /> <!-- 요청파라미터를 memberDTO로 전달 -->
	<jsp:useBean id="memberDAO" class="CH03.memberDAO" scope="page"/>
	
	<%
		int result=memberDAO.memberUpdate(memberDTO);
		
	%>


</body>
</html>