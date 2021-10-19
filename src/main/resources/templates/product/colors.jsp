<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<c:forEach var="color" items="${colors}">
	<img onclick="moveToProductDetail();" src="${color.colorImg}" style="width:18px; height:18px;"/>
</c:forEach>