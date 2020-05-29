package com.port.biz.member;

import java.util.List;

import com.port.biz.vo.AddressVO;
import com.port.biz.vo.MemberVO;

public interface MemberService {
	
	MemberVO login(MemberVO vo);
	
	void signUp(MemberVO vo);
	
	List<AddressVO> findAddr(String dong);
	
	void memberUpdate(MemberVO member);
	
	MemberVO findId(MemberVO member);
	
	MemberVO findPwd(MemberVO member);
}
