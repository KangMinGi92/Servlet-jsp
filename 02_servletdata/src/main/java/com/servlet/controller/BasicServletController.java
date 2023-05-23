package com.servlet.controller;

import java.io.IOException;
import javax.servlet.ServletException;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

//일반클래스를 서블릿역할로 만들기.... -> 클라이언트의 요청을 받는 클래스
//1. javax.servlet.http.HttpServlet클래스를 상속받음
//2. HttpServlet에 정의되어있는 메소드를 재정의(오버라이딩)
//	1) doGet() : 클라이언트가 get방식으로 요청한 내용을 처리하는 메소드 
//	2) doPost() : 클라이언트가 post방식으로 요청한 내용을 처리하는 메소드
//3. 서버에서 요청을 받을 수 있게 등록을 해야함. ->web.xml파일, @어노테이션이용
//	1) 생성한 서블릿클래스는 서버에 등록
//	2) 서블릿을 실행한 주소를 매핑(연결)시켜줌
public class BasicServletController extends HttpServlet{

	/**
	 * 
	 */
	private static final long serialVersionUID = 5412475190290065154L;
	
	public BasicServletController() {
		// TODO Auto-generated constructor stub
	}
	
	@Override
	public void doGet(HttpServletRequest request,HttpServletResponse response) throws ServletException,IOException {
		System.out.println("서블릿의 doGet메소드가 실행됨");
		
	}
	@Override
	public void doPost(HttpServletRequest request,HttpServletResponse response) throws ServletException,IOException{
		System.out.println("서블릿의 doPost메소드가 실햄됨");
	}
	
	//HTTPServletRequest 요청시 전달된 데이터보관, 요청에 처리할수 있는 내용가진객체	and 서버에서 생성한 정보(data)를 저장
	//HTTPServletResponse 요청된 데이터를 응답처리하는 기능을 담당하는 객체
}
