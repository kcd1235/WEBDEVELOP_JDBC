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
		String email=request.getParameter("email");
		String pwd=request.getParameter("pwd");
	%>
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
		String url="jdbc:mysql://localhost:3330/shopdb";
		String id="root";
		String pw="1234";
		try
		{
			conn=DriverManager.getConnection(url,id,pw);
			System.out.println("DB Connection!!");
			pstmt=conn.prepareStatement("select * from member_tbl where email=?");
			pstmt.setString(1, email);
			rs=pstmt.executeQuery();
			

			if(rs!=null)
			{
				rs.next();
				if(rs.getString("pwd").equals(pwd))
				{
					out.print("이메일ID : "+rs.getString("email")+"<br>");
					out.print("우편번호 : "+rs.getInt("zipcode")+"<br>");
					out.print("주소1 : "+rs.getString("addr1")+"<br>");
					out.print("주소2 : "+rs.getString("addr2")+"<br>");
				}
				else
				{
					%>
					<script>
						alert("패스워드가 일치하지않습니다");
					</script>
					<%
				}
			}
			else
			{
				//해당 ID가 존재하지않음
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