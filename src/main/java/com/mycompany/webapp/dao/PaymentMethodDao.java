package com.mycompany.webapp.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.mycompany.webapp.vo.PaymentMethod;

@Mapper
public interface PaymentMethodDao {
	public List<PaymentMethod> selectAllCard();
	public List<PaymentMethod> selectAllAccount();
}
