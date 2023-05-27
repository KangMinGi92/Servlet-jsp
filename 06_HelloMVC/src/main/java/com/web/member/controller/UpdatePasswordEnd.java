package com.web.member.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.web.member.service.MemberService;

/**
 * Servlet implementation class UpdatePasswordEnd
 */
@WebServlet("/member/updatePasswordEnd.do")
public class UpdatePasswordEnd extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdatePasswordEnd() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Cookie[] cookies=request.getCookies();
		String userId="";
		if(cookies!=null){
			for(Cookie c : cookies){
				if(c.getName().equals("saveId")){
					userId=c.getValue();
					break;
				}
			}
		}
		String password=request.getParameter("password_new");

		int result=new MemberService().updatePassword(userId,password);	
		String msg="",loc="";
		if(result>0) {
			//변경성공
			msg="비밀번호 변경 성공";
			loc="/";
		}else {
//			msg="비밀번호 변경에 실패하였습니다. :( \\n다시시도하세요";
//			loc="/member/updatePassword.do";
		}
		System.out.println(result);
		System.out.println(msg);
		request.setAttribute("result",result);
		request.setAttribute("msg", msg);
//		request.setAttribute("loc", loc);
		request.getRequestDispatcher("/views/member/updatePassword.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
