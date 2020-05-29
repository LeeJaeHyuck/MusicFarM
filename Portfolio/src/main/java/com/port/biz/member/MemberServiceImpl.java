package com.port.biz.member;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.port.biz.vo.AddressVO;
import com.port.biz.vo.MemberVO;

@Service("memberService")
public class MemberServiceImpl implements MemberService {

	@Autowired
	private MemberDAO dao;

	@Override
	public MemberVO login(MemberVO vo) {
		return dao.login(vo.getId());
	}

	@Override
	public void signUp(MemberVO vo) {
		dao.signUp(vo);

	}

	@Override
	public List<AddressVO> findAddr(String dong) {
		return dao.findAddr(dong);
	}

	@Override
	public void memberUpdate(MemberVO member) {
		dao.memberUpdate(member);
	}

	@Override
	public MemberVO findId(MemberVO member) {
		return dao.findId(member);
	}

	@Override
	public MemberVO findPwd(MemberVO member) {
		return dao.findPwd(member);
	}

}
