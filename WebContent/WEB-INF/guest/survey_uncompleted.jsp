<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/res_jsp/base.jsp" %>
<script type="text/javascript">
	
	$(function(){
		
		$(".deeplyRemoveAnchor").click(function(){
			
			//1.第一次确认
			var surveyName = $(this).parents("tr").children("td:eq(2)").text();
			
			var firstConfirm = confirm("您真的要删除【"+surveyName+"】这个调查吗？");
			
			if(firstConfirm) {
				
				//2.第二次确认
				var secondConfirm = confirm("这个操作很危险！调查内的包裹和问题也会一起被删除，你确定真的要这么做吗？");
				
				if(secondConfirm) {
					//经过反复确认后，如果用户确实要执行深度删除操作，那么就让当前超链接正常执行
					return true;
				}
				
			}
			
			return false;
			
		});
		
	});
	
</script>
<body>
	
	<%@include file="/res_jsp/guest_top.jsp" %>
	
	<div class="jumbotron">
		<h4>[显示我未完成的调查]</h4>
		
		<table class="table table-bordered table-hover text-center">
		
			<c:if test="${empty page.list }">
				<tr>
					<td>您尚未创建调查！</td>
				</tr>
			</c:if>
			<c:if test="${!empty page.list }">
				
				<tr>
					<td>ID</td>
					<td>Logo</td>
					<td>SurveyName</td>
					<td colspan="4">Operation</td>
				</tr>
				
				<c:forEach items="${page.list }" var="survey">
					<tr>
						<td>${survey.surveyId }</td>
						<td>
							<img src="${survey.logoPath }"/>
						</td>
						<td>${survey.surveyName }</td>
						<td>
							<a class="btn btn-default" href="guest/survey/toDesignUI/${survey.surveyId }">设计</a>
						</td>
						<td>
							<a class="btn btn-warning" href="guest/survey/removeSurvey/${survey.surveyId }/${page.pageNo}">删除</a>
						</td>
						<td>
							<a class="btn btn-default" href="guest/survey/toEditUI/${survey.surveyId }/${page.pageNo}">更新</a>
						</td>
						<td>
							<a class="deeplyRemoveAnchor btn btn-danger" href="guest/survey/deeplyRemove/${survey.surveyId }/${page.pageNo}">深度删除</a>
						</td>
					</tr>
				</c:forEach>
				
				<tr>
					<td colspan="7">
						
						<c:set var="targetUrl" value="guest/survey/showMyUncompleted" scope="page"/>
						<%@include file="/res_jsp/navigator.jsp" %>
						
					</td>
				</tr>
				
			</c:if>
		
		</table>
		
	</div>
	
	<%@include file="/res_jsp/guest_bottom.jsp" %>

</body>
</html>