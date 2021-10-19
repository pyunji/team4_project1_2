package com.mycompany.webapp.dto;

import lombok.Data;

@Data
public class ProductToCart {
	private String productStockId;
	private String sizeCode;
	private String productColorId;
	private String img1;
	private String img2;
	private String img3;
	private String productCommonId;
	private String colorCode;
	private int price;
	private String name;
	private int brandNo;
	private String brandName;
	private int quantity;
}
