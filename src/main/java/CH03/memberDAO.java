package CH03;

import java.sql.*;
import java.util.ArrayList;

public class memberDAO {
	
	//멤버변수:DB연결객체용 참조변수
	Connection conn=null;
	public PreparedStatement pstmt = null;
	ResultSet rs = null;
	memberDTO dto=null;
	
	//생성자,기본설정 : DB드라이버 적재 & 특정 DB에 연결작업
	public memberDAO() {
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			System.out.println("DB 드라이브 적재 완료!");
			
			conn=DriverManager.getConnection("jdbc:mysql://localhost:3330/shopdb","root","1234");
			System.out.println("DB 연결 완료!");
			
			
			
		}catch(Exception e){
			e.printStackTrace();
		}
	}
	//기능메서드,Select -전체 조회
	public ArrayList<memberDTO> memberSelect() {
		
		ArrayList<memberDTO> list = new ArrayList(); //ArrayList객체 연결
		try {
			pstmt=conn.prepareStatement("select * from member_tbl");
			rs = pstmt.executeQuery();
			if(rs!=null)
			{
				while(rs.next())
				{
					memberDTO dto = new memberDTO();  //회원 저장 객체 생성
					//회원객체 각멤버에 값삽입
					dto.setEmail(rs.getString("email")); 
					dto.setPwd(rs.getString("pwd"));
					dto.setZipcode(rs.getInt("zipcode"));
					dto.setAddr1(rs.getString("addr1"));
					dto.setAddr2(rs.getString("addr2"));
					list.add(dto);
				}			
			}	
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			try{rs.close();}catch(Exception e) {}
			try{pstmt.close();}catch(Exception e) {}
			
		}
		return list;	//select된 모든 결과객체(Resultset)의 주소를 호출했던 위치로 전달
		
	}
	public memberDTO memberSearch(String email,String pwd)
	{
		int result=0;
		memberDTO dto=null;
		try
		{
			
			pstmt=conn.prepareStatement("select * from member_tbl where email=?");
			pstmt.setString(1,email);
			rs = pstmt.executeQuery();
			boolean flag = rs.next();
			if(flag==false)
			{
				//동일 ID 없음 : dto==null
				System.out.println("동일ID가 없음");
			}
			else if(rs.getString("pwd").equals(pwd))//아이디가 존재,패스워드 확인
			{
				//동일 ID있음, 패스워드 일치 : dto=객체생성 후 값 넣기
				dto=new memberDTO();
				dto.setEmail(rs.getString("email"));
				dto.setPwd(rs.getString("pwd"));
				dto.setZipcode(rs.getInt("zipcode"));
				dto.setAddr1(rs.getString("addr1"));
				dto.setAddr2(rs.getString("addr2"));
			}
			else
			{
				//ID는 있으나 패스워드 불일치 : 1
			}
		}
		catch(Exception e)
		{
			e.printStackTrace();	
		}
		finally
		{
			
			try{pstmt.close();}catch(Exception e){}
			try{rs.close();}catch(Exception e){}
		}
		
		return dto;
	}
	//기능메서드,Insert
	public int memberJoin(memberDTO dto)
	{
		//성공 : 1, 실패 : 0
		int result=0;
		try
		{
			String sql="insert into member_tbl values(?,?,?,?,?,?)";
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, dto.getEmail());	//이메일
			pstmt.setString(2, dto.getPwd());	//패스워드
			pstmt.setInt(3, dto.getZipcode());	//우편번호
			pstmt.setString(4, dto.getAddr1());	//주소1
			pstmt.setString(5, dto.getAddr2());	//주소2
			pstmt.setInt(6, 1);	//계정정보
			
			result=pstmt.executeUpdate();
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		finally
		{
			try {
				pstmt.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return result;
	}
	
	//기능메서드,Update
	public int memberUpdate(memberDTO dto)
	{
		//성공 : 1, 실패 : 0
		int result=0;
		try
		{
			String sql="update member_tbl set pwd=?,zipcode=?,addr1=?,addr2=? where email=?";
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, dto.getPwd());	//PWD
			pstmt.setInt(2, dto.getZipcode());	//Zipcode
			pstmt.setString(3,dto.getAddr1());	//Addr1
			pstmt.setString(4, dto.getAddr2());	//Addr2
			pstmt.setString(5, dto.getEmail());	//Email
			
			result=pstmt.executeUpdate();
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		finally
		{
			try {
				pstmt.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return result;
	}
	
	//기능메서드,Delete
	public int memberDelete(String email,String pwd)
	{
		int result=0;
		try
		{
			memberDTO dbdto=memberSearch(email,pwd);

			if(dbdto==null)
			{
				System.out.println("삭제실패");
			}
			else
			{
				if(dbdto.getPwd().equals(pwd))
				{
					pstmt=conn.prepareStatement("delete from member_tbl where email=?");
					pstmt.setString(1,email);
					result=pstmt.executeUpdate();
				}
				else
				{
					System.out.print("삭제실패(패스워드 불일치)");
				}
			}
			
		}
		catch(Exception e)
		{
			e.printStackTrace();	
		}
		finally
		{
			try{pstmt.close();}catch(Exception e){}
		}
		
		return result;
	}
}
