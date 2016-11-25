<%@ page contentType= "application/json; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

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
		"mtel":"${member.mtel}",
		"mphoto":"${member.savedfile}"
	}
	
}
