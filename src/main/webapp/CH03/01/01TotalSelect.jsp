<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<jsp:useBean id="memDAO" class="CH03.memberDAO" scope="page" />
<%@page import="java.util.*,CH03.memberDTO" %>
<body>
<%
	ArrayList<memberDTO> list = memDAO.memberSelect();
	
	for(int i=0;i<list.size();i++)
	{
		out.print("아이디 : " + list.get(i).getEmail()+"\t");
		out.print("우편번호 : " + list.get(i).getZipcode()+"\t");
		out.print("주소 : " + list.get(i).getAddr1()+"<br><br>");
	}
%>

</body>
</html>