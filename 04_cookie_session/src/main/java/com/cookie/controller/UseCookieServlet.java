package com.cookie.controller;

import java.io.IOException;
import java.util.Arrays;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class UseCookieServlet
 */
@WebServlet("/usecookie.do")
public class UseCookieServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UseCookieServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		//쿠키값 가져오기
		Cookie[] cookies=request.getCookies();
		if(cookies!=null) {
			for(Cookie c : cookies) {
				System.out.println(c.getName()); //key 값
				System.out.println(c.getValue()); //value 값
				if(c.getName().equals("readBoard")) {
					String[] data=c.getValue().split("\\$");
					System.out.println(Arrays.toString(data));
//					StringTokenizer st=new StringTokenizer(c.getValue(),"$");
//					while(st.hasMoreTokens()) {
//						System.out.println(st.nextToken());
//					}
				}
			}
		}
		
		HttpSession session=request.getSession(false);
		String data=(String)session.getAttribute("data");
		System.out.println(data);
		
		
		//context-param으로 등록된 데이터 가져오기
		String contextData=getServletContext().getInitParameter("admin");
		System.out.println(contextData);
		
		
		//서블릿 초기화 데이터 이용하기(이 서블릿에는 web.xml에 init-param으로 초기값 데이터를 적어주지 않아서 데이터를 불러올 수 없다.)
		String servletdata=getInitParameter("servletdata");
		System.out.println(servletdata);
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
