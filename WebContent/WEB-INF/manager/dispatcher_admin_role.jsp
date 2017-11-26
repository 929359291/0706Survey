<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/res_jsp/base.jsp" %>
<body>

	<%@include file="/res_jsp/manager_top.jsp" %>
	
	<div class="jumbotron">
		<h4>[给管理员分配角色]</h4>
		<form action="manager/admin/doDispatcher" method="post">
			
			<input type="hidden" name="adminId" value="${requestScope.adminId }"/>
			
			<table class="table table-bordered table-hover text-center">
				
				<c:if test="${empty roleList }">
					<tr>
						<td>暂时没有角色可供分配</td>
					</tr>
				</c:if>
				<c:if test="${!empty roleList }">
					
					<c:forEach items="${roleList }" var="role">
						
						<tr>
							<td>
								<!-- 回显的方式是检查当前遍历得到的roleId是否在roleIdList中 -->
								<input id="checkbox${role.roleId }" 
									   type="checkbox" 
									   name="roleIdList" 
									   value="${role.roleId }"
									   
										<c:forEach items="${roleIdList }" var="currentRoleId">
											<c:if test="${currentRoleId==role.roleId }">checked="checked"</c:if>
										</c:forEach>
									   
									   />
									   
									   
								<label for="checkbox${role.roleId }">${role.roleName }</label>
							</td>
						</tr>
						
					</c:forEach>
					
					<tr>
						<td>
							<button type="submit" class="btn btn-default" style="width: 30%">OK</button>
						</td>
					</tr>
					
				</c:if>
				
			</table>
			
		</form>
	</div>
	
	<%@include file="/res_jsp/manager_bottom.jsp" %>

</body>
</html>