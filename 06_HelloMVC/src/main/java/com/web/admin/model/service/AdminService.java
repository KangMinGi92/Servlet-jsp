package com.web.admin.model.service;

import static com.web.common.JDBCTemplate.close;
import static com.web.common.JDBCTemplate.getConnection;

import java.sql.Connection;
import java.util.List;
import java.util.Map;

import com.web.admin.model.dao.AdminDao;
import com.web.member.dto.MemberDto;

public class AdminService {
	
	private AdminDao dao=new AdminDao();
	
	public List<MemberDto> checkMemberAll(int cPage,int numPerpage) {
		Connection conn=getConnection();
		List<MemberDto> list=dao.checkMemberAll(conn,cPage,numPerpage);
		close(conn);
		return list;
	}
	public int selectMemberCount() {
		Connection conn=getConnection();
		int result=dao.selectMemberCount(conn);
		close(conn);
		return result;
	}
	
	public List<MemberDto> checkMemberType(int cPage,int numPerpage, Map map){
		Connection conn=getConnection();
		List<MemberDto> list=dao.checkMemberType(conn,cPage,numPerpage,map);
		close(conn);
		return list;
	}
	public int selectMemberCountType(Map map) {
		Connection conn=getConnection();
		int result=dao.selectMemberCountType(conn,map);
		close(conn);
		return result;
	}
	
}
