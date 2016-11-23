<%@ page contentType= "text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<c:forEach var="member" items="${list}">
	<div class="thumbnail" style="width:350px; display: inline-block;margin:6px;">
		<div class="caption">
			<div>   
				<!--
					<span class="glyphicon glyphicon-credit-card"></span>
					<span class="glyphicon glyphicon-trash pull-right text-primary"></span> 
				-->
			</div>
			<div>
				<h4>3Team</h4>
			</div>
			<div style="margin:0px 10px;">
				<img src="member/getPhoto?savedfile=${member.savedfile}"
				style="float: right" class="img-rounded" alt="Cinque Terre" width="120" height="130"> 
				<span id="mname" style="font-weight: bold" >Name: ${member.mname}</span><br /> 
				<span id="mlocal"style="font-weight: bold">Local: ${member.mlocal}</span><br /> 
				<span id="mtel"style="font-weight: bold">Tel: ${member.mtel}</span><br /> 
				<span id="memail"style="font-weight: bold">Email: ${member.memail}</span><br /> 
				<span id="mage"style="font-weight: bold">age: ${member.mage}</span><br /> 
				<span id="msex"style="font-weight: bold">Sex: ${member.msex}</span><br /> 
				<span id="mmatchingdate"style="font-weight: bold">MatchingDate: ${member.mmatchingdate}</span><br />
			</div>
			<button type="button"
				class="btn btn-primary btn-xs btn-update btn-add-card"
				title="Introduce" data-toggle="popover" data-trigger="focus"
				data-placement="bottom"
				data-content="Hi, My hobby is coding. do you play coding with me?">Intro</button>
			<button id="btnMessageModal" type="button"
				class="btn btn-danger btn-xs btn-update btn-add-card" data-mto="test1">CHATTING</button>
		</div>
	</div>
</c:forEach>
