<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>

<link rel="stylesheet" type="text/css" href="member/join.css"/>
<link rel="stylesheet" type="text/css" href="member/shadow/css/shadowbox.css"/>
<script type="text/javascript" src="member/shadow/js/shadowbox.js"></script>
<script type="text/javascript" src="http://code.jquery.com/jquery.js"></script>
<script type="text/javascript">
	Shadowbox.init({
		players:['iframe']
	});
	$(function(){
		$('#useridBtn').click(function(){
			Shadowbox.open({
				content:'member/idcheck.jsp',
				player:'iframe',
				title:'아이디 중복체크',
				width:200,
				height:150
			});
		});
		$('#userpostBtn').click(function(){
			Shadowbox.open({
				content:'member/postfind.jsp',
				player:'iframe',
				title:'우편번호 찾기',
				width:430,
				height:300
			});
		});
	});
	
</script>
</head>
<body>
  <div id="wrapper">
    <form name="join_frm" id="joinForm">
      <p>
       <label for="userid">아이디</label>
       <input type=text id="userid" name="id" readonly>
       <input type=button value="중복체크" id="useridBtn">
      </p>
      <p>
       <label for="userpwd">비밀번호</label>
       <input type=password id="userpwd" name="pwd">
       <input type=password id="userpwd2" name="pwd2" placeholder="재입력">
      </p>
      <p>
       <label for="username">이름</label>
       <input type=text id="username" name="name">
      </p>
      <p>
       <label for="usersex">성별</label>
       <input type=radio name="sex" id="usersex" value=남자 checked>남자
       <input type=radio name="sex" id="usersex" value=여자>여자
      </p>
      <p>
       <label for="userbday">생년월일</label>
       <input type=date id="userbday" name="bday">
      </p>
      <p>
       <label for="useraddr">주소</label>
       <span id="cellStyle">
         <input type=text id="userpost" name="post" readonly>
         <input type=button value="우편번호검색" id="userpostBtn">
         <input type=text id="useraddr1" name="addr1" readonly>
         <input type=text id="useraddr2" name="addr2">
       </span>
      </p>
      <p>
       <label for="useraddr">전화</label>
       <span id="cellStyle">
         <select id="usertel" name="tel1">
          <option>010</option>
          <option>011</option>
          <option>017</option>
         </select>
         <input type=text id="usertel2" name="tel2">-
         <input type=text id="usertel3" name="tel3">
       </span>
      </p>
      <p class="btnSubmit">
       <input type=submit value="회원가입" id="btnSub">
       <input type=button value="가입취소" id="btnCancel">
      </p>
    </form>
  </div>
</body>
</html>

