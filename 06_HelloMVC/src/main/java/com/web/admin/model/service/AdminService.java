package com.web.admin.model.service;

import static com.web.common.JDBCTemplate.*;

import java.sql.Connection;
import java.util.List;

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
}
