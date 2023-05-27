package com.web.member.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.web.member.dto.MemberDto;
import com.web.member.service.MemberService;

/**
 * Servlet implementation class MemberUpdateEndServlet
 */
@WebServlet("/member/memberUpdate.do")
public class MemberUpdateEndServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

    public MemberUpdateEndServlet() {
        super();
      
    }


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
//		String userId=request.getParameter("userId");
		String password=request.getParameter("password");
		String userName=request.getParameter("userName");
		int age=Integer.parseInt(request.getParameter("age"));
		String email=request.getParameter("email");
		String phone=request.getParameter("phone");
		String address=request.getParameter("address");
		String gender=request.getParameter("gender");
		String[] hobbies=request.getParameterValues("hobby");
		
		
		 System.out.println(userId); System.out.println(password);
		 System.out.println(userName); System.out.println(age);
		 System.out.println(email); System.out.println(phone);
		 System.out.println(address); System.out.println(gender);
		 System.out.println(String.join(",",hobbies));
		 
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
		int result=new MemberService().updateMember(m);
		System.out.println(result);
		String msg="",loc="";
		if(result>0) {
			//변경 성공
			msg="회원정보 변경이 완료됐습니다.";
			loc="/";
		}else {
			//변경 실패
			msg="회원정보 변경에 실패하였습니다. :( \n다시시도하세요";
			loc="/member/memberView.do";
		}
		request.setAttribute("msg", msg);
		request.setAttribute("loc", loc);
		request.getRequestDispatcher("/views/common/msg.jsp").forward(request, response);
		
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		doGet(request, response);
	}

}
