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
<jsp:useBean id="memberSvc" scope="page" class="com.member.model.MemberService" />
<jsp:useBean id="commSvc" scope="page" class="com.comm.model.CommService" />

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


	div.card-group, div.card {
		max-width: 95%;
		margin: 2% auto;
	}
	div.card border-dark {
		margin: 20px;
	}
	div.hdd {
		margin: 2px;
	}
	img.img-icon {
		width: 25px;
		height: 25px;
		float: right;
		margin: 0 2px;
	}
	img.img-icon:hover {
		cursor:pointer;
	}
	img.card-img, img.card-img-top {
		height: 250px;
		padding: 0 1px;
	}
	img.card-img:hover {
		cursor: pointer;
	}
	img.postBy {
		width: 25px;
		height: 25px;
		border-radius: 50%;
	}
	p > img {
		max-width: 95%;
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
                <div class="item col-md-2"><a href="<%=request.getContextPath()%>/front-end/post/listAllPost.jsp">�Q�װ�</a></div>
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
                	<a class="nav-link" href="<%=request.getContextPath()%>/member/login.do?action=logout">�n�X</a>
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
<%
	java.util.List<String> errorMsgs = (java.util.List<String>) request.getAttribute("errorMsgs");
	String message = "";
	for (String msg : errorMsgs) {
		message += msg;
		message += "\\n";
	}
%>
<script>
	Swal.fire({
		icon: 'error',
		title: '<%=message%>'
	});
</script>
</c:if>
<%-- ���~��C --%>

<div class="container">
	<div class="row">
		<c:forEach var="postVO" items="${list}">
			<c:if test="${postVO.p_status eq 1}">
				<div class="col-4 justify-content-around">
					<div class="accordion" id="accordionExample">
						<div class="row">
							<div class="card w-100 border-dark">
								<label for="${postVO.post_id}">
									<img alt="" src="<%=request.getContextPath()%>/post/ShowPostPic.do?post_id=${postVO.post_id}" class="card-img">
								</label>
							<div class="card-header text-center" id="heading${postVO.post_id}">
								<h5 class="card-title">
								<button class="btn btn-link" type="button" data-toggle="collapse" data-target="#collapse${postVO.post_id}" aria-expanded="false" aria-controls="collapse${postVO.post_id}" id="${postVO.post_id}">
									<c:forEach var="ptypeVO" items="${ptypeSvc.all}">
				      					<c:if test="${postVO.ptype_id == ptypeVO.ptype_id}">
				      						[${ptypeVO.type}] ${postVO.p_title}
				      					</c:if>
			      					</c:forEach>
								</button>
								</h5>
								<c:forEach var="memberVOpost" items="${memberSvc.all}">
									<c:if test="${memberVOpost.mem_id == postVO.mem_id}">
										<small class="text-muted">
											�峹�@�� �G<a href="<%=request.getContextPath()%>/member/member.do?action=getOne_For_Display-front&mem_id=${postVO.mem_id}">${memberVOpost.mem_name}<img class="postBy" alt="" src="<%=request.getContextPath()%>/member/ShowMemberPic.do?mem_id=${postVO.mem_id}"></a>
											<br>
											<br>
										</small>
										<c:if test="${sessionScope.memberVO ne null}">
								      		<c:if test="${favpostSvc.getOneFavpost(memberVO.mem_id, postVO.post_id).mem_id eq null}">
								      			<img class="img-icon" alt="" src="<%=request.getContextPath()%>/images/icons/full.png" id="${postVO.post_id}${memberVO.mem_id}" title="���ä峹">
								      		</c:if>
					      					<c:forEach var="favpostVO" items="${favpostSvc.all}">
									      		<c:if test="${favpostVO.mem_id == memberVO.mem_id and favpostVO.post_id == postVO.post_id}">
									      			<img class="float-right img-icon" alt="" src="<%=request.getContextPath()%>/images/icons/empty.png" id="${postVO.post_id}${memberVO.mem_id}" title="��������">
									      		</c:if>
					      					</c:forEach>
					      					<img class="img-icon" alt="" src="<%=request.getContextPath()%>/images/icons/comm.png" id="${postVO.post_id}${memberVO.mem_id}" title="�^�Ф峹">
					      					<img class="img-icon" alt="" src="<%=request.getContextPath()%>/images/icons/reportmember.png" id="${postVO.post_id}${memberVO.mem_id}" title="���|�|��">
					      					<img class="img-icon" alt="" src="<%=request.getContextPath()%>/images/icons/reportpost.png" id="${postVO.post_id}${memberVO.mem_id}" title="���|�峹">
											<c:if test="${sessionScope.memberVO.mem_id == postVO.mem_id}">
												<img class="img-icon" alt="" src="<%=request.getContextPath()%>/images/icons/remove.png" id="${postVO.post_id}${memberVO.mem_id}" title="�����峹">
												<img class="img-icon" alt="" src="<%=request.getContextPath()%>/images/icons/update.png" id="${postVO.post_id}${memberVO.mem_id}" title="�ק�峹">
											</c:if>
			      						</c:if>
									</c:if>
								</c:forEach>
							</div>
							<div id="collapse${postVO.post_id}" class="collapse" aria-labelledby="heading${postVO.post_id}" data-parent="#accordionExample">
								<div class="card-body h5">
									<b>
										${postVO.text}
									</b>
								</div>
								<div class="card-header text-center" id="headingOne">
									<h5 class="card-title">
										<button class="btn btn-link" type="button" data-toggle="collapse" data-target="#collapse${postVO.post_id}" aria-expanded="false" aria-controls="collapse${postVO.post_id}">
											���X�峹
										</button>
									</h5>
								</div>
							</div>
							 
								<c:if test="${commSvc.findComm(postVO.post_id).comm_id ne null}">
									<div class="accordion" id="accordionExample">
										<div class="card-header text-center" id="headingOne">
											<h5 class="card-title">
												<button class="btn btn-link" type="button" data-toggle="collapse" data-target=".${postVO.post_id}" aria-expanded="false" aria-controls="collapseOne">
													�s���d��
												</button>
											</h5>
										</div>
										<c:forEach var="commVO" items="${commSvc.all}">
											<c:if test="${commVO.c_status eq 1}">
												<c:if test="${commVO.post_id == postVO.post_id}">
													<div id="collapseOne" class="collapse ${postVO.post_id}" aria-labelledby="headingOne" data-parent="#accordionExample">
														<c:forEach var="memberVOcomm" items="${memberSvc.all}">
															<c:if test="${memberVOcomm.mem_id == commVO.mem_id}">
																<div class="card-header">
																	<small class="text-muted">
																		�d���|�� �G<a href="<%=request.getContextPath()%>/member/member.do?action=getOne_For_Display-front&mem_id=${commVO.mem_id}">${memberVOcomm.mem_name}<img class="postBy" alt="" src="<%=request.getContextPath()%>/member/ShowMemberPic.do?mem_id=${commVO.mem_id}"></a>
																	</small>
																<c:if test="${sessionScope.memberVO ne null}">
																	<img class="img-icon" alt="" src="<%=request.getContextPath()%>/images/icons/reportmember.png" id="${commVO.comm_id}${memberVO.mem_id}" title="���|�|��">
																	<c:if test="${sessionScope.memberVO.mem_id == commVO.mem_id}">
																		<img class="img-icon" alt="" src="<%=request.getContextPath()%>/images/icons/remove.png" id="${commVO.comm_id}${memberVO.mem_id}" title="�����d��">
																		<img class="img-icon" alt="" src="<%=request.getContextPath()%>/images/icons/update.png" id="${commVO.comm_id}${memberVO.mem_id}" title="�ק�d��">
																	</c:if>
																</c:if>
																</div>
															</c:if>
														</c:forEach>
														<div class="card-body h6">
															<small class="text-muted post_time float-right">�d���ɶ� �G <fmt:formatDate value="${commVO.post_time}" pattern="yyyy-MM-dd HH:mm:ss" /></small>
															<br>
															<small class="text-muted last_time float-right">�ק�ɶ� �G <fmt:formatDate value="${commVO.last_edit}" pattern="yyyy-MM-dd HH:mm:ss" /></small>
															<br>
															<br>
															<b>
																${commVO.c_text}
															</b>
															<br>
														</div>
													</div>
												</c:if>
											</c:if>		
										</c:forEach>
										<div id="collapseOne" class="collapse ${postVO.post_id}" aria-labelledby="headingOne" data-parent="#accordionExample">
											<div class="card-header text-center" id="headingOne">
												<h5 class="card-title">
													<button class="btn btn-link" type="button" data-toggle="collapse" data-target=".${postVO.post_id}" aria-expanded="false" aria-controls="collapseOne">
														���X�d��
													</button>
												</h5>
											</div>
										</div>
									</div>
								</c:if>		
								<div class="card-footer">
									<small class="text-muted post_time float-right">�i�K�ɶ� �G <fmt:formatDate value="${postVO.post_time}" pattern="yyyy-MM-dd HH:mm:ss" /></small>
									<br>
									<small class="text-muted last_edit float-right">�ק�ɶ� �G <fmt:formatDate value="${postVO.last_edit}" pattern="yyyy-MM-dd HH:mm:ss" /></small>
								</div>
							</div>
						
						</div>
					</div>
				</div>
			</c:if>
		</c:forEach>
	</div>
</div>











<script>
	// �B�zicon�Ϥ��Υ\�઺����
	$('img.img-icon').click(function(){
		var source = $(this).attr('src');
		if (source.includes('full')){
			// full �� ��߷R�߹Ϯ�, �N���ä峹�\��, ���U��m���Ϥ�, �åB�HAJAX�覡�e�X�ШD
			var thisID = this.id;
			var post_id = thisID.substring(0, 10);
			var mem_id = thisID.substring(10, 17);
			$(this).attr('src', '<%=request.getContextPath()%>/images/empty.png');
			$(this).attr('title', '��������');
			$.ajax({
				url: '<%=request.getContextPath()%>/favpost/favpost.do',
				type: 'POST',
				data: {
					post_id: post_id,
					mem_id: mem_id,
					action: 'insert'
				},
				success: function(){
					Swal.fire({
						icon: 'info',
						title: '���ä峹���\',
						showConfirmButton: false,
						timer: 750
					})
				}
			});
			
		} else if (source.includes('empty')){
			// empty �N��Ť߷R�߹Ϯ�, �N��������å\��, ���U��m���Ϥ�, �åB�HAJAX�覡�e�X�ШD
			var thisID = this.id;
			var post_id = thisID.substring(0, 10);
			var mem_id = thisID.substring(10, 17);
			$(this).attr('src', '<%=request.getContextPath()%>/images/full.png');
			$(this).attr('title', '���ä峹');
			$.ajax({
				url: '<%=request.getContextPath()%>/favpost/favpost.do',
				type: 'POST',
				data: {
					post_id: post_id,
					mem_id: mem_id,
					action: 'delete'
				},
				success: function(){
					Swal.fire({
						icon: 'info',
						title: '�������æ��\',
						showConfirmButton: false,
						timer: 750
					})
				}
			});
		} else if (source.includes('remove')){
			// remove ���U����Ϯ�, �N�����峹�ίd��
			var thisID = this.id;
			if (thisID.includes('POST')){
				// �C��.img-icon �� img ���Ҫ� ID �����[�J�F
				// ${postVO.post_id}${memberVO.mem_id} �άO ${commVO.comm_id}${memberVO.mem_id}
				// �H���P�_�O�峹�άO�d�������� icon �Q���U
				// �A�^��'POST000000' �άO 'COMM000000' �@���ШD�Ѽ�
				var post_id = thisID.substring(0, 10);
				var post = $(this).parents('div.justify-content-around');
				$.ajax({
					url: '<%=request.getContextPath()%>/post/post.do',
					type: 'POST',
					data: {
						post_id: post_id,
						action: 'remove'
					},
					success: function(){
						post.hide();
						Swal.fire({
							icon: 'info',
							title: '�����峹���\',
							showConfirmButton: false,
							timer: 1200
						});
					},
					error: function(){
						Swal.fire({
							icon: 'error',
							title: '�����峹����'
						})
					}
				});
			} else if (thisID.includes('COMM')){
				<%-- �����d���϶� --%>
				<%-- comm �� model �B controller �٨S���g remove �\��, ���L�������޿�w�g�B�z�n�F --%>
				// div.collapse, div.accordion
				var comm_id = thisID.substring(0, 10);
				var comm = $(this).parents('div.collapse');
				var commRoot = $(this).parents('div.accordion');
				var commSibling = commRoot.find('div.collapse');
				var oooSibling = comm.siblings();
				
				$.ajax({
					url: '<%=request.getContextPath()%>/comm/comm.do',
					type: 'POST',
					date: {
						comm_id: comm_id,
						action: 'remove'
					},
					success: function(){
						
						if (commSibling.length <= 3){
							oooSibling.hide();
							comm.hide();
						} else {
							comm.remove();
						}
						
						Swal.fire({
							icon: 'info',
							title: '�����d�����\',
							showConfirmButton: false,
							timer: 1200
						});
					},
					error: function(){
						Swal.fire({
							icon: 'error',
							title: '�����峹����'
						})
					}
				});
				
			}
			
		} else if (source.includes('update')){
			var parent = $(this).parents('.col-4 justify-content-around');
			parent.attr('class', 'ririri');
			console.log(parent);
			
		}

	});

	
</script>
		
		
		

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
                                <a class="footer-link" href="<%=request.getContextPath()%>/front-end/post/listAllPost.jsp">�Q�װ�</a>
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



</html>