<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/res_jsp/base.jsp" %>
<body>

	<%@include file="/res_jsp/manager_top.jsp" %>
	
	<div class="jumbotron">
		<h4>[简答题答案列表]</h4>
		<table class="table table-bordered table-hover text-center">
		
			<c:if test="${empty textResult }">
				<tr>
					<td>暂时没有答案数据</td>
				</tr>
			</c:if>
			<c:if test="${!empty textResult }">
				<c:forEach items="${textResult }" var="text">
					<tr>
						<td>${text }</td>
					</tr>
				</c:forEach>
			</c:if>
		
		</table>
	</div>
	
	<%@include file="/res_jsp/manager_bottom.jsp" %>

</body>
</html>