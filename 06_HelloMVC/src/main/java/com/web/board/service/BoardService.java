package com.web.board.service;

import static com.web.common.JDBCTemplate.*;

import java.sql.Connection;
import java.util.List;

import com.web.board.model.dao.BoardDao;
import com.web.board.model.vo.Board;
public class BoardService {
	private BoardDao dao=new BoardDao();
	
	public List<Board> selectBoard(int cPage,int numPerpage){
		Connection conn=getConnection();
		List<Board> list=dao.selectBoard(conn,cPage,numPerpage);
		close(conn);
		return list;
	}
	
	public int selectBoardCount(){
		Connection conn=getConnection();
		int result=dao.selectBoardCount(conn);
		close(conn);
		return result;
	}
	
	public int insertBoard(Board b) {
		Connection conn=getConnection();
		int result=dao.insertBoard(conn,b);
		if(result>0) commit(conn);
		else rollback(conn);
		close(conn);
		return result;
	}
	
	public Board selectBoardByNo(int no) {
		Connection conn=getConnection();
		Board b=dao.selectBoardByNo(conn,no);
		close(conn);
		return b;
	}
}
