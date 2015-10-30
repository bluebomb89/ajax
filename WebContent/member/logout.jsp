<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="member/table.css">
<script type="text/javascript" src="http://code.jquery.com/jqeury.js"></script>
<script type="text/javascript">
	$(function(){
		$('#logoutBtn').click(function(){
			$('#logout_frm').submit();
		});
	});
</script>
</head>
<body>
	<form method=post action="member_logout.do" id="logout_frm">
		<table id="table_content1">
			<tr>
				<td>
					${sessionScope.name }님
				</td>
			</tr>
			<tr>
				<td>
					${sessionScope.admin=='y'?"관리자":"일반" }
				</td>
			</tr>
			<tr>
				<td>&nbsp;</td>
				<td>
					<input type=button value=로그아웃 id="logoutBtn">
				</td>
			</tr>
		</table>
	</form>
</body>
</html>