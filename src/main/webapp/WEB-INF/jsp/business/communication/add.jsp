<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<%@include file="/web/jsp/header.jsp"%>
<title>Insert title here</title>
</head>
<body>
	<fieldset class="layui-elem-field" style="margin: 20px; padding: 15px;">
		<legend>沟通维护--添加信息</legend>

		<form class="layui-form" method="post">
			<div class="layui-form-item">
				<label class="layui-form-label">用户编号</label>
				<div class="layui-input-inline">
					<select name="userCode"></select>
				</div>
			</div>
			<div class="layui-form-item">
				<label class="layui-form-label">客户编号</label>
				<div class="layui-input-inline">
					<select name="customerCode"></select>
				</div>
			</div>
			<div class="layui-form-item">
				<label class="layui-form-label">时间</label>
				<div class="layui-input-inline">
					<input type="text" name="time" lay-verify="required"
						placeholder="请输入" autocomplete="off" class="layui-input">
				</div>
			</div>
			<div class="layui-form-item">
				<label class="layui-form-label">类别</label>
				<div class="layui-input-inline">
					<input type="text" name="type" placeholder="请输入姓名"
						autocomplete="off" class="layui-input">
				</div>
			</div>
			<div class="layui-form-item">
				<label class="layui-form-label">内容</label>
				<div class="layui-input-inline">
					<input type="text" name="content" placeholder="请输入"
						autocomplete="off" class="layui-input">
				</div>
			</div>
			<div class="layui-form-item">
				<label class="layui-form-label">邮件地址</label>
				<div class="layui-input-inline">
					<input type="text" name="email" placeholder="请输入"
						autocomplete="off" class="layui-input">
				</div>
			</div>
			<div class="layui-form-item">
				<label class="layui-form-label"></label>
				<div class="layui-input-inline">
					<input type="button" class="layui-btn" lay-submit
						lay-filter="addUser" value="确定" /> <input type="button"
						class="layui-btn" onclick="closeThis()" value="取消" />
				</div>
			</div>
		</form>
	</fieldset>
	<script type="text/javascript">
	form.render();
	init()
	function init(){
		ajax("/user/search", {}, "json", function(d){
			console.log(d);
			var html="";
			$.each(d.data,function(i,dom){
				html+="<option value='"+dom.code+"'>"+dom.name+"</option>";
				});
			$("select[name='userCode']").html(html);
			form.render();
			});
		ajax("/customer/search", {}, "json", function(d){
			console.log(d);
			var html="";
			$.each(d.data,function(i,dom){
				html+="<option value='"+dom.code+"'>"+dom.name+"</option>";
				});
			$("select[name='customerCode']").html(html);
			form.render();
			});
		}
		formSubmit('/communication/add', 'submit(addUser)', 'text',
				function(data) {
					if (data == 0) {
						layer.msg('添加成功');
					} else if (data == 1) {
						layer.msg('账号已存在');
					} else if(data == 3){
						layer.msg('添加失败，上级编号不存在');
					} else if(data == 2){
						layer.msg('添加失败');
					}
					closeThis(1000);
				});
	</script>
</body>
</html>