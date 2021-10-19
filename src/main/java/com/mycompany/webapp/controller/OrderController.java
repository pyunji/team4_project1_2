package com.mycompany.webapp.controller;

import java.security.Principal;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

import javax.annotation.Resource;
import javax.validation.Valid;

import org.json.JSONArray;
import org.json.JSONObject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.mycompany.webapp.dto.CartProduct;
import com.mycompany.webapp.dto.OrderComplete;
import com.mycompany.webapp.service.CartService;
import com.mycompany.webapp.service.MemberService;
import com.mycompany.webapp.service.MileageService;
import com.mycompany.webapp.service.OrderItemService;
import com.mycompany.webapp.service.OrderService;
import com.mycompany.webapp.service.PaymentService;
import com.mycompany.webapp.validator.OrderFormValidator;
import com.mycompany.webapp.vo.Member;
import com.mycompany.webapp.vo.Mileage;
import com.mycompany.webapp.vo.Orders;
import com.mycompany.webapp.vo.PaymentMethod;

@Controller
@RequestMapping("/order")
public class OrderController {
	private static final Logger logger = LoggerFactory.getLogger(OrderController.class);

	@Resource
	MemberService memberService;
	@Resource
	OrderItemService orderItemService;
	@Resource
	private OrderService orderService;
	@Resource
	CartService cartService;
	@Resource
	MileageService mileageService;
	
	
	//장바구니에 상품을 담고 주문하기 클릭시, 주문 Form으로 이동.
	@RequestMapping("/orderform")
	public String orderForm(Model model, Principal principal, String orderContent) {
		// 아이디가 들어가는 변수
		String userId = principal.getName();
		// Mileage 합계를 넣기 위한 변수
		int mileageSum = 0;
		Member member = memberService.memberInfoById(userId);
		List<Mileage> mileages = memberService.memberMileageById(principal.getName());
		List<Mileage> usedmileages = memberService.memberUsedMileageById(principal.getName());
		for (Mileage mileage : mileages) {
			mileageSum += mileage.getAmount();
		}
		for (Mileage mileage : usedmileages) {
			mileageSum -= mileage.getAmount();
		}

		// 장바구니에서 주문요청한 상품을 order 폼에 뿌리기
		// 장바구니에서 json으로 보내준 orderContent를 사용한다.
		List<CartProduct> cartProducts = new ArrayList<CartProduct>();
		JSONObject jsonObject = new JSONObject(orderContent);
		JSONArray products = jsonObject.getJSONArray("products");
		for (int i = 0; i < products.length(); i++) {
			JSONObject product = products.getJSONObject(i);
			CartProduct cartProduct = new CartProduct();
			cartProduct.setPcolorId(product.getString("pcolorId"));
			cartProduct.setBrandName(product.getString("brandName"));
			cartProduct.setProductName(product.getString("productName"));
			cartProduct.setColorCode(product.getString("colorCode"));
			cartProduct.setSizeCode(product.getString("sizeCode"));
			cartProduct.setImg(product.getString("img"));
			cartProduct.setQuantity(product.getInt("quantity"));
			cartProduct.setAppliedPrice(product.getInt("appliedPrice"));

			cartProducts.add(cartProduct);
		}

		int totalPrice = jsonObject.getInt("totalPrice");

		model.addAttribute("member", member);
		model.addAttribute("mileageSum", mileageSum);
		model.addAttribute("cartProducts", cartProducts);
		model.addAttribute("totalPrice", totalPrice);
		model.addAttribute("orderContent", orderContent);
		/* orderService.orderDeliveryPaymentInfo(null); */
		return "order/orderForm";
	}
	
	// Author: lch
	// 주문이 완료된 페이지 입니다 
	@GetMapping("/ordercomplete")
	public String showOrder(@RequestParam("p") String orderId, Principal principal, Model model) {

		String mid = principal.getName();
		// 상품 정보, 상품합계쪽을 OrderComplete 폼에 뿌립니다.
		List<OrderComplete> orderProduct = orderService.selectProductByorderId(mid, orderId);
		// 결제 수단쪽을 OrderComplete 폼에 뿌립니다.
		List<OrderComplete> orderpayment = orderService.selectpaymentByorderId(mid, orderId);
		// 배송지 정보쪽을 OrderComplete 폼에 뿌립니다.
		List<OrderComplete> orderaddress = orderService.selectaddressByorderId(mid, orderId);
		// 주문자 정보쪽을 OrderComplete 폼에 뿌립니다.
		Member member = memberService.memberInfoById(mid);
		
		// 가상계좌로 입금시 +4시간
		String timeP = null;
		Date date = new Date();
		//SimpleDateFormat = 원하는 시간 포맷
		SimpleDateFormat bytime = new SimpleDateFormat("yyyy.MM.dd HH시 mm분");
		//getInstance = 하나의 인스턴스만 가지고 공유해서 씀
		// 날짜 계산
		Calendar cal = Calendar.getInstance();
		// 지정 날짜 set
		cal.setTime(date);
		// 4시간 더하기 
		cal.add(Calendar.HOUR,+4);
		timeP = bytime.format(cal.getTime());
		// 입금 시간 +4시간 더하기
		model.addAttribute("timeP", timeP);
		
		
		model.addAttribute("member", member);
		model.addAttribute("orderProduct", orderProduct);
		model.addAttribute("orderpayment", orderpayment);
		model.addAttribute("orderaddress", orderaddress);
		model.addAttribute("bfdcprice", orderProduct.get(0).getOrders().getBeforeDcPrice());
		model.addAttribute("afdcprice", orderProduct.get(0).getOrders().getAfterDcPrice());
		model.addAttribute("mileage", orderProduct.get(0).getOrders().getUsedMileage());

		return "order/orderComplete";
	}

	/* author: 채연
	 * Validation 세팅 
	 * @InitBinder은 @Valid을 실행하기 전에 Validator를 세팅해준다.
	 * orderForm이라는 이름을 사용한다. */
	@InitBinder("orderForm")
	public void orderFormSetValidate(WebDataBinder binder) {
		binder.setValidator(new OrderFormValidator());//OrderFormValidator를 검증기로 사용한다.
	}

	/* author: 채연
	 * 서버측 Vlaidation 이후 ordercomplete 화면으로 전환 
	 * @Valid : Form에서 오는 Orders 커맨드 객체를 "orderForm"이라는 이름의 Validator로 Valid 하겠다.
	 * InitBinder의 이름과 Valid의 ModelAttribute의 이름을 일치시켜줘야한다.
	 * BindingResult에는 검증 결과가 들어간다. */
	@PostMapping("/ordercomplete")
	public String orderValid(@ModelAttribute("orderForm") @Valid Orders orders, BindingResult bindingResult, Model model, Principal principal, Orders order, String orderContent) {
		// 서버측 Vlidator 처리
		if (bindingResult.hasErrors()) {// BindingResult의 error가 존재할 경우 -> 에러메시지를 orderform에 전달
			logger.info("Validatior에 들어왔고, 검증이 올바르지 않음");
			logger.info(bindingResult.toString());

			model.addAttribute("orderContent", orderContent);
			return "forward:/order/orderform";
		} else {// BindingResult에 error가 존재하지 않을 경우 -> ordercomplete 화면으로(form 재전송 방지를 위해 redirect)
			logger.info("Validatior에 들어왔고, 검증이 올바름");

			logger.info("실행");
			JSONObject jsonObject = new JSONObject(orderContent);
			JSONArray products = jsonObject.getJSONArray("products");
			/*
			 * orderService.makeOrder insert: OrderItem 테이블에 orderId와 상품을 매칭해 입력 delete:
			 * Cart 테이블에서 해당 상품 삭제 update: product_stock 테이블에서 남은 수량 업데이트 (주문한 수량만큼 차감)
			 */
			String madeOrderId = orderService.makeOrder(principal, products, order, orderContent);
			model.addAttribute("p", madeOrderId);

			// 주문 오류시 오류창으로 가게끔 하는 부분 필요
			return "redirect:/order/ordercomplete";
		}
	}

	@Resource
	private PaymentService paymentService;

	@GetMapping(value = "/paymentlist", produces = "application/json; charset=UTF-8")
	@ResponseBody
	public List<PaymentMethod> getCompanyList(String method) {
		List<PaymentMethod> methodList = null;
		if (method.equals("카드")) {
			methodList = paymentService.getCardCompanyList();
		} else if (method.equals("계좌")) {
			methodList = paymentService.getAccountCompanyList();
		}
		return methodList;
	}
	
	@RequestMapping("/cancel")
	public String cancelOrder(String hidden_ordersId) {
		// orderitem 테이블에서 데이터 삭제 -> orders 테이블에서 데이터 삭제
		orderService.cancelOrder(hidden_ordersId);
		return "redirect:/member/orderlist";
	}
	
}
