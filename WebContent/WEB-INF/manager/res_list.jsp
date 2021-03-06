<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/res_jsp/base.jsp" %>
<script type="text/javascript">
	
	$(function(){
		
		$(":button").click(function(){
			
			//<input id="4" type="button" value="公共资源">
			console.log(this);
			
			var thisBtn = this;
			
			//最终目的：将当前资源的id发送到服务器端，让服务器端根据这个id值更新资源的publicStatus属性
			//1.获取当前资源的id
			var resId = this.id;
			
			//2.准备$.post()函数需要的参数值
			var url = "${pageContext.request.contextPath}/manager/res/toggleStatus";
			var paramData = {"resId":resId,"time":new Date()};
			
			//respData是服务器端返回的响应数据
			var callBack = function(respData){
				//{"newStatus":"true","message":"success"}
				var message = respData.message;
				
				if(message == "success") {
					alert("操作成功！");
					
					var newStatus = respData.newStatus;
					
					if(newStatus) {
						thisBtn.value = "公共资源";
					}
					
					if(!newStatus) {
						thisBtn.value = "受保护资源";
					}
					
					//Object ...
					//在JavaScript中this代表调用当前函数的那个对象
					//在Ajax操作的回调函数中的this代表jQuery框架内的某一个对象，不是我们当前点击的按钮
					console.log(this);
					
				}
				
				if(message == "failed") {
					alert("操作失败！");
				}
				
			};
			
			//接收到服务器端数据后的解析方式
			var type="json";
			
			//3.发送Ajax请求
			$.post(url,paramData,callBack,type);
			
		});
		
	});
	
</script>
<body>

	<%@include file="/res_jsp/manager_top.jsp" %>
	
	<div class="jumbotron">
		<h4>[资源列表]</h4>
		<form action="manager/res/batchDelete" method="post">
			<table class="table table-bordered table-hover text-center">
				<c:if test="${empty resList }">
					<tr>
						<td>尚未捕获到资源</td>
					</tr>
				</c:if>
				<c:if test="${!empty resList }">
					<tr>
						<td>ID</td>
						<td>ServletPath</td>
						<td>资源状态</td>
						<td>删除</td>
					</tr>
					
					<c:forEach items="${resList }" var="res">
						<tr>
							<td>${res.resId }</td>
							<td>${res.servletPath }</td>
							<td>
								<!-- <button>在表单中有提交表单的效果</button> -->
								<c:if test="${res.publicStatus }">
									<input id="${res.resId }" type="button" class="btn btn-default" value="公共资源"/>
								</c:if>
								<c:if test="${!res.publicStatus }">
									<input id="${res.resId }" type="button" class="btn btn-default" value="受保护资源"/>
								</c:if>
							</td>
							<td>
								<input id="checkbox${res.resId }" type="checkbox" name="resIdList" value="${res.resId }"/>
								<label for="checkbox${res.resId }">点我更轻松</label>
							</td>
						</tr>
					</c:forEach>
					
					<tr>
						<td colspan="4">
							<button type="submit" class="btn btn-default" style="width: 30%">批量删除</button>
						</td>
					</tr>
					
				</c:if>
			</table>
		</form>
	</div>
	
	<%@include file="/res_jsp/manager_bottom.jsp" %>

</body>
</html>