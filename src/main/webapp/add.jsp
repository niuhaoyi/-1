<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<jsp:include page="myeasyui.jsp"></jsp:include>
</head>
<body>
<script type="text/javascript">
	$(function () {
		$('#aid').combobox({    
		    url:'findAnimal',    
		    valueField:'aid',    
		    textField:'aname'   
		});
		$('#tid').combobox({    
		    url:'findType',    
		    valueField:'tid',    
		    textField:'tname'   
		});
	})
	
	//添加
	function addShop() {
		$('#ff').form('submit', {
			url: "addAnimal",
			onSubmit: function(){
				var isValid = $(this).form('validate');
				if (!isValid){
					$.messager.progress('close');	// 如果表单是无效的则隐藏进度条
				}
				return isValid;	// 返回false终止表单提交
			},
			success: function(data){
				if(data=="true"){
				$.messager.progress('close');	// 如果提交成功则隐藏进度条
				$('#add_win').window('close');
				$('#dg').datagrid('reload');
				$.messager.show({
					title:'我的消息',
					msg:'添加成功',
					timeout:2000,
					showType:'slide'
				});

				}else{
					$.messager.show({
						title:'我的消息',
						msg:'添加 失败',
						timeout:2000,
						showType:'slide'
					});
				}
				
			}
		});


	}
</script>




<form id="ff" method="post" enctype="multipart/form-data">   
    <div>   
        <label for="animalname">动物名称:</label>   
        <input class="easyui-validatebox" type="text" name="animalname" />   
    </div>   
    <div>   
        <label for="createdate">统计时间:</label>
        <input class="easyui-datetimebox" name="createdate"     
        style="width:150px">  
    </div>   
   
   <!--  <div>   
        <label for="tname">种类:</label>   
        <input type="radio" > 哺乳类  
        <input type="radio"> 两栖类  
        <input type="radio"> 鸟    类  
        <input type="radio"> 鱼	类  
        <input type="radio"> 爬行类  
    </div>    -->
    <div>   
        <label for="tid">种类:</label>   
        <input id="tid" name="tid"> 
    </div>   
    <div>   
        <label for="aid">分布区域:</label>   
        <input id="aid" name="aid"> 
    </div>   
       <a id="btn" class="easyui-linkbutton" onclick="addShop()" data-options="iconCls:'icon-add'">添加</a>  
</form>  
</body>
</html>