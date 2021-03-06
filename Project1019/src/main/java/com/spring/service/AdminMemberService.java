package com.spring.service;

import java.util.List;

import com.spring.domain.Criteria;
import com.spring.domain.MemberVO;

public interface AdminMemberService {
	
	public MemberVO getMember(int member_no);
	
	public boolean modify(MemberVO vo);
	
	public boolean remove(int member_no);
	
	public List<MemberVO> getList();
	
	public List<MemberVO> getListWithPaging(Criteria cri);
	
	public int getTotalCount(Criteria cri);
	
}
