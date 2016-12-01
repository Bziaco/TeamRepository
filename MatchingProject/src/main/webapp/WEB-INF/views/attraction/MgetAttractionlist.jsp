<%@ page contentType= "application/json; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
[
<c:forEach var="MgetAttractionlist" items="${list}" varStatus="status">
		{
			"ano":"${MgetAttractionlist.ano}",
			"aname":"${MgetAttractionlist.aname}",
			"alocation":"${MgetAttractionlist.alocation}",
			"ainfo":"${MgetAttractionlist.ainfo}",
			"savedfile":"${MgetAttractionlist.savedfile}"
		}
	<c:if test="${!status.last}">,</c:if>
</c:forEach>
]
