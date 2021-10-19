<%@ page contentType="text/html; charset=UTF-8"%>
<%@ include file="/WEB-INF/views/common/header.jsp"%>
<%-- <%@ include file="/WEB-INF/views/special/cartListLinks.jsp"%> --%>
<%-- <%@ include file="/WEB-INF/views/common/headerBelowLinks.jsp"%> --%>

<div class="orderwrap1807">
	<div id="bodyWrap">
		<h3 class="cnts_title cnts_tlt1807">
			<span>장바구니</span>
		</h3>

		<div class="cart-form">
			<div class="tblwrap">
				<table class="tbl_ltype">
					<caption>장바구니</caption>
					<colgroup>
						<col style="width: 10px;">
						<col>
						<col style="width: 150px">
						<col style="width: 105px">
						<col style="width: 110px">
					</colgroup>
					<thead>
						<%-- 테이블 헤더의 시작 --%>
						<tr>
							<th scope="col">
								<!-- 전체 체크박스를 컨트롤하는 마스터 체크박스 -->
								<input type="checkbox" id="entryCheckAll" name="entryCheckAll" onclick="checkAll(this);selectProductCount();selectProductPrice();" />
							</th>
							<th scope="col">상품정보</th>
							<th scope="col">수량</th>
							<th scope="col">판매가</th>
							<th scope="col">선택</th>
						</tr>
						<%--//테이블 헤더의 끝 --%>
					</thead>
					<tbody>
						<!-- *product:[pcommonId, pcolorId, pstockId, quantity, brandName, productName, sizeCode, colorCode, 
									img1, img2, img3, colorImg, price, stock] -->
						<!-- *cart.xml.selectList()를 통해 가져옴-->
						<c:forEach var="product" items="${cartItems}" varStatus="status">
							<%-- 첫번째 행의 시작 --%>
							<tr class="entryProductInfo">
								<%-- 체크박스 --%>
								<td class="frt">
									<input type="checkbox" class="entryProductCheck" value="${status.count}" onclick="selectProductCount();selectProductPrice();" />
								</td>
								<%-- 상품정보 --%>
								<td class="pt_list_wrap">
									<div class="pt_list_all">
										<!-- *컬러 아이디만으로 상위 카테고리 경로까지 설정해주는 컨트롤러로 url 매핑 -->
										<a href="/product/set/${product.productColor.id}">
											<img src="${product.productColor.img1}" style="image-rendering: -webkit-optimize-contrast;" alt="">
										</a>
										<div class="tlt_wrap">
											<a href="/product/set/${product.productColor.id}" class="basket_tlt">
												<span class="tlt">${product.brand.name}</span>
												<span class="sb_tlt">${product.productCommon.name}</span>
											</a>
											<p class="color_op">
												color : ${product.productColor.colorCode}
												<span>/</span>
												size : ${product.productStock.sizeCode}
											</p>
											<!-- stock check -->
											<!-- *3개부터 품절임박 표시 -->
											<c:if test="${product.productStock.stock < 4 and product.productStock.stock > 0}">
												<p class="stock_info">품절 임박 ! 현재 선택하신 상품의 재고가 ${product.productStock.stock}개 남았습니다.</p>
											</c:if>

											<c:if test="${product.productStock.stock < 1}">
												<p class="stock_info">품절</p>
											</c:if>
											<!-- *재고 정보 저장 -->
											<input type="hidden" name="stock" value="${product.productStock.stock}" />
											<!-- //stock check -->
											<div class="option_wrap">
												<input type="hidden" value="${product.productCommon.id}" />
												<a href="javascript:void(0);" class="btn_option" onclick="display_opt(this, '${product.productColor.colorCode}', '${product.productStock.sizeCode}', '${product.productCommon.id}','${product.productColor.id}' , ${status.count})">옵션변경</a>
											</div>
										</div>
									</div>
								</td>
								<%-- 수량 --%>
								<td class="al_middle">
									<!-- Cart테이블의 수량 정보를 업데이트 하는 폼 시작 -->
									<form action="/cart/update/quantity" method="post">
										<input type="hidden" name="productStockId" value="${product.productStock.id}" />
										<span class="qty_sel num">
											<!-- 수량 제어 버튼 시작 -->
											<a href="javascript:void(0)" class="left" onclick="quantity_control(this, 'minus');">이전 버튼</a>
											<!-- css 적용하기 위해 number type이 아닌 text 타입을 사용함 -->
											<input id="quantity${status.count}" name="quantity" type="text" class="mr0" value="${product.cart.quantity}" size="1" maxlength="3" min="1" onchange="quantity_check(this)" />
											<a href="javascript:void(0)" class="right" onclick="quantity_control(this, 'plus');">다음 버튼</a>
											<!--//수량 제어 버튼 끝 -->
										</span>
										<button id="QuantityProduct" class="btn wt_ss qty_w mr0">변경</button>
									</form>
									<!--//Cart테이블의 수량 정보를 업데이트 하는 폼 끝 -->
								</td>
								<%-- 가격 --%>
								<td class="al_middle">
									<div class="price_wrap">
										<span>
											₩
											<fmt:formatNumber type="number" maxFractionDigits="3" value="${product.productColor.price * product.cart.quantity}" />
										</span>
										<input type="hidden" name="appliedPrice" value="${product.productColor.price * product.cart.quantity}">
									</div>
								</td>
								<%-- 삭제 --%>
								<td class="al_middle">
									<!-- <div class="btn_wrap">
										<button class="btn wt_ss">삭제</button>
									</div> -->
									<div class="btn_wrap">
										<!-- Cart테이블의 데이터를 삭제하는 폼 시작 -->
										<form class="cartItem" action="/cart/delete" method="post">
											<input type="hidden" name="hidden_pcolorId" value="${product.productColor.id}" />
											<input type="hidden" name="hidden_brand_name" value="${product.brand.name}" />
											<input type="hidden" name="hidden_product_name" value="${product.productCommon.name}" />
											<input type="hidden" name="hidden_color_code" value="${product.productColor.colorCode}" />
											<input type="hidden" name="hidden_size_code" value="${product.productStock.sizeCode}" />
											<input type="hidden" name="hidden_img1" value="${product.productColor.img1}" />
											<input type="hidden" name="hidden_quantity" value="${product.cart.quantity}" />
											<input type="hidden" name="hidden_applied_price" class="hidden_applied_price" value="${product.cart.quantity * product.productColor.price}" />
											<button class="btn wt_ss">삭제</button>
										</form>
										<!--//Cart테이블의 데이터를 삭제하는 폼 끝 -->
									</div>
								</td>
							</tr>
							<%--// 첫번째 행의 끝 --%>

							<%-- 두번째 행의 시작 (default로 hidden) --%>
							<%-- 옵션변경 클릭 시 보여지는 상품 정보--%>
							<tr>
								<td colspan="6" class="basket_wrap">
									<div class="basket_info" style="display: hidden;">
										<input type="hidden" name="statusCount" value="${status.count}" />
										<span class="btn_arr">위치아이콘</span>
										<%-- 옵션 변경 폼 시작 --%>
										<form action="/cart/update/options" method="post">
											<div class="info">
												<div class="pt_list" id="pt_list_4">
													<!-- 클릭 시 상품 상세 화면으로 -->
													<!-- *컬러 아이디만으로 상위 카테고리 경로까지 설정해주는 컨트롤러로 url 매핑 -->
													<a href="/product/set/${product.productColor.id}">
														<!-- 상품 사진 -->
														<img src="${product.productColor.img3}" style="image-rendering: -webkit-optimize-contrast;" alt="">
													</a>
													<div class="tlt_wrap">
														<!-- 클릭 시 상품 상세 화면으로 -->
														<a href="/product/set/${product.productColor.id}">
															<div class="tlt" style="text-align: left;">${product.brand.name}</div>
															<div class="sb_tlt" style="text-align: left;">${product.productCommon.name}</div>
														</a>

														<%-- 변경 버튼 클릭 시 디비에 업데이트 되는 상품 정보 시작 --%>
														<input type="hidden" name="productStockId" value="${product.productStock.id}" />
														<input type="hidden" name="productCommonId" value="${product.productCommon.id}" />
														<input type="hidden" name="colorCode" class="color_option" value="${product.productColor.colorCode}" />
														<input type="hidden" name="sizeCode" class="size_option" value="${product.productStock.sizeCode}" />
														<input type="hidden" name="quantity" value="${product.cart.quantity}" />
														<%--// 변경 버튼 클릭 시 디비에 업데이트 되는 상품 정보 끝 --%>

														<dl class="cs_wrap">
															<dt style="font-size: 18px;">COLOR</dt>
															<dd class="color_wrap">
																<div id="select_color${status.count}" class="cl_select">
																	<%-- color.jsp fragment가 들어가는 부분 시작--%>
																	<!-- <div class="opt_color_wrap">
																			<c:forEach var="color" items="${colors}">
																				<div class="opt_color${color.colorCode}">
																					<a href="javascript:void(0);" onclick="set_color(this);" style="background: #362626 url('${color.colorImg}')">${color.colorCode}</a>
																				</div>
																			</c:forEach>
																		</div> -->
																	<%--//color.jsp fragment가 들어가는 부분 끝--%>
																</div>
															</dd>
															<dt style="font-size: 18px;">SIZE</dt>
															<dd style="width: 90%; height: 100%;">
																<div id="select_size${status.count}" class="sz_select">
																	<%-- size.jsp fragment가 들어가는 부분 시작 --%>
																	<!--<c:forEach var="size" items="${sizes}">
																			<a href="javascript:void(0);" onclick="set_size(this);" class="on ${size.sizeCode}" style="line-height: 15px;">${size.sizeCode}</a>
																		</c:forEach> -->
																	<%--//size.jsp fragment가 들어가는 부분 끝--%>
																</div>
															</dd>
														</dl>
													</div>
												</div>
												<div class="btns">
													<button class="btn wt_ss mr0" id="UpdateCart_4">변경</button>
													<!-- *옵션 변경 row를 숨기는 버튼 -->
													<a href="javascript:void(0)" class="btn wt_ss mt10 mr0" id="optCancelLayer_4" onclick="hidden_opt(this)">취소</a>
													<a href="javascript:void(0)" class="btn_close" id="optCloseLayer_0" onclick="hidden_opt(this)">닫기</a>
												</div>
											</div>
										</form>
										<%--// 옵션 변경 폼 끝 --%>
									</div>
								</td>
							</tr>
							<%-- //옵션변경 클릭 시 보여지는 상품 정보--%>
							<%-- // 두번째 행의 끝 --%>
						</c:forEach>

					</tbody>
				</table>
			</div>
			<!-- 선택된 상품의 합계 금액, 개수를 보여주는 곳 시작 -->
			<!-- *체크박스가 change될때마다 합계와 개수는 바뀐다 -->
			<!-- *selectProductCount(), selectProductPrice() 함수가 실행됨 -->
			<div class="total_wrap">
				<!-- total -->
				<div class="total_price_wrap">
					<dl>
						<dt>상품 합계</dt>
						<dd>
							<span id="cartDataSubtotal">₩0</span>
						</dd>
						<dt class="delch_wrap">배송비</dt>
						<dd>
							<span id="cartDataDeliveryCost">₩0</span>
						</dd>
					</dl>
					<dl class="total">
						<dt style="display: inline;">합계</dt>
						<dd>
							<span id="cartDataTotalPrice">₩0</span>
						</dd>
					</dl>
				</div>
				<div class="total_count_cart">
					<p>
						총
						<span id="selectProductCount">0</span>
						개 상품
					</p>
				</div>
				<!-- //total -->
			</div>
			<!--//Total wrap-->
		</div>
		<!--// 선택된 상품의 합계를 보여주는 곳 끝 -->
		<!-- 선택된 상품리스트(1개 이상)를 장바구니에서 삭제하는 버튼 시작 -->
		<div class="btnwrap order" id="checkout_btn_wrap">

			<input id="" onclick="selDel(this)" value="선택상품삭제" class="btn wt delBtn" type="button" />
			<!-- *삭제할 상품의 StockId를 JSON -> String으로 저장할 input 박스와 데이터를 전달할 경로를 설정한 폼-->
			<form id="delForm" action="/cart/deleteSelected" method="post">
				<input type="hidden" id="selDel" name="productStockIds"/>
			</form>
			<!-- *최종 합계 가격이 들어가는 input box이며, 해당 데이터는 주문서 폼에 넘어간다 -->
			<input type="hidden" id="finalPrice" name="data" />

			<!-- *orderContent input박스의 내용을 주문서 폼으로 전달할 폼 -->
			<form id="orderForm" method="post" action="/order/orderform">
				<!-- *선택한 상품을 JSON -> String으로 저장할 input박스 -->
				<input type="hidden" id="orderContent" name="orderContent" />
				<!-- *주문하기 버튼을 누르면 makeOrder()함수가 실행되고 함수의 결과로 채워진 input 박스의 값이 주문서 폼으로 전달된다 -->
				<input type="button" onclick="makeOrder()" value="선택상품 주문하기" class="btn gray mr0 orderBtn">
			</form>
		</div>
		<!--// 선택 상품을 삭제하는 버튼 끝 -->
		<script>

		</script>
	</div>
</div>

<script>
/*
 * author: 현지
 * 뒤로가기 버튼 등 장바구니 페이지 새롭게 진입 시 모든 체크박스를 해제
 * 재고를 조회해 품절 상품의 체크박스 비활성화
 */
$(document).ready(function () {
	// 체크되어있는 체크박스 해제
	$("input:checked").each(function(){
		$(this).prop("checked", false);
		console.log("실행");
	});
	
	$(".entryProductInfo").each(function() {
		// 장바구니 조회시 재고 데이터도 가져오는데, 재고가 없을 경우 해당 체크박스 비활성화
		var stockElem = $(this).find("input[name='stock']");
		var stock = $(stockElem).val();
		if (stock < 1) {
			$(this).find(".entryProductCheck").prop("disabled", true);
		}
	});
});


/*
 * author: 현지
 * 모든 체크박스를 컨트롤하는 마스터 체크박스를 클릭 시 실행되는 함수
 */
function checkAll(e) {
	// 마스터 체크박스를 체크한 경우
	if ($(e).is(':checked')) {
		// 모든 체크박스를 체크한 후
		$(".entryProductCheck").prop("checked", true);
		// disabled된 체크박스는 체크를 해제한다
		$(".entryProductCheck:disabled").prop("checked", false);
	// 마스터 체크박스를 해제한 경우
	} else {
		// 모든 체크박스를 해제
		$(".entryProductCheck").prop("checked", false);
	}
}

/*
 * author: 현지
 * 선택된 상품 리스트를 장바구니에서 삭제하는 함수
 * "선택상품 주문하기" 버튼 클릭 시 실행
 */
function selDel(e) {
	var productStockIds = [];
	// 체크된 요소를 가져와서
	$(".entryProductCheck:checked").each(function() {
		// 가장 가까운 부모 tr 태그를 찾아서
		var row = $(this).closest("tr");
		// 해당 input을 통해 productStockId 정보를 얻고
		var productStockId = $(row).find("input[name='productStockId']").val();
		// 배열에 추가한다
		productStockIds.push(productStockId);
	});
	
	// 체크된 상품의 id 배열을 "productStockIds"라는 키값을 준 객체로 만든 후 문자열화 한다.
	var jsonProductStockIds = JSON.stringify({"productStockIds":productStockIds});
	// 문자열로 바뀐 json 객체를 input 태그의 값으로 넣는다.
	$("#selDel").val(jsonProductStockIds);
	// form element를 /cart/deleteSelected 경로로 제출한다.
	$("#delForm").submit();
}

/*
 * author: 현지
 * 체크된 체크박스의 개수를 세는 함수
 * 체크박스 상태 바뀔때마다 실행
 */
function selectProductCount() {
	
	// 체크된 체크박스의 개수
	var currChecked = $(".entryProductCheck:checked").length;
	// 체크할 수 있는 체크박스의 개수
	var canChecked = $(".entryProductCheck:enabled").length;
	// 체크할 수 있는 체크박스가 모두 체크되지 않은 경우
	if (currChecked !== canChecked) {
		// 마스터 체크박스를 체크 해제한다
		$("#entryCheckAll").prop("checked", false);
	// 현재 체크할 수 있는 체크박스를 모두 체크한 경우
	} else {
		// 마스터 체크박스를 체크한다
		$("#entryCheckAll").prop("checked", true);
	}
	// 선택된 상품의 개수를 사용자에게 보여줌
	$("#selectProductCount").text(currChecked);
}

/*
 * author: 현지
 * 체크된 상품의 합계를 구하는 함수
 * 체크박스 상태 바뀔때마다 실행
 */
function selectProductPrice() {
	var subTotalPrice = 0;
	var totalPrice = 0;
	// 체크된 체크박스를 찾아서
	$(".entryProductCheck:checked").each(function() {
		// 가장 가까운 tr태그를 찾고
		var row = $(this).closest("tr");
		
		// 각 상품의 (1개당 가격 * 개수)를 입력해놓은 히든태그의 값을 찾아서 합계에 더해준다
		var price = Number($(row).find(":input[name='appliedPrice']").val());
		console.log("appliedPrice=", price);
		subTotalPrice += price;
		totalPrice += price;
		}
	);
	
	// 원화 표시 후 뷰에 뿌려준다
	$("#cartDataSubtotal").text('₩'+subTotalPrice.toLocaleString());
	$("#cartDataTotalPrice").text('₩'+totalPrice.toLocaleString());
	// 주문서 폼으로 넘길 input태그에도 합계 값을 넣어준다
	$("#finalPrice").val(totalPrice);
}

/*
 * author: 현지
 * 수량을 조절하는 함수
 * 수량 조절 버튼 클릭 시 실행됨
 */
function quantity_control(e, operator) {
	// 수량 조절 버튼 값과 형제 관계의 input 태그를 찾아서
	let obj = $(e).siblings("input")[0];
	// 숫자로 변환된 값을 가져온다
	let value = Number($(obj).val());
	// 마이너스 버튼을 눌렀을 경우
	if (operator === 'minus') {
		// 현재 값이 1보다 큰 경우만 값을 빼준다
		if (value > 1) {
			// 뺀 값을 value에 다시 넣어준다 (아직 DB에 반영되진 않은 상태이고, 변경 버튼을 눌러야 반영된다)
			$(obj).attr("value", value - 1);
		}
	// 플러스 버튼을 눌렀을 경우
	} else if (operator === 'plus') {
		// 값을 더해준다
		$(obj).attr("value", value + 1);
	}
}

/*
 * author: 현지
 * "수량" 음수와 소수점 처리
 */
function quantity_check(e) {
	console.log("실행");
	var _input = $(e).val();
	// 0이거나 문자일 경우
	if (isNaN(_input) === true || _input == 0) {
		// 1을 기본값으로 넣어준다
		$(e).val(1);
	// 소숫점이거나 음수일 경우
	} else {
		// 절대값으로 변환 후 내림한 값을 넣어준다
		var validInput = Math.floor(Math.abs(_input));
		$(e).val(validInput);
	}
}

/*
 * author: 현지
 * 컬러칩을 선택하면 컬러 정보를 입력하고, 컬러에 따라 다른 사이즈 배리에이션을 가져오고 보여주는 함수
 */
function set_color(e) {
	// 컬러코드
	var value = $(e).text();
	// 컬러코드 input의 값을 현재 선택한 컬러의 코드로 변경
	$(e).closest("form").find(":input[name='colorCode']").val(value);
	// productCommonId를 가져옴
	var pcommonId = $(e).closest(".tlt_wrap").find(":input[name='productCommonId']").val();
	// id를 구분짓는 statusCout를 가져옴
	var statusCount = $(e).closest(".basket_info").find(":input[name='statusCount']").val();
	// productCommonId와 colorCode를 통해 pcolorId를 만듦
	var pcolorId = pcommonId + "_" + value;
		
	// *컬러에 따라 사이즈 배리에이션이 달라지기 때문에, 컬러 선택 시 컬러 아이디를 통해 사이즈를 비동기로 가져오게 처리하는 부분
	// pcolorId 데이터를 전송할 경로 설정
	var url = "/cart/selectSizesByPcolorId";
	// 해당 id를 가지는 element에 size 리스트를 뿌려줌
	var id_size = "#select_size" + statusCount;
	// post 방식으로 pcolorId 데이터를 url에 전송
	$.ajax({
		url:url,
		method:"post",
		data:{"pcolorId":pcolorId},
		// 전송 후 결과는 사이즈 리스트를 가지는 jsp fragment가 넘어오고, 해당 fragment를 html에 뿌려줌
		success:function(result) {
			$(id_size).html(result);
		}
	});
	
	// css 효과를 줄 class 지정
	var colorClass = ".opt_color" + value;
	// color 선택시 css 추가해 사용자에게 어떤 컬러를 선택했는지 보여줌
	$(e).addClass("on");
	// 나머지 컬러칩은 css 효과를 제거함
	$(e).parents(colorClass).siblings().find("a").removeClass("on");
}

/*
 * author: 현지
 * 현재 선택된 사이즈를 input에 입력하는 함수
 * 사이즈 칩을 클릭할 때 실행됨
 */
function set_size(e) {
	// 현재 선택된 사이즈칩의 사이즈코드
	var value = $(e).text();
	// 사이즈 코드 input의 값을 갱신
	$(e).closest("form").find(":input[name='sizeCode']").val(value);

	//선택된 사이즈칩을 강조하는 css 처리
	$(e).siblings().css("background-color", "#ffffff");
	$(e).siblings().css("color", "#000000");
	$(e).css("background-color", "#8CB297");
	$(e).css("color", "#ffffff");
}

/*
 * author: 현지
 * hidden 행을 display 하는 함수
 * "옵션 변경" 버튼을 누를 시 실행됨
 */
function display_opt(e, colorCode, sizeCode, pcommonId, pcolorId, count) {
	/*
	 * 컬러 리스트를 보여주는 부분
	 */
	// 비동기로 컬러 리스트 데이터를 요청할 url
	var url = "/cart/selectColors";
	// 행마다 특정된 id를 가진 element에 컬러칩 jsp fragment가 들어감
	var id_color = "#select_color" + count;
	// pcommonId 데이터를 전송해 비동기 처리 후 컬러 리스트를 가져오는 부분
	$.ajax({
		url : url,
		method : "post",
		// pcommonId를 이용해 공통 상품이 가지고있는 색상의 리스트를 보여줌
		data : {"pcommonId":pcommonId},
		success : function(result) {
			// 색상 리스트를 보여주는 jsp 파일을 id값을 가진 태그 사이에 삽입
			$(id_color).html(result);

			// 회원이 장바구니에 담은 상품의 기존 선택되어있는 컬러칩을 표시해줌
			// css 표시할 class 이름
			var colorClass = ".opt_color" + colorCode;
			$(colorClass).find("a").addClass("on");
		}
	});
	/*
	 * 사이즈 배리에이션을 보여주는 부분
	 * 옵션을 변경하기 전이기 때문에, 현재 장바구니에 담긴 컬러에 해당하는 사이즈 배리에이션이 표시되어야 한다
	 */
	// 비동기로 사이즈 배리에이션 데이터를 요청할 url
	var url = "/cart/selectSizesByPcolorId";
	// 행마다 특정된 id를 가진 element에 사이즈 배리에이션 jsp fragment가 들어감
	var id_size = "#select_size" + count;
	// pcolorId 데이터를 전송해 비동기 처리 후 사이즈 배리에이션을 가져오는 부분
	$.ajax({
		url:url,
		method:"post",
		// pcolorId를 이용해 현재 선택된 색상의 상품이 가지고있는 사이즈 배리에이션을 보여줌
		data:{"pcolorId":pcolorId},
		success:function(result) {
			// 사이즈 배리에이션을 보여주는 jsp 파일을 id값을 가진 태그 사이에 삽입
			$(id_size).html(result);
			
			// 회원이 장바구니에 담은 상품의 기존 선택되어있는 컬러의 사이즈칩을 표시해줌
			// css 표시할 class 이름
			let currSizeCs = "."+sizeCode;
			$(id_size).find(currSizeCs).css("background-color", "#8CB297");
			$(id_size).find(currSizeCs).css("color","#ffffff");
		}
	});
	// 옵션 변경 버튼을 누르면 숨겨져있던 옵션 변경 row가 보여지는 부분
	let next_tr = $(e).closest("tr").next();
	let closest_basket_info = $(next_tr).find(".basket_info");
	$(closest_basket_info).attr("style", "display: block;");
}

/*
 * author: 현지
 * 다시 옵션 변경 row를 숨기는 함수
 */
function hidden_opt(e) {
	let closest_basket_info = $(e).closest(".basket_info");
	$(closest_basket_info).attr("style", "display: hidden;");
}

/*
 * author: 현지
 * 선택된 상품의 데이터를 주문서 폼에 넘겨주는 함수
 * DB를 거치지 않고 request범위에 저장하기 위해서이다.
 * "선택상품 주문하기" 버튼 클릭 시 실행되는 함수
 */
function makeOrder() {
	// 선택된 상품을 가져온다
	var checkedElems = $(".entryProductCheck:checked");
	// 선택된 상품이 없는 경우
	if (checkedElems.length < 1) {
		alert("상품을 선택해주세요.");
		return "";
	// 선택된 상품이 있는 경우
	} else {
		// 배열을 만든다
		var products = [];
		// 선택된 상품을 루프를 돌린다
		checkedElems.each(function () {
			// 선택된 상품의 행
			var row = $($(this).closest("tr"));
			// 선택된 상품의 pcolorId
			var pcolorId = row.find(":input[name='hidden_pcolorId']").val();
			// 선택된 상품의 brandName
			var brandName = row.find(":input[name='hidden_brand_name']").val();
			// 선택된 상품의 productName
			var productName = row.find(":input[name='hidden_product_name']").val();
			// 선택된 상품의 colorCode
			var colorCode = row.find(":input[name='hidden_color_code']").val();
			// 선택된 상품의 sizeCode
			var sizeCode = row.find(":input[name='hidden_size_code']").val();
			// 선택된 상품의 대표 이미지
			var img = row.find(":input[name='hidden_img1']").val();
			// 선택된 상품의 (단일 가격 * 수량)이 적용된 가격
			var appliedPrice = Number(row.find(":input[name='hidden_applied_price']").val());
			// 선택된 상품의 수량
			var quantity = Number(row.find(":input[name='hidden_quantity']").val());
			
			// 위의 정보를 json으로 만든다
			var json = {
				// "name" : "value" 형식으로 적어주지 않아도 알아서 "name" : "value"형식으로 할당된다
				pcolorId,
				brandName,
				productName,
				colorCode,
				sizeCode,
				img,
				appliedPrice,
				quantity
			};
			// json 객체를 배열에 넣는다
			products.push(json);
		});
		console.log("products = ", products);
		
		// 상품 합계 금액
		var totalPrice = Number($("#finalPrice").val());
		
		// json 객체에 상품 정보 배열과 상품 합계 금액을 넣는다
/* orderContent = 
			{"products": [
				0: {"pcolorId" : ~,
					"brandName" : ~, ...},
				1: {"pcolorId" : ~,
					"brandName" : ~, ...},
					...
			],
			"totalPrice" : 929000} */
		var orderContent = {
				products,
				totalPrice
		}
		
		console.log("orderContent = ", orderContent);
		// json 객체를 문자열화 함
		var strOrderContent = JSON.stringify(orderContent);
		// 문자열화 된 json 객체를 input값에 넣어줌
		$("#orderContent").val(strOrderContent);
		// 해당 input을 자식으로 가지는 폼을 submit함
		$("#orderForm")[0].submit();
	}
}
</script>

<%@ include file="/WEB-INF/views/common/footer.jsp"%>