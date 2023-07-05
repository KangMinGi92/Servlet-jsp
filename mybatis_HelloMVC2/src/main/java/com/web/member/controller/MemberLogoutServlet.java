package com.web.member.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class MemberLogoutServlet
 */
@WebServlet("/logout.do")
public class MemberLogoutServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MemberLogoutServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//로그인사용자를 로그아웃시키기!
		// -HttpSession에 저장된 데이터를 삭제
		//1. HttpSession을 가져오기
		HttpSession session=request.getSession(false);
		//2. HttpSession 삭제하는 메소드를 이용함
//		se.setAttribute("loginMember",null);
//		se.removeAttribute("loginMember"); 
		// -> invalidate(); 세션정보를 남겨둘필요가 없어서 이 메소드로 삭제해준다.!!
		if(session!=null)
			session.invalidate();
		//3. 출력할 화면선택
		//메인화면으로 이동 -> index.jsp
//		request.getRequestDispatcher(request.getContextPath()).forward(request,response);
		//request로 정보를 넘길것이 없고, url주소에 정보를 남기지 않기 위해 sendRedirect로 화면이동시켜준다.
		
		response.sendRedirect(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
