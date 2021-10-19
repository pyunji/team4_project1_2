package com.mycompany.webapp.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.mycompany.webapp.dao.MemberDao;
import com.mycompany.webapp.vo.Member;
import com.mycompany.webapp.vo.Mileage;

@Service
public class MemberService {
	@Resource private MemberDao memberDao;
	
	
	public Member memberInfoById(String memberId){
		return memberDao.selectById(memberId);
	}
	
	public List<Mileage> memberMileageById(String memberId) {
		return memberDao.selectMileageById(memberId);
	}
	
	public List<Mileage> memberUsedMileageById(String memberId) {
		return memberDao.selectUsedMileageById(memberId);
	}
}
