package com.mycompany.webapp.controller;

import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.util.List;

import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.mycompany.webapp.dto.CategoryDepth;
import com.mycompany.webapp.dto.Color;
import com.mycompany.webapp.dto.Product;
import com.mycompany.webapp.dto.ProductStock;
import com.mycompany.webapp.dto.Size;
import com.mycompany.webapp.service.CartService;
import com.mycompany.webapp.service.ProductService;
import com.mycompany.webapp.vo.Category;
import com.mycompany.webapp.vo.Pager;

@Controller
@RequestMapping("/product")
public class ProductController {
	private static final Logger logger = LoggerFactory.getLogger(ProductController.class);
	
	@Resource
	private ProductService productService;

	@Resource
	private CartService cartService;
	
	
	@RequestMapping("/set/{pcolorId}")
	public String setCategoryAndReturn(@PathVariable String pcolorId) throws UnsupportedEncodingException {
		Category category = cartService.setCategories(pcolorId);
		String depth1Name = category.getDepth1Name();
		String depth2Name = category.getDepth2Name();
		String depth3Name = URLEncoder.encode(category.getDepth3Name(), "UTF-8");
		String redirect = "redirect:/product/"+depth1Name+"/"+depth2Name+"/"+depth3Name+"/"+pcolorId;
		

		logger.info("depth3Name : " + depth3Name);
		
		return redirect;
	}
	
	/* [Author : KHY] */ 
	//대분류, 중분류, 소분류 모두다 입력받아 상품리스트를 조회 하는 경우
	@RequestMapping("/{depth1}/{depth2}/{depth3}")
	public String searchByCategory(Model model, @PathVariable String depth1, @PathVariable String depth2, @PathVariable String depth3,@RequestParam(defaultValue = "1") int pageNo) {
		
		// 입력받은 대분류,중분류,소분류 정보를 parameter로 넘기기 위한 dto객체
		CategoryDepth categoryDepthDto = new CategoryDepth();
		categoryDepthDto.setDepth1(depth1);
		categoryDepthDto.setDepth2(depth2);
		categoryDepthDto.setDepth3(depth3);

		// 페이징 처리를 위해 조건에 맞는 상품전체 개수 조회
		int totalProduct = productService.getTotalProductNum(categoryDepthDto);
		
		// Pager객체에 parameter값으로 (표시할 상품수, 표시할 페이지 그룹수, 전체 상품개수, 페이지번호)를 넣는다.
		Pager pager = new Pager(12,5,totalProduct, pageNo);
		categoryDepthDto.setPager(pager);
		List<Product> products = productService.getProductsByCategory(categoryDepthDto); 
		model.addAttribute("pager",pager);
		model.addAttribute("products", products);
		String str = depth1+"/"+depth2+"/"+depth3;
		//page이동시 숫자 button에 href에 들어갈 url엥 넣기위해 str을 넘겨준다.
		model.addAttribute("str",str);
		//카테고리 활성화를 위한부분
		model.addAttribute("currDepth",3);//depth3
		return "product/productList";
	}
	
	/* [Author : KHY] */ 
	//대분류, 중분류만 입력받아 상품리스트를 조회 하는 경우
	@RequestMapping("/{depth1}/{depth2}")
	public String searchByCategory(Model model, @PathVariable String depth1, @PathVariable String depth2,@RequestParam(defaultValue = "1") int pageNo) {
		CategoryDepth categoryDepthDto = new CategoryDepth();
		categoryDepthDto.setDepth1(depth1);
		categoryDepthDto.setDepth2(depth2);
		int totalProduct = productService.getTotalProductNum(categoryDepthDto);
		Pager pager = new Pager(12,5,totalProduct, pageNo);
		categoryDepthDto.setPager(pager);
		List<Product> products = productService.getProductsByCategory(categoryDepthDto); 
		model.addAttribute("pager",pager);
		model.addAttribute("products", products);
		String str = depth1+"/"+depth2;
		model.addAttribute("str",str);
		model.addAttribute("currDepth",2);//depth2
		return "product/productList";
	}
	
	/* [Author : KHY] */ 
	//대분류만 입력받아 상품리스트를 조회 하는 경우
	@RequestMapping("/{depth1}")
	public String searchByCategory(Model model, @PathVariable String depth1,@RequestParam(defaultValue = "1") int pageNo) {
		CategoryDepth categoryDepthDto = new CategoryDepth();
		categoryDepthDto.setDepth1(depth1);
		int totalProduct = productService.getTotalProductNum(categoryDepthDto);
		Pager pager = new Pager(12,5,totalProduct, pageNo);
		categoryDepthDto.setPager(pager);
		List<Product> products = productService.getProductsByCategory(categoryDepthDto); 
		model.addAttribute("pager",pager);
		model.addAttribute("products", products);
		String str = depth1;
		model.addAttribute("str",str);
		model.addAttribute("currDepth",1);//depth1

		return "product/productList";
	}
	
	// 하나의 상품에 대한 컬러는 product를 사용하면서 가져올 수 있지만, 여러 상품에 대한 컬러는 자바스크립트로 가져오도록 처리하였다.
	@RequestMapping("/{depth1}/{depth2}/{depth3}/**/{pcolorId}")
	public String detail(@PathVariable String pcolorId, Model model) {
		Product product = productService.getProductDetail(pcolorId);
		List<Color> colors = productService.getColors(pcolorId);
		List<Size> sizes = productService.getSizes(pcolorId);
		List<Product> withItems = productService.getWithItems(pcolorId);
		List<ProductStock> stocks = productService.getStocks(pcolorId);
		logger.info(withItems.toString());
		
		model.addAttribute("product", product);
		model.addAttribute("colors", colors);
		model.addAttribute("sizes", sizes);
		model.addAttribute("withItems", withItems);
		model.addAttribute("stocks", stocks);
		
		return "product/productDetail";
	}
	
	@RequestMapping("/selectColors")
	public String selectColors(Model model, String pcommonId){
		List<Color> colors = cartService.getColors(pcommonId);
		model.addAttribute("colors", colors);
		return "product/colors";
	}
	
}