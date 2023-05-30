package com.web.member.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.web.member.dto.MemberDto;
import com.web.member.service.MemberService;

@WebServlet("/member/memberView.do")
public class MemberViewServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

    public MemberViewServlet() {
        super();

    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//회원정보를 보여주는 화면으로 이동
		String userId=request.getParameter("userId");
		//1. DB에서 로그인한 회원의 정보를 가져와서 화면에 전달.
		MemberDto m=new MemberService().selectByUserId(userId);
		request.setAttribute("infoMember", m);
		//2. 화면에서 전달받은 회원데이터 출력
		
		request.getRequestDispatcher("/views/member/memberView.jsp").forward(request, response);
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		doGet(request, response);
	}

}
