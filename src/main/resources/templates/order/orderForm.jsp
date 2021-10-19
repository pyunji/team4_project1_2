<%@ page contentType="text/html; charset=UTF-8"%>

<%@ include file="/WEB-INF/views/common/headerAboveLinks.jsp"%>
<%@ include file="/WEB-INF/views/special/orderFormLinks.jsp"%>
<%@ include file="/WEB-INF/views/common/headerBelowLinks.jsp"%>
<%
Integer totalPrice = (Integer) request.getAttribute("totalPrice");
%>
<!-- bodyWrap -->
<div id="bodyWrap">
	<h3 class="cnts_title">
		<span>배송&amp;결제정보 입력</span>
	</h3>
	<%-- sub_container --%>
	<div class="sub_container">
		<%-- orderwrap --%>
		<div class="orderwrap del_pay">
			<!--orderwrap left-->
			<div class="float_left">
				<%-- table wrap1 --%>
				<div id="checkoutCartView" class="tblwrap">
					<table class="tbl_ltype ">

						<caption>배송&amp;결제정보 입력</caption>
						<colgroup>
							<col>
							<col style="width: 66px">
							<col style="width: 158px">
						</colgroup>
						<thead>
							<tr>
								<th scope="col">상품정보</th>
								<th scope="col">수량</th>
								<th scope="col">판매가/쿠폰 적용가</th>
							</tr>
						</thead>
						<tbody>
							<%-- 선택해서 주문중인 상품 정보 리스트 --%>
							<c:forEach var="product" items="${cartProducts}">
								<tr class="al_middle">
									<td class="frt">
										<div class="pt_list_all">
											<a href="/cart/set/${product.pcolorId}"> <img
												src="${product.img}" alt="">
											</a>
											<div class="tlt_wrap">
												<a href="/cart/set/${product.pcolorId}" class="basket_tlt">
													<span class="tlt">${product.brandName}</span> <span
													class="sb_tlt">${product.productName}</span>
												</a>
												<p class="color_op">
													color : ${product.colorCode} <span class="and_line">/</span>
													size : ${product.sizeCode}
												</p>
											</div>
										</div>
									</td>
									<td>${product.quantity}</td>
									<td>
										<!-- price_wrap -->
										<div class="price_wrap ">
											<span> ₩ <fmt:formatNumber type="number" maxFractionDigits="3" value="${product.appliedPrice}"/> </span>
										</div>
									</td>
								</tr>
							</c:forEach>
							<%-- //선택해서 주문중인 상품 정보 리스트 --%>
						</tbody>
					</table>
				</div>


				<!--주문자 정보 입력-->
				<div class="title_wrap clearfix mt40">
					<h4 class="float_left">주문자 정보</h4>
				</div>
				<div class="tblwrap">
					<table class="tbl_wtype1">
						<caption>주문자 정보</caption>
						<colgroup>
							<col style="width: 140px">
							<col>
						</colgroup>
						<tbody>
							<tr>
								<th scope="row" class="th_space">주문자</th>
								<%-- 주문자 이름 --%>
								<td>${member.name}</td>
							</tr>
							<tr>
						<c:set var="TextValue" value="${member.phone}" />
						<th scope="row" class="th_space">휴대폰</th>
						<td>
							${fn:substring(TextValue,0,3) } - 
							${fn:substring(TextValue,3,7) } - 
							${fn:substring(TextValue,7,11) }
						</td>
							</tr>
							<tr>
								<th scope="row" class="th_space">E-mail</th>
								<%-- 주문자 이메일 --%>
								<td>${member.email}</td>
							</tr>
						</tbody>
					</table>
				</div>


				<!--배송지 정보 -->
				<div class="title_wrap clearfix mt40" id="deliveryAddressDisplay">
					<h4 class="float_left">배송지 정보</h4>
					<p class="reqd_txt none">
						<strong class="reqd">*</strong> 표시는 필수항목입니다.
					</p>
					<div class="btn_wrap">
						<a href="javascript:customerAddress();" class="btn wt_ss">주문고객과 동일</a> 
						<a href="javascript:resetAddress();" class="btn wt_ss mr0">새로작성하기</a>
					</div>
				</div>

				<div class="tblwrap" id="deliveryInfoTitle">
					<table class="tbl_wtype1">
						<caption>배송지 정보</caption>
						<colgroup>
							<col style="width: 140px">
							<col>
						</colgroup>
						<tbody>
							<tr>
								<th scope="row" class="tooltip191022">
									<strong class="reqd">*</strong>
									<label for="adress">배송지 주소</label>
									<span class="ico_question">icon</span>
									<div class="delch_box190816">
										<span class="arr">위치아이콘</span>
										<ul class="bul_sty01_li">
											<li>기본배송지 변경은 <strong>마이페이지&gt; [배송지관리]</strong> 에서 가능합니다.</li>
											<li>기본배송지 설정 시 기본배송지가 최우선으로 노출 됩니다.</li>
										</ul>
									</div>
								</th>
								<td>
									<!-- 주소지 입력 --> 
									<input onclick="goPopup()"
											value="${member.zipcode}" title="우편번호" id="adress"
											name="postcode" class="post inputclear" type="text" readonly="">
									<form:errors cssClass="text-danger" path="orderForm.zipcode"/>
									<br>
									<div id="basis_bk_flag">
										<input onclick="goPopup()" value="${member.address1}"
											title="주소1" name="line1" id="line1"
											class="post_wall top inputclear" type="text" readonly="">
									</div> 
										<input onclick="goPopup()" value="${member.address2}"
											title="주소2" name="line2" id="line2"
											class="post_wall inputclear" type="text" maxlength="110">
									<form:errors cssClass="text-danger" path="orderForm.address" style="display:block;"/>
									
								</td>
							</tr>
							<tr>
								<th scope="row">
									<strong class="reqd">*</strong>
									<label for="rcpt_name">수령인</label>
								</th>
								<td>
									<input value="${member.name}" title="수령인"
										id="rcpt_name" name="lastName" class="inputclear"
										maxlength="13" type="text" style="width: 118px;">
									<form:errors cssClass="text-danger" path="orderForm.receiver"/>
								</td>
							</tr>
							<!-- 휴대폰 번호 -->
							<tr>
								<th scope="row">
									<strong class="reqd">*</strong>
									<label for="hp">휴대폰 번호</label>
								</th>
								<td>
									<!-- hp --> 
									<c:set var="hpnum1" value="${fn:substring(member.phone,0,3)}" /> 
									<select id="hp" name="hp_num1" title="휴대폰 번호 앞자리" class="hp_num1">
										<option value="010"
											<c:if test="${hpnum1==010}">selected</c:if>>010
										</option>
										<option value="011"
											<c:if test="${hpnum1==011}">selected</c:if>>011
										</option>
										<option value="016"
											<c:if test="${hpnum1==016}">selected</c:if>>016
										</option>
										<option value="017"
											<c:if test="${hpnum1==017}">selected</c:if>>017
										</option>
										<option value="018"
											<c:if test="${hpnum1==018}">selected</c:if>>018
										</option>
										<option value="019"
											<c:if test="${hpnum1==019}">selected</c:if>>019
										</option>
									</select>
									<div class="form_hyphen">-</div> 
									<input title="휴대폰 번호 가운데자리"
										name="hp_num2" id="hp_num2" class="hp_num2 inputclear"
										type="text" maxlength="4" numberonly="true"
										value="${fn:substring(member.phone,3,7)}">

									<div class="form_hyphen">-</div> 
									<input title="휴대폰 번호 뒷자리"
										name="hp_num3" id="hp_num3" class="hp_num2 inputclear"
										type="text" maxlength="4" numberonly="true"
										value="${fn:substring(member.phone,7,13)}"> <!-- //hp -->
									<span style="color:red;" id="hp_num_error"></span>
									<div><form:errors cssClass="text-danger" path="orderForm.tel"/></div>
								</td>
							</tr>
							<tr>
								<th scope="row" class="th_space">
									<label for="ph">연락처</label>
								</th>
								<td>
									<!-- 연락처 입력 -->
									<select name="ph_num1" id="ph" title="연락처 앞자리" class="hp_num1">
										<option value="">선택</option>
										<option value="02">02</option>
										<option value="031">031</option>
										<option value="032">032</option>
										<option value="033">033</option>
										<option value="041">041</option>
										<option value="042">042</option>
										<option value="043">043</option>
										<option value="044">044</option>
										<option value="051">051</option>
										<option value="052">052</option>
										<option value="053">053</option>
										<option value="054">054</option>
										<option value="055">055</option>
										<option value="061">061</option>
										<option value="062">062</option>
										<option value="063">063</option>
										<option value="064">064</option>
									</select>

									<div class="form_hyphen">-</div> 
									<input title="연락처 가운데자리"
										name="ph_num2" id="ph_num2" class="hp_num2 inputclear"
										type="text" maxlength="4" numberonly="true">

									<div class="form_hyphen">-</div>
									<input title="연락처 뒷자리"
										name="ph_num3" id="ph_num3" class="hp_num2 inputclear"
										type="text" maxlength="4" numberonly="true">
									<span style="color:red;" id="ph_num_error"></span>
								</td>
							</tr>
							
							<!-- 배송 요청 사항 -->
							<tr>
								<th scope="row" class="th_space">
									<label for="orderr">배송요청사항</label>
								</th>
								<td>
									<div class="input_sumtxt">
										<div class="input_sumtxt_box">
											<!-- input -->
											<input class="inputclear" id="orderr"
												name="deliveryRequestContents" type="text" value=""
												title="배송요청사항" maxlength="20">
										</div>
									</div>
								</td>
							</tr>
							<tr>
								<th scope="row" class="th_space">
									<label for="mail">수령인 E-mail</label>
								</th>
								<td>
									<!-- 이메일 입력 --> 
									<input type="text" id="mail" name="mail"
										title="이메일 아이디" class="em_form inputclear">
									<span class="andmail">@</span>
									<input type="text" value=""
											name="emailDely" id="emailDely" title="직접입력"
											class="em_form inputclear"> 
									<select title="이메일 계정" id="emailDelySel" class="em_select">
										<option value="">직접입력</option>
										<option value="naver.com">naver.com</option>
										<option value="gmail.com">gmail.com</option>
										<option value="daum.net">daum.net</option>
										<option value="nate.com">nate.com</option>
										<option value="hanmail.net">hanmail.net</option>
										<option value="yahoo.com">yahoo.com</option>
										<option value="dreamwiz.com">dreamwiz.com</option>
									</select>
									<span style="color:red;" id="email_error"></span>
									<form:errors cssClass="text-danger" path="orderForm.email"/>
								</td>
							</tr>
						</tbody>
					</table>
					<ul class="bul_sty01_li">
						<li>선택사항을 미입력하더라도 불이익은 발생하지 않습니다.</li>
					</ul>
				</div>

				<!--결제 수단 입력-->
				<div class="title_wrap clearfix mt40">
					<h4 class="float_left">결제 수단 선택</h4>
				</div>
				<div class="tblwrap">
					<table class="tbl_wtype1">
						<caption>결제 수단 선택</caption>
						<colgroup>
							<col style="width: 140px">
						</colgroup>
						<table class="tbl_wtype1">
							<caption>결제 수단 선택</caption>
							<colgroup>
								<col style="width: 140px">
								<col>
							</colgroup>
							<tbody>
								<tr>
									<th scope="row" class="th_space">
										<label for="pointpay">한섬마일리지 결제</label>
									</th>
									<td>
										<!-- 한섬마일리지 결제 입력 -->
										<div class="point_wrap">
											<input onkeyup="inputMileage();" title="한섬마일리지 결제"
												class="inpput" type="text" id="pointpay" name="usePoint"
												numberonly="true" value="0">
											<p class="p_txt">
												M 사용 (잔액 : <span>${mileageSum}</span> M)
											</p>

											<div class="point_apply">
												<div class="all">
													<input title="선택" value="" type="checkbox"
														id="point_useall"> <span> <label
														for="point_useall">모두사용</label>
													</span>
												</div>
												<input id="btnUsePoint" class="btn add_s min_auto"
													value="적용" type="button" onclick="doUsePoint(this);">
												<input id="btnCancelUsePoint" class="btn dis_s min_auto"
													value="적용취소" type="button" onclick="cancelUsePoint(this);">
											</div>

											<p class="txt_guide">* 1마일리지 = 1원</p>
										</div>
									</td>
								</tr>
							<tbody>
								<tr>
									<th scope="row" class="th_space">결제수단 선택</th>
									<td>
										<div class="rd_wrap payment_way1907">
											<ul>
												<li>
													<%-- value가 0이면 카드결제 --%>
													<input type="radio" name="mode" id="sel_rd1"
														value="0" onclick="showCkout(this);">
													<label for="sel_rd1" class="mr20">신용카드</label>
												</li>

												<li>
													<%-- value가 1이면 계좌결제 --%>
													<input type="radio" name="mode" id="sel_rd2"
														value="1" onclick="showCkout(this);">
													<label for="sel_rd2" class="mr20">실시간 계좌이체</label>
												</li>
												<li>
													<%-- value가 2이면 마일리지결제 --%>
													<input type="radio" name="mode" id="sel_rd6"
														value="2" onclick="showCkout(this);">
													<label for="sel_rd6" class="mr20">한섬 마일리지</label>
												</li>
												<span style="color:red;" id="payment_method_error"></span>
											</ul>
										</div>
									</td>
								</tr>
								<tr id="paydetail">
									<%-- ajax로 들어갈자리 --%>
								</tr>
							</tbody>
						</table>
					</table>
				</div>
			</div>
			<div class="float_right" style="position: sticky; left: 680px; top: 140px;">
				<!--오른쪽 박스 최종 결제 금액-->
				<div class="sum_box">
					<div>
						<p class="tlt">최종 결제 금액</p>
						<hr>
						<dl class="clearfix">
							<dt class="sub_total190816">상품 합계</dt>
							<dd class="sub_total190816" id="subTotal">${totalPrice}</dd>
							<%-- 마일리지 관련된 정보가 javascript로 추가되는 자리--%>
						</dl>
					</div>
					<div class="total">
						<dl class="clearfix">
							<dt>합계</dt>
							<%--계산된 값이 할당되게 변경해주세요 --%>
							<dd id="totalPrice">${totalPrice}</dd>
						</dl>
					</div>
				</div>
				<!-- 구매시 지급 예정 포인트-->
				<div class="p_a_box">
					<div class="point">
						<!-- 간편회원이 아닐 때 s -->
					</div>

					<div class="agree">
						<input type="checkbox" id="agree"> 
						<label for="agree" class="tlt"> 구매자 동의</label>
						<p class="txt">
							주문할 상품의 상품명, 가격, 배송정보 등 <br> 판매조건을 확인하였으며, 구매진행에 동의합니다. <br>
							(전자상거래법 제8조 2항) <br> <br> 기존 마이너스 한섬마일리지를 보유하고 있는 고객은
							한섬마일리지가 차감되어 적립되는 것에 동의합니다. 적립 예정 한섬마일리지가 상이할 수 있습니다.
						</p>
					</div>
				</div>
				<span id="doOrderBtn"> 
				<!-- ** 폼의 요청 경로와 같은 경로로 href 주면 안됩니다. form의 action을 통해서만 페이지를 전환해야 합니다. -->
					<a href="javascript:void(0)" style="background-color:#f5f5f5; color:silver" class="btn gray">결제하기</a>
				</span>
				<div>
					<form id="orderform" method="post" action="${pageContext.request.contextPath}/order/ordercomplete">
						<input type="hidden" name="zipcode" value=""></input>
						<input type="hidden" name="address" value=""></input>
						<input type="hidden" name="receiver" value=""></input>
						<input type="hidden" name="phone" value=""></input>
						<input type="hidden" name="tel" value=""></input>
						<input type="hidden" name="memo" value=""></input>
						<input type="hidden" name="email" value=""></input>
						<input type="hidden" name="usedMileage" value=""></input>
						<input type="hidden" name="beforeDcPrice" value=""></input>
						<input type="hidden" name="afterDcPrice" value=""></input>
						<input type="hidden" name="paymentInfo" value="1101-3211-3332-5321"></input>
						<input type="hidden" name="status" value="주문완료"></input>
						<input type="hidden" name="deliveryStatus" value="준비중"></input>
						<input type="hidden" name="memberId" value="${member.id}"></input>
						<input type="hidden" name="paymentMethodCode" value=""></input>
						<input type="hidden" name="orderContent" value=""></input>
					</form>
				</div>
			</div>
		</div>
	</div>
</div>



<script>
		

		
		
		
		
		
		
		/* 구매자 동의 체크되어야 onclick 속성 추가되어 결제가능*/
		$("#agree").change(function(){
			var check = $("#agree").is(":checked");
			if(check == true){
				$("#doOrderBtn a").attr("onclick","order()").css("background-color","#4a4a4a").css("color","white");
			} else if(check == false){
				$("#doOrderBtn a").removeAttr("onclick").css("background-color","#f5f5f5").css("color","silver").css("border","");
			}
		});
		
		
		/* 주문하기 클릭시 */
		function order(){
			
			//유효성 검사를 위한 변수 선언
			var checkResult = true;
			
			/* hidden Form에 value값 넣기위함. */
			$("input[name=zipcode]").val($("#adress").val());
			$("input[name=address]").val($("#line1").val()+' '+$("#line2").val());
			$("input[name=receiver]").val($("#rcpt_name").val());
			$("input[name=memo]").val($("#orderr").val());
			
			const phnumpattern = /[0-9]{3}[0-9]{3,4}[0-9]{4}/i;
			let hpNumCheckValue = $("#hp option:selected").val()+$("#hp_num2").val()+$("#hp_num3").val();
			const hpnumResult = phnumpattern.test(hpNumCheckValue);
			
			/* (휴대폰번호)에러 표시 영역 초기화 */
			$("#hp_num_error").html(" ");
			/* (휴대폰번호) 유효성검사 결과에 따라 CheckResult false로 변환 */
			if(hpnumResult == true){
				$("input[name=phone]").val(hpNumCheckValue);
			} else if(hpnumResult == false){
				$("#hp_num_error").html("번호형식오류");
				checkResult = false;
			}
			
			let phnumValue = $("#ph option:selected").val()+$("#ph_num2").val()+$("#ph_num3").val();
			let phnumCheckValue = $("#ph_num2").val()+$("#ph_num3").val();
			$("#ph_num_error").html(" ");
			/* (전화번호번호) 유효성검사 결과에 따라 에러 표시, CheckResult false로 변환 */
			/* (전화번호)는 선택사항이므로 아무 값을 넣지 않아도 된다. 그러나 값이 있을때는 유효성 검사가 필요하다. */
			if(phnumCheckValue != ""){
				const phnumResult = phnumpattern.test(phnumValue);
				if(phnumResult == true){
					$("input[name=tel]").val(phnumValue);
				} else if(phnumResult == false){
					$("#ph_num_error").html("번호형식오류");
					checkResult = false;
				}
			}
			
			const emailPattern = /([\w-]+(?:\.[\w-]+)*)@((?:[\w-]+\.)*\w[\w-]{0,66})\.([a-z]{2,6}(?:\.[a-z]{2})?)/i;
			let emailCheckValue = $("#mail").val()+'@'+$("#emailDely").val();
			
			/* (E-mail)에러 표시 영역 초기화 */
			$("#email_error").html(" ");
			/* (E-mail) 유효성검사 결과에 따라 에러 표시, CheckResult false로 변환 */
			if(emailCheckValue != "@"){
				const emailCheckResult = emailPattern.test(emailCheckValue);
				if(emailCheckResult == true){
					$("input[name=email]").val(emailCheckValue);
				} else if(emailCheckResult == false){
					$("#email_error").html("이메일형식 오류");
					checkResult = false;
				}
			}
			
			/* 사용한 마일리지 값가져와서 hidden form에 value 넣기 */
			const usedMileage = $("#pointpay").val();
			if(usedMileage == ""){
				$("input[name=usedMileage]").val("0");
			}else{
				$("input[name=usedMileage]").val($("#pointpay").val());
			}
			$("input[name=beforeDcPrice]").val(${totalPrice});
			$("input[name=afterDcPrice]").val(${totalPrice}-$("#pointpay").val());
			$("input[name='orderContent']").val(JSON.stringify(${orderContent}));
			/* (결제수단)이 선택되지 않았다면 , CheckResult false로 변환 */
			/* 결제수단을 선택하라는 에러표시 */
			if($("input[name='mode']:checked").val() == 0 || $("input[name='mode']:checked").val() == 1){
				$('input[name=paymentMethodCode]').val($("input[name='mode']:checked").val()+$("select[name=company]").val());
			}else if( $("input[name='mode']:checked").val() == 2){
				$('input[name=paymentMethodCode]').val($("input[name='mode']:checked").val());
			}else{
				$("#payment_method_error").html("결제수단을 선택해주세요.");
				checkResult = false;
			}
			
			var ordform = $("#orderform");
			
			
			//유효성 검사 결과가 true일때만 결제가 된다.
			if(checkResult == true){
				ordform.submit();
			}
		}
		
		
		/* 오른쪽 결제하기 부분 sticky 적용을 위한 부분 및 금액 표시를 위한 부분 */
		$(function(){
			let bodyHeight = $("#bodyWrap").height();
			$(".orderwrap").css('height',bodyHeight);
			let subtotal = Number($("#subTotal").text());
			let totalprice = Number($("#totalPrice").text());
			$("#subTotal").text('₩ '+subtotal.toLocaleString());
			$("#totalPrice").text('₩ '+totalprice.toLocaleString());
			$("#sel_rd6").prop("disabled", true);
		});

		/* 신용카드 혹은 실시간 계좌이체 체크시 */
		/* ajax로 DB에 다녀오고 #patdetail에 추가 */
		function showCkout(obj){
			if(obj.id == 'sel_rd1'){
				$.ajax({
					url:"/order/paymentlist",
					method:"get",
					data: {"method":"카드"},
					success: function(data){
						var insert = '<th scope="row" class="th_space">';
						insert += '<label for="orderr">카드사</label>';
						insert += '</th><td><select name="company">';
						for(let val in data){
							insert += '<option>'+data[val].company+'</option>';
						}
						insert += '</select></td>';
						$("#paydetail").empty();
						$("#paydetail").append(insert);
					}
				});
			}else if(obj.id == 'sel_rd2'){
				$.ajax({
					url:"/order/paymentlist",
					method:"get",
					data: {"method":"계좌"},
					success: function(data){
						var insert = '<th scope="row" class="th_space">';
						insert += '<label for="orderr">은행사</label>';
						insert += '</th><td><select name="company">';
						for(let val in data){
							insert += '<option>'+data[val].company+'</option>';
						}
						insert += '</select></td>';
						$("#paydetail").empty();
						$("#paydetail").append(insert);
					}
				});
			}else if(obj.id == 'sel_rd6'){
				$("#paydetail").empty();
			}
			
		}
		
		
		/* 마일리지 입력시 오입력을 체크하기 위한 부분 */
		function inputMileage(){
			let mileageSum = parseInt('${mileageSum}');
			let insertedValue = $("#pointpay").val();
			if(insertedValue>=mileageSum){
				$("#pointpay").val(mileageSum);
				$(".p_txt span").text('0');
			}else if(insertedValue<mileageSum && insertedValue>0){
				$(".p_txt span").text(mileageSum-insertedValue);
			}else{
				$("#pointpay").val('');
				$(".p_txt span").text(mileageSum);
			}
		}
		
		var btn = true;
		
		/* 마일리지 적용버튼 누를시 */
		function doUsePoint(apply){
			$("#pointpay")
			.prop('readonly', true)
			.css('background-color','lightgray');
			$("#point_useall").attr("disabled",true);
			apply.setAttribute("style","color:#c7c7c7");
			$("#btnCancelUsePoint").css('color','black');
			if($("#pointpay").val()!=0 && btn == true){
				$("#subTotal").after($('<dt class=delch_wrap190816><p class="tlt_ship190816">마일리지사용</p><div class="delch_box190816" style="display: none;"><span class="arr">위치아이콘</span><ul class="bul_sty01_li"></ul></div></dt><dd id="deliveryCost">-'+$("#pointpay").val().toLocaleString()+'</dd>'));
				btn = false;
			}
			//한섬마일리지 사용시 마일리지 버튼 비활성화
			$("#sel_rd6").prop("disabled", true);
			//총합계금액은 상품금액 - 마일리지금액
			$("#totalPrice").text('₩'+(${totalPrice}-$("#pointpay").val()).toLocaleString());
			
			
			//마일리지 사용금액과 상품금액이 같다면 "신용카드, 실시간계좌이체 부분 비활성화, 한섬마일리지 check"
			if($("#pointpay").val() == ${totalPrice}){
				$("#sel_rd1").prop("disabled",true);
				$("#sel_rd2").prop("disabled",true);
				$("#sel_rd6").prop("disabled", true);
				$("#sel_rd6").prop("checked", true);
			}
		}
		
		/* 쿠폰취소버튼 누를시 */
		function cancelUsePoint(cancel){
			$("#pointpay")
			.prop('readonly', false)
			.css('background-color','');
			$("#point_useall").attr("disabled",false);
			cancel.setAttribute("style","color:#c7c7c7");
			$("#btnUsePoint").css('color','black');
			if($("#pointpay").val()!=0 && btn == false){
				$("#subTotal").next().next().remove();
				$("#subTotal").next().remove();
				btn = true;
				$("#totalPrice").text('₩'+(${totalPrice}).toLocaleString());
			}
			$("#sel_rd1").attr("disabled",false);
			$("#sel_rd2").attr("disabled",false);
			$("#sel_rd6").prop("checked", false);
		}

		/* email이 select될 때 옆에 input값도 함께 바꿔주는 부분 */
		$("#emailDelySel").change(function(){
			$("#emailDely").val($("#emailDelySel").val());
		});
		
		
		/* 포인트 모두사용 클릭시 혹은 해제시*/
		$("#point_useall").change(function(){
			let subtotal = ${totalPrice};
			let mileageSum = ${mileageSum};
			if($("input:checkbox[id=point_useall]").is(":checked") == true) {
				/* 모두사용 체크가 되어있을 경우 */
				if(subtotal>mileageSum){
					$("#pointpay").val(mileageSum);
					$(".p_txt span").text('0');
					
				}else{
					$("#pointpay").val(subtotal);
					$(".p_txt span").text(mileageSum-subtotal);
				}
			} else {
				/* 모두사용 체크가 되어있지 않을 경우 */
				$(".p_txt span").text(mileageSum);
				$("#pointpay").val('0');
			}
		});
	
		/* 주문고객과 동일 버튼 클릭시, 고객 default 정보 */
		function customerAddress(){
			$("#rcpt_name").val('${member.name}');
			$("#adress").val(${member.zipcode});
			$("#line1").val('${member.address1}');
			$("#line2").val('${member.address2}');
			$("#hp_num2").val(${fn:substring(member.phone,3,7)});
			$("#hp_num3").val(${fn:substring(member.phone,7,13)});
			$("#hp").val("${fn:substring(member.phone,0,3)}").prop("selected",true);
		}
		
		/* 새로작성하기 클릭시 초기화 */
		function resetAddress(){
			let clearList = $(".inputclear");
			for(let i=0; i<clearList.length; i++){
				clearList[i].value = null;
			}
			$("#hp option:eq(0)").prop("selected",true);
		}
		
		
		
		/* 주소 API를 위한 부분 */
		function goPopup(){
			// 호출된 페이지(jusopopup.jsp)에서 실제 주소검색URL(https://www.juso.go.kr/addrlink/addrLinkUrl.do)를 호출하게 됩니다.
		    var popupX = (document.body.offsetWidth / 2) - (570 / 2);
			//만들 팝업창 좌우 크기의 1/2 만큼 보정값으로 빼주었음
			
			var popupY= (window.screen.height / 2) - (420/1.5);
			//만들 팝업창 상하 크기의 1/2 만큼 보정값으로 빼주었음
			
			var pop = window.open("${pageContext.request.contextPath}/addressPopup", "pop", "height=420, width=570, left="+ popupX + ", top="+ popupY);
		    
			// 모바일 웹인 경우, 호출된 페이지(jusopopup.jsp)에서 실제 주소검색URL(https://www.juso.go.kr/addrlink/addrMobileLinkUrl.do)를 호출하게 됩니다.
		    //var pop = window.open("/popup/jusoPopup.jsp","pop","scrollbars=yes, resizable=yes"); 
		}
		
		/* 주소API에서의 결과 값을 가져오기 위한 부분 */
		function jusoCallBack(roadFullAddr,roadAddrPart1,addrDetail,roadAddrPart2,engAddr, jibunAddr, zipNo, admCd, rnMgtSn, bdMgtSn,detBdNmList,bdNm,bdKdcd,siNm,sggNm,emdNm,liNm,rn,udrtYn,buldMnnm,buldSlno,mtYn,lnbrMnnm,lnbrSlno,emdNo){
			// 팝업페이지에서 주소입력한 정보를 받아서, 현 페이지에 정보를 등록합니다.
			$("#adress").val(zipNo);
			$("#line1").val(roadAddrPart1+' '+roadAddrPart2);
			$("#line2").val(addrDetail);
		}
	</script>



<%@ include file="/WEB-INF/views/common/footer.jsp"%>