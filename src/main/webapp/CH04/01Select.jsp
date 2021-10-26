<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%@page import="java.sql.*,javax.naming.*,javax.sql.*" %>

	<%
		Connection conn=null;
		try
		{
			Context initCtx=new InitialContext();
			Context envCtx=(Context)initCtx.lookup("java:comp/env");
			DataSource ds=(DataSource)envCtx.lookup("jdbc/MysqlDB");
			
			conn=ds.getConnection();
			PreparedStatement pstmt=conn.prepareStatement("select * from member_tbl");
			ResultSet rs=pstmt.executeQuery();
			
			if(rs!=null)
			{
				while(rs.next())
				{
					out.println(rs.getString("email")+" ");
					out.println(rs.getString("pwd")+" ");
					out.println(rs.getString("zipcode")+" ");
					out.println(rs.getString("addr1")+" ");
					out.println(rs.getString("addr2")+"<br><br>");
				}
			}
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		
	%>
</body>
</html>