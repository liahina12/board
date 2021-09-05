<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta charset="UTF-8">
 <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-+0n0xVW2eSR5OomGNYDnhzAbDsOXxcvSN1TPprVMTNDbiYZCxYbOOl7+AMvyTG2x" crossorigin="anonymous">
 <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-gtEjrD/SeCtmISkJkNUaaKMoLD0//ElJ19smozuHV6z3Iehds+3Ulb9Bn9Plx0x4" crossorigin="anonymous"></script>    
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap-theme.min.css">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script
  src="https://code.jquery.com/jquery-3.4.1.js"
  integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU="
  crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-gtEjrD/SeCtmISkJkNUaaKMoLD0//ElJ19smozuHV6z3Iehds+3Ulb9Bn9Plx0x4" crossorigin="anonymous"></script>

<style type="text/css">
* {box-sizing: border-box}
body {font-family: Arial, Helvetica, sans-serif;
  padding:20px;
  magin:20px;
}
.mySlides {display: none;}
img {vertical-align: middle;
  width:100%;
  height:600px;
}
#logo1{
	width:72px;
	height:72px;
}
.navbar1 {
  width: 100%;
  background-color: #32CD32;
  overflow: auto;
}
.navbar1 a {
  float: left;
  padding: 12px;
  color: white;
  text-decoration: none;
  font-size: 17px;
  width: 25%; 
  text-align: center;
}

.navbar1 a:hover {
  background-color : #228B22;
}
#h1 {
  text-align:center;
}
#h1 a{
  text-decoration:none;
  color:#32CD32;
}
/* Slideshow container */
.slideshow-container {
  max-width: 1200px;
  position: relative;
  margin: auto;
}
/* Next & previous buttons */
.prev, .next {
  cursor: pointer;
  position: absolute;
  top: 50%;
  width: auto;
  padding: 16px;
  margin-top: -22px;
  color: white;
  font-weight: bold;
  font-size: 18px;
  transition: 0.6s ease;
  border-radius: 0 3px 3px 0;
  user-select: none;
}

/* Position the "next button" to the right */
.next {
  right: 0;
  border-radius: 3px 0 0 3px;
}
/* On hover, add a black background color with a little bit see-through */
.prev:hover, .next:hover {
  background-color: rgba(0,0,0,0.8);
}
/* Caption text */
.text {
  color: #f2f2f2;
  font-size: 15px;
  padding: 8px 12px;
  position: absolute;
  bottom: 8px;
  width: 100%;
  text-align: center;
}
/* The dots/bullets/indicators */
.dot {
  height: 15px;
  width: 15px;
  margin: 0 2px;
  background-color: #bbb;
  border-radius: 50%;
  display: inline-block;
  transition: background-color 0.6s ease;
}
.active, .dot:hover  {
  background-color: #717171;
}
/* Fading animation */
.fadea {
  -webkit-animation-name: fade;
  -webkit-animation-duration: 1.5s;
  animation-name: fade;
  animation-duration: 1.5s;
}

@-webkit-keyframes fade {
  from {opacity: .4} 
  to {opacity: 1}
}

@keyframes fade {
  from {opacity: .4} 
  to {opacity: 1}
}

/* On smaller screens, decrease text size */
@media only screen and (max-width: 300px) {
  .prev, .next,.text {font-size: 11px}
}
.ch{
   background-color: #32CD32;
   text-align:center;
   font-size: 17px;  
}
.ch a{
 text-decoration:none;
    color: white;
}
#footer {
   margin-top: 20px;
   padding: 20px;
   background-color: #32CD32;
   color: white;
   text-align: center;
}
.row{
  white-space: nowrap;
  overflow: hidden;
  text-overflow: ellipsis;
  line-height: 1.2em;
  max-height: 1.2em;
}
</style>
<title>MainHomePage</title>
</head>
<body>
<div id="header">
		<div >			
				<h1 id="h1">
				<img id="logo1" src="/resources/img/camping7.png">
					<a href="http://localhost:8080/main">홈페이지</a>
				</h1>						
		</div>
		<div class="navbar1">
			  <a href="http://localhost:8080/board/list">게시판</a> 
			  <!-- 로그인 전  -->
			  <c:if test="${ member == null }">
			  <a href="http://localhost:8080/member/login" class="loginbu">로그인</a> 
			  <a href="http://localhost:8080/member/join">회원가입</a>
			  </c:if >    					   
			  <!-- 로그인 후 -->  
			  <c:if test="${ member != null }">
              <a href="http://localhost:8080/member/logout">로그아웃</a> 
			  <a href="http://localhost:8080/member/profile">회원정보</a>
              </c:if>
        </div>
</div>
<br>
<div id="section">
		<div class="slideshow-container">		
		<div class="mySlides fadea">
		  <img src="/resources/img/camping2.jpg" style="width:100%">
		  <div class="text">떠나요</div>
		</div>
		
		<div class="mySlides fadea">
		  <img src="/resources/img/camping3.jpg" style="width:100%">
		  <div class="text">산속</div>
		</div>
		
		<div class="mySlides fadea">
		  <img src="/resources/img/camping4.jpg" style="width:100%">
		  <div class="text">감성적</div>
		</div>
		<a class="prev" onclick="plusSlides(-1)">&#10094;</a>
        <a class="next" onclick="plusSlides(1)">&#10095;</a>
		
		</div>
		<br>
		
		<div style="text-align:center">
		  <span class="dot"  onclick="currentSlide(1)"></span> 
		  <span class="dot"  onclick="currentSlide(2)"></span> 
		  <span class="dot"  onclick="currentSlide(3)"></span> 
		</div>
</div>
<br>

<div id="footer">
  <div>
    <p>Easy And Safely Camping</p>
    <p>Copyrights(c) 2021</p>
    <p>Email : saka135@naver.com</p>
  </div>
</div>
<script>
var slideIndex = 1;
showSlides(slideIndex);

function plusSlides(n) {
  showSlides(slideIndex += n);
}

function currentSlide(n) {
  showSlides(slideIndex = n);
}

function showSlides(n) {
  var i;
  var slides = document.getElementsByClassName("mySlides");
  var dots = document.getElementsByClassName("dot");
  if (n > slides.length) {slideIndex = 1}    
  if (n < 1) {slideIndex = slides.length}
  for (i = 0; i < slides.length; i++) {
      slides[i].style.display = "none";  
  }
  for (i = 0; i < dots.length; i++) {
      dots[i].className = dots[i].className.replace(" active", "");
  }
  slides[slideIndex-1].style.display = "block";  
  dots[slideIndex-1].className += " active";
}
</script>
</body>
</html>