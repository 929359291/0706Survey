<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/res_jsp/base.jsp" %>
<body>

	<%@include file="/res_jsp/manager_top.jsp" %>
	
	<div class="jumbotron">
		<h4>[创建权限]</h4>
		<div class="container">
			<form action="manager/auth/saveAuth" method="post" role="form" class="form-horizontal">
				<div class="form-group">
					<label for="authNameInput" class="col-lg-2 control-label">权限名称</label>
					<div class="col-lg-10">
						<input type="text" name="authName" class="form-control" id="authNameInput" placeholder="Enter Auth Name">
					</div>
				</div>
				<div style="text-align: center;">
					<button type="submit" class="btn btn-default" style="width: 30%">创建</button>
				</div>
			</form>
		</div>
	</div>
	
	<%@include file="/res_jsp/manager_bottom.jsp" %>

</body>
</html>