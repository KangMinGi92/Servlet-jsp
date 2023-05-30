package com.web.member.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.web.common.AESEncryptor;
import com.web.member.dto.MemberDto;
import com.web.member.service.MemberService;

/**
 * Servlet implementation class DeleteMemberServlet
 */
@WebServlet("/member/deleteMember.do")
public class DeleteMemberServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

    public DeleteMemberServlet() {
        super();
      
    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String userId=request.getParameter("userId");
		MemberDto m=new MemberService().selectByUserId(userId);
		String password=request.getParameter("password");
		
		String msg="", loc="/member/memberView.do?userId="+userId;
		if(m==null) {
			//비밀번호 일치하지 않음
			msg="비밀번호가 일치하지 않습니다.";
		}else {
			//비밀번호가 일치함.
			int result=new MemberService().deleteMember(userId,password);
			if(result>0) {
				msg="회원탈퇴 완료";
				loc="/";
				request.setAttribute("script", "opener.location.replace('"+request.getContextPath()+"/logout.do');close();");
			}else {
				msg="회원탈퇴 실패";
				loc="/member/memberView.do?userId="+userId;
			}
		}
		request.setAttribute("msg",msg);
		request.setAttribute("loc",loc);
		request.getRequestDispatcher("/views/common/msg.jsp").forward(request,response);
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
