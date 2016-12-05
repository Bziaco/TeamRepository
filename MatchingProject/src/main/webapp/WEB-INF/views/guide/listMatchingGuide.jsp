<%@ page contentType= "application/json; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


[
	<c:forEach var="guide" items="${list}" varStatus="status">
		{
			"gid": "${guide.gid}",
			"glocal": "${guide.glocal}", 
			"gintro": "${guide.gintro}",
			"mname": "${guide.mname}",
			"savedfile": "${guide.savedfile}"
		}
		<c:if test="${!status.last}">,</c:if>
	</c:forEach>
] 