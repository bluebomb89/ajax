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
				title:'���̵� �ߺ�üũ',
				width:200,
				height:150
			});
		});
		$('#userpostBtn').click(function(){
			Shadowbox.open({
				content:'member/postfind.jsp',
				player:'iframe',
				title:'�����ȣ ã��',
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
       <label for="userid">���̵�</label>
       <input type=text id="userid" name="id" readonly>
       <input type=button value="�ߺ�üũ" id="useridBtn">
      </p>
      <p>
       <label for="userpwd">��й�ȣ</label>
       <input type=password id="userpwd" name="pwd">
       <input type=password id="userpwd2" name="pwd2" placeholder="���Է�">
      </p>
      <p>
       <label for="username">�̸�</label>
       <input type=text id="username" name="name">
      </p>
      <p>
       <label for="usersex">����</label>
       <input type=radio name="sex" id="usersex" value=���� checked>����
       <input type=radio name="sex" id="usersex" value=����>����
      </p>
      <p>
       <label for="userbday">�������</label>
       <input type=date id="userbday" name="bday">
      </p>
      <p>
       <label for="useraddr">�ּ�</label>
       <span id="cellStyle">
         <input type=text id="userpost" name="post" readonly>
         <input type=button value="�����ȣ�˻�" id="userpostBtn">
         <input type=text id="useraddr1" name="addr1" readonly>
         <input type=text id="useraddr2" name="addr2">
       </span>
      </p>
      <p>
       <label for="useraddr">��ȭ</label>
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
       <input type=submit value="ȸ������" id="btnSub">
       <input type=button value="�������" id="btnCancel">
      </p>
    </form>
  </div>
</body>
</html>

