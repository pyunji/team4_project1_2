//package com.mycompany.webapp.controller;
//
//import java.util.List;
//
//import javax.annotation.Resource;
//
//import org.springframework.stereotype.Controller;
//import org.springframework.ui.Model;
//import org.springframework.web.bind.annotation.RequestMapping;
//import org.springframework.web.bind.annotation.RequestParam;
//
//import com.mycompany.webapp.service.TestService;
//import com.mycompany.webapp.dto.Product;
//
//@Controller
//public class TestController {
//	@Resource private TestService testService;
//	
//	@RequestMapping("/test")
//	public String test(Model model) {
//		List<Product> boards = testService.getBoards();
//		model.addAttribute("boards", boards);
//		return "testhome";
//	}
//	
//	@RequestMapping("/test/detail")
//	public String detail(Model model, @RequestParam String productColorId) {
//		Product productDetail = testService.getProductDetail(productColorId);
//		model.addAttribute("product", productDetail);
//		return "product/productDetail";
//	}
//}
