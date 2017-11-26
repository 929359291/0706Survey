<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@include file="/res_jsp/base.jsp" %>
<body>
	
	<%@include file="/res_jsp/guest_top.jsp" %>
	
	<div class="jumbotron">
		<h4>[更新包裹]</h4>
		<form:form action="guest/bag/updateBag" method="post" modelAttribute="bag" cssClass="form-horizontal">
			
			<form:hidden path="bagId"/>
			<form:hidden path="surveyId"/>
			
			<div class="form-group">
				<label for="bagNameInput" class="col-lg-2 control-label">账号</label>
				<div class="col-lg-10">
					<form:input path="bagName" cssClass="form-control" id="bagNameInput"/>
				</div>
			</div>
			<div style="text-align: center;">
				<button type="submit" class="btn btn-default" style="width: 30%">更新</button>
			</div>
			
		</form:form>
	</div>
	
	<%@include file="/res_jsp/guest_bottom.jsp" %>

</body>
</html>