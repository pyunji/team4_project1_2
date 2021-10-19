package com.mycompany.webapp.dao;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.mycompany.webapp.vo.EventResult;

@Mapper
public interface EventResultDao {
	EventResult selectByEventNoNRank(@Param("eventNo") int eventNo, @Param("memberId") String memberId);
	int insertEventResult(@Param("eventNo") int eventNo, @Param("memberId") String memberId, @Param("rank") int rank);
}
