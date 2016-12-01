<%@ page contentType= "application/json; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


[
	<c:forEach var="tourist" items="${list}" varStatus="status">
		{
			"tid": "${tourist.tid}",
			"tlocal": "${tourist.tlocal}", 
			"tintro": "${tourist.tintro}",
			"mname": "${tourist.mname}",
			"savedfile": "${tourist.savedfile}"
		}
		<c:if test="${!status.last}">,</c:if>
	</c:forEach>
] 