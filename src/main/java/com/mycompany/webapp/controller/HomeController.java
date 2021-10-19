package com.mycompany.webapp.controller;

import java.util.List;

import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.mycompany.webapp.dto.Product;
import com.mycompany.webapp.service.ProductService;

@Controller
public class HomeController {
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	@Resource ProductService productService;
	
	@RequestMapping("/")
	public String content(Model model) {
		logger.info("실행");
		List<Product> homeProducts = productService.getHomeProducts();
		model.addAttribute("products", homeProducts);
		return "home";
	}
	
	@RequestMapping("/error/403")
	public String error403() {
		logger.info("실행");
		return "error/403";
	}
	
	@RequestMapping("/addressPopup")
	public String addressPopup() {
		return "popup/jusoPopup";
	}

}