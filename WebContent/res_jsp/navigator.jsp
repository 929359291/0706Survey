<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script type="text/javascript">
	
	$(function(){
		
		$("#goPageNo").change(function(){
			
			//1.获取当前文本框中输入的pageNo
			var pageNo = $.trim(this.value);
			
			//2.检查pageNo是否是有效的值
			//NaN：not a number
			//window.isNaN()：判断是否为非数字
			
			//JavaScript会将空字符串进行自动的类型转换，转换后可以看成是数字
			//所以isNaN()函数并不能将空字符串这种情况排除
			
			if(pageNo == "" || isNaN(pageNo)) {
				//如果用户输入的值无效，则恢复为默认值
				this.value = this.defaultValue;
				return ;
			}
			
			//3.执行页面跳转
			var url = "${pageContext.request.contextPath}/${targetUrl}?pageNoStr="+pageNo;
			
			window.location.href = url;
			
		});
		
	});
	
</script>
<div style="text-align: center;">
	<nav>
		<ul class="pager">
			<c:if test="${page.hasPrev }">
				<li><a href="${targetUrl}?pageNoStr=1">首页</a></li>
				<li><a href="${targetUrl}?pageNoStr=${page.prev }">上一页</a></li>
			</c:if>
			<li>您现在在第${page.pageNo }页</li>
			<li>共${page.totalPageNo }页</li>
			<li>共${page.totalRecordNo }条记录</li>
			<li>跳转到第<input type="text" class="shortInput" id="goPageNo"/>页</li>
			<c:if test="${page.hasNext }">
				<li><a href="${targetUrl}?pageNoStr=${page.next }">下一页</a></li>
				<li><a href="${targetUrl}?pageNoStr=${page.totalPageNo }">末页</a></li>
			</c:if>
		</ul>
	</nav>
	<%-- <c:if test="${page.hasPrev }">
		<li><a href="${targetUrl}?pageNoStr=1">首页</a></li>
		<li><a href="${targetUrl}?pageNoStr=${page.prev }">上一页</a></li>
	</c:if>
	<c:if test="${page.hasNext }">
		<li><a href="${targetUrl}?pageNoStr=${page.next }">下一页</a></li>
		<li><a href="${targetUrl}?pageNoStr=${page.totalPageNo }">末页</a></li>
	</c:if>
	<li>您现在在第${page.pageNo }页</li>
	<li>共${page.totalPageNo }页</li>
	<li>共${page.totalRecordNo }条记录</li> --%>
	
	
	
</div>