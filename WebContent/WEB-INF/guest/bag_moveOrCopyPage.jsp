<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/res_jsp/base.jsp" %>
<body>
	
	<%@include file="/res_jsp/guest_top.jsp" %>
	
	<div class="jumbotron">
		<h4>[选择目标调查]</h4>
		<table class="table table-bordered table-hover text-center">
		
			<tr>
				<td>ID</td>
				<td>调查名称</td>
				<td>操作</td>
			</tr>
			
			<c:forEach items="${page.list }" var="survey">
				
				<tr>
					<td>${survey.surveyId }</td>
					<td>${survey.surveyName }</td>
					<td>
						<c:if test="${requestScope.surveyId != survey.surveyId }">
							<a class="btn btn-default" href="guest/bag/moveToThisSurvey/${requestScope.bagId }/${survey.surveyId}">移动到当前调查</a>
							|
							<a class="btn btn-default" href="guest/bag/copyToThisSurvey/${requestScope.bagId }/${survey.surveyId}">复制到当前调查</a>
						</c:if>
						<c:if test="${requestScope.surveyId == survey.surveyId }">
							当前调查
						</c:if>
					</td>
				</tr>
				
			</c:forEach>
			
			<tr>
				<td colspan="3">
					<c:set var="targetUrl" value="guest/bag/toMoveOrCopyPage/${requestScope.bagId }/${requestScope.surveyId }" scope="page"/>
					<%@include file="/res_jsp/navigator.jsp" %>
				</td>
			</tr>
		
		</table>
	</div>
	
	<%@include file="/res_jsp/guest_bottom.jsp" %>

</body>
</html>