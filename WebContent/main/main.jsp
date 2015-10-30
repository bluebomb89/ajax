<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>MVC를 이용한 간단한 사이트</title>
<style type="text/css">
#blogMenu {
   float:right;
   margin:0px 5px 2px 5px;
   padding:0;
   -moz-border-radius: 3px;
   -khtml-border-radius: 3px;
   -webkit-border-radius: 3px;
   border-radius: 3px;
}


#blogMenu, ul {
   box-shadow: 0px 0px 15px rgba(0,0,0,.3);
   -moz-box-shadow: 0px 0px 15px rgba(0,0,0,.3);
   -webkit-box-shadow: 0px 0px 15px rgba(0,0,0,.3);
   -o-box-shadow: 0px 0px 15px rgba(0,0,0,.3);
   background-color:white;
   list-style: none;
}



#blogMenu ul {
   margin-top:2px;
   padding-bottom:3px;
    -moz-border-radius-bottom-left: 3px;
     -khtml-border-bottom-left-radius: 3px;
     -webkit-border-bottom-left-radius: 3px;
     border-bottom-left-radius: 3px;
    -moz-border-radius-bottom-right: 3px;
     -khtml-border-bottom-right-radius: 3px;
     -webkit-border-bottom-right-radius: 3px;
     border-bottom-right-radius: 3px;
}

#blogMenu ul li {
   float:left;
   /*background:url(images/menu_div.gif) no-repeat 0 8px;*/
   padding:4px 0 0 0;
   width:150px;
}

#blogMenu li.first {
   background:none;
}

#blogMenu a {
   height:16px;
   color:#f1f1f1;
   font-family:arial;
   font-size:12px;
   padding:0 10px 0 10px;
}

#blogMenu a:hover {
   color:#D4F4FA;
   border-bottom:3px solid #FAED7D;
   text-decoration:none;
}

#blogMenu ul li:hover ul {
 display: block;
}

#blogMenu ul ul {
display:none;
position:absolute;
margin-top:2px;
padding-bottom:3px;
}

#blogMenu ul ul li {
float:none;
}

</style>
<link href="main/blog_top.css" rel="stylesheet" type="text/css">
<link href="main/blog_middle.css" rel="stylesheet" type="text/css">
<script type="text/javascript" src="http://code.jquery.com/jquery.js"></script>
<script type="text/javascript">
$(function(){
   $('#loginBtn').click(function(){
      var id=$('#id').val();
      if(id=="")
      {
         $('#id').focus();
         return;
      }
      var pwd=$('#pwd').val();
      if(pwd=="")
      {
         $('#pwd').focus();
         return;
      }
      $('#login_frm').submit();
   });
    $('#logoutBtn').click(function(){
      $('#logout_frm').submit();
   });
});
</script>
</head>


<body>
         <div class="AllDiv">
         
            <div id="Top-Simage">
				<c:set var="menu" value="user_menu.jsp"/>

	              <jsp:include page="${menu }"></jsp:include>
              
            </div>
            <div class="Top-Image">
            <a href="#" ><img alt="" src="main/supermario.jpg"></a>
         
            </div><!-- Top-Image  -->
            
            <div class="Top-Image-sub">
               <br> ${title}
            </div><!-- Top-Image-sub  -->
            
            <div class="Top-Right-All">
				<span style="font-size:8pt">
					<c:if test="${sessionScope.id==null }">
					<jsp:include page="../member/login.jsp"></jsp:include>
					</c:if>
					<c:if test="${sessionScope.id!=null }">
					<jsp:include page="../member/logout.jsp"></jsp:include>
					</c:if>
				</span>
            </div><!-- Top-Right-All -->
            <div class="middleContent">
               <jsp:include page="${jsp }"></jsp:include>
            </div><!-- middleContent  -->
            
            <div class="middle-Right-All">
                  <div id="m-r-sub01">
                     <div id="m-r-sub01_1">
                     </div><!-- m-r-sub01_1 -->
                     <div id="m-r-sub01_2">
                     <p>
                     맛집소개<br>
                     안녕하세요<br> 
                     서강대맛집 팔색삼겹살입니다 
                     
                     </p>
                     </div>
                  </div>   <!-- m-r-sub01 -->
                           
                  <div id="m-r-sub02">
                     <ul id="menu_01">- 최고의 맛집
                        <li><a href="#">신촌편</a></li>
                        <li><a href="#">이야기</a></li>
                     </ul>
                     <ul id="menu_02">- 지역별
                        <li><a href="#">신촌</a></li>
                        <li><a href="#">홍대</a></li>
                        <li><a href="#">강남</a></li>
                        <li><a href="#">마포</a></li>
                        </ul>
                  </div>   <!-- m-r-sub02 -->   
                  <div id="m-r-sub03">
                  
                  </div><!-- m-r-sub03  -->
            
            </div><!--  middle-Right-All-->
         </div><!-- AllDiv -->
</body>
</html>