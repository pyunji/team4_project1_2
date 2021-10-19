package com.mycompany.webapp.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.mycompany.webapp.dao.OrderItemDao;
import com.mycompany.webapp.dao.OrdersDao;
import com.mycompany.webapp.dto.OrderX;

@Service
public class OrderItemService {
	@Resource 
	private OrdersDao ordersDao;
	
	@Resource
	private OrderItemDao orderItemDao; 

	
	public List<OrderX> getOrderItems(String mid){
		return ordersDao.selectProductByMid(mid);
	}

	/*	@Transactional
		public int cancelOrderItem(String hidden_ordersId, Date today) {
			return orderItemDao.updateByOrdersId(hidden_ordersId, today);
		}
	
		@Transactional
		public int cancelOrders(String hidden_ordersId) {
			return ordersDao.updateByOrdersId(hidden_ordersId);
		}*/
	
}