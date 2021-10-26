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
<jsp:useBean id="memberDTO" class="CH02.memberDTO" scope="page" />
<jsp:setProperty name="memberDTO" property="*" /> <!-- 요청파라미터를 memberDTO로 전달 -->


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
		String sql="update member_tbl set pwd=?,zipcode=?,addr1=?,addr2=? where email=?";
		pstmt=conn.prepareStatement(sql);
		pstmt.setString(1,memberDTO.getPwd());
		pstmt.setInt(2,memberDTO.getZipcode());
		pstmt.setString(3,memberDTO.getAddr1());
		pstmt.setString(4,memberDTO.getAddr2());
		pstmt.setString(5,memberDTO.getEmail());
		int result = pstmt.executeUpdate();
		
		System.out.println(memberDTO.getEmail());
		
		if(result!=0){
			%>
				<script>
					alert("수정 성공!");
				</script>
			<%
		}else
		{
			%>
			<script>
				alert("수정 실패!");
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