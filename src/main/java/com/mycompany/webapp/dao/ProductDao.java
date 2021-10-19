package com.mycompany.webapp.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.mycompany.webapp.dto.CategoryDepth;
import com.mycompany.webapp.dto.Color;
import com.mycompany.webapp.dto.Product;
import com.mycompany.webapp.dto.Size;
import com.mycompany.webapp.dto.ProductStock;

@Mapper
public interface ProductDao {
	List<Product> testRow();

	List<Product> getProductByCategory(CategoryDepth categoryDepthDto);
	
	int countByCategory(CategoryDepth categoryDepthDto);
	
	Product selectProductByPcolorId(String pcolorId);
	
	List<Color> selectColorsByPcolorId(String pcolorId);
	
	List<Size> selectSizesByPcolorId(String pcolorId);
	
	List<Product> selectWithItemsByPcolorId(String pcolorId);
	
	List<ProductStock> getStock(String pcolorId);
	
	List<Product> selectProductOrderByStockRandom();
}
