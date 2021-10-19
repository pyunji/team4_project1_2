package com.mycompany.webapp.controller;

import java.security.Principal;
import java.util.List;

import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.mycompany.webapp.dto.OrderX;
import com.mycompany.webapp.service.OrderItemService;
import com.mycompany.webapp.vo.OrderItem;

@Controller
@RequestMapping("/member")
public class MemberController {
	private static final Logger logger = LoggerFactory.getLogger(MemberController.class);
	
	@RequestMapping("/loginform")
	public String loginForm() {
		logger.info("실행");
		return "member/loginForm";
	}
	
	
	@Resource
	private OrderItemService orderItemService;
	// Author: lch
	// 마이 페이지 & 주문 취소 
	@RequestMapping("/orderlist")
	public String orderList(Model model, Principal principal, OrderItem orderItem) {
		// 사용자 아이디 = mid
		String mid = principal.getName();
		
		//상품 주문목록에 해당하는 주문번호, 상품정보, 수량, 판매가, 주문상태, 배송상태의 정보 조회
		List<OrderX> orderProduct=orderItemService.getOrderItems(mid);
		
		// bytime = 주문한 시간이다.
		model.addAttribute("bytime", orderItem.getOrderByTime());
		model.addAttribute("orderProduct",orderProduct);
		
		return "member/orderList";
	}
	
	
}  
