<%@ page contentType= "text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!doctype html>
<html>
<head>
<title>:::SEWS - 회원가입
</title>

<link rel='stylesheet' type='text/css' href='../css/joincss.css'>

<style>
textarea {border:solid 1;font-size:9pt;color:black;background-color:white; border-color:#e3bdc8;}
input {border:solid 1;font-size:9pt;color:black;background-color:white; border-color:#e3bdc8;}
.bt1 {color:#000000;border-color:#dfb8b8;background-color:#f0f0f0;font-size:8pt;font-family:Tahoma;height:20px;}

.s0 {BORDER-RIGHT: #e3bdc8 1px solid; BORDER-TOP: #e3bdc8 1px solid; BORDER-LEFT: #e3bdc8 1px solid; BORDER-BOTTOM: #e3bdc8 1px solid}

.s1 {BORDER-TOP: #e3bdc8 4px solid;}
.s2 {BORDER-TOP: #e3bdc8 1px solid;}

wrap {style=" margin-left: 0px; margin-top: 0px; margin-right: 0px; margin-bottom: 0px;"}

</style>

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




<%-- <html>
	<head>
		<meta charset="UTF-8">		
		<link rel="stylesheet" href="${pageContext.servletContext.contextPath}/resources/css/joincss.css" />	
		
	</head>

	<body class="wrap">
		<form name="joinForm" method="post">
		<table width="800px" style="padding:5px 0 0 0; margin:auto; height:600px;">
			<tr>
				<th>
					<h2>회원 가입</h2>
				</th>
			</tr>
			
			<tr>
   				<th>이름</th>
  				<td><input type="text" name="mname"></td>
			</tr>
			
			<tr>
   				<th>닉네임</th>
  				<td><input type="text" name="mnickname"></td>
			</tr>
 			
 			<tr>
  				<th>아이디</th>
  				<td><input type="text" name="mid">
   					<a href='#' style='cursor:help'>중복체크</a>
        		</td>
     		 </tr>
     		 
     		 <tr>
        		 <th>비밀번호</th>
      			 <td><input type="password" name="mpassword"> 영문/숫자포함 6자 이상</td>
    		 </tr>
     		 <tr>
        		 <th>비밀번호 확인</th>
       			 <td><input type="password" name="mpassword_re"></td>
     		 </tr>
     		 
     		 <tr>
	          <th>지역</th>
	          <td>
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
	         	</td>
	      	 </tr>
     		 
       		 <tr>
        		 <th>이메일</th>
       			 <td>
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
		         </td>
       		  </tr>
        	  
       		  <tr>
				 <th>휴대전화</th>
				 <td>
				 	<select name="mtel">
					<option value="010">010</option>
					<option value="011">011</option>
					<option value="016">016</option>							
					</select> -
					<input type="text" name="phonel"/> -
					<input type="text" name="phone2"/>
				 </td>
			  </tr>
			  
			  <tr>
			  <th>성별</th>
                <td>
                    <input type="radio" value="male" name="msex">남
                    <input type="radio" value="female" name="msex">여
                </td>
			  </tr>
			  
			  <tr>
   				<th>나이</th>
  				<td><input type="text" name="mage"></td>
			 </tr>
		      	 
		         <tr>
		           <th> 관심분야 </th>
		           <td>
		              <input type='checkbox' name='fnmae' value='17'> 문화
		              <input type='checkbox' name='fnmae' value='18'> 놀이
		              <input type='checkbox' name='fnmae' value='19'> 관광
		              <input type='checkbox' name='fnmae' value='20'> 운동
		              <input type='checkbox' name='fnmae' value='21'> 언어
		            </td>
		         </tr>
 
          
           <tr>
				<td colspan="2" align="center">
              	 <input type="submit" value="회원가입">
             	 <input type="reset" value="취소">
            	</td>
           </tr>
        </table>
		</form>
	</body>
</html> --%>



