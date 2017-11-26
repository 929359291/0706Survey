<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/res_jsp/base.jsp" %>
<body>
	
	<%@include file="/res_jsp/guest_top.jsp" %>
	
	<div class="jumbotron">
		<h4>[用户登录]</h4>
		<div class="container">
			<form action="guest/user/login" method="post" role="form" class="form-horizontal">
				<c:if test="${!empty requestScope.exception }">
					<div style="text-align: center;">${requestScope.exception.message }</div>
				</c:if>
				<div class="form-group">
					<label for="userNameInput" class="col-lg-2 control-label">账号</label>
					<div class="col-lg-10">
						<input type="text" name="userName" class="form-control" id="userNameInput" placeholder="Enter User Name">
					</div>
				</div>
				<div class="form-group">
					<label for="passwordInput" class="col-lg-2 control-label">密码</label>
					<div class="col-lg-10">
						<input type="password" name="userPwd" class="form-control" id="passwordInput" placeholder="Enter Password">
					</div>
				</div>
				<div style="text-align: center;">
					<button type="submit" class="btn btn-default" style="width: 30%">登录</button>
				</div>
			</form>
		</div>
	</div>
	
	<%@include file="/res_jsp/guest_bottom.jsp" %>

</body>
</html>