package com.web.member.dto;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data //setter, getter, 기본생성자, toString, equals, hashcode
@AllArgsConstructor //매개변수있는 생성자(전제필드에 대해)
@NoArgsConstructor //
@Builder //빌더패턴을 생성
public class MemberDto {

	  private String userId;
	  private String password;
	  private String userName;
	  private char gender;
	  private int age;
	  private String email;
	  private String phone;
	  private String address;
	  private String[] hobby;
	  private Date enrollDate;
}
