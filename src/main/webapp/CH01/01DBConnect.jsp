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
		//드라이브적재
		Class.forName("com.mysql.cj.jdbc.Driver");
		System.out.println("Driver Loding Success!!");
	
		//DB연동객체용 참조변수 선언
		Connection conn=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		
		//DB연결
		String url="jdbc:mysql://localhost:3330/employees";
		String id="root";
		String pwd="1234";
		try
		{
			conn=DriverManager.getConnection(url,id,pwd);
			System.out.println("DB Connection!!");
			pstmt=conn.prepareStatement("select * from departments order by dept_no");
			rs=pstmt.executeQuery();
			
			String dept_no=null;
			String dept_name=null;
			if(rs!=null)
			{
				while(rs.next())
				{
					dept_no=rs.getString("dept_no");
					dept_name=rs.getString("dept_name");
					%>
					부서번호 : <%=dept_no %>&nbsp;&nbsp;
					부서명 : <%=dept_name %><br>
					<%
				}
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
			try{rs.close();} catch(Exception e){e.printStackTrace();}
		}
		//SQL문 작성
		//쿼리전송
		//결과처리
	%>
</body>
</html>