<%@ page contentType="text/html; charset=UTF-8" pageEncoding="BIG5"%>
<%@ page import="com.post.model.*" %>
<%-- 此頁暫練習採用 Script 的寫法取值 --%>

<%
	PostVO postVO = (PostVO) request.getAttribute("postVO");
%>

<html>
<head>
<title>文章資料 - listOnePost.jsp</title>

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

<h4>此頁暫練習採用 Script 的寫法取值：</h4>
<table id="table-1">
	<tr>
		<td>
			<h3>文章資料 - listOnePost.jsp</h3>
			<h4><a href="<%=request.getContextPath()%>/front-end/post/select_page.jsp"><img alt="" src="<%=request.getContextPath()%>/images/back1.gif">回首頁</a></h4>
		</td>
	</tr>
</table>

<table>
	<tr>
		<th>文章編號</th>
		<th>會員編號</th>
		<th>文章類型編號</th>
		<th>文章狀態</th>
		<th>文章標題</th>
		<th>文章內容</th>
		<th>附加圖片</th>
		<th>最後修改時間</th>
		<th>發文時間</th>
	</tr>
	<tr>
		<td><%=postVO.getPost_id()%></td>
		<td><%=postVO.getMem_id()%></td>
		<td><%=postVO.getPtype_id()%></td>
		<td><%=postVO.getP_status()%></td>
		<td><%=postVO.getP_title()%></td>	
		<td><%=postVO.getText()%></td>
		<td><img alt="" src="<%=request.getContextPath()%>/post/ShowPostPic.do?post_id=<%=postVO.getPost_id()%>" id="display"></td>
		<td><%=postVO.getLast_edit()%></td>
		<td><%=postVO.getPost_time()%></td>
		<td>
			<form action="<%=request.getContextPath()%>/post/post.do" method="post">
				<input type="submit" value="修改">
				<input type="hidden" name="post_id" value="<%=postVO.getPost_id()%>">
				<input type="hidden" name="action" value="getOne_For_Update">
			</form>
		</td>
	</tr>
</table>

</body>
</html>