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
	<%
		String email=request.getParameter("email");
		String pwd=request.getParameter("pwd");
		int zipcode=Integer.parseInt(request.getParameter("zipcode"));
		String addr1=request.getParameter("addr1");
		String addr2=request.getParameter("addr2");
		
		//드라이브적재
		Class.forName("com.mysql.cj.jdbc.Driver");
		System.out.println("Driver Loding Success!!");
	
		//DB연동객체용 참조변수 선언
		Connection conn=null;
		PreparedStatement pstmt=null;
		
		//DB연결
		String url="jdbc:mysql://localhost:3330/shopdb";
		String id="root";
		String pw="1234";
		try
		{
			conn=DriverManager.getConnection(url,id,pw);
			System.out.println("DB Connection!!");
			pstmt=conn.prepareStatement("insert into member_tbl value(?,?,?,?,?,?)");
			pstmt.setString(1,email);
			pstmt.setString(2,pwd);
			pstmt.setInt(3,zipcode);
			pstmt.setString(4,addr1);
			pstmt.setString(5,addr2);
			pstmt.setInt(6,1);
			int result=pstmt.executeUpdate();
			
			if(result!=0)
			{
				%>
				<script>
					alert("회원가입성공!");
				</script>
				<%
			}
			else
			{
			%>
				<script>
					alert("회원가입실패!");
				</script>
			<%
			}
		}
		catch(Exception e)
		{
			e.printStackTrace();	
		}
		finally
		{
			try{conn.close();} catch(Exception e){e.printStackTrace();}
			try{pstmt.close();} catch(Exception e){e.printStackTrace();}
		}
		//SQL문 작성
		//쿼리전송
		//결과처리
	%>
</body>
</html>