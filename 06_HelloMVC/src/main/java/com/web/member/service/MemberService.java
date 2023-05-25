package com.web.member.service;

import static com.web.common.JDBCTemplate.close;
import static com.web.common.JDBCTemplate.getConnection;

import java.sql.Connection;

import com.web.member.dao.MemberDao;
import com.web.member.dto.MemberDto;

public class MemberService {
	
	private MemberDao dao=new MemberDao();
	
	public MemberDto selectByUserIdAndPw(String userId, String password) {
		Connection conn=getConnection();
		MemberDto m=dao.selectByUserIdAndPw(conn,userId,password);
		close(conn);
		return m;
	}
	
	public void login(String userId, String password){
		Connection conn=getConnection();
		dao.login(conn,userId,password);
		close(conn);
	}

}
