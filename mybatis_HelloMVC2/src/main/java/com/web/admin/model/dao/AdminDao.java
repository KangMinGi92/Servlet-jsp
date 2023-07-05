package com.web.admin.model.dao;

import static com.web.common.JDBCTemplate.close;
import static com.web.member.dao.MemberDao.getMember;

import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.Properties;

import com.web.common.JDBCTemplate;
import com.web.member.dto.MemberDto;
public class AdminDao {
	
	private Properties sql=new Properties();
	
//	{
//		String path=JDBCTemplate.class.getResource("/sql/admin/admin_sql.properties").getPath();
//		try {
//			sql.load(new FileReader(path));
//		}catch(IOException e) {
//			e.printStackTrace();
//		}
//	} 기본생성자를 생성해서 사용하기때문에 초기화블럭을 이용해서 생성해두 되고 기본생성자에 넣어줘도 된다.
	
	public AdminDao() {
		String path=JDBCTemplate.class.getResource("/sql/admin/admin_sql.properties").getPath();
		try(FileReader fr=new FileReader(path);){
			sql.load(fr);
		}catch(IOException e) {
			e.printStackTrace();
		}
	}
	public List<MemberDto> checkMemberAll(Connection conn,int cPage,int numPerpage) {
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		List<MemberDto> list=new ArrayList();
		try {
			pstmt=conn.prepareStatement(sql.getProperty("checkMemberAll"));
			pstmt.setInt(1, (cPage-1)*numPerpage+1);
			pstmt.setInt(2, cPage*numPerpage);
			rs=pstmt.executeQuery();
			while(rs.next()) {
				list.add(getMember(rs)); //getMember는 MemberDao에 있는 메소드를 스태틱으로 선언해서 불러옴
			}
		}catch(SQLException e){
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
		}
		return list;
	}
	
	public int selectMemberCount(Connection conn) {
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		int result=0;
		try {
			pstmt=conn.prepareStatement(sql.getProperty("selectMemberCount"));
			rs=pstmt.executeQuery();
			if(rs.next()) {
				result=rs.getInt(1); //DB에 count(*)조회결과가 컬럼 하나이기 때문에 1로 불러온다 sql문에 AS로 컬럼명을 부여해서 불러와도 된다.!!
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
		}return result;
	}
	
	public List<MemberDto> selectMemberByKeyword(Connection conn,int cPage,int numPerpage,Map map){
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		String sql=this.sql.getProperty("selectMemberByKeyword");
		sql=sql.replace("#TYPE",(String)map.get("type"));
		List<MemberDto> list=new ArrayList();
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1,"%"+(String)map.get("keyword")+"%");
			pstmt.setInt(2, (cPage-1)*numPerpage+1);
			pstmt.setInt(3, cPage*numPerpage);
			rs=pstmt.executeQuery();
			while(rs.next()) {
				list.add(getMember(rs)); //getMember는 MemberDao에 있는 메소드를 스태틱으로 선언해서 불러옴
			}
		}catch(SQLException e){
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
		}
		return list;
	}
	public int selectMemberByKeywordCount(Connection conn, Map map) {
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		String sql=this.sql.getProperty("selectMemberByKeywordCount");
		sql=sql.replace("#TYPE",(String)map.get("type"));
		int result=0;
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1,"%"+(String)map.get("keyword")+"%");
			rs=pstmt.executeQuery();
			if(rs.next()) {
				result=rs.getInt(1); //DB에 count(*)조회결과가 컬럼 하나이기 때문에 1로 불러온다 sql문에 AS로 컬럼명을 부여해서 불러와도 된다.!!
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
		}return result;
	}
}
