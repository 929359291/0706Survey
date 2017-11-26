<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.atguigu.com/myTag" prefix="atguigu" %>
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
	            <a class="navbar-brand" href="index.jsp">尚硅谷在线调查系统后台</a>
			</div>
			<div id="navbar" class="navbar-collapse collapse">
				<ul class="nav navbar-nav">
					<c:if test="${empty sessionScope.loginAdmin }">
						<li><a href="manager/admin/toLoginUI">登录</a></li>
					</c:if>
					<c:if test="${!empty sessionScope.loginAdmin }">
						<li><a>欢迎您，${sessionScope.loginAdmin.adminName }</a></li>
						<li><a href="manager/admin/logout">退出登录</a></li>
						<li>
							<atguigu:auth servletPath="manager/statistics/showAllAvailable">
								<a href="manager/statistics/showAllAvailable">统计调查</a>
							</atguigu:auth>
						</li>
						<li>
							<atguigu:auth servletPath="manager/res/showList">
								<a href="manager/res/showList">资源列表</a>
							</atguigu:auth>
						</li>
						<li>
							<atguigu:auth servletPath="manager/auth/toAddUI">
								<a href="manager/auth/toAddUI">创建权限</a>
							</atguigu:auth>
						</li>
						<li>
							<atguigu:auth servletPath="manager/auth/showList">
								<a href="manager/auth/showList">权限列表</a>
							</atguigu:auth>
						</li>
						<li>
							<atguigu:auth servletPath="manager/role/toAddUI">
								<a href="manager/role/toAddUI">创建角色</a>
							</atguigu:auth>
						</li>
						<li>
							<atguigu:auth servletPath="manager/role/showList">
								<a href="manager/role/showList">角色列表</a>
							</atguigu:auth>
						</li>
						<li>
							<atguigu:auth servletPath="manager/admin/toAddUI">
								<a href="manager/admin/toAddUI">创建账号</a>
							</atguigu:auth>
						</li>
						<li>
							<atguigu:auth servletPath="manager/admin/showList">
								<a href="manager/admin/showList">账号列表</a>
							</atguigu:auth>
						</li>
						<li>
							<atguigu:auth servletPath="manager/log/showList">
								<a href="manager/log/showList">日志列表</a>
							</atguigu:auth>
						</li>
					</c:if>
					
	            </ul>
	            <ul class="nav navbar-nav navbar-right">
					<li class="active"><a href="manager/admin/toMainUI">首页</a></li>
					<li><a href="index.jsp">回前台首页</a></li>
	            </ul>
	          </div>
		</div>
	</nav>