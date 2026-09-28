<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>GOTT (Go to travel)</title>
<script
  src="https://code.jquery.com/jquery-3.7.1.js"
  integrity="sha256-eKhayi8LEQwp4NKxN+CfCh+3qOVUtJn3QNZ0TciWLP4="
  crossorigin="anonymous"></script>
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/7.3.1/css/all.min.css" integrity="sha512-QeR2VH+lsBE5LSAe1Q5EnTBbe7XTBubt8dG93Y7gidSgdMCr8nVqKcfKAMyN96SV8KDbZVTDXChatu5G2KQGzg==" crossorigin="anonymous" referrerpolicy="no-referrer">
<style>
	* {box-sizing: border-box;}
	
	body {
		margin : 0px;
		font-family: "Segoe UI" , "Malgun Gothic", sans-serif;
		background-color: #f8fafa;
	}
	.container {
		width : 100%;
		margin: 0 auto;
		padding: 0 20px;
		background-color: #fff8f0;
		border : 1px solid black;
	}
	.top {
		width : 100%;
		height: 100px;
		border : 1px solid black;
	}
	.top .logo-box {
		width: 30%;
		height: 100%;
		border : 1px solid black;
		float : left;
	}
	.top .pagetitle {
		width: 50%;
		height: 100%;
		border : 1px solid black;
		float : left;
		align-items: center;
		justify-content: center;
		display: flex;
		font-size: 24px;
		font-weight: bolder;
	}
	.top .topbtn {
		width: 20%;
		height: 100%;
		border : 1px solid black;
		float : left;
		display: flex;
		align-items: center;
		justify-content: flex-end;
	}
	.top .topbtn i:hover {
		cursor: pointer;
	}
	.mid {
		width : 100%;
		height: auto;
		border : 1px solid black;
		align-items: center;
		justify-content: center;
		display: flex;
		padding: 20px 0px 15px 0px;
	}
	.mid .eventbox {
		width: 85%;
		height: 300px;
		border : 1px solid black;
	}
	.mid i {
		width: 7.5%;
		height: auto;
		align-items: center;
		justify-content: center;
		display: flex;
	}
	.mid i:hover {
		cursor: pointer;
	}
	
	.bottom {
		width : 100%;
		height: auto;
		border : 1px solid black;
	}
	.bottom .ourpromise {
		width: 100%;
		height: 280px;
		align-items: center;
		justify-content: center;
		display: flex;
	}
	.bottom .ourpromise .promisebox {
		width : 30%;
		height: 250px;
		border: 1px solid black;
		float: left;
		margin: 0px 5px 0px 5px;
	}
	.bottom .ourpromise .promisebox .promisephoto {
		width: 100%;
		height: 75%;
		border: 1px solid black;
	}
	.bottom .ourpromise .promisebox .promisephoto .promisebtn {
		width: 100%;
		height: 25%;
		border: 1px solid black;
	}
	p {
		font-size: 12px;
		margin: 0px;
	}
	.map {
		width : 100%;
		height: 500px;
		border : 1px solid black;
		align-items: center;
		justify-content: center;
		padding: 10px;
	}
	.map .mapbox {
		width : 100%;
		height: 100%;
		margin-top: 20px;
	}
	.map .maptitle {
		margin: auto;
		width: 95%;
		height: 50px;
		border : 1px solid black;
		align-items: center;
		justify-content: center;
		display: flex;
		
	}
	.map .mapphoto {
		margin: auto;
		width: 95%;
		height: 400px;
		border : 1px solid black;
		align-items: center;
		justify-content: center;

	}
</style>
</head>
<body>
	
	<div class="container">
		<div class="top">
			<div class="logo-box"><img src=""></div>
			<div class="pagetitle">GOTT</div>
			
		<c:choose>
			<c:when test="${loginId != null}">
				<div class="topbtn">
					<p>${loginId}</p>
					<i class="fa-regular fa-user"></i>
					<i class="fa-solid fa-bars"></i>
				</div>
			</c:when>
			<c:otherwise>
				<div class="topbtn">
					<i class="fa-regular fa-user"></i>
					<i class="fa-solid fa-bars"></i>
				</div>
			</c:otherwise>
		</c:choose>
		
		</div>
		<div class="mid">
			<i class="fa-solid fa-arrow-left-long"></i>
			<div class="eventbox">
				<img src="">
			</div>
			<i class="fa-solid fa-arrow-right"></i>
			
		</div>
		<div class="bottom">
			<div class="ourpromise">
				<div class="promisebox">
					<div class="promisephoto">
						<img src="">
					</div>
					<div class="promisebtn">
						<button id="promiseone">자세히 보기</button>
						<p>블라블라블라블라블라블라블라</p>
					</div>
				</div>
				<div class="promisebox">
					<div class="promisephoto">
						<img src="">
					</div>
					<div class="promisebtn">
						<button id="promisetwo">자세히 보기</button>
						<p>블라블라블라블라블라블라블라</p>
					</div>
				</div>
				<div class="promisebox">
					<div class="promisephoto">
						<img src="">
					</div>
					<div class="promisebtn">
						<button id="promisethree">자세히 보기</button>
						<p>블라블라블라블라블라블라블라</p>
					</div>
				</div>
			</div>
		</div>
		
		<div class="map">
			<div class="mapbox">
				<div class="maptitle">대한민국 여행지 지도</div>
					<div class="mapphoto">
					<img src="">
				</div>
			</div>
			
		</div>
		
	</div>
	
	
</body>
</html>