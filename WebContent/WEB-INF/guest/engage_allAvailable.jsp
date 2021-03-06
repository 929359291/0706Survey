<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/res_jsp/base.jsp" %>
<body>
	
	<%@include file="/res_jsp/guest_top.jsp" %>
	
	<div class="jumbotron">
		<h4>[所有可以参与的调查]</h4>
		<table class="table table-bordered table-hover text-center">
			<c:if test="${empty page.list }">
				<tr>
					<td>暂时还没有可以参与的调查</td>
				</tr>
			</c:if>
			<c:if test="${!empty page.list }">
				
				<tr>
					<td>Logo</td>
					<td>调查名称</td>
					<td>参与</td>
				</tr>
				
				<c:forEach items="${page.list }" var="survey">
					
					<tr>
						<td><img src="${survey.logoPath }"/></td>
						<td>${survey.surveyName }</td>
						<td>
							<a class="btn btn-default" href="guest/engage/entry/${survey.surveyId }">参与调查</a>
						</td>
					</tr>
					
				</c:forEach>
				
				<tr>
					<td colspan="3">
						<c:set var="targetUrl" value="guest/engage/showAllAvailable"/>
						<%@include file="/res_jsp/navigator.jsp" %>
					</td>
				</tr>
			
			</c:if>
		</table>
	</div>
	
	<%@include file="/res_jsp/guest_bottom.jsp" %>

</body>
</html>