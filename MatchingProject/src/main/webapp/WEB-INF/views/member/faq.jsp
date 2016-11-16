<%@ page contentType = "text/html;charset=UTF-8"%>

<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<link rel="stylesheet"	href="${pageContext.servletContext.contextPath}/resources/css/faq.css" />
	</head>
	<body class="wrap"  style=" margin-left: 0px; margin-top: 0px; margin-right: 0px; margin-bottom: 0px;">


<!-- 큰 테이블 -->
<table align=center>
<form name='f' action='./memberRegDB.php' method='post' enctype='multipart/form-data'>
<tr>
 <td height=20>
<tr>
 <td><h1>JOIN FORM</h1>
<tr>
 <td>
 
  <table border=0 cellpadding=5 cellspacing=0>
  <tr>
   <td align='right' class='s1' width=100><b>ID
   <td align='left' class='s1' width=300>
    <input name='id' readonly  onClick='getName()'>
    
  <tr>
   <td align='right' class='s2'><b>PASSWORD
   <td class='s2'  align='left'>
    <input name='pw' type='password'> 확인 :
    <input name='pw2' type='password'>
  <tr>
   <td class='s2'  align='right'><b>AGE
   <td class='s2'  align='left'>
    <input name='team' readonly onClick='getName()'>
  <tr>
   <td class='s2'  align='right'><b>LOCATION
   <td class='s2'  align='left'>
    <select name='mlocal' size='1'>
	               <option value=''>선택하세요</option>
	               <option value='39'>서울</option>
	               <option value='40'>경기</option>
	               <option value='41'>인천</option>
	               <option value='42'>대전</option>
	               <option value='43'>대구</option>
	               <option value='44'>부산</option>
	               <option value='45'>충북</option>
	               <option value='46'>충남</option>
	               <option value='47'>광주</option>
	               <option value='48'>강원</option>
	         	</select>
  <tr>
   <td class='s2'  align='right'><b>NAME
   <td class='s2'  align='left'><input name='name' readonly onClick='getName()'>
  <tr>
	<td class='s2'  align='right'><b>NICKNAME</td>
	<td class='s2'  align='left'><input type="text" name="mnickname"></td>
  </tr>
   <td class='s2'  align='right'><b>E-MAIL
   <td class='s2'  align='left'>
   	<input type='text' name="memail">@
       <input type='text' name="memail_dns">
       <select name="emailaddr">
        <option value="">직접입력</option>
        <option value="daum.net">daum.net</option>
        <option value="empal.com">empal.com</option>
        <option value="gmail.com">gmail.com</option>
        <option value="hanmail.net">hanmail.net</option>
        <option value="msn.com">msn.com</option>
        <option value="naver.com">naver.com</option>
        <option value="nate.com">nate.com</option>
       </select>
  <tr>
  
	 <td class='s2' align='right'><b>TEL</td>
	 <td class='s2' align='left'>
	 	<select name="mtel">
		<option value="010">010</option>
		<option value="011">011</option>
		<option value="016">016</option>							
		</select> -
		<input type="text" name="phonel"/> -
		<input type="text" name="phone2"/>
	 </td>
	</tr>
	
   <td class='s2'  align='right'><b>SEX
   <td class='s2'  align='left'>
   <input type="radio" value="male" name="msex">남
    <input type="radio" value="female" name="msex">여
  <tr>
  
  
   <td class='s2'  align='right'><b>FIELD
   <td class='s2'  align='left'>
	    <input type='checkbox' name='fnmae' value='17'> 문화
	    <input type='checkbox' name='fnmae' value='18'> 놀이
	    <input type='checkbox' name='fnmae' value='19'> 관광
	    <input type='checkbox' name='fnmae' value='20'> 운동
	    <input type='checkbox' name='fnmae' value='21'> 언어
  <tr>
   <td colspan=2 class='s1' align=center>
    <input type='submit' class='bt1' value='확인' onClick='ok()'>
    <input type='button' class='bt2' value='취소' >
  </table>
<tr>
 <td height=30>
</table>
<input name='insaNo' type='hidden'>
</form>
<!-- 큰 테이블 끝 -->
</body>
</html>