package com.mycompany.webapp.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.mycompany.webapp.vo.Member;
import com.mycompany.webapp.vo.Mileage;

@Mapper
public interface MemberDao {
	Member selectById(String memberId);
	List<Mileage> selectMileageById(String memberId);
	List<Mileage> selectUsedMileageById(String memberId);
}
