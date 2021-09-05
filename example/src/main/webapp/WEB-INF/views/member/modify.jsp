<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@include file="../includes/header.jsp" %>
<style>
#container{
	width:450px;
	height:700px;
	margin:0px auto;
	padding:0px;	
}
#section{
	position:relative;
	top:50px;
	width:450px;
	height:600px;
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
#btn1,#btn2,#btn3{
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
.pw_ck{
    font-size:13px;
    color: red;
    display: none;
}
.name_ck{
    font-size:13px;
    color: red;
    display: none;
}
.nic_ck{
    font-size:13px;
    color: red;
    display: none;
}
</style>
<h1 class="page-header"> 회원정보수정 </h1>
 <div id="container">  
   <form id="form" method="post">    
 	<div id="section">
 	  <div class="cnt">
 	    <span>아이디</span>
 	    <input class="form-control" name="id" value='<c:out value="${member.id}"/>' readonly="readonly">
 	  </div>
 	   <div class="cnt">
 	    <span>비밀번호</span>
 	    <input class="form-control pw_input" type="password" name="pw" value='<c:out value="${member.pw}"/>'>
 	  </div>
 	  <span class="pw_ck">(6~20자의 영문 대소문자,숫자)비밀번호 입력해주세요</span>
 	  <div class="cnt">
 	    <span>이름</span>
 	    <input class="form-control name_input" name="name" value='<c:out value="${member.name}"/>' >
 	  </div>
 	  <span class="name_ck">(2~10자의 한글)이름 수정이 가능합니다.</span>
 	  <div class="cnt">
 	    <span>닉네임</span>
 	    <input class="form-control nic_input" name="nicname" value='<c:out value="${member.nicname}"/>' >
 	  </div>
 	  <span class="nic_ck">(2~10자의 한글)닉네임 수정이 가능합니다.</span>
 	  <div class="cnt">
 	    <span>생년월일</span>
 	    <input class="form-control" name="birth" value='<c:out value="${member.birth}"/>' readonly="readonly">
 	  </div>
 	  <div class="cnt">
 	    <span>이메일</span>
 	    <input class="form-control" name="email" value='<c:out value="${member.email}"/>' readonly="readonly">
 	  </div>
 	  <div class="col text-center cnt">
 	   <input id="btn1" type="button" value="회원수정" onclick="location.href='/member/modifyPost'">
 	   <input id="btn3" type="button" value="회원탈퇴" onclick="location.href='/member/deletePost'">
 	   <input id="btn2" type="button" value="홈으로" onclick="location.href='/main'">
 	  </div> 
 	</div>
   </form>	
 </div>		
<script >
/* 유효성 검사 통과유무 변수 */
var pwCheck = false;          // 비번
var nameCheck = false;        // 이름
var nicCheck = false;         // 닉네임
$(document).ready(function(){	
	//회원수정 버튼
	$("#btn1").click(function(e){	
		var pw = $('.pw_input').val();         //pw
		var name = $('.name_input').val();     //name
		var nic = $('.nic_input').val();       //nic
        /* 비밀번호 유효성 검사 */
        if(pw == ""){
            $('.pw_ck').css('display','block');
            pwCheck = false;
        }else{
            $('.pw_ck').css('display', 'none');
            pwCheck = true;
        }
        /* 이름 유효성 검사 */
        if(name == ""){
            $('.name_ck').css('display','block');
            nameCheck = false;
        }else{
            $('.name_ck').css('display', 'none');
            nameCheck = true;
        }
        /* 닉네임 유효성 검사 */
        if(nic == ""){
            $('.nic_ck').css('display','block');
            nicCheck = false;
        }else{
            $('.nic_ck').css('display', 'none');
            nicCheck = true;
        }
        /* 최종 유효성 검사 */
        if(pwCheck&&nameCheck&&nicCheck){
            $("#form").attr("action", "/member/modifyPost");
            $("#form").submit(); 
            console.log("success");
        }else{
        	console.log("error");
        	alert("빈칸이 있습니다.");   	        
        }      	
	});
	$('.pw_input').keyup(function(){
		var regPw = /^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[$@$!%*?&])[A-Za-z\d$@$!%*?&]{6,20}$/;
		if(!regPw.test($('.pw_input').val())){
			$('.pw_ck').css('display','block');		
		}else{
			$('.pw_ck').css('display','none');			
		}				
	});
	$('.name_input').keyup(function(){
		var regName = /^[가-힣]{2,10}$/;
		if(!regName.test($('.name_input').val())){
			$('.name_ck').css('display','block');			
		}else{
			$('.name_ck').css('display','none');			
		}		
	});
	$('.nic_input').keyup(function(){
		var regNic = /^[가-힣]{2,10}$/;
		if(!regNic.test($('.nic_input').val())){
			$('.nic_ck').css('display','block');			
		}else{
			$('.nic_ck').css('display','none');			
		}
	});

});

</script> 
<%@include file="../includes/footer.jsp" %>