<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@include file="../includes/header.jsp" %>
<style>
#container{
	width:450px;
	height:600px;
	margin:0px auto;
	padding:0px;	
}
#section{
	position:relative;
	top:50px;
	width:450px;
	height:500px;
	margin:0 auto;
	padding:0px;
	border:2px solid #32CD32;
}
span{
   font-size:16px;
   font_weight: bold;
}
.cnt{
	margin-top: 20px;
}
#btn1,#btn2{
	width:100px;
	padding:10px;
	top:10px;
	border:black 1.5px solid;
	border-radius:5px;
	margin:0 auto;
	background:#32CD32;
	color:white;
	font-weight:bold;
	font-size:16px;			
}

</style>
<h1 class="page-header"> 회 원 정 보 </h1>
 <div id="container">      
 	<div id="section">
 	  <div class="cnt">
 	    <span>아이디</span>
 	    <input class="form-control" name="id" value='<c:out value="${member.id}"/>' readonly="readonly">
 	  </div>	  
 	  <div class="cnt">
 	    <span>이름</span>
 	    <input class="form-control" name="name" value='<c:out value="${member.name}"/>' readonly="readonly">
 	  </div>
 	  <div class="cnt">
 	    <span>닉네임</span>
 	    <input class="form-control" name="nicname" value='<c:out value="${member.nicname}"/>' readonly="readonly">
 	  </div>
 	  <div class="cnt">
 	    <span>생년월일</span>
 	    <input class="form-control" name="birth" value='<c:out value="${member.birth}"/>' readonly="readonly">
 	  </div>
 	  <div class="cnt">
 	    <span>이메일</span>
 	    <input class="form-control" name="email" value='<c:out value="${member.email}"/>' readonly="readonly">
 	  </div>
 	  <div class="col text-center cnt">
 	   <input id="btn1" type="button" value="정보수정" onclick="location.href='/member/modify'">
 	   <input id="btn2" type="button" value="돌아가기" onclick="location.href='/main'">
 	  </div> 
 	</div>
 </div>		
 
<%@include file="../includes/footer.jsp" %>