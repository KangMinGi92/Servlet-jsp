package com.filtertest.common.filter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletRequestWrapper;

public class MyRequestWrapper extends HttpServletRequestWrapper{
	 //*매개변수있는 생성자를 만들어야한다!!
	public MyRequestWrapper(HttpServletRequest request) {
		super(request);
	}

	@Override
	public String getParameter(String name) {
		String oriData=super.getParameter(name);
		return oriData+"-bs-";
	}
	
}
