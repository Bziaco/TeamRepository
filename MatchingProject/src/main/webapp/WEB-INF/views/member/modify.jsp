<%@ page contentType= "application/json; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<c:if test="${member != null}">
	{
		"result":"success"
	}
</c:if>

<c:if test="${member == null}">
	{
		"result": "fail"
	}	
</c:if>
