<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@include file="../includes/header.jsp" %>
<style>
#container{
	width:450px;
	height:500px;
	margin:0px auto;
	padding:0px;	
}
#section{
	position:relative;
	top:50px;
	width:450px;
	height:450px;
	margin:0 auto;
	padding:0px;
	border:2px solid #32CD32;
}
#btn{
	width:200px;
	padding:10px;
	position:relative;
	top:10px;
	border:black 1.5px solid;
	border-radius:5px;
	margin:0 auto;
	background:#32CD32;
	color:white;
	font-weight:bold;
	display:block;
	font-size:18px;
}
.wrap{
  width:100%;
  margin-top:20px;
}
.atem{
   font-size:16px;
   font_weight: bold;
}
.cnt{
	margin-top: 40px;
}
.input_box{
  border:1px solid black;
  height:40px;
}
.id_input, .pw_input{
  width:100%;
  height:100%;
  border:none;
  font-size:18px;
}
/* 로그인 실패시 경고글 */
.login_warn{
    margin-top: 30px;
    text-align: center;
    color : red;
}
</style>

<h1 class="page-header"> 로 그 인 </h1>
<div id="container">
	<form id="login" method="post">
	 <div id="section">
	     <div class="wrap">
			     <div class="cnt">
				   <div class="atem">아이디</div>
				   <div class="input_box">
				     <input class="id_input" type="text" name="id">
				   </div>
				 </div>
				 <div class="cnt">  
				   <div class="atem">비밀번호</div>
				   <div class="input_box">
				     <input class="pw_input" type="password" name="pw">
				   </div>
				 </div>	
				  <c:if test = "${result == 0 }">
                     <div class = "login_warn">사용자 ID 또는 비밀번호를 잘못 입력하셨습니다.</div>
                  </c:if>			   
				 <div class="cnt">
				     <input id="btn" type="button" value="로그인">
				 </div>			 
	     </div>   
	 </div>
	</form>
</div>

<script>
/* 로그인 버튼 클릭 메서드 */
$("#btn").click(function(){
    
   /*  alert("로그인 버튼 작동"); */
	 $("#login").attr("action", "/member/loginPost");
     $("#login").submit();
    
});

</script>

<%@include file="../includes/footer.jsp" %>