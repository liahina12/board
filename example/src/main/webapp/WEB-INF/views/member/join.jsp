<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@include file="../includes/header.jsp" %>
<style>
#container{
	width:450px;
	height:800px;
	margin:0px auto;
	padding:0px;	
}
#section{
	position:relative;
	top:50px;
	width:450px;
	height:700px;
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
   font-size:14px;
   font_weight: bold;
}
.input_box{
  border:1px solid black;
  height:31px;
}
.id_input, .pw_input , .pwck_input, .name_input{
  width:100%;
  height:100%;
  border:none;
  font-size:15px;
}
.nic_input, .birth_input , .email_input{
  width:100%;
  height:100%;
  border:none;
  font-size:15px;
}
.cnt{
   margin-top:20px;
}
span{
  font-size:12px;
}
.id_input_re_1{
   color: green;
   display: none;
}
.id_input_re_2{
   color: red;
   display: none;
}
.nic_input_re_1{
   color: green;
   display: none;
}
.nic_input_re_2{
   color: red;
   display: none;
}
/* 유효성 검사 문구 */
.id_ck{
    color: red;
    display: none;
}
.pw_ck{
    color: red;
    display: none;
}
.pwck_ck{
    color: red;
    display: none;
}
.name_ck{
    color: red;
    display: none;
}
.nic_ck{
    color: red;
    display: none;
}
.birth_ck{
    color: red;
    display: none;
}
.email_ck{
    color: red;
    display: none;
}
/* 비밀번호 확인 일치 유효성검사 */
.pwck_input_re_1{
        color : green;
        display : none;    
}
.pwck_input_re_2{
        color : red;
        display : none;    
}
.email_input_box_warn{
        color : red;
        display : none;
}   
.birth_input_box_warn{
        color : red;
        display : none;
} 
</style>
<h1 class="page-header"> 회원 가입 </h1>

 <div id="container">
       
	<form id="join" method="post">
		<div id="section">
		  <div class="wrap">
		    <div class="atem">아이디</div>
		    <div class="input_box">
		      <input class="id_input" type="text" name="id">
		    </div>
		     <span class="id_input_re_1">사용 가능한 아이디입니다.</span>
		     <span class="id_input_re_2">아이디가 이미 존재합니다.</span>
		     <span class="id_ck">(5~14자의 영문소문자,숫자)아이디를 입력해주세요.</span>
		  </div>
		  <div class="wrap">
		   <div class="atem">비밀번호</div>
		   <div class="input_box">
		     <input class="pw_input" type="password" name="pw">
		   </div> 
		   <span class="pw_ck">(6~20자의 영문 대소문자,숫자,특수문자 각1개이상)비밀번호를 입력해주세요.</span>
		  </div>
		   <div class="wrap">
		   <div class="atem">비밀번호확인</div>
		   <div class="input_box">
		     <input class="pwck_input" type="password">
		   </div> 
		   <span class="pwck_ck">비밀번호 확인을 입력해주세요.</span>
		   <span class="pwck_input_re_1">비밀번호가 일치합니다.</span>
           <span class="pwck_input_re_2">비밀번호가 일치하지 않습니다.</span>
		  </div>
		  <div class="wrap">
		    <div class="atem">이름</div>
		    <div class="input_box">
		      <input class="name_input" type="text" name="name">
		    </div>
		    <span class="name_ck">(2~10자의 한글)이름을 입력해주세요.</span>
		  </div>  
		<div class="wrap">
		    <div class="atem">닉네임</div>
		    <div class="input_box">
		      <input class="nic_input" type="text" name="nicname">
		    </div>
		    <span class="nic_ck">(2~10자의 한글)닉네임을 입력해주세요.</span>
		    <span class="nic_input_re_1">사용 가능합니다.</span>
		    <span class="nic_input_re_2">이미 존재합니다.</span>
		  </div>  
		  <div class="wrap">
		    <div class="atem">생일</div>
		    <div class="input_box">
		      <input class="birth_input" type="text" name="birth" placeholder="ex) 19920415">
		    </div>
		    <span class="birth_ck">생일을 입력해주세요.</span>
		    <span class="birth_input_box_warn">생년월일이 올바르지 않습니다.</span>
		  </div>  
		    <div class="wrap">
		    <div class="atem">이메일</div>
		    <div class="input_box">
		      <input class="email_input" type="text" name="email">
		    </div>
		    <span class="email_ck">이메일을 입력해주세요.</span>		    
            <span class="email_input_box_warn">이메일이 올바르지 않습니다.</span>
		  </div>  
		  <div class="cnt">
		   <input id="btn" type="button" value="회원가입">
		  </div> 
		</div>		
	</form>  	
 </div>
 
<script>
/* 유효성 검사 통과유무 변수 */
var idCheck = false;            // 아이디
var idckCheck = false;            // 아이디 중복 검사
var pwCheck = false;            // 비번
var pwckCheck = false;            // 비번 확인
var pwckckCheck = false;        // 비번 확인 일치 확인
var nameCheck = false;            // 이름
var nicCheck = false;         // 닉네임
var nicckCheck = false;         // 닉네임 중복검사
var birthCheck = false;           //생일
var emailCheck = false;            // 이메일

$(document).ready(function(){	
	//회원가입 버튼
	$("#btn").click(function(){	
		var id = $('.id_input').val();         //id
		var pw = $('.pw_input').val();         //pw
		var pwck = $('.pwck_input').val();     //pwck
		var name = $('.name_input').val();     //name
		var nic = $('.nic_input').val();       //nic
		var birth = $('.birth_input').val();   //birth
		var email = $('.email_input').val();   //emeil
		  /* 아이디 유효성검사 */
        if(id == ""){
            $('.id_ck').css('display','block');
            idCheck = false;
        }else{
            $('.id_ck').css('display', 'none');
            idCheck = true;
        }
        /* 비밀번호 유효성 검사 */
        if(pw == ""){
            $('.pw_ck').css('display','block');
            pwCheck = false;
        }else{
            $('.pw_ck').css('display', 'none');
            pwCheck = true;
        }
        /* 비밀번호 확인 유효성 검사 */
        if(pwck == ""){
            $('.pwck_ck').css('display','block');
            pwckCheck = false;
        }else{
            $('.pwck_ck').css('display', 'none');
            pwckCheck = true;
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
        /* 생일 유효성 검사 */
        if(birth == ""){
            $('.birth_ck').css('display','block');
            birthCheck = false;
        }else{
            $('.birth_ck').css('display', 'none');
            birthCheck = true;
        }
        /* 이메일 유효성 검사 */
        if(email == ""){
            $('.email_ck').css('display','block');
            emailCheck = false;
        }else{
            $('.email_ck').css('display', 'none');
            emailCheck = true;
        }
        /* 최종 유효성 검사 */
        if(idCheck&&pwCheck&&pwckCheck&&nameCheck&&nicCheck&&birthCheck&&emailCheck){
            $("#join").attr("action", "/member/joinPost");
            $("#join").submit(); 
            console.log("success");
        }else{
        	console.log("error");
        	return false;
        }           
	});
	$('.id_input').on("mouseout",function(){		
		if($('.id_input').val()==""){
			$('.id_ck').css('display','block');
			$('.id_input_re_1').css("display","none");
			$('.id_input_re_2').css("display","none");
		}else{
			$('.id_ck').css('display','none');
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
	$('.birth_input').keyup(function(){		
		var regBirth = /^(19|20)\d{2}(0[1-9]|1[012])(0[1-9]|[12][0-9]|3[0-1])$/;
		if(!regBirth.test( $('.birth_input').val())){
			$('.birth_input_box_warn').css('display','block'); 
			$('.birth_ck').css('display','none');		
		}else{
      	    $('.birth_input_box_warn').css('display','none');
      	  $('.birth_ck').css('display','none');   	  
        }		
	});
	$('.email_input').keyup(function(){	
		var regEmail = /([\w-\.]+)@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.)|(([\w-]+\.)+))([a-zA-Z]{2,4}|[0-9]{1,3})(\]?)$/;
		if(!regEmail.test( $('.email_input').val())){
			  $('.email_input_box_warn').css('display','block');
			  $('.email_ck').css('display','none');
            return false;
          } else{
        	  $('.email_input_box_warn').css('display','none');
        	  $('.email_ck').css('display','none');      	  
          }        
	});
});

/* 아이디 중복체크 */
$('.id_input').on("propertychange change keyup paste input", function(){
    /*  console.log("keyup 테스트") */
	var id = $('.id_input').val(); //.id_input에 입력되는 값
	var data= {id : id}      // 컨트롤에 넘길 데이터 이름 : 데이터
	
	$.ajax({
		type: "post",
		url : "/member/memberIdChk",
		data : data,
		success : function(result){
			/* console.log("성공여부" + result);  */
			var regId = /^[a-z0-9]{5,14}$/;
			
		 	if(result != 'fail' && 5<$('.id_input').val()<14 && regId.test($('.id_input').val())){
				$('.id_input_re_1').css("display","block");
				$('.id_input_re_2').css("display","none");	
				$('.id_ck').css('display',"none");
				idckCheck = true;
			}else if(result == 'fail'){
				$('.id_input_re_2').css("display","block");
				$('.id_input_re_1').css("display","none");	
				$('.id_ck').css('display',"none");
				idckCheck = false;
			}else{
				$('.id_ck').css('display','block');
				$('.id_input_re_1').css("display","none");	
				$('.id_input_re_2').css("display","none");
			}
		}	
	}); 	
});
/* 닉네임 중복체크 */
$('.nic_input').on("propertychange change keyup paste input", function(){
    /*  console.log("keyup 테스트") */
	var nicname = $('.nic_input').val(); //.nic_input에 입력되는 값
	var data= {nicname : nicname}      // 컨트롤에 넘길 데이터 이름 : 데이터
	
	$.ajax({
		type: "post",
		url : "/member/memberNicChk",
		data : data,
		success : function(result){
		    /* console.log("성공여부" + result); */
			var regNic = /^[가-힣]{2,10}$/;
			
		 	if(result != 'fail' && 2<$('.nic_input').val()<10 && regNic.test($('.nic_input').val())){
				$('.nic_input_re_1').css("display","block");
				$('.nic_input_re_2').css("display","none");	
				$('.nic_ck').css('display',"none");
				nicckCheck = true;
			}else if(result == 'fail'){
				$('.nic_input_re_2').css("display","block");
				$('.nic_input_re_1').css("display","none");	
				$('.nic_ck').css('display',"none");
				nicckCheck = false;
			}else{
				$('.nic_ck').css('display','block');
				$('.nic_input_re_1').css("display","none");	
				$('.nic_input_re_2').css("display","none");
			}
		}	
	}); 	
});
/* 비밀번호 확인 일치 유효성 검사 */
$('.pwck_input').on("propertychange change keyup paste input", function(){
 
    var pw = $('.pw_input').val();
    var pwck = $('.pwck_input').val();
    $('.pwck_ck').css('display', 'none');
        
    if(pw == pwck){
        $('.pwck_input_re_1').css('display','block');
        $('.pwck_input_re_2').css('display','none');
        $('.pwck_ck').css('display','none');
        pwckckCheck = true;
    }else{
        $('.pwck_input_re_1').css('display','none');
        $('.pwck_input_re_2').css('display','block');
        $('.pwck_ck').css('display','none');
        pwckckCheck = false;
    }    
});    

</script>
<%@include file="../includes/footer.jsp" %>