<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/res_jsp/base.jsp" %>
<body>
	
	<%@include file="/res_jsp/guest_top.jsp" %>
	
	<div class="jumbotron">
		<h4>[创建调查]</h4>
		<div class="container">
			<form action="guest/survey/saveSurvey" method="post" enctype="multipart/form-data" class="form-horizontal">
				<c:if test="${!empty requestScope.exception }">
					<div style="text-align: center;">${requestScope.exception.message }</div>
				</c:if>
				<div class="form-group">
					<label for="surveyNameInput" class="col-lg-2 control-label">调查名称</label>
					<div class="col-lg-10">
						<input type="text" name="surveyName" class="form-control" id="surveyNameInput" placeholder="Enter Survey Name">
					</div>
				</div>
				<div class="form-group">
					<label for="surveyLogoInput" class="col-lg-2 control-label">选择图片</label>
					<div class="col-lg-10">
						<input type="file" name="logoFile" id="surveyLogoInput"/>
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