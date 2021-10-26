<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
 <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
 <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>


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
	ResultSet rs = null;
	
	//DB연결용 값 저장
	String url = "jdbc:mysql://localhost:3330/shopdb";
	String id = "root";
	String pw = "1234";
	try{
		conn = DriverManager.getConnection(url,id,pw);
		System.out.println("DBCONN Success!!");
		pstmt=conn.prepareStatement("select * from member_tbl where email=?");
		pstmt.setString(1,email);
		rs = pstmt.executeQuery();

		System.out.println("RS : " + rs.next());
		if(rs!=null)
		{
			//아이디가 존재
			//rs.next();
			if(!rs.getString("pwd").equals(pwd))
			{
				%>
				<script>
					alert("패스워드가 일치하지 않습니다");
				</script>	
				<%
			}	
		}else
		{
			//해당 아이디가 존재X
			%>
			<script>
				alert("아이디 없음");
			</script>	
			<%
			
		}
		
		
	%>	

<div style="margin:100px auto; width:60%;">
        <h2 style="margin-bottom:20px;">회원정보 조회</h2>
        <form class="row g-3" action="update.jsp">
            <div class="col-md-6">
                <label for="inputEmail4" class="form-label">Email</label>
                <input type="email" class="form-control" id="inputEmail4" value="<%=rs.getString("email") %>" disabled>
                <input type="hidden" class="form-control" id="inputEmail4" name="email" value="<%=rs.getString("email") %>">
            </div>
            <div class="col-md-6">
                <label for="inputPassword4" class="form-label">Password</label>
                <input type="password" class="form-control" id="inputPassword4" name="pwd" value="<%=rs.getString("pwd") %>" >
            </div>
            <div class="col-md-2">
                <label for="inputZip " class="form-label ">Zip</label>
                <input type="text " class="form-control " id="inputZip" name="zipcode" value="<%=rs.getInt("zipcode") %>">
                <button class="btn btn-primary ">주소검색</button>
            </div>
            <div class="col-md-2 ">
            </div>
            <div class="col-12 ">
                <label for="inputAddress " class="form-label ">Address 1</label>
                <input type="text " class="form-control " id="inputAddress " name=addr1 value="<%=rs.getString("addr1") %>">
            </div>
            <div class="col-12 ">
                <label for="inputAddress2 " class="form-label ">Address 2</label>
                <input type="text " class="form-control " id="inputAddress2 " name=addr2 value="<%=rs.getString("addr2") %>">
            </div>

            <div class="col-12 ">
                <button type="submit " class="btn btn-primary ">수정요청</button>
            </div>
        </form>
    </div>

	<%	
	}catch(Exception e){
		e.printStackTrace();	
	}finally{
		try{conn.close();}catch(Exception e){}
		try{pstmt.close();}catch(Exception e){}
		try{rs.close();}catch(Exception e){}
	}
	//DB연결
	//쿼리전송 객체 생성 + SQL문 전달
	//쿼리전송 
	//결과처
%>








</body>
</html>