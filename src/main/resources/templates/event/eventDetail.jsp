<%@ page contentType="text/html; charset=UTF-8" %>

<%@ include file="/WEB-INF/views/common/headerAboveLinks.jsp"%>
<%@ include file="/WEB-INF/views/special/eventDetailLinks.jsp"%>
<%@ include file="/WEB-INF/views/common/headerBelowLinks.jsp"%>



<div id="bodyWrap" class="products">
	<!--title-->
	<h3 class="cnts_title">
		<span> 이벤트 </span>
	</h3>
	<!--//title-->
	<div class="sub_container">
		<div class="mgz_view">
			<div class="evt_top">
				<p class="subj">${title}</p>
				<p class="date">${issueDate}</p>
			</div>
			<div class="evt_cnts">
				<div class="pic">
					<div class="event-pc-outerweek-2021-09-17">
						<img src="http://cdn.thehandsome.com/pc/event/detail/image/handsome_202109/event_outerweek_pc_img_01_01.gif" alt="">
						<img src="http://cdn.thehandsome.com/pc/event/detail/image/handsome_202109/event_outerweek_pc_img_01_02.jpg" alt="">
						
						<div class="event_button" id="event_button" >
						<a style="color:white" class="event_couponbutton" href="javascript:void(0);" onclick="winPopup()">쿠폰 받기</a>
						

        					<!-- <span style="color:white" class="event_couponbutton">쿠폰 받기</span> -->
 						</div>
	                	<div style="display:none;">
	                      <form name="frm">
	                         <input type="hidden" name="eventNo" value="${eventNo}"></input>
	                         <input type="hidden" name="limitCount" value="${limitCount}">
	                      </form>
                  		</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>

<script>
	function winPopup() {
		var popupX = (document.body.offsetWidth / 2) - (570 / 2);
		//만들 팝업창 좌우 크기의 1/2 만큼 보정값으로 빼주었음
		var popupY= (window.screen.height / 2) - (420/1.5);
		//만들 팝업창 상하 크기의 1/2 만큼 보정값으로 빼주었음
	
 		var popUrl = "${pageContext.request.contextPath}/event/coupondownload";
		var popOption = "top="+popupY+", left="+popupX+", width=500, height=300, status=no, menubar=no, toolbar=no, resizable=no";
		var title = "submitform";
		window.open("", title, popOption);
		
		var frmPop = $("form[name='frm']")[0];
		frmPop.action = popUrl;
		frmPop.target = title;
		frmPop.method = "post";
		frmPop.submit();
    }

</script>


<%@ include file="/WEB-INF/views/common/footer.jsp" %>
