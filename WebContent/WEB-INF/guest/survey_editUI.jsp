<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@include file="/res_jsp/base.jsp" %>
<body>
	
	<%@include file="/res_jsp/guest_top.jsp" %>
	
	<div class="jumbotron">
		<h4>[编辑调查]</h4>
		<div class="container">
			<form:form action="guest/survey/updateSurvey" method="post" modelAttribute="survey" enctype="multipart/form-data" cssClass="form-horizontal">
				<form:hidden path="surveyId"/>
				<form:hidden path="logoPath"/>
				
				<input type="hidden" name="pageNo" value="${requestScope.pageNo }"/>
				
				<c:if test="${!empty requestScope.exception }">
					<div style="text-align: center;">${requestScope.exception.message }</div>
				</c:if>
				
				<div class="form-group">
					<label for="surveyNameInput" class="col-lg-2 control-label">调查名称</label>
					<div class="col-lg-10">
						<form:input path="surveyName" cssClass="form-control" id="surveyNameInput"/>
					</div>
				</div>
				
				<div class="form-group">
					<label class="col-lg-2 control-label">当前图片</label>
					<div class="col-lg-10">
						<img src="${survey.logoPath }" class="img-responsive" alt="Responsive image">
					</div>
				</div>
				<div class="form-group">
					<label for="surveyLogoInput" class="col-lg-2 control-label">选择图片</label>
					<div class="col-lg-10">
						<input type="file" name="logoFile" id="surveyLogoInput"/>
					</div>
				</div>
				
				<div style="text-align: center;">
					<button type="submit" class="btn btn-default" style="width: 30%">更新</button>
				</div>
			</form:form>
		</div>
	</div>
	
	<%@include file="/res_jsp/guest_bottom.jsp" %>

</body>
</html>