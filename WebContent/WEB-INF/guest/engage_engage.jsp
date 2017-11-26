<%@page import="com.atguigu.survey.utils.DataProcessUtils"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/res_jsp/base.jsp" %>
<body>
	
	<%@include file="/res_jsp/guest_top.jsp" %>
	
	<div class="jumbotron">
		<h4>[参与调查]</h4>
		<table class="table table-bordered table-hover text-center">
			<tr>
				<td colspan="2">调查信息</td>
			</tr>
			<tr>
				<td>Logo</td>
				<td>名称</td>
			</tr>
			<tr>
				<td><img src="${sessionScope.currentSurvey.logoPath }"/></td>
				<td>${sessionScope.currentSurvey.surveyName }</td>
			</tr>
		</table>
		
		<br/>
		<br/>
		
		<form action="guest/engage/engage" method="post">
			
			<input type="hidden" name="currentIndex" value="${requestScope.currentIndex }"/>
			<input type="hidden" name="bagId" value="${requestScope.currentBag.bagId }"/>
		
			<table class="table table-bordered table-hover text-center">
				
				<tr>
					<td colspan="2">当前包裹：${requestScope.currentBag.bagName }</td>
				</tr>
				<c:forEach items="${requestScope.currentBag.questionSet }" var="question">
					<tr>
							<td>
								${question.questionName }
							</td>
							<td>
								<c:if test="${question.questionType==0 }">
									
									<%-- ${myStatus.index}可以获取到遍历过程中集合元素的索引值 --%>
									<c:forEach items="${question.optionsArr }" var="option" varStatus="myStatus">
										<input type="radio" 
											   name="q${question.questionId }" 
											   value="${myStatus.index}" 
											   id="id${question.questionId }${myStatus.index}"
											   <%=DataProcessUtils.checkedRedisplay(pageContext) %>
											   />
											   
										<label for="id${question.questionId }${myStatus.index}">${option }</label>
									</c:forEach>
									
								</c:if>
								
								<c:if test="${question.questionType==1 }">
									
									<c:forEach items="${question.optionsArr }" var="option" varStatus="myStatus">
										<input type="checkbox" 
											   name="q${question.questionId }" 
											   value="${myStatus.index}" 
											   id="id${question.questionId }${myStatus.index}"
											   <%=DataProcessUtils.checkedRedisplay(pageContext) %>
											   />
										<label for="id${question.questionId }${myStatus.index}">${option }</label>
									</c:forEach>
									
								</c:if>
								
								<c:if test="${question.questionType==2 }">
									
									<input type="text" 
										   name="q${question.questionId }" 
										   class="form-control"
										   value="<%=DataProcessUtils.valueRedisplay(pageContext) %>"/>
									
								</c:if>
								
								<br/>
							</td>
					</tr>
					</c:forEach>
				<tr>
					<td colspan="2">
						
						<c:if test="${requestScope.currentIndex > 0 }">
							<input type="submit" name="submit_prev" value="返回上一个包裹" class="btn btn-primary"/>
						</c:if>
						
						<c:if test="${requestScope.currentIndex < sessionScope.lastIndex }">
							<input type="submit" name="submit_next" value="进入下一个包裹" class="btn btn-info"/>
						</c:if>
						
						<input type="submit" name="submit_quit" value="放弃" class="btn btn-danger"/>
						
						<c:if test="${requestScope.currentIndex == sessionScope.lastIndex }">
							<input type="submit" name="submit_done" value="完成" class="btn btn-success"/>
						</c:if>
						
					</td>
				</tr>
				
			</table>
		</form>
		
	</div>
	
	<%@include file="/res_jsp/guest_bottom.jsp" %>

</body>
</html>