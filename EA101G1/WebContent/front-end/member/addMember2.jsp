<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="com.member.model.*" %>

<%
	MemberVO memberVO = (MemberVO) request.getAttribute("memberVO");
%>

<html>
<head>
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"/>
<title>會員資料新增 - addMember.jsp</title>

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
		matgin-bottom: 1px;
	}
	h4 {
		color: blue;
		display: inline;
	}
	table {
		width: 450px;
		background-color: white;
		margin-top: 1px;
		margin-bottom: 1px;
	}
	table, th, td {
		border: 0px solid #CCCCFF;
	}
	th, td {
		padding: 1px;
	}
	body {
		background-color: white;
	}
	#back {
		width: 100px;
		height: 32px;
	}
	font {
		color: red;
	}
	li {
		color: red;
	}
	#tomcat {
		width: 100px;
		height: 100px;
	}
	#display {
		width: 200px;
		height: 200px;
	}
	#upload {
		display: none;
	}
	img#submit {
		width: 100px;
		height: 50px;
	}
</style>

</head>
<body>

<table id="table-1">
	<tr>
		<td>
			<h3>會員資料新增 - addMember.jsp</h3>
		</td>
		<td>
			<h4><a href="<%=request.getContextPath()%>/front-end/member/select_page.jsp"><img alt="" src="<%=request.getContextPath()%>/images/tomcat.png" id="tomcat">回首頁</a></h4>
		</td>
	</tr>
</table>

<h3>資料新增：</h3>

<%-- 錯誤表列 --%>
<c:if test="${not empty errorMsgs}">
	<font>請修正以下錯誤：</font>
	<ul>
		<c:forEach var="message" items="${errorMsgs}">
			<li>${message}</li>
		</c:forEach>
	</ul>
</c:if>

<form action="<%=request.getContextPath()%>/member/member.do" method="post">
	<table>
		<tr>
			<td>
				電子信箱：
			</td>
			<td>
				<input type="text" name="mem_email" value="<%= (memberVO == null) ? "" : memberVO.getMem_email() %>" placeholder="請輸入電子信箱">
				<input type="hidden" name="action" value="signup">
				<%-- 
				<input type="submit" value="送出">
				--%>
				<button type="submit"><img alt="" src="<%=request.getContextPath()%>/images/tomcat.png" id="submit"></button>
			</td>
		</tr>
	</table>
</form>

</body>

</html>