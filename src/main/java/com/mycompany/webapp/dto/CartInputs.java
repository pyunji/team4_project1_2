package com.mycompany.webapp.dto;

import java.util.List;

import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
public class CartInputs {
	private List<String> pcolorId;
	private List<String> brandName;
	private List<String> productName;
	private List<String> colorCode;
	private List<String> sizeCode;
	private List<String> img;
	private List<Integer> quantity;
	private List<Integer> appliedPrice;
}
