<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/res_jsp/base.jsp" %>
<body>
	
	<%@include file="/res_jsp/guest_top.jsp" %>
	
	<div class="jumbotron">
		<h4>[创建包裹]</h4>
		<div class="container">
			<form action="guest/bag/saveBag" method="post" class="form-horizontal">
				<input type="hidden" name="surveyId" value="${requestScope.surveyId }"/>
				<div class="form-group">
					<label for="bagNameInput" class="col-lg-2 control-label">账号</label>
					<div class="col-lg-10">
						<input type="text" name="bagName" class="form-control" id="bagNameInput" placeholder="Enter User Name">
					</div>
				</div>
				<div style="text-align: center;">
					<button type="submit" class="btn btn-default" style="width: 30%">保存</button>
				</div>
			</form>
		</div>
	</div>
	
	<%@include file="/res_jsp/guest_bottom.jsp" %>

</body>
</html>