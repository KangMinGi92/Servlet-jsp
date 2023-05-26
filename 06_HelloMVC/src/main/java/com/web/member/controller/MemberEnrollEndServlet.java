package com.web.member.controller;

import java.io.IOException;
import java.util.Arrays;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.web.member.dto.MemberDto;
import com.web.member.service.MemberService;

/**
 * Servlet implementation class EnrollMemberEnd
 */
@WebServlet("/member/enrollMemberEnd.do")
public class MemberEnrollEndServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MemberEnrollEndServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String userId=request.getParameter("userId");
		String password=request.getParameter("password");
		String userName=request.getParameter("userName");
		int age=Integer.parseInt(request.getParameter("age"));
		String email=request.getParameter("email");
		String phone=request.getParameter("phone");
		String address=request.getParameter("address");
		String gender=request.getParameter("gender");
		String[] hobbies=request.getParameterValues("hobby");
		/*
		 * System.out.println(userId); System.out.println(password);
		 * System.out.println(userName); System.out.println(age);
		 * System.out.println(email); System.out.println(phone);
		 * System.out.println(address); System.out.println(gender);
		 * System.out.println(Arrays.toString(hobbies));
		 */
		
		MemberDto m=MemberDto.builder().
				userId(userId).
				password(password).
				userName(userName).
				age(age).
				email(email).
				gender(gender.charAt(0)).
				phone(phone).
				address(address).
				hobby(hobbies).
				build();
	int result=new MemberService().insertMember(m);
	String msg="",loc="";
	if(result>0) {
		//입력 성공
		msg="회원가입을 축하드립니다!";
		loc="/";
	}else {
		//입력 실패
		msg="회원가입에 실패하였습니다. :( \n다시시도하세요";
		loc="/member/enrollMember.do";
	}
	request.setAttribute("msg", msg);
	request.setAttribute("loc", loc);
	request.getRequestDispatcher("/views/common/msg.jsp").forward(request, response);
	
	
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
