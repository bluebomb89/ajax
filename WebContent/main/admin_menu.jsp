<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
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
       <li><a href="#">ȸ������</a></li>
      </c:if>
      <c:if test="${sessionScope.id!=null }">
       <li><a href="#">ȸ������</a></li>
      </c:if>
      <li><a href="#">ID/Password ã��</a></li>
      </ul>
      
      </li>
      
      
      <li><a href="#">Ŀ�´�Ƽ</a>
      
      <ul>
      <li><a href="#">���� �Խ���</a></li>
      <li><a href="#">���� ���ϱ�</a></li>
      <li><a href="#">F & Q</a></li>
      </ul>
      
      </li>
      
      
      <li><a href="#">���� ����</a>
        <li><a href="#">��õ ����</a></li>
        <li><a href="#">������ ����</a></li>
        <c:if test="${sessionScope.id==null }">
        <li>���� ����</li>
        </c:if>
        <c:if test="${sessionScope.id!=null }">
        <li><a href="#">���� ����</a></li>
        </c:if>
      </li>
        <c:if test="${sessionScope.id==null }">
        <li>������Ȳ</li>
        </c:if>
        <c:if test="${sessionScope.id!=null }">
        <li><a href="#">������Ȳ</a></li>
        </c:if>
      </ul>
   </div>
     
</body>
</html>