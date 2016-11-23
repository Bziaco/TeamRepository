<%@ page contentType= "application/json; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

{
	"result":"success",
	"member": {
		"mname":"${member.mname}",
		"mlocal":"${member.mlocal}",
		"mtel":"${member.mtel}",
		"memail":"${member.memail}",
		"mage":"${member.mage}",
		"msex":"${member.msex}",
		"mmatching":"${member.mmatching}",
		"mphoto":"${member.savedfile}"
	}
}
