<%@ page contentType="text/html; charset=UTF-8"%>
</head>
<body>

	<%-- headerWrap 시작 --%>
	<div id="headerWrap">
		<div class="header header_fixed header_main1903">
			<div class="top_nav topnav1903">
				<div class="top_nav_wrap clearfix">
					<div class="gnb_sh_wrap" style="display: none;">
						<div class="gnb_sh_box">
							<input type="text" class="input" id="gnbsearchwords" title="검색어 입력" value="" onkeypress="if(event.keyCode==13) {EnterSearchHeader(); return false;}">
							<a href="" id="gnbsearch">검색</a>
						</div>
					</div>
					<div class="util_menu" style="display: block;">
						<ul class="clearfix">
							<sec:authorize access="isAnonymous()">
								<li>
									<a href="${pageContext.request.contextPath}/member/loginform">로그인</a>
								</li>
							</sec:authorize>
							<sec:authorize access="isAuthenticated()">
								<li>
									<a href="${pageContext.request.contextPath}/logout">로그아웃</a>
								</li>
								<!-- 공백 없이 딱 붙어서 나와서 부트스트랩 클래스 추가함 -->
								<li class="mr-2">
									<a href="${pageContext.request.contextPath}/member/orderlist">마이페이지</a>
								</li>
							</sec:authorize>
						</ul>
					</div>
				</div>
			</div>


			<div class="gnbwarp com clearfix">
				<h1 class="logo logo1903">
					<a href="/" onclick="GA_Event('공통', '로고', '상단');">thehandsome.com</a>
				</h1>
			</div>
		</div>
		<%-- headerWrap 끝 --%>