package com.jsp.model.dto;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.NonNull;
import lombok.RequiredArgsConstructor;
import lombok.Setter;
import lombok.ToString;
//lombok라이브러리 활용하기
//1. lombok.jar파일 다운로드
//2. lombok 설정 -> IDE도구 연동하기
//3. lombok이 제공하는 어노테이션 이용해서 활용하기
@Data //setter, getter, 기본생성자, toString, equals, hashcode
@AllArgsConstructor //매개변수있는 생성자(전제필드에 대해)
@NoArgsConstructor //
@Builder //빌더패턴을 생성
//@Getter
//@Setter
//@ToString(exclude = {"memberPwd"})
//@EqualsAndHashCode
//@RequiredArgsConstructor //NonNull설정, final로 설정된 필드를 매개변수로 하는 생성자생성
public class MemberDTO {
	
	//@Getter
	//private final String memberId;
	private String memberId;
	//@Getter@Setter
	//@NonNull
	private String memberPwd;
	private String memberName;
	//@NonNull
	private int age;
	private String gender;
	private String email;
	private String phone;
	private String address;
	private String hobby;
	private Date enrollDate;

	
	
	
}
