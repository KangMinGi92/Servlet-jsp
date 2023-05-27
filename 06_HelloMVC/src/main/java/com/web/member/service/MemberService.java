package com.web.member.service;

import static com.web.common.JDBCTemplate.*;

import java.sql.Connection;
import java.util.List;

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
	
	public int insertMember(MemberDto m){
		Connection conn=getConnection();
		int result=dao.insertMember(conn,m);
		if(result>0) commit(conn);
		else rollback(conn);
		close(conn);
		return result;
	}
	
	public MemberDto selectByUserId(String userId) {
		Connection conn=getConnection();
		MemberDto m=dao.selectByUserId(conn,userId);
		close(conn);
		return m;
	}
	
	public int updateMember(MemberDto m) {
		Connection conn=getConnection();
		int result=dao.updateMember(conn,m);
		if(result>0) commit(conn);
		else rollback(conn);
		close(conn);
		return result;
	}
	
	public int updatePassword(String userId, String password) {
		Connection conn=getConnection();
		int result=dao.updatePassword(conn,userId,password);
		if(result>0) commit(conn);
		else rollback(conn);
		close(conn);
		return result;
	}

}
