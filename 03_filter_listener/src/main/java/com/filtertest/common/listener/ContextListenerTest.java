package com.filtertest.common.listener;

import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;

public class ContextListenerTest implements ServletContextListener{

	@Override
	public void contextDestroyed(ServletContextEvent sce) {
		//톰캣에서 ServletContext객체가 소멸됐을때 실행
		//톰캣종료 시
		System.out.println("서버 죽음");
	}

	@Override
	public void contextInitialized(ServletContextEvent sce) {
		//톰캣에서 ServletContext객체가 생성됐을때 실행
		//톰캣실행 시
		System.out.println("서버 실행");
	}
	
	
}
