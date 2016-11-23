<%@ page contentType= "text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<table class="table table-striped table-bordered table-list">
	<thead>
		<tr>
			<th class="hidden-xs">ID</th>
			<th>Local</th>
			<th>Intro</th>
			<th>Count</th>
		</tr>
	</thead>
	<tbody>
		<c:forEach var="guide" items="${list}">
			<tr>
				<td align="center"><a  id="btnDetailModal" href="#" >${guide.gid}</a></td>
				<td class="hidden-xs">${guide.glocal}</td>
				<td>${guide.gintro}</td>
				<td>${guide.count}</td>
			</tr>
		</c:forEach>	
	</tbody>
</table>



