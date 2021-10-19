package com.mycompany.webapp.dao;

import org.apache.ibatis.annotations.Mapper;

import com.mycompany.webapp.vo.Mileage;

@Mapper
public interface MileageDao {
 int insertMileage(Mileage mileage);
}
