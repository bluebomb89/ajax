<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
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
	if(window.ActiveXObject){ //IE 6.0 �̻�
		return new ActiveXObject("Msxml2.XMLHTTP");
		//Microsoft.XMLHTTP 6.0�����϶�
	}else if(window.XMLHttpRequest){ // ũ�� , ff
		return new XMLHttpRequest();
	}else{ // ȣȯ�� �ȵɶ�
		return null; //�������� �ʴ� ������
	}
}
function sendMessage(method,param,url,callback){
	// ���� ���� DWR,DOJO
	httpRequest=createHttpRequest();
	httpRequest.open(method,url+param,true);
	// true: �񵿱� false:����
	httpRequest.onreadystatechange=callback;
	httpRequest.send(null);
}
function postfind_result(){
	if(httpRequest.readyState==4){
		if(httpRequest.status==200){
			$('#postPrint').html(httpRequest.responseText);
		}	
	}
}
function postfind(){
	var param=$('#dong').val();
	if(param==""){
		$('#dong').focus();
		return;
	}
	
	param="?dong="+param;
	sendMessage('GET', param, "../postfind.do", postfind_result);
}
$(function(){
	$('#postFindBtn').click(function(){
		postfind();
	});
});
function postok(zip,addr)
{
   parent.join_frm.post.value=zip;
   parent.join_frm.addr1.value=addr;
   parent.Shadowbox.close();
}
	
</script>
</head>
<body>
	
	<table border=0 width=410>
		<tr>
			<td align=left>
				�Է�:<input type="text" name=dong id=dong size=13>
				<input type="button" value=ã�� id="postFindBtn">
			</td>
		</tr>
	</table>
	<span id="postPrint"></span>
	
</body>
</html>