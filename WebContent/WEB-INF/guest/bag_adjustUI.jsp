<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/res_jsp/base.jsp" %>
<script type="text/javascript">
	
	$(function(){
		
		$(":text").change(function(){
			
			var bagOrder = $.trim(this.value);
			
			if(bagOrder == "" || isNaN(bagOrder)) {
				
				this.value = this.defaultValue;
				
				return ;
			}
			
			this.value = bagOrder;
			
		});
		
	});
	
</script>
<body>
	
	<%@include file="/res_jsp/guest_top.jsp" %>
	
	<div class="jumbotron">
		<h4>[调整包裹顺序]</h4>
		<div class="container">
			<form action="guest/bag/doAdjust" method="post" class="form-horizontal">
				<input type="hidden" name="surveyId" value="${requestScope.surveyId }"/>
				<table class="table table-bordered table-hover text-center">
				
					<c:if test="${empty bagList }">
						<tr>
							<td>暂时没有包裹可以调整</td>
						</tr>
					</c:if>
					<c:if test="${!empty bagList }">
						
						<c:if test="${!empty exception }">
							<tr>
								<td colspan="3">${exception.message }</td>
							</tr>
						</c:if>
					
						<tr>
							<td>ID</td>
							<td>包裹名称</td>
							<td>序号</td>
						</tr>
					
						<c:forEach items="${bagList }" var="bag">
							
							<tr>
								<td>${bag.bagId }</td>
								<td>${bag.bagName }</td>
								<td>
									<input type="hidden" name="bagIdList" value="${bag.bagId }"/>
									<input type="text" name="bagOrderList" class="form-control" value="${bag.bagOrder }"/>
								</td>
							</tr>
							
						</c:forEach>
						
						<tr>
							<td colspan="3">
								<button type="submit" class="btn btn-default" style="width: 30%">OK</button>
							</td>
						</tr>
					
					</c:if>
				
				</table>
				
			</form>
		</div>
	</div>
	
	<%@include file="/res_jsp/guest_bottom.jsp" %>

</body>
</html>