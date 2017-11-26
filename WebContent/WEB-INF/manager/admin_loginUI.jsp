<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/res_jsp/base.jsp" %>
<body>

	<%@include file="/res_jsp/manager_top.jsp" %>
	
	<div class="jumbotron">
		<h4>[管理员登录]</h4>
		<div class="container">
			<form action="manager/admin/login" method="post" role="form" class="form-horizontal">
				<c:if test="${!empty requestScope.exception }">
					<div style="text-align: center;">${requestScope.exception.message }</div>
				</c:if>
				<div class="form-group">
					<label for="adminNameInput" class="col-lg-2 control-label">账号</label>
					<div class="col-lg-10">
						<input type="text" name="adminName" class="form-control" id="adminNameInput" placeholder="Enter Admin Name">
					</div>
				</div>
				<div class="form-group">
					<label for="adminPwdInput" class="col-lg-2 control-label">密码</label>
					<div class="col-lg-10">
						<input type="password" name="adminPwd" class="form-control" id="adminPwdInput" placeholder="Enter Password">
					</div>
				</div>
				<div style="text-align: center;">
					<button type="submit" class="btn btn-default" style="width: 30%">登录</button>
				</div>
				
			</form>
		</div>
	</div>
	
	<%@include file="/res_jsp/manager_bottom.jsp" %>

</body>
</html>