<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<jsp:include page="myeasyui.jsp"></jsp:include>
<title>登录页面</title>
</head>
<body>

	<div id="win" class="easyui-window" title="登录窗口" style="width:400px;height:200px"   
        data-options="iconCls:'icon-save',modal:true">  
        ${msg } 
     <form id="loginForm" method="post" action="<%=request.getContextPath()%>/user/toLogin">
            <center style="margin-top: 30px">
            	<div class="input_container">
               		 <input class="easyui-textbox" name="uname" type="text" labelPosition="top" data-options="prompt:'请输入用户名',iconCls:'icon-man'" style="width:200px;height:30px">
            	</div>
            	<br/>
            	<div class="input_container">
               		 <input class="easyui-textbox" name="pwd" type="text" labelPosition="top" data-options="prompt:'请输入密码',iconCls:'icon-lock'" style="width:200px;height:30px">
            	</div>
            	<br/>
            	<div>
               		<input type="submit" value="登录"/>
            	</div>
            </center>
    </form>  
	</div>  
</body>
</html>