<%@ page contentType= "text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<c:forEach var="guideschedule" items="${list}">
	<div class="thumbnail" style="width:350px; display: inline-block;margin:6px;">
		<div class="caption">
			<div style="margin:0px 10px; height:270px;">
				<img src="member/getPhoto?savedfile=${guideschedule.tourist.savedfile}"
				style="float: right" class="img-rounded" alt="Cinque Terre" width="120" height="120"> 
				<span id="mname" style="font-weight: bold" >이름: ${guideschedule.tourist.mname}</span><br /> 
				<span id="mtel"style="font-weight: bold">전화: ${guideschedule.tourist.mtel}</span><br /> 
				<span id="memail"style="font-weight: bold">메일: ${guideschedule.tourist.memail}</span><br /> 
				<span id="mage"style="font-weight: bold">나이: ${guideschedule.tourist.mage}</span><br /> 
				<span id="msex"style="font-weight: bold">성별: ${guideschedule.tourist.msex}</span><br /> 
				<br/><br/>
				<span id="msex"style="font-weight: bold">제목: ${guideschedule.schedule.stitle}</span><br /> 
				<span id="msex"style="font-weight: bold">시작: ${guideschedule.schedule.sstart}</span><br /> 
				<span id="msex"style="font-weight: bold">종료: ${guideschedule.schedule.send}</span><br /> 
				<span id="msex"style="font-weight: bold">내용: ${guideschedule.schedule.scontent}</span><br /> 
			</div>
			<button type="button"
				class="btn btn-primary btn-xs btn-update btn-add-card"
				title="Introduce" data-toggle="popover" data-trigger="focus"
				data-placement="bottom"
				data-content="Hi, My hobby is coding. do you play coding with me?">Intro
			</button>
			<button id="btnMessageModal" type="button"
				class="btn btn-danger btn-xs btn-update btn-add-card" data-mto="test1">CHATTING
			</button>
		</div>
	</div>
</c:forEach>
