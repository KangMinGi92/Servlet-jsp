package com.web.member.dao;

import static com.web.common.JDBCTemplate.close;

import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Properties;

import com.web.common.JDBCTemplate;
import com.web.member.dto.MemberDto;

public class MemberDao {
	private Properties sql=new Properties();//final로 선언하면 처리속도 빨라짐
	
	{
		String path=JDBCTemplate.class.getResource("/sql/member/member_sql.properties").getPath();
		try {
			sql.load(new FileReader(path));
		}catch(IOException e) {
			e.printStackTrace();
		}
	}
	public MemberDto selectByUserIdAndPw(Connection conn,String userId, String password) {
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		MemberDto m=null;
		try {
			pstmt=conn.prepareStatement(sql.getProperty("selectByUserIdAndPw"));
			pstmt.setString(1, userId);
			pstmt.setString(2, password);
			rs=pstmt.executeQuery();
			if(rs.next()) {
				m=getMember(rs);
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
		}
		return m;
	}
	
	public int insertMember(Connection conn,MemberDto m) {
		PreparedStatement pstmt=null;
		int result=0;
		try {
			pstmt=conn.prepareStatement(sql.getProperty("insertMember"));
			pstmt.setString(1, m.getUserId());
			pstmt.setString(2, m.getPassword());
			pstmt.setString(3, m.getUserName());
			pstmt.setString(4, String.valueOf(m.getGender()));
			//char를 String으로 형변환 시켜주는 메소드 String.valueof()
			pstmt.setInt(5, m.getAge());
			pstmt.setString(6, m.getEmail());
			pstmt.setString(7, m.getPhone());
			pstmt.setString(8, m.getAddress());
			pstmt.setString(9, String.join(",",m.getHobby()));
			//배열을 String으로 형변환 시켜주는 메소드 String.join()
			result=pstmt.executeUpdate();
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		return result;
	}
	public MemberDto selectByUserId(Connection conn,String userId) {
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		MemberDto m=null;
		try {
			pstmt=conn.prepareStatement(sql.getProperty("selectByUserId"));
			pstmt.setString(1, userId);
			rs=pstmt.executeQuery();
			if(rs.next()) {
				m=getMember(rs);
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
		}return m;
	}
	
	public int updateMember(Connection conn, MemberDto m) {
		PreparedStatement pstmt=null;
		int result=0;
		try {
			//UPDATE MEMBER SET USERNAME=?,AGE=?,EMAIL=?,PHONE=?,ADDRESS=?,GENDER=?,HOBBY=?,ENROLLDATE=SYSDATE WHERE USERID=?
			pstmt=conn.prepareStatement(sql.getProperty("updateMember"));
			pstmt.setString(1, m.getUserName());
			pstmt.setInt(2, m.getAge());
			pstmt.setString(3, m.getEmail());
			pstmt.setString(4, m.getPhone());
			pstmt.setString(5, m.getAddress());
			pstmt.setString(6, String.valueOf(m.getGender()));
			pstmt.setString(7, String.join(",",m.getHobby()));
			pstmt.setString(8, m.getUserId());
			result=pstmt.executeUpdate();
		}catch(SQLException e){
			e.printStackTrace();
		}finally {
			close(pstmt);
		}return result;
	}
	
	public int updatePassword(Connection conn,String userId, String password) {
		PreparedStatement pstmt=null;
		int result=0;
		try {
			//updatePassword=UPDATE MEMBER SET PASSWORD=? WHERE USERID=?
			pstmt=conn.prepareStatement(sql.getProperty("updatePassword"));
			pstmt.setString(1, password);
			pstmt.setString(2, userId);
			result=pstmt.executeUpdate();
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}return result;
	}
	
	private MemberDto getMember(ResultSet rs) throws SQLException{
		return MemberDto.builder()
				.userId(rs.getString("userid"))
				.password(rs.getString("password"))
				.userName(rs.getString("username"))
				.age(rs.getInt("age"))
				.gender(rs.getString("gender").charAt(0))
				.email(rs.getString("email"))
				.phone(rs.getString("phone"))
				.address(rs.getString("address"))
				.hobby(rs.getString("hobby").split(","))
				.enrollDate(rs.getDate("enrollDate"))
				.build();
	}

}
