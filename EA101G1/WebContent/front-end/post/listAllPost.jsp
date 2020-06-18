<%@ page contentType="text/html; charset=UTF-8" pageEncoding="BIG5"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="java.util.*" %>
<%@ page import="com.post.model.*" %>

<%
	PostService postSvc = new PostService();
	java.util.List<PostVO> list = postSvc.getAll();
	pageContext.setAttribute("list", list);
%>
<jsp:useBean id="memberSvc" scope="page" class="com.member.model.MemberService" />

<html>
<head>
<title>所有文章資料 - listAllPost.jsp</title>

<style>
	table#table-1 {
		width: 100%;
		background-color: #CCCCFF;
		border: 2px solid black;
		text-align: center;
	}
	table#table-1 h4 {
		color: red;
		display: block;
		margin-bottom: 1px;
	}
	h4 {
		color: blue;
		display: inline;
	}
	
	table {
		width: 100%;
		background-color: white;
		margin-top: 5px;
		margin-bottom: 5px;
		text-align: center;
	}
	
	td#text {
		text-align: left;
	}
	
	table, th, td {
		padding: 5px;
	}
	/*
	th, td {
		width: 100%;
		height: 100%;
	}
	*/
	body {
		background-color: white;
	}
	img {
		width: 100px;
		height: 32px;
	}
	font {
		color: red;
	}
	#errormsg {
		color: red;
	}
	img#display {
		width: 200px;
		height: 200px;
	}
</style>

</head>
<body>

<h4>此頁練習採用 EL 的寫法取值</h4>
<table id="table-1">
	<tr>
		<td>
			<h3>所有文章資料 - listAllPost.jsp</h3>
			<h4><a href="<%=request.getContextPath()%>/front-end/post/select_page.jsp"><img alt="" src="<%=request.getContextPath()%>/images/back1.gif">回首頁</a></h4>
		</td>
	</tr>
</table>

<%-- 錯誤表列 --%>
<c:if test="${not empty errorMsgs}">
	<font>請修正以下錯誤</font>
	<ul>
		<c:forEach var="message" items="${errorMsgs}">
			<li id="errormsg">${message}</li>
		</c:forEach>
	</ul>
</c:if>

<table>
	<tr>
		<th>文章編號</th>
		<th>會員編號</th>
		<th>會員名稱</th>
		<th>文章類型編號</th>
		<th>文章狀態</th>
		<th>文章標題</th>
		<th>文章內容</th>
		<th>附加圖片</th>
		<th>最後修改時間</th>
		<th>發文時間</th>
	</tr>
	
<%@ include file="../../files/page1.file" %>
	<c:forEach var="postVO" items="${list}" begin="<%=pageIndex%>" end="<%=pageIndex+rowsPerPage-1%>">
		<tr>
			<td>${postVO.post_id}</td>
			<td>${postVO.mem_id}</td>
			<td>
				<c:forEach var="memberVO" items="${memberSvc.all}">
					<c:if test="${postVO.mem_id == memberVO.mem_id}">
						${memberVO.mem_name}
					</c:if>
				</c:forEach>
			</td>
			<td>${postVO.ptype_id}</td>
			<td>${postVO.p_status}</td>
			<td>${postVO.p_title}</td>
			<td id="text">${postVO.text}</td>
			<td><img alt="" src="<%=request.getContextPath()%>/post/ShowPostPic.do?post_id=${postVO.post_id}" id="display"></td>
			<td>${postVO.last_edit}</td>
			<td>${postVO.post_time}</td>
			<td>
				<form action="<%=request.getContextPath()%>/post/post.do" method="post">
					<input type="submit" value="修改">
					<input type="hidden" name="post_id" value="${postVO.post_id}">
					<input type="hidden" name="action" value="getOne_For_Update">
				</form>
			</td>
			<td>
				<form action="<%=request.getContextPath()%>/post/post.do" method="post">
					<input type="submit" value="刪除">
					<input type="hidden" name="post_id" value="${postVO.post_id}">
					<input type="hidden" name="action" value="delete">
				</form>
			</td>
		</tr>
	</c:forEach>
</table>
<%@ include file="../../files/page2.file" %>

</body>
</html>