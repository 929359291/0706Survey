<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/res_jsp/base.jsp" %>
<body>
	
	<%@include file="/res_jsp/guest_top.jsp" %>
	<div class="jumbotron">
		<h4>[用户注册]</h4>
		<div class="container">
			<form action="guest/user/regist" method="post" role="form" class="form-horizontal">
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
				<div class="form-group">
					<label for="pwdConfirmInput" class="col-lg-2 control-label">确认</label>
					<div class="col-lg-10">
						<input type="password" name="userPwdConfirm" class="form-control" id="pwdConfirmInput" placeholder="Confirm Password">
					</div>
				</div>
				<div class="form-group" style="text-align: center;">
					<input id="companyTrue" type="radio" name="company" value="true" checked="checked"/>
					<label for="companyTrue">企业用户</label>
					
					<input id="companyFalse" type="radio" name="company" value="false"/>
					<label for="companyFalse">个人用户</label>
				</div>
				<div style="text-align: center;">
					<button type="submit" class="btn btn-default" style="width: 30%">注册</button>
				</div>
			</form>
		</div>
	</div>
	
	<%@include file="/res_jsp/guest_bottom.jsp" %>

</body>
</html>