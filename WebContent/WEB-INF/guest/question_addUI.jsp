<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/res_jsp/base.jsp" %>
<script type="text/javascript">
	
	$(function(){
		
		//1.在文档加载完成时，将选项所在的行隐藏
		$("#optionsTr").hide();
		
		//2.获取题型的单选按钮并绑定单击响应函数
		$(":radio").click(function(){
			
			//3.获取当前单选按钮的value属性值
			var type = this.value;//$(this).val()
			
			//4.判断type是否是0或1
			if(type == 0 || type == 1) {
				//单选题或多选题显示
				$("#optionsTr").show();
			}
			
			if(type == 2) {
				//简答题隐藏
				$("#optionsTr").hide();
			}
			
		});
		
		//3.过滤选项文本框中输入的数据
		$("textarea").change(function(){
			
			//获取当前输入的数据
			var options = $.trim(this.value);
			
			//声明一个去除各个选项中间多余空白的正则表达式
			var reg = /\s\n*\s/g;
			
			//将原始字符串中满足正则表达式的部分替换为换行
			this.value = options.replace(reg,"\n");
			
		});
		
		$(":submit").click(function(){
			var questionName = $.trim($("[name=questionName]").val());
			if(questionName == "") {
				alert("请输入问题名称！");
				return false;
			}
			
			var questionType = $(":radio:checked").val();
			
			if(questionType == 2) {
				return true;
			}
			
			var questionOptions = $("textarea").val();
			
			if(questionOptions == "") {
				alert("选择题必须有选项！");
				return false;
			}
			
		});
		
	});
	
</script>
<body>
	
	<%@include file="/res_jsp/guest_top.jsp" %>
	
	<div class="jumbotron">
		<h4>[创建问题]</h4>
		<div class="container">
		<form action="guest/question/saveQuestion" method="post">
		
			<input type="hidden" name="bagId" value="${requestScope.bagId }"/>
			<input type="hidden" name="surveyId" value="${requestScope.surveyId }"/>
		
			<table class="table table-bordered table-hover text-center">
				<tr>
					<td>问题名称</td>
					<td>
						<input type="text" name="questionName" class="form-control"/>
					</td>
				</tr>
				<tr>
					<td>选择题型</td>
					<td>
						<input id="type01" type="radio" name="questionType" value="0"/>
						<label for="type01">单选题</label>
						
						<input id="type02" type="radio" name="questionType" value="1"/>
						<label for="type02">多选题</label>
						
						<input id="type03" type="radio" name="questionType" value="2" checked="checked"/>
						<label for="type03">简答题</label>
						
					</td>
				</tr>
				<tr id="optionsTr">
					<td>选项</td>
					<td>
						<!-- 不使用单行文本框是因为单行文本框中输入数据的过程中“回车”会提交表单 -->
						<textarea name="questionOptions" class="form-control" rows="10"></textarea>
					</td>
				</tr>
				<tr>
					<td colspan="2">
						<button type="submit" class="btn btn-default" style="width: 30%">保存</button>
					</td>
				</tr>
			</table>
		</form>
		</div>
	</div>
	
	<%@include file="/res_jsp/guest_bottom.jsp" %>

</body>
</html>