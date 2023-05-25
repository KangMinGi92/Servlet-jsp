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

	public void login(Connection conn,String userId, String password) {
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		String sql="SELECT *FROM MEMBER WHERE USERID=? AND PASSWORD=?";
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, userId);
			pstmt.setString(2, password);
			rs=pstmt.executeQuery();
				if(rs.next()) System.out.println("로그인성공");
				else System.out.println("로그인실패");
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
		}
	}
}
