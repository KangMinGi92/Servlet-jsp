package com.board.view;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class BoardViewServlet
 */
@WebServlet("/insertBoardView.do")
public class BoardViewServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public BoardViewServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String title=request.getParameter("title");
		String writer=request.getParameter("writer");
		String content=request.getParameter("content");
		
		int random=(int)request.getAttribute("random");
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out=response.getWriter();
		String html="<html>";
		html+="<head>";
		html+="<title>게시판</title>";
		html+="</head>";
		html+="<body>";
		html+="<div>";
		html+="<fieldset>";
		html+="<legend>게시판</legend>";
		html+="<p>게시판No : "+random+"</p>";
		html+="<p>제목 : "+title+"</p>";
		html+="<p>작성자 : "+writer+"</p>";
		html+="<p>내용 : "+content+"</p>";
		html+="</fieldset>";
		html+="</div>";
		html+="</body>";
		html+="</html>";
		
		out.write(html);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
