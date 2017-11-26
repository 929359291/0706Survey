<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/res_jsp/base.jsp" %>
<body>
	<%@include file="/res_jsp/manager_top.jsp" %>
	
	<div class="jumbotron">
		<h4>管理员列表</h4>
		<table class="table table-bordered table-hover text-center">
			<c:if test="${empty adminList }">
				<tr>
					<td>暂时没有创建账号</td>
				</tr>
			</c:if>
			<c:if test="${!empty adminList }">
				<tr>
					<td>AdminName</td>
					<td>分配</td>
				</tr>
				<c:forEach items="${adminList }" var="admin">
					<tr>
						<td>${admin.adminName }</td>
						<td>
							<a class="btn btn-default" href="manager/admin/toDispatcherUI/${admin.adminId }">分配角色</a>
						</td>
					</tr>
				</c:forEach>
			</c:if>
		</table>
	</div>
	
	<%@include file="/res_jsp/manager_bottom.jsp" %>

</body>
</html>