<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
  <div id="blogMenu">
      <ul>
         <li><a href="main.do">Home</a></li>
         
         <li><a href="#">ȸ������</a>
      
            <ul>
               <c:if test="${sessionScope.id==null }">
                <li><a href="join.do">ȸ������</a></li>
               </c:if>
               <c:if test="${sessionScope.id!=null }">
                <li><a href="join_update.do">ȸ������</a></li>
               </c:if>
               <li><a href="ip_find.do">ID/Password ã��</a></li>
            </ul>
      
          </li>
      
      
          <li><a href="#">Ŀ�´�Ƽ</a>
      
            <ul>
            <li><a href="board_list.do">���� �Խ���</a></li>
            <li><a href="#">���� ���ϱ�</a></li>
            <li><a href="#">F & Q</a></li>
            </ul>
      
          </li>
      
      
      <li><a href="#">���� ����</a>
        <ul>
        <li><a href="#">��õ ����</a></li>
        <li><a href="#">������ ����</a></li>
        <c:if test="${sessionScope.id==null }">
        <li>���� ����</li>
        </c:if>
        <c:if test="${sessionScope.id!=null }">
        <li><a href="#">���� ����</a></li>
        
        </c:if>
        </ul>
      </li>
      	<c:if test="${sessionScope.admin=='n' }">
        <li><a href="#">����������</a></li>
        </c:if>
        <c:if test="${sessionScope.admin=='y' }">
        <li><a href="#">������Ȳ</a></li>
        </c:if>
      </ul>
   </div>
     
</body>
</html>