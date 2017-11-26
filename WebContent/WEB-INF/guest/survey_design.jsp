<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/res_jsp/base.jsp" %>
<script type="text/javascript">
	
	$(function(){
		
		$(".deeplyRemoveAnchor").click(function(){
			
			var bagName = $(this).parents("tr").children("td:eq(0)").text();
			
			var firstConfirm = confirm("您真的要删除【"+bagName+"】这个包裹吗？");
			
			if(firstConfirm) {
				
				var secondConfirm = confirm("这个操作很危险，包裹内的问题会一起删除，你确定要这么做吗？");
				
				if(secondConfirm) {
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
		<h4>[设计调查]</h4>
		
		<table class="table table-bordered table-hover text-center">
			<tr>
				<td colspan="4">调查的基本信息</td>
			</tr>
			<tr>
				<td><img src="${requestScope.survey.logoPath }"/></td>
				<td>${requestScope.survey.surveyName }</td>
				<td>
					<a class="btn btn-default" href="guest/bag/toAddUI/${requestScope.survey.surveyId }">创建包裹</a>
				</td>
				<td>
					<a class="btn btn-default" href="guest/bag/toAdjustUI/${requestScope.survey.surveyId }">调整包裹顺序</a>
				</td>
			</tr>
		</table>
		
		<br/><br/>
		
		<table class="table table-bordered table-hover text-center">
			<tr>
				<td colspan="2">包裹信息</td>
			</tr>
			<c:if test="${empty requestScope.survey.bagSet }">
				<tr>
					<td>尚未创建包裹</td>
				</tr>
			</c:if>
			<c:if test="${!empty requestScope.survey.bagSet }">
				<tr>
					<td>包裹名称</td>
					<td>基本操作</td>
				</tr>
				<c:forEach items="${requestScope.survey.bagSet }" var="bag">
					
					<tr>
						<td>${bag.bagName }</td>
						<td>
							<a class="btn btn-warning" href="guest/bag/removeBag/${bag.bagId }/${requestScope.survey.surveyId}">删除包裹</a>
							<a class="btn btn-default" href="guest/bag/toEditUI/${bag.bagId }">更新包裹</a>
							<a class="deeplyRemoveAnchor btn btn-danger" href="guest/bag/removeBagDeeply/${bag.bagId }/${requestScope.survey.surveyId}">深度删除</a>
							<a class="btn btn-default" href="guest/bag/toMoveOrCopyPage/${bag.bagId }/${requestScope.survey.surveyId}">移动/复制包裹</a>
							<a class="btn btn-default" href="guest/question/toAddUI/${bag.bagId }/${requestScope.survey.surveyId}">创建问题</a>
						</td>
					</tr>
					
					<tr>
						<td><!-- 为了将问题数据向里面缩进一格，所以这里没有内容 --></td>
						<td>
							<table class="table table-bordered table-hover text-center">
								<c:if test="${empty bag.questionSet }">
									<tr>
										<td>尚未创建问题</td>
									</tr>
								</c:if>
								<c:if test="${!empty bag.questionSet }">
									<tr>
										<td>问题详情</td>
										<td>问题操作</td>
									</tr>
									<c:forEach items="${bag.questionSet }" var="question">
										<tr>
											<td>
												${question.questionName }
												
												<c:if test="${question.questionType==0 }">
													
													<!-- 单选题 -->
													<c:forEach items="${question.optionsArr }" var="option">
														<input type="radio"/>
														${option }
													</c:forEach>
													
												</c:if>
												
												<c:if test="${question.questionType==1 }">
													
													<!-- 多选题 -->
													<c:forEach items="${question.optionsArr }" var="option">
														<input type="checkbox"/>
														${option }
													</c:forEach>
													
												</c:if>
												
												<c:if test="${question.questionType==2 }">
												
													<input type="text" class="longInput"/>
												
												</c:if>
												
											</td>
											<td>
												<a class="btn btn-warning" href="guest/question/removeQuestion/${question.questionId }/${survey.surveyId}">删除问题</a>
												<a class="btn btn-default" href="guest/question/toEditUI/${question.questionId }/${survey.surveyId}">更新问题</a>
											</td>
										</tr>
									</c:forEach>
								</c:if>
							</table>
						</td>
					</tr>
					
				</c:forEach>
			</c:if>
			
			<tr>
				<td colspan="2">
					<a class="btn btn-default" href="guest/survey/complete/${requestScope.survey.surveyId }">完成调查</a>
				</td>
			</tr>
			
		</table>
		
	</div>
	
	<%@include file="/res_jsp/guest_bottom.jsp" %>

</body>
</html>