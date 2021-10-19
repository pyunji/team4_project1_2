package com.mycompany.webapp.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.mycompany.webapp.dao.PaymentMethodDao;
import com.mycompany.webapp.vo.PaymentMethod;

@Service
public class PaymentService {

	@Resource
	private PaymentMethodDao paymentMethodDao;
	
	public List<PaymentMethod> getCardCompanyList(){
		return paymentMethodDao.selectAllCard();
	}
	
	public List<PaymentMethod> getAccountCompanyList(){
		return paymentMethodDao.selectAllAccount();
	}
}
