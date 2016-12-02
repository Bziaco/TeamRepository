<%@ page contentType= "text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<c:forEach var="message" items="${list}">
	<c:if test="${login == message.mfrom}">
		<div class="row msg_container base_sent">
			<div class="col-md-10 col-xs-10">
				<div class="messages msg_sent" style="height:65px; background-color: #c0ffff;">
					<p>${message.mcontent}</p>
					<time>${message.mdate}</time>
				</div>
			</div>
			<div class="col-md-2 col-xs-2 avatar">
				<img src="/mymatch/resources/img/${message.mfromPhoto}" width="70px" height="65px">
			</div>
		</div>
	</c:if> 
	
	<c:if test="${login != message.mfrom}">
		<div class="row msg_container base_receive">
			<div class="col-md-2 col-xs-2 avatar">
				<img src="/mymatch/resources/img/${message.mfromPhoto}" width="70px" height="65px">
			</div>
			<div class="col-md-10 col-xs-10">
				<div class="messages msg_receive" style="height:65px;">
					<p>${message.mcontent}</p>
					<time>${message.mdate}</time>
				</div>
			</div>
		</div>
	</c:if>
</c:forEach>

