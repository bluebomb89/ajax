<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>

<link rel="stylesheet" type="text/css" href="board/board.css"/>
<script type="text/javascript" src="http://code.jquery.com/jquery.js"></script>
<script type="text/javascript">
// window.onload=function(){}
// $(document).ready(function(){})
$(function(){
	$('#username').focus();
	//$('#username').val("admin");
	$('#btnSub').click(function(){
		
		var name=$('#username').val();
		if(name=="")
		{
			$('#nameSpan').text("이름은 반드시 입력해야 합니다!!");
			$('#username').focus();
			return;
		}
		$('#nameSpan').text("");
		
		var sub=$('#usersubject').val();
		if(sub=="")
		{
			$('#subSpan').text("제목은 반드시 입력해야 합니다!!");
			$('#usersubject').focus();
			return;
		}
		$('#subSpan').text("");
		
		var cont=$('#usercontent').val();
		if(cont=="")
		{
			$('#contSpan').text("내용은 반드시 입력해야 합니다!!");
			$('#userscontent').focus();
			return;
		}
		$('#contSpan').text("");
		
		var pwd=$('#userpwd').val();
		if(pwd=="")
		{
			$('#pwdSpan').text("비밀번호는 반드시 입력해야 합니다!!");
			$('#userpwd').focus();
			return;
		}
		$('#pwdSpan').text("");
		
		$('#writeForm').submit();
	});
	$('#btnCancel').click(function(){
		history.back();
	});
});
</script>
</head>
<body>
  <div id="wrapper">
    <form name="write_frm" id="writeForm" method=post action="board_insert_ok.do">
      <p>
       <label for="username">이름</label>
       <input type=text id="username" name="name">
       <br>
       <span id="nameSpan" style="color:red;text-align: center"></span>
      </p>
      <p>
       <label for="useremail">이메일</label>
       <input type=text id="useremail" name="email">
      </p>
      <p>
       <label for="usersubject">제목</label>
       <input type=text id="usersubject" name="subject">
        <br>
       <span id="subSpan" style="color:red;text-align: center"></span>
      </p>
      <p>
       <label for="usercontent">내용</label>
       <textarea name="content" id="usercontent"></textarea>
        <br>
       <span id="contSpan" style="color:red;text-align: center"></span>
      </p>
      <p>
       <label for="userpwd">비밀번호</label>
       <input type=password id="userpwd" name="pwd">
        <br>
       <span id="pwdSpan" style="color:red;text-align: center"></span>
      </p>
      <p class="btnSubmit">
       <input type=button value="글쓰기" id="btnSub">
       <input type=button value="취소" id="btnCancel">
      </p>
    </form>
  </div>
</body>
</html>

