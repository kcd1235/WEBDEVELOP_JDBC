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

<%@page import="java.sql.*" %>

<%
	//드라이브적재
	Class.forName("com.mysql.cj.jdbc.Driver");
	System.out.println("Driver Loading Success!!");
	//DB연동객체용 참조변수 선언
	Connection conn = null;
	PreparedStatement pstmt = null;
	 
	
	//DB연결용 값 저장
	String url = "jdbc:mysql://localhost:3330/shopdb";
	String id = "root";
	String pw = "1234";
	try{
		conn = DriverManager.getConnection(url,id,pw);
		System.out.println("DBCONN Success!!");
		pstmt=conn.prepareStatement("delete from member_tbl where email=?");
		pstmt.setString(1,email);
		int result = pstmt.executeUpdate();
		
		if(result!=0){
			%>
				<script>
					alert("삭제 성공!");
				</script>
			<%
		
		}else{
			%>
			<script>
				alert("삭제 실패!");
			</script>
		<%
		}
		
		
	}catch(Exception e){
		e.printStackTrace();	
	}finally{
		try{conn.close();}catch(Exception e){}
		try{pstmt.close();}catch(Exception e){}
		
	}
	//DB연결
	//쿼리전송 객체 생성 + SQL문 전달
	//쿼리전송 
	//결과처리


%>













</body>
</html>