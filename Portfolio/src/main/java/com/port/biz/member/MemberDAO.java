package com.port.biz.member;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.port.biz.vo.AddressVO;
import com.port.biz.vo.MemberVO;

@Repository
public class MemberDAO {
	
	@Autowired
	private SqlSessionTemplate mybatis;
	
	public MemberVO login(String id){
		return mybatis.selectOne("MemberDAO.login", id);
	}
	
	public void signUp(MemberVO member) {
		mybatis.insert("MemberDAO.signUp", member);
	}
	
	public List<AddressVO> findAddr(String dong) {
		return mybatis.selectList("MemberDAO.findAddr", dong);		
	}
	
	public void memberUpdate(MemberVO member) {
		mybatis.update("MemberDAO.updateMember", member);
	}
	
	public MemberVO findId(MemberVO member) {
		return mybatis.selectOne("MemberDAO.findId", member);
	}
	
	public MemberVO findPwd(MemberVO member) {
		return mybatis.selectOne("MemberDAO.findPwd", member);
	}
}
