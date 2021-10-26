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
	<%@page import="CH03.memberDTO"%>
	<jsp:useBean id="memberDAO" class="CH03.memberDAO" scope="page"/>
	<%
		memberDTO dto=new memberDTO();
		if(dto==null)
		{
			%>
				<script>
					alert("계정조회실패");
				</script>
		<%
			response.sendRedirect("03memberSearchForm.jsp");
		}
	%>

<div style="margin:100px auto; width:60%;">
        <h2 style="margin-bottom:20px;">회원정보 조회</h2>
        <form class="row g-3" action="update.jsp">
            <div class="col-md-6">
                <label for="inputEmail4" class="form-label">Email</label>
                <input type="email" class="form-control" id="inputEmail4" value="<%=dto.getEmail() %>" disabled>
                <input type="hidden" class="form-control" id="inputEmail4" name="email" value="<%=dto.getEmail() %>">
            </div>
            <div class="col-md-6">
                <label for="inputPassword4" class="form-label">Password</label>
                <input type="password" class="form-control" id="inputPassword4" name="pwd" value="<%=dto.getPwd() %>" >
            </div>
            <div class="col-md-2">
                <label for="inputZip " class="form-label ">Zip</label>
                <input type="text " class="form-control " id="inputZip" name="zipcode" value="<%=dto.getZipcode() %>">
                <button class="btn btn-primary ">주소검색</button>
            </div>
            <div class="col-md-2 ">
            </div>
            <div class="col-12 ">
                <label for="inputAddress " class="form-label ">Address 1</label>
                <input type="text " class="form-control " id="inputAddress " name=addr1 value="<%=dto.getAddr1() %>">
            </div>
            <div class="col-12 ">
                <label for="inputAddress2 " class="form-label ">Address 2</label>
                <input type="text " class="form-control " id="inputAddress2 " name=addr2 value="<%=dto.getAddr2() %>">
            </div>

            <div class="col-12 ">
                <button type="submit " class="btn btn-primary ">수정요청</button>
            </div>
        </form>
    </div>









</body>
</html>