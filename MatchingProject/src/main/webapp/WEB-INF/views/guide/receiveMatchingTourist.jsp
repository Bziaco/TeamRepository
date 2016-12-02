<%@ page contentType= "application/json; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


[
	<c:forEach var="tourist" items="${list}" varStatus="status">
		{
			"mid": "${tourist.mid}",
			"mname": "${tourist.mname}", 
			"aname": "${tourist.aname}",
			"grno": "${tourist.grno}",
			"savedfile": "${tourist.savedfile}"
		}
		<c:if test="${!status.last}">,</c:if>
	</c:forEach>
] 