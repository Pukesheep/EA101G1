<%@ page contentType="text/html; charset=UTF-8" pageEncoding="BIG5"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page import="java.util.*" %>
<%@ page import="com.post.model.*" %>
<%@ page import="com.member.model.*" %>

<%
	PostService postSvc = new PostService();
	java.util.List<PostVO> list = postSvc.getAll();
	pageContext.setAttribute("list", list);
	MemberVO memberVO = (MemberVO) session.getAttribute("memberVO");
	
%>
<jsp:useBean id="ptypeSvc" scope="page" class="com.ptype.model.PtypeService" />
<jsp:useBean id="favpostSvc" scope="page" class="com.favpost.model.FavpostService" />

<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>�Ҧ��峹��� - listAllPost.jsp</title>
    <!-- TODO: ��title ��icon -->
    <link rel="icon shortcut" href="./img/ICON.ico">
    <!-- Bootstrap�x����� https://getbootstrap.com/ -->
    <!-- �s��Bootstrap.min.css -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
        integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">

    <!-- �ϥ�font awesome -->
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.1.0/css/all.css"
        integrity="sha384-lKuwvrZot6UHsBSfcMvOkWwlCMgc0TaWr+30HWe3a4ltaBwTZhyTEggF5tJv8tbt" crossorigin="anonymous">
    <!-- �ϥ�google Fonts -->
    <link href="https://fonts.googleapis.com/css2?family=Sedgwick+Ave+Display&display=swap" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Lakki+Reddy&display=swap" rel="stylesheet">

    <!-- �ϥ�style.css -->
    <link rel="stylesheet" href="<%=request.getContextPath()%>/front-end/css/style.css">

    <!-- �s��Bootstrap�һݭn��js -->
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
<style>

	img.card-img-top {
		height: 250px;
	}
	div.card-group {
		max-width: 95%;
		margin: 2% auto;
	}
	div.card border-dark {
		margin: 20px;
	}
	div.hdd {
		margin: 2px;
	}
	img#heart-icon, img#empty-icon {
		width: 30px;
		height: 30px;
	}
	img.img-delete, img.img-insert {
		width: 30px;
		height: 30px;
		float: right;
	}
</style>
</head>
<body>
    <!-- navbar -->
    <!-- �ϥ�Boostrap Navbar -->
    <!-- �]�wNavbar��K�e���W�t -->
    <!-- b4-navbar-default �w��Bootstrap�~��,�i�H�ϥΧֱ����O -->
    <nav class="navbar navbar-expand-md navbar-dark fixed-top">
        <a class="navbar-brand" href="<%=request.getContextPath()%>/front-end/index.jsp">
            <span class="logo"><i class="fas fa-bomb"></i></span>
            <span class="logo2">S.F.G</span>
            <span class="logo3">{{{</span>
        </a>
        <!-- ��������s -->
        <button class="navbar-toggler d-lg-none" type="button" data-toggle="collapse" data-target="#collapsibleNavId"
            aria-controls="collapsibleNavId" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        
        <div class="navbar2 navbar-dark">
            <div class="row">
                <div class="item col-md-2"><a href="#"></a>�ӫ�</div>
                <div class="item col-md-2"><a href="#"></a>����</div>
                <div class="item col-md-2"><a href="#"></a>���</div>
                <div class="item col-md-2"><a href="#"></a>�Q�װ�</div>
                <div class="item col-md-2"><a href="#"></a>���Q</div>
                <div class="item col-md-2"><a href="#"></a>Q&A</div>
            </div>
        </div>

        <div class="collapse navbar-collapse" id="collapsibleNavId">
            <ul class="navbar-nav ml-auto">
                <c:if test="${memberVO == null}">
                <li class="nav-item">
                    <a class="nav-link" href="<%=request.getContextPath()%>/front-end/member/login.jsp">�n�J</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="<%=request.getContextPath()%>/front-end/member/addMember.jsp">���U</a>
                </li>
            </c:if>
            <c:if test="${sessionScope.memberVO ne null}">
            	
                <li class="nav-item">
                    <a class="nav-link" href="<%=request.getContextPath()%>/front-end/protected/listOneMember.jsp">�|������</a>
                </li>
                <li class="nav-item">
                	<a class="nav-link" href="<%=request.getContextPath()%>/login/login.do?action=logout">�n�X</a>
                </li>
          	</c:if>
                <li class="nav-item">
                    <a class="nav-link" href="#">�ڪ��̷R</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="#">�ʪ���</a>
                </li>

            </ul>
        </div>


    </nav>
    <!-- navbar end -->
    <section class="blank0"></section>
    <!-- ���e -->

		<%-- ���~��C --%>
		<c:if test="${not empty errorMsgs }">
			<font>�Эץ��H�U���~�G</font>
			<ul>
				<c:forEach var="message" items="${errorMsgs}">
						<%--
							java.util.List<String> errorMsgs = (java.util.List<String>) request.getAttribute("errorMsgs");
							String aaa = "";
							for (String msg : errorMsgs) {
								aaa += msg;
								aaa += "\r\n";
							}
						--%>
						
					<li id="errormsg">${message}</li>
					
				</c:forEach>
			</ul>
		</c:if>
	
<div class="card-group justify-content-around">
  <div class="row justify-content-around">
 	 <c:forEach var="postVO" items="${list}">
 	 	<c:if test="${postVO.p_status eq 1}">
	  		<div class="card-deck col-md-3 hdd">
			  <div class="card border-dark">
			  	<a href="<%=request.getContextPath()%>/post/post.do?action=getOne_For_Display&post_id=${postVO.post_id}">
					<img src="<%=request.getContextPath()%>/post/ShowPostPic.do?post_id=${postVO.post_id}" class="card-img-top" alt="...">
			    </a>
			    <div class="card-body text-success">
			      <p class="card-text">
			      	<a href="<%=request.getContextPath()%>/post/post.do?action=getOne_For_Display&post_id=${postVO.post_id}">
			      		<c:forEach var="ptypeVO" items="${ptypeSvc.all}">
			      			<c:if test="${postVO.ptype_id == ptypeVO.ptype_id}">
			      				[${ptypeVO.type}] ${postVO.p_title}
			      			</c:if>
			      		</c:forEach>
			      	</a>
			      </p>
			    </div>
			    <div class="card-footer bg-transparent border-success">
			      <small class="text-muted">
			      	<fmt:formatDate value="${postVO.post_time}" pattern="yyyy-MM-dd HH:mm:ss" />
			      </small>
			      <div></div>
			      	<c:if test="${sessionScope.memberVO ne null}">
			      		<c:if test="${favpostSvc.getOneFavpost(memberVO.mem_id, postVO.post_id).mem_id eq null}">
			    			 
			    			<button class="float-right btn-insert" id="${postVO.post_id}${memberVO.mem_id}insert"><img alt="" src="<%=request.getContextPath()%>/images/full.jpg" id="heart-icon"></button>
			    			
			    			<%-- 
			    			<img class="float-right img-insert" alt="" src="<%=request.getContextPath()%>/images/full.jpg" id="${postVO.post_id}${memberVO.mem_id}insert" name="${postVO.post_id}${memberVO.mem_id}">
			    			--%>
			    		</c:if>
			    	</c:if>
			    	<c:forEach var="favpostVO" items="${favpostSvc.all}">
				    	<c:if test="${favpostVO.mem_id == memberVO.mem_id and favpostVO.post_id == postVO.post_id}">
				    		 
				    		<button class="float-right btn-delete" id="${postVO.post_id}${memberVO.mem_id}delete"><img alt="" src="<%=request.getContextPath()%>/images/empty.jpg" id="empty-icon"></button>
				    		
				    		<%--
				    		<img class="float-right img-delete" alt="" src="<%=request.getContextPath()%>/images/empty.jpg" id="${postVO.post_id}${memberVO.mem_id}delete" name="${postVO.post_id}${memberVO.mem_id}">
				    		--%>
				    	</c:if>
				    </c:forEach>
			    </div>
			  </div>
		  	</div>
	  	</c:if>
 	 </c:forEach>
  </div>
  <br>
</div>
  <%-- 
  <div class="card col-md-3">
    <img src="..." class="card-img-top" alt="...">
    <div class="card-body">
      <h5 class="card-title">Card title</h5>
      <p class="card-text">This card has supporting text below as a natural lead-in to additional content.</p>
    </div>
    <div class="card-footer">
      <small class="text-muted">Last updated 3 mins ago</small>
    </div>
  </div>
  <div class="card col-md-3">
    <img src="..." class="card-img-top" alt="...">
    <div class="card-body">
      <h5 class="card-title">Card title</h5>
      <p class="card-text">This is a wider card with supporting text below as a natural lead-in to additional content. This card has even longer content than the first to show that equal height action.</p>
    </div>
    <div class="card-footer">
      <small class="text-muted">Last updated 3 mins ago</small>
    </div>
  </div>
</div>
--%>
		
		
		

    <!-- ���e ---end  -->


        <!-- footer -->
        <footer id="footer" class="pt-5 ">
            <div class="container">
                <div class="row">
                    <div class="col-md-3 col-sm-6 footer-list">
                        <h5 class="text-uppercase">�ֳt�s��</h5>
                        <ul>
                            <li>
                                <a class="footer-link" href="<%=request.getContextPath()%>/front-end/index.jsp">S.F.G����</a>
                            </li>
                            <li>
                                <a class="footer-link" href="<%=request.getContextPath()%>/front-end/member/addMember.jsp">���U�|��</a>
                            </li>
                            <li>
                                <a class="footer-link" href="">�ӫ�</a>
                            </li>
                            <li>
                                <a class="footer-link" href="">����</a>
                            </li>
                        </ul>
                    </div>
                    <div class="col-md-3 col-sm-6 footer-list">
                        <h5 class="text-uppercase">�|������</h5>
                        <ul>
                            <li>
                                <a class="footer-link" href="">�v�а�</a>
                            </li>
                            <li>
                                <a class="footer-link" href="">���ʰ�</a>
                            </li>
                            <li>
                                <a class="footer-link" href="<%=request.getContextPath()%>/front-end/post/select_page.jsp">�Q�װ�</a>
                            </li>
                            <li>
                                <a class="footer-link" href="">��ѫ�</a>
                            </li>
                        </ul>
                    </div>
                    <div class="col-md-3 col-sm-6 footer-list">
                        <h5 class="text-uppercase">����ڭ�</h5>
                        <ul>
                            <li>
                                <a class="footer-link" href="">����S.F.G</a>
                            </li>
                            <li>
                                <a class="footer-link" href="">�̷s����</a>
                            </li>
                            <li>
                                <a class="footer-link" href="">���p�v�F��</a>
                            </li>
                        </ul>
                    </div>
                    <div class="col-md-3 col-sm-6 footer-list">
                        <h5 class="text-uppercase">�޳N�䴩</h5>
                        <ul>
                            <li>
                                <a class="footer-link" href="">�s��W��</a>
                            </li>
                            <li>
                                <a class="footer-link" href="">���U&�䴩</a>
                            </li>
                            <li>
                                <a class="footer-link" href="">�A�ȱ���</a>
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

<script>
	
	$('button').click(function() {
		var button_id = this.id;
		var post_id = button_id.substring(0, 10);
		var mem_id = button_id.substring(10, 17);
		var action = button_id.substring(17);
		$.ajax({
			url: '<%=request.getContextPath()%>/favpost/favpost.do',
			type: 'POST',
			data: {
				post_id: post_id,
				mem_id : mem_id,
				action: action
			},
			success: function(){
				Swal.fire({
				  icon: 'info',
				  title: (action === "insert") ? "���ä峹���\" : "�������æ��\"
				})
			}
		});
	});
	
	<%--
	$('img').click(function() {
		var name = this.name;
		var classs = this.className;
		var post_id = name.substring(0, 10);
		var mem_id = name.substring(10, 17);
		var action = classs.substring(-6);
		$.ajax({
			url: '<%=request.getContextPath()%>/favpost/favpost.do',
			type: 'POST',
			data: {
				post_id: post_id,
				mem_id: mem_id,
				action: action
			},
			success: function(){
				Swal.fire({
					icon: 'info',
					title: (action === "insert") ? "���ä峹���\" : "�������æ��\"
				})
			}
		});
	});
	--%>
	
	
	
	$('.img-insert').click(function() {
		this.src = '<%=request.getContextPath()%>/images/empty.jpg';
		this.classList.remove('img-insert');
		this.classList.add('img-delete');
	})
	
	$('.img-delete').click(function() {
		this.src = '<%=request.getContextPath()%>/images/full.jpg';
		this.classList.remove('img-delete');
		this.classList.add('img-insert');
	})
	
</script>

</html>