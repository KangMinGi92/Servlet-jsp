package com.servlet.controller;

import java.io.IOException;
import java.util.Arrays;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(name = "enrollMember",urlPatterns= {"/enrollMember.do"})
public class EnrollMemberServlet extends HttpServlet {

	/**
	 * 
	 */
	private static final long serialVersionUID = 8943647513626935483L;

	public EnrollMemberServlet() {
		// TODO Auto-generated constructor stub
	}

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		//HTML에서 값을 입력하지 않고 보내면 데이터를 공란("")으로 가져온다. 
		//체크박스 체크하지않고 값을 보내면 null을 반환한다.
		//인코딩처리하자!!
		//HttpServletRequest.setCharacterEncoding()메소드를 이용
		req.setCharacterEncoding("UTF-8");
		
		String id=req.getParameter("id");
		String pwd=req.getParameter("password");
		String name=req.getParameter("name");
		String nickName=req.getParameter("nickname");
		String email=req.getParameter("email");
		String[] hobbies=req.getParameterValues("hobby");
		String married=req.getParameter("married");
		String info=req.getParameter("info");
		
		String test=req.getParameter("test");
		System.out.println(test); // input태그 name에 test라는게 없으면 에러를 발생시키는게 아니라 null로 출력해준다!!
		
		System.out.println(id+pwd+name+nickName+email+Arrays.toString(hobbies)+married+info);
		
		Map<String,String[]> param=req.getParameterMap();
		for(String key : param.keySet()) {
			System.out.println(key+" : "+Arrays.toString(param.get(key)));
		}
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		this.doGet(req,resp);
		//Request가 form태그의 method=post방식으로 데이터가 넘어오면 바이너리로 넘어와서 한글이 깨지므로 인코딩 처리를 해야한다.!!
		//HttpServletRequest.setCharacterEncoding()메소드를 이용
	}
	
	
}
