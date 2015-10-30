<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="member/table.css">
<style type="text/css">
td,th{
color:white;
}
#id{
width: 80px;
}
</style>
<script type="text/javascript"src="http://code.jquery.com/jquery.js"></script>
<script type="text/javascript">
var httpRequest=null;
function createHttpRequest(){
	if(window.ActiveXObject){ //IE 6.0 이상
		return new ActiveXObject("Msxml2.XMLHTTP");
		//Microsoft.XMLHTTP 6.0이하일때
	}else if(window.XMLHttpRequest){ // 크롬 , ff
		return new XMLHttpRequest();
	}else{ // 호환이 안될때
		return null; //지원하지 않는 브라우저
	}
}
function sendMessage(method,param,url,callback){
	// 서버 연결 DWR,DOJO
	httpRequest=createHttpRequest();
	httpRequest.open(method,url+param,true);
	// true: 비동기 false:동기
	httpRequest.onreadystatechange=callback;
	httpRequest.send(null);
}
function idcheck_result(){
	if(httpRequest.readyState==4){
		if(httpRequest.status==200){
			var res=httpRequest.responseText;
			if(res.trim()=='NOID'){
				$('#result').html('<font color=white>사용가능한 ID입니다</font>')
				$('#ok').html('<input type=button value="확인" onclick="ok()">')
			}else{
				$('#result').html('<font color=white>이미 사용중인 ID입니다</font>')
				$('#ok').html('');
				
			}
		}	
	}
}
function idcheck(){
	var param=$('#id').val();
	if(param==""){
		$('#id').focus();
		return;
	}
	
	param="?id="+param;
	sendMessage('GET', param, "../idcheck.do", idcheck_result);
}
function ok() {
	parent.join_frm.id.value=$('#id').val();
	parent.Shadowbox.close();
}
</script>
</head>
<body>
	<table id="table_content1">
		<tr>
			<td>
				ID입력<input type="text" name=id id="id">			
				<input type=button value=로그인 onclick="idcheck()">
			</td>
		</tr>
		<tr>
			<td align=center>
				<span id="result"></span>	
			</td>
		</tr>
		<tr>
			<td align=center>
				<span id="ok"></span>	
			</td>
		</tr>
	</table>
</body>
</html>