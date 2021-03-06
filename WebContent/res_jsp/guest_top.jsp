<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<div class="container">
	<nav class="navbar navbar-default" role="navigation">
		<div class="container-fluid">
			<div class="navbar-header">
				<button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar">
					<span class="sr-only">Toggle navigation</span>
					<span class="icon-bar"></span>
					<span class="icon-bar"></span>
					<span class="icon-bar"></span>
	            </button>
	            <a class="navbar-brand" href="index.jsp">尚硅谷在线调查系统</a>
			</div>
			<div id="navbar" class="navbar-collapse collapse">
				<ul class="nav navbar-nav">
					<c:if test="${empty sessionScope.loginUser }">
						<li><a href="guest/user/toLoginUI">登录</a></li>
						<li><a href="guest/user/toRegistUI">注册</a></li>
					</c:if>
					<c:if test="${!empty sessionScope.loginUser }">
						<li><a>欢迎您：${sessionScope.loginUser.userName }</a></li>
						<li><a href="guest/user/logout">退出登录</a></li>
						
						<c:if test="${sessionScope.loginUser.company }">
							<li><a href="guest/survey/toAddUI">创建调查</a></li>
							<li><a href="guest/survey/showMyUncompleted">我未完成调查</a></li>
						</c:if>
						
						<li><a href="guest/engage/showAllAvailable">参与调查</a></li>
						
					</c:if>
					
	            </ul>
	            <ul class="nav navbar-nav navbar-right">
					<li class="active"><a href="index.jsp">首页</a></li>
					<li><a href="manager/admin/toMainUI">管理员入口</a></li>
	            </ul>
	          </div>
		</div>
	</nav>