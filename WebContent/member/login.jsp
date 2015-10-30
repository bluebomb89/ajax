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
		$('#logBtn').click(function(){
			var id=$('#id').val();
			if(id==""){
				$('#id').focus();
				return;
			}
			var pwd=$('#pwd').val();
			if(pwd==""){
				$('#pwd').focus();
				return;
			}
			$('#log_frm').submit();
		});
	});
</script>
</head>
<body>
	<form method=post action="member_login.do" id="log_frm">
		<table id="table_content1">
			<tr>
				<td>ID</td>
				<td>
					<input type=text name=id id=id>
				</td>
			</tr>
			<tr>
				<td>pwd</td>
				<td>
					<input type=password name=pwd id=pwd>
				</td>
			</tr>
			<tr>
				<td>&nbsp;</td>
				<td colspan="2">
					<input type=button value=로그인 id="logBtn">
				</td>
			</tr>
		</table>
	</form>
</body>
</html>