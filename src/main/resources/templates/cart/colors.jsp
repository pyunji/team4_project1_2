<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%-- 기존 코드 백업 --%>
<%-- <a href="javascript:void(0);" onclick="setOptions(this, '4', 'CM2B9WOT400W_SW', 'style');" class="beige on"
	style="background: #362626 url('${color.colorImg}')">${color.colorCode}</a> --%>
<div class="opt_color_wrap">
	<c:forEach var="color" items="${colors}">
		<div class="opt_color${color.colorCode}">
			<a href="javascript:void(0);" onclick="set_color(this);"
			style="background: #362626 url('${color.colorImg}')">${color.colorCode}</a>
		</div>
	</c:forEach>
</div>
