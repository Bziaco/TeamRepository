<%@ page contentType= "application/json; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
[
<c:forEach var="attraction" items="${list}" varStatus="status">
		{
			"ano":"${attraction.ano}",
			"aname":"${attraction.aname}",
			"alocation":"${attraction.alocation}",
			"savedfile":"${attraction.savedfile}"
		}
	<c:if test="${!status.last}">,</c:if>
</c:forEach>
]
