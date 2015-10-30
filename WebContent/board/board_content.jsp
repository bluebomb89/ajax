<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="board/table.css"/>
<script type="text/javascript" src="http://code.jquery.com/jquery.js"></script>
<script type="text/javascript">
var i=0;
$(function(){
	$('#delTr').hide();
	$('#delA').click(function(){
		if(i==0)
		{
			$('#delTr').show();
			i=1;
		}
		else
		{
			$('#delTr').hide();
			i=0;
		}
	});
	$('#delBtn').click(function(){
		var pwd=$('#pwd').val();
		if(pwd=="")
		{
			$('#pwd').focus();
			return;
		}
		$('#delfrm').submit();
	});
	var j=0;
	$('#replyShow').click(function(){
		if(j==0)
		{
			$('#reply').show();
			$('#replyShow').text("댓글닫기");
			j=1;
			
		}
		else
		{
			$('#reply').hide();
			$('#replyShow').text("댓글보기");
			j=0;
			// text() val() html() attr()
			/*
			   text() : <a>aaaaa</a>
			   text('bbbb') <a>bbbb</a>
			   
			   val() : <input> <textarea> <select>
			   $('a').html() : <a><b><c></c></b></a>
			         ==> innerHTML
			   attr('src')
			*/
		}
	});
	$('#replyBtn').click(function(){
		var msg=$('#rmsg').val();
		if(msg=="")
		{
			alert("댓글 내용을 입력하세요");
			$('#rmsg').focus();
			return;
		}
		$('#re_new_frm').submit();
		// action수행
	});
	var k=0;
	$('.reRe').click(function(){
		var no=$(this).attr('name');
		if(k==0)
		{
			$('#re_re_tr'+no).show();
			k=1;
		}
		else
		{
			$('#re_re_tr'+no).hide();
			k=0;
		}
	});
	var p=0;
	$('.reUpdate').click(function(){
		var no=$(this).attr('name');
		if(p==0)
		{
			$('#re_update_tr'+no).show();
			p=1;
		}
		else
		{
			$('#re_update_tr'+no).hide();
			p=0;
		}
	});
});
function replyBtnClick(no)
{
	var msg=$('#rmsg'+no).val();
	if(msg=="")
	{
		alert("댓글 내용 입력하세요");
		$('#rmsg'+no).focus();
		return;
	}
	$('#re_re_frm'+no).submit();
}
function replyUpdateClick(no)
{
	var msg=$('#umsg'+no).val();
	if(msg=="")
	{
		alert("댓글 내용 입력하세요");
		$('#umsg'+no).focus();
		return;
	}
	$('#re_update_frm'+no).submit();
}
</script>
</head>
<body>
  <center>
    
    <table id="table_content">
      <tr>
        <td width=20% class="tdcenter">번호</td>
        <td width=30% class="tdcenter">${dto.no }</td>
        <td width=20% class="tdcenter">작성일</td>
        <td width=30% class="tdcenter">
          <fmt:formatDate value="${dto.regdate }"
           pattern="yyyy-MM-dd"
          />
        </td>
      </tr>
      <tr>
        <td width=20% class="tdcenter">이름</td>
        <td width=30% class="tdcenter">${dto.name }</td>
        <td width=20% class="tdcenter">조회수</td>
        <td width=30% class="tdcenter">${dto.hit }</td>
      </tr>
      <tr>
        <td width=20% class="tdcenter">제목</td>
        <td colspan="3" class="tdleft">${dto.subject }</td>
      </tr>
      <tr>
        <td colspan="4" class="tdleft" valign="top" height="80">
         <pre>${dto.content }</pre>
        </td>
      </tr>
    </table>
    <table border=0 width=600>
      <tr>
       <td align=right>
         <a href="board_update.do?no=${dto.no }&page=${page}"><img src="image/modify.gif"></a>
         <a href="#" id="delA"><img src="image/delete.gif"></a>
         <a href="board_list.do?page=${page }"><img src="image/list.gif"></a>
       </td>
      </tr>
      <tr id="delTr">
        <td align=right>
          <form method=post action="board_delete.do" id="delfrm">
         비밀번호 : <input type="password" name=pwd id=pwd size=10>
             <input type=hidden name=no value="${ dto.no}">
             <input type=hidden name=page value="${page }">
             <input type=button value=삭제 id="delBtn">
         </form>
        </td>
      </tr>
    </table>
    
      <table border=0 width=600>
        <tr>
         <td align=right>
          <a href="#" id="replyShow">댓글보기</a>
         </td>
        </tr>
      </table>
     <div id="reply" style="width:600px">
     <table id="table_content">
      <c:forEach var="rDto" items="${rlist }">
       <tr>
         <td align=left>
           <c:if test="${rDto.group_tab!=0 }">
            <c:forEach var="i" begin="1" end="${rDto.group_tab }" step="1">
              &nbsp;&nbsp;
            </c:forEach>
            <img src="image/re_icon.gif">
           </c:if>
           <font color=blue>${rDto.name }</font>
           &nbsp;&nbsp;${rDto.dbday }
           <br>
           <c:if test="${rDto.group_tab!=0 }">
            <c:forEach var="i" begin="1" end="${rDto.group_tab }" step="1">
              &nbsp;&nbsp;
            </c:forEach>
           </c:if>
           ${rDto.msg }
         </td>
         <td align="center">
            <c:if test="${sessionScope.id!=null }">
            └ <a class="reRe" href="#" name="${rDto.no }">댓글</a>
            </c:if>
          <c:if test="${sessionScope.id==rDto.id }">
            └ <a class="reUpdate" href="#" name="${rDto.no }">수정</a> &nbsp; └ <a href="reply_delete.do?no=${rDto.no }&bno=${dto.no}&page=${page}">삭제</a>
          </c:if>
         </td>
       </tr>
       <tr id="re_re_tr${rDto.no }" style="display:none">
       <td colspan="2">
        <span style="float: left;display: block;">
        <form method=post action="reply_re_insert.do" id="re_re_frm${rDto.no }">
         <textarea rows="1" cols="60" name="rmsg" id="rmsg${rDto.no }" style="vertical-align: middle;"></textarea>
         <input type=hidden name=bno value="${ dto.no}">
         <input type=hidden name=page value="${page }">
         <input type=hidden name=pno value="${rDto.no }">
         <input type=button value="댓글" style="height:45px" onclick="replyBtnClick(${rDto.no })">
        </form>
        </span>
       </td>
      </tr>
      <tr id="re_update_tr${rDto.no }" style="display:none">
       <td colspan="2">
        <span style="float: left;display: block;">
        <form method=post action="reply_re_update.do" id="re_update_frm${rDto.no }">
         <textarea rows="1" cols="60" name="rmsg" id="umsg${rDto.no }" style="vertical-align: middle;">${rDto.msg }</textarea>
         <input type=hidden name=bno value="${ dto.no}">
         <input type=hidden name=page value="${page }">
         <input type=hidden name=no value="${rDto.no }">
         <input type=button value="수정" style="height:45px" onclick="replyUpdateClick(${rDto.no })">
        </form>
        </span>
       </td>
      </tr>
      </c:forEach>
      <c:if test="${sessionScope.id!=null }">
      <tr>
       <td colspan="2">
        <span style="float: left;display: block;">
        <form method=post action="reply_new_insert.do" id="re_new_frm">
         <textarea rows="1" cols="60" name="rmsg" id="rmsg" style="vertical-align: middle;"></textarea>
         <input type=hidden name=bno value="${ dto.no}">
         <input type=hidden name=page value="${page }">
         <input type=button value="댓글" id="replyBtn" style="height:45px">
        </form>
        </span>
       </td>
      </tr>
      </c:if>
     </table>
     <table border=0 width=600>
      <tr>
        <td align=right>
         <a href="board_content.do?no=${dto.no }&page=${page}&rPage=${rcurpage>1?rcurpage-1:rcurpage}"><img src="image/prev_icon.gif"></a>&nbsp;
         <a href="board_content.do?no=${dto.no }&page=${page}&rPage=${rcurpage<rtotal?rcurpage+1:rcurpage}"><img src="image/next_icon.gif"></a>&nbsp;
         ${rcurpage } page / ${rtotal } pages
        </td>
      </tr>
     </table>
     </div>
     
  </center>
</body>
</html>



