<%@ page contentType= "application/json; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<c:if test="${member != null}">
	{
		"result":"success",
		"member": {
			"mid":"${member.mid}",
			"mnickname":"${member.mnickname}",
			"mname":"${member.mname}",
			"mage":"${member.mage}",
			"msex":"${member.msex}",
			"memail":"${member.memail}",
			"mlocal":"${member.mlocal}",
			"mtel":"${member.mtel}"
		}
	}
</c:if>

<c:if test="${member == null}">
	{
		"result": "fail"
	}	
</c:if>
