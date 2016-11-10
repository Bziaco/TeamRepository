<%@ page contentType = "text/html;charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
	</head>
	<body>
		로그인
		<hr/>
		<form method="post">
		<!-- value을 이용한 기본값 지정으로 JOin에서 예외가 발생하면 기존의 값들을 살리도록 했다 -->
			아이디: <input type="text" name="mid" value="${member.mid}"/> <a href="checkMid">중복체크</a>
			<br/>
			이름: <input type="text" name="mname" value="${member.mname}"/>
			<br/> 
			패스워드: <input type="password" name="mpassword" /> 
			<br/>
			휴대전화: <input type="tel" name="mtel" value="${member.mtel}"/>
			<br/>
			이메일: <input type="email" name="memail" value="${member.memail}"/>
			<br/>
			주소: <input type="text" name="maddress" value="${member.maddress}"/>
			<br/>
			<input type="submit" value="회원가입"/>
		</form>
	</body>
</html>