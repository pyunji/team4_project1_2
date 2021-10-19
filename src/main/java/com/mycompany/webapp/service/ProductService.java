package com.mycompany.webapp.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.mycompany.webapp.dao.ProductDao;
import com.mycompany.webapp.dto.CategoryDepth;
import com.mycompany.webapp.dto.Color;
import com.mycompany.webapp.dto.Product;
import com.mycompany.webapp.dto.Size;
import com.mycompany.webapp.dto.ProductStock;

@Service
public class ProductService {
	@Resource private ProductDao productDao;
	
	public List<Product> getProductsByCategory(CategoryDepth categoryDepthDto){
		return productDao.getProductByCategory(categoryDepthDto);
	}
	
	public int getTotalProductNum(CategoryDepth categoryDepthDto) {
		return productDao.countByCategory(categoryDepthDto);
	}
	
	public Product getProductDetail(String pcolorId) {
		return productDao.selectProductByPcolorId(pcolorId); 
	}
	
	public List<Color> getColors(String pcolorId){
		return productDao.selectColorsByPcolorId(pcolorId);
	}
	
	public List<Size> getSizes(String pcolorId){
		return productDao.selectSizesByPcolorId(pcolorId);
	}
	
	public List<Product> getWithItems(String pcolorId) {
		return productDao.selectWithItemsByPcolorId(pcolorId);
	}
	
	public List<ProductStock> getStocks(String pcolorId){
		return productDao.getStock(pcolorId);
	}
	
	public List<Product> getHomeProducts() {
		return productDao.selectProductOrderByStockRandom();
	}
}
