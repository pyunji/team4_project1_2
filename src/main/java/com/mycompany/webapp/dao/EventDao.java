package com.mycompany.webapp.dao;

import org.apache.ibatis.annotations.Mapper;

import com.mycompany.webapp.vo.Event;

@Mapper
public interface EventDao {
	Event selectByEventNo(int eventNo);
	Event selectCount(int eventNo);
	int updateCount(int eventNo);
}
