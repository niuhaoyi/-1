<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<jsp:include page="/myeasyui.jsp"></jsp:include>
<script type="text/javascript">
	$(function () {
		$('#dg').datagrid({    
		    url:'http://127.0.0.1:8080/list',    
		    columns:[[    
		        {field:'',title:'全选',width:100,checkbox:true},    
		        {field:'animalid',title:'编号',width:100},    
		        {field:'animalname',title:'动物名称',width:100},    
		        {field:'createdate',title:'统计时间',width:100},    
		        {field:'tname',title:'种类',width:100},    
		        {field:'aname',title:'分布范围',width:100}  
		    ]],    
		    toolbar: '#tb',
		    pagination:true,
		    pageSize:4,
		    pageList:[2,4,8,10,20]

		}); 
	})
	//反选
	function fanxuan() {
		var rows = $('#dg').datagrid('getSelections');
		$('#dg').datagrid('selectAll');
		for (var i = 0; i < rows.length; i++) {
			var index = $('#dg').datagrid('getRowIndex',rows[i]);
			$('#dg').datagrid('unselectRow',index);
		}
	}
	//查询
	function chaxun() {
		var keywords = $("#keywords").val();
		$('#dg').datagrid('load', {    
			keywords: keywords
		}); 
		
	}
	//添加
	function toaddShop() {
		$('#add_win').window({    
		    width:600,    
		    height:400,    
		    modal:true,
		    title:"添加动物",
		    href:"add.jsp"
		});  
	}
	//批量删除
	function deleteAll() {
		var rows = $('#dg').datagrid('getSelections');
		var ids="";
		$(rows).each(function () {
			ids+=","+this.animalid;
		});
		$.post("deleteByIds",{ids:ids.substring(1)},function(date){
			$.messager.show({
				title:'我的消息',
				msg:'删除完成。',
				timeout:2000,
				showType:'slide'
			});
			$('#dg').datagrid('reload');
		},"json")
	}
	
</script>
</head>
<body>
<table id="dg"></table> 
<div id="tb">
<input class="easyui-textbox" style="width:150px" id="keywords" name="keywords" prompt="动物名称">
<a id="btn" class="easyui-linkbutton" onclick="chaxun()" data-options="iconCls:'icon-search'">查询</a>  

<div>
<a  class="easyui-linkbutton" onclick="toaddShop()" data-options="iconCls:'icon-edit',plain:true">添加</a>
<a  class="easyui-linkbutton" onclick="deleteAll()" data-options="iconCls:'icon-help',plain:true">批量删除</a>
<a  class="easyui-linkbutton" onclick="fanxuan()">反选</a>
</div>
</div> 
<div id="add_win"></div> 
<div id="update_win"></div> 
</body>
</html>