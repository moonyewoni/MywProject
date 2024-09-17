/*====================
	IMemberDAO.java
	- 인터페이스
====================*/

package com.test.prj;

import java.util.ArrayList;

public interface IMemberDAO
{
	// 회원가입 폼에서 찾기 질문 리스트 확인
	public ArrayList<MemberDTO> findList();
	
	// 회원정보에서 아이디 중복 여부 검색
	public int idCount(String my_id);
	
	// 회원정보에서 닉네임 중복 여부 검색
	public int nameCount(String user_name);
	
	// 회원 수 검색
	public int userCount();
	
	// 회원 데이터 입력(추가)
	public int addUser(String user_id);

	// 회원정보 데이터 입력(추가)
	public int addUserInformation(MemberDTO dto);
	
	/*
	// 모먼트 데이터 확인
	public MemberDTO search(String moment_id);
	
	// 모먼트 데이터 수정
	public int modify(MemberDTO dto);
	
	// 모먼트 데이터 삭제
	public int remove(String moment_id);
	*/
}
