<%@ page contentType="text/html; charset=UTF-8" pageEncoding="BIG5"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="com.member.model.*" %>

<%--
<%
	MemberVO memberVO = (MemberVO) session.getAttribute("memberVO");
	String login = "/front-end/member/login.jsp";
	if (memberVO == null) {
		session.setAttribute("location", request.getRequestURI());
		response.sendRedirect(request.getContextPath() + login);
		return;
	}
%>
--%>
 
<!DOCTYPE html>
<html>
<head>
<meta charset="BIG5">
<title>Insert title here</title>
</head>
<style>
	div#logout {
		float: right;
	}
</style>
<body>

	<form action="member.do" method="post">
		<c:if test="${not empty memberVO }">
			<div id="logout">
				<input type="hidden" name="action" value="logout">
				<input type="submit" value="�n�X">
			</div>
		</c:if>
	</form>
${memberVO.mem_name}
hi 123 �o�̻ݭn�n�J
�ݨ�o����ܧA�n�J�i�ӷS��

</body>
</html>