<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="com.member.model.*" %>

<%
	MemberVO memberVO = (MemberVO) session.getAttribute("memberVO");
%>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>login.jsp</title>
    <!-- TODO: 換title 的icon -->
    <link rel="icon shortcut" href="./img/ICON.ico">
    <!-- Bootstrap官方網站 https://getbootstrap.com/ -->
    <!-- 連結Bootstrap.min.css -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
        integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">

    <!-- 使用font awesome -->
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.1.0/css/all.css"
        integrity="sha384-lKuwvrZot6UHsBSfcMvOkWwlCMgc0TaWr+30HWe3a4ltaBwTZhyTEggF5tJv8tbt" crossorigin="anonymous">
    <!-- 使用google Fonts -->
    <link href="https://fonts.googleapis.com/css2?family=Sedgwick+Ave+Display&display=swap" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Lakki+Reddy&display=swap" rel="stylesheet">

    <!-- 使用style.css -->
    <link rel="stylesheet" href="<%=request.getContextPath()%>/front-end/css/style.css">

    <!-- 連結Bootstrap所需要的js -->
    <!-- jquery.min.js -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
    <!-- popper.min.js -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"
        integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1"
        crossorigin="anonymous"></script>
    <!-- bootstrap.min.js -->
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"
        integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM"
        crossorigin="anonymous"></script>
        
    <!-- SweetAlert2 -->
	<script src="https://cdn.jsdelivr.net/npm/sweetalert2@9"></script>

</head>

<body>
    <!-- navbar -->
    <!-- 使用Boostrap Navbar -->
    <!-- 設定Navbar緊貼畫面上緣 -->
    <!-- b4-navbar-default 安裝Bootstrap外掛,可以使用快捷指令 -->
    <nav class="navbar navbar-expand-md navbar-dark fixed-top">
        <a class="navbar-brand" href="<%=request.getContextPath()%>/front-end/index.jsp">
            <span class="logo"><i class="fas fa-bomb"></i></span>
            <span class="logo2">S.F.G</span>
            <span class="logo3">{{{</span>
        </a>
        <!-- 手機選單按鈕 -->
        <button class="navbar-toggler d-lg-none" type="button" data-toggle="collapse" data-target="#collapsibleNavId"
            aria-controls="collapsibleNavId" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        
        <div class="navbar2 navbar-dark">
            <div class="row">
                <div class="item col-md-2"><a href="#"></a>商城</div>
                <div class="item col-md-2"><a href="#"></a>團購</div>
                <div class="item col-md-2"><a href="#"></a>交易</div>
                <div class="item col-md-2"><a href="<%=request.getContextPath()%>/front-end/post/listAllPost.jsp">討論區</a></div>
                <div class="item col-md-2"><a href="#"></a>紅利</div>
                <div class="item col-md-2"><a href="#"></a>Q&A</div>
            </div>
        </div>

        <div class="collapse navbar-collapse" id="collapsibleNavId">
            <ul class="navbar-nav ml-auto">
                <c:if test="${memberVO == null}">
                <li class="nav-item">
                    <a class="nav-link" href="<%=request.getContextPath()%>/front-end/member/login.jsp">登入</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="<%=request.getContextPath()%>/front-end/member/addMember.jsp">註冊</a>
                </li>
            </c:if>
            <c:if test="${sessionScope.memberVO ne null}">
            	
                <li class="nav-item">
                    <a class="nav-link" href="<%=request.getContextPath()%>/member/member.do?action=getOne_For_Update-front&mem_id=${sessionScope.memberVO.mem_id}">會員中心</a>
                </li>
                <li class="nav-item">
                	<a class="nav-link" href="<%=request.getContextPath()%>/login/login.do?action=logout">登出</a>
                </li>
          	</c:if>
                <li class="nav-item">
                    <a class="nav-link" href="#">我的最愛</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="#">購物車</a>
                </li>

            </ul>
        </div>


    </nav>
    <!-- navbar end -->
    <section class="blank0"></section>
    <!-- 內容 -->
    <section class="blank1">
		<%-- 錯誤表列 --%>
		<c:if test="${not empty errorMsgs }">
			<font>請修正以下錯誤：</font>
			<ul>
			<%-- 
				<c:forEach var="message" items="${errorMsgs}">
						

						
					<li id="errormsg">${message}</li>
					
				</c:forEach>
				--%>
			</ul>
			<%
				java.util.List<String> errorMsgs = (java.util.List<String>) request.getAttribute("errorMsgs");
				String aaa = "";
				for (String msg : errorMsgs) {
					aaa += msg;
					aaa += "\r\n";
			%>
			<%= msg %>
			<%= aaa %>
			<script>
				Swal.fire({
				  icon: 'error',
				  title: <%=aaa%>,
				  text: 'Something went wrong!',
				  footer: '<a href>Why do I have this issue?</a>'
				})
				console.log(<%=aaa%>);
			</script>
			<%}%>
		</c:if>
	<%--
		<form action="member.do" method="post" id="login">
			<div class="col-md-3 col-sm-6">
				<div class="input-group mb-3">
  					<div class="input-group-prepend">
						<span class="input-group-text" id="basic-addon1">E-mail</span>
  					</div>
  					<input type="text" class="form-control" placeholder="Username" name="mem_email" aria-label="Username" aria-describedby="basic-addon1">
  					<div class="input-group-prepend">
						<span class="input-group-text" id="basic-addon1">Password</span>
  					</div>
  					<input type="password" class="form-control" placeholder="Password" name="mem_pass" aria-label="Username" aria-describedby="basic-addon1">
				</div>
				<button type="submit" class="btn btn-success btn-lg" form="login" name="action" value="login">登入</button>
			</div>
		</form>
	 --%>
	   <div class="col-md-2">
	   filefile
	   sjfsnsdjknfjkdfdsfdfsdjfsd
	   </div>
	   	<div class="col-md-5 offset-md-5 justify-content-around">
		<form action="<%=request.getContextPath()%>/login/login.do" method="post" id="login">
			<div class="form-group col-md-3 col-sm-6">
	    		<label for="formGroupExampleInput1">E-mail</label>
	    		<input type="text" class="form-control" id="formGroupExampleInput1" placeholder="E-mail" name="email">
	    	</div>
	    	<div class="form-group col-md-3 col-sm-6">
	  			<label for="formGroupExampleInput2">Password</label>
	    		<input type="password" class="form-control" id="formGroupExampleInput2" placeholder="Password" name="password">
	  		</div>
	  		<div class="form-row col-md-3 col-sm-6 justify-content-around">
	  			<button type="submit" class="btn btn-success btn-lg" form="login" name="action" value="login">Login</button>
	  		</div>
		</form>
		</div>
    </section>
    <!-- 內容 ---end  -->


        <!-- footer -->
        <footer id="footer" class="pt-5 ">
            <div class="container">
                <div class="row">
                    <div class="col-md-3 col-sm-6 footer-list">
                        <h5>快速連結</h4>
                        <ul>
                            <li>
                                <a class="footer-link" href="<%=request.getContextPath()%>/front-end/index.jsp">S.F.G首頁</a>
                            </li>
                            <li>
                                <a class="footer-link" href="<%=request.getContextPath()%>/front-end/member/addMember.jsp">註冊會員</a>
                            </li>
                            <li>
                                <a class="footer-link" href="">商城</a>
                            </li>
                            <li>
                                <a class="footer-link" href="">團購</a>
                            </li>
                        </ul>
                    </div>
                    <div class="col-md-3 col-sm-6 footer-list">
                        <h5 class="text-uppercase">會員互動</h5>
                        <ul>
                            <li>
                                <a class="footer-link" href="">競標區</a>
                            </li>
                            <li>
                                <a class="footer-link" href="">直購區</a>
                            </li>
                            <li>
                                <a class="footer-link" href="<%=request.getContextPath()%>/front-end/post/listAllPost.jsp">討論區</a>
                            </li>
                            <li>
                                <a class="footer-link" href="">聊天室</a>
                            </li>
                        </ul>
                    </div>
                    <div class="col-md-3 col-sm-6 footer-list">
                        <h5 class="text-uppercase">關於我們</h5>
                        <ul>
                            <li>
                                <a class="footer-link" href="">關於S.F.G</a>
                            </li>
                            <li>
                                <a class="footer-link" href="">最新消息</a>
                            </li>
                            <li>
                                <a class="footer-link" href="">隱私權政策</a>
                            </li>
                        </ul>
                    </div>
                    <div class="col-md-3 col-sm-6 footer-list">
                        <h5 class="text-uppercase">技術支援</h5>
                        <ul>
                            <li>
                                <a class="footer-link" href="">新手上路</a>
                            </li>
                            <li>
                                <a class="footer-link" href="">幫助&支援</a>
                            </li>
                            <li>
                                <a class="footer-link" href="">服務條款</a>
                            </li>
                        </ul>                    
                    </div>
                </div>
            </div>

            <div class="footer-end bg-dark mt-5 py-2">
                <p class="text-center">&copy; Copy right 2020</p>
            </div>
        </footer>

        <button id="chatBtn" class="bg-primary">
            <i class="fas fa-comments"></i>
        </button>

</body>
<%-- 
<script>

Swal.fire({
	  icon: 'error',
	  title: 'Oops...',
	  text: 'Something went wrong!',
	  footer: '<a href>Why do I have this issue?</a>'
	})

</script>
--%>

</html>