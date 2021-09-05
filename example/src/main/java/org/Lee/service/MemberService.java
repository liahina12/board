package org.Lee.service;

import org.Lee.domain.MemberDTO;

public interface MemberService {

	public void member(MemberDTO mdto) throws Exception; //회원가입
	
    public int idCheck(String id) throws Exception;  //아이디 중복검사
    
    public int nicCheck(String nicname) throws Exception;//닉네임 중복검사
    
    public MemberDTO memberLogin(MemberDTO mdto) throws Exception; //로그인 
    
  	public MemberDTO readMember(MemberDTO mdto) throws Exception; //회원정보 보기
  	
    public void updateMember(MemberDTO mdto) throws Exception;   //회원정보 수정
  	
  	public void deleteMember(MemberDTO mdto) throws Exception;  	//회원정보 삭제
  	
  	
}
