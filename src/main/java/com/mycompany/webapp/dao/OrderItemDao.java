package com.mycompany.webapp.dao;

import java.util.Date;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

@Mapper
public interface OrderItemDao {
	
	int updateByOrdersId(@Param ("hidden_ordersId") String hidden_ordersId,  @Param("today") Date today);

}
