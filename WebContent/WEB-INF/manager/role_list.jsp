<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/res_jsp/base.jsp" %>
<script type="text/javascript">
	
	$(function(){
		$("[name=roleName]").change(function(){
			
			var roleId = this.id;
			var roleName = this.value;
			
			var url = "${pageContext.request.contextPath}/manager/role/updateRoleName";
			var paramData = {"roleId":roleId,"roleName":roleName,"time":new Date()};
			var callBack = function(respData){
				var message = respData.message;
				if(message == "success") {
					alert("操作成功！");
				}else{
					alert("操作失败！");
				}
			};
			var type = "json";
			
			$.post(url,paramData,callBack,type);
			
		});
	});
	
</script>
<body>
	<%@include file="/res_jsp/manager_top.jsp" %>
	
	<div class="jumbotron">
		<h4>角色列表</h4>
		<form action="manager/role/batchDelete" method="post">
			<table class="table table-bordered table-hover text-center">
				<c:if test="${empty roleList }">
					<tr>
						<td>尚未创建角色！</td>
					</tr>
				</c:if>
				<c:if test="${!empty roleList }">
					<tr>
						<td>ID</td>
						<td>角色名称</td>
						<td>删除</td>
						<td>分配</td>
					</tr>
					<c:forEach items="${roleList }" var="role">
						<tr>
							<td>${role.roleId }</td>
							<td>
								<input id="${role.roleId }" type="text" name="roleName" value="${role.roleName }" class="form-control"/>
							</td>
							<td>
								<input type="checkbox" name="roleIdList" value="${role.roleId }" id="checkbox${role.roleId }"/>
								<label for="checkbox${role.roleId }">点我更轻松</label>
							</td>
							<td>
								<a class="btn btn-default" href="manager/role/toDispatcherUI/${role.roleId }">分配权限</a>
							</td>
						</tr>
					</c:forEach>
					
					<tr>
						<td colspan="4">
							<button type="submit" class="btn btn-default" style="width: 30%">批量删除</button>
						</td>
					</tr>
				</c:if>
			</table>
		</form>
	</div>
	
	<%@include file="/res_jsp/manager_bottom.jsp" %>

</body>
</html>