<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/res_jsp/base.jsp" %>
<body>
	<%@include file="/res_jsp/manager_top.jsp" %>
	
	<div class="jumbotron">
		<h4>分配权限</h4>
		<form action="manager/role/dispatcher" method="post">
			<input type="hidden" name="roleId" value="${roleId }"/>
			<table class="table table-bordered table-hover text-center">
				<c:if test="${empty authList }">
					<tr>
						<td>暂时没有资源</td>
					</tr>
				</c:if>
				<c:if test="${!empty authList }">
					<c:forEach items="${authList }" var="auth">
						<tr>
							<td>
								<input id="checkbox${auth.authId }" type="checkbox" name="authIdList" value="${auth.authId }"
									<c:forEach items="${currentAuthIdList }" var="currentAuthId">
										<c:if test="${currentAuthId==auth.authId }">checked="checked"</c:if>
									</c:forEach>
								/>
								<label for="checkbox${auth.authId }">${auth.authName }</label>
							</td>
						</tr>
					</c:forEach>
					<tr>
						<td><button type="submit" class="btn btn-default" style="width: 30%">OK</button></td>
					</tr>
				</c:if>
			</table>
		</form>
	</div>
	
	<%@include file="/res_jsp/manager_bottom.jsp" %>

</body>
</html>