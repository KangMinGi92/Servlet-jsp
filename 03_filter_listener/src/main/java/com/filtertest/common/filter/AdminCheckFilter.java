package com.filtertest.common.filter;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet Filter implementation class AdminCheckFilter
 */
//@WebFilter("/admin/*") 어노테이션 url패턴 방식으로 설정거나 아래와 같이 서블릿 네임방식으로 설정가능
@WebFilter(servletNames = {
		"memberManager","encoding"
})
public class AdminCheckFilter extends HttpFilter implements Filter {
       
    /**
     * @see HttpFilter#HttpFilter()
     */
    public AdminCheckFilter() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see Filter#destroy()
	 */
	public void destroy() {
		// TODO Auto-generated method stub
	}

	/**
	 * @see Filter#doFilter(ServletRequest, ServletResponse, FilterChain)
	 */
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
		// TODO Auto-generated method stub
		// place your code here
		HttpSession session=((HttpServletRequest)request).getSession(); //HttpServletRequest형변환을 먼저 해주고 .으로 접근해야한다
		String loginId=(String)session.getAttribute("loginId");
		System.out.println(loginId);
		if(loginId!=null&&loginId.equals("admin")) {
			chain.doFilter(request, response);
		}else {
			((HttpServletResponse)response).sendRedirect("/03_filter_listener/");
		}
		
	}

	/**
	 * @see Filter#init(FilterConfig)
	 */
	public void init(FilterConfig fConfig) throws ServletException {
		// TODO Auto-generated method stub
	}

}
