package org.Lee.service;

import org.Lee.domain.MemberDTO;
import org.Lee.mapper.MemberMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import lombok.Setter;


@Service
public class MemberServiceImpl implements MemberService  {

	
	@Setter(onMethod_ = @Autowired)
	private MemberMapper mapper;
	
	//회원가입 insert
	@Override
	public void member(MemberDTO mdto) throws Exception {		
		mapper.member(mdto);		
	}
	// 아이디 중복체크
	@Override
	public int idCheck(String id) throws Exception {
		
		return mapper.idCheck(id);
	}
	//닉네임 중복체크
	@Override
	public int nicCheck(String nicname) throws Exception {
		
		return mapper.nicCheck(nicname);
	}
	//로그인
	@Override
	public MemberDTO memberLogin(MemberDTO mdto) throws Exception {
		return mapper.memberLogin(mdto);
	}
	
	//회원정보보기
	@Override
	public MemberDTO readMember(MemberDTO mdto) throws Exception {
		System.out.println("S : readMember()실행");
								
     	return mapper.readMember(mdto);
	}
	//회원 정보 수정
	@Override
	public void updateMember(MemberDTO mdto) throws Exception {
		mapper.updateMember(mdto);
	}
	//회원 정보 탈퇴
	@Override
	public void deleteMember(MemberDTO mdto) throws Exception {
		mapper.deleteMember(mdto);
	}
	
}
