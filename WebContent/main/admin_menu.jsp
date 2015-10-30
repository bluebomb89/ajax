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
      
      <li><a href="#">회원가입</a>
      
      <ul>
      <c:if test="${sessionScope.id==null }">
       <li><a href="#">회원가입</a></li>
      </c:if>
      <c:if test="${sessionScope.id!=null }">
       <li><a href="#">회원수정</a></li>
      </c:if>
      <li><a href="#">ID/Password 찾기</a></li>
      </ul>
      
      </li>
      
      
      <li><a href="#">커뮤니티</a>
      
      <ul>
      <li><a href="#">자유 게시판</a></li>
      <li><a href="#">묻고 답하기</a></li>
      <li><a href="#">F & Q</a></li>
      </ul>
      
      </li>
      
      
      <li><a href="#">맛집 정보</a>
        <li><a href="#">추천 맛집</a></li>
        <li><a href="#">지역별 맛집</a></li>
        <c:if test="${sessionScope.id==null }">
        <li>맛집 예약</li>
        </c:if>
        <c:if test="${sessionScope.id!=null }">
        <li><a href="#">맛집 예약</a></li>
        </c:if>
      </li>
        <c:if test="${sessionScope.id==null }">
        <li>예약현황</li>
        </c:if>
        <c:if test="${sessionScope.id!=null }">
        <li><a href="#">예약현황</a></li>
        </c:if>
      </ul>
   </div>
     
</body>
</html>