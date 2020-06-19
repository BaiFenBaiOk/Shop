//1. 捕捉到键盘弹起的事件 
//在文档准备就绪的时候，对某一个元素进行onkeyup事件监听
/*$(document).ready(function(){
	
})*/
$(function(){
	$("#username").keyup(function() {
		
		//2。 获取输入框的值 
		//var word = $("#word").val();
		//this  对应就是执行这个方法的那个对象， $("#word")
		var username = $(this).val();

		if(username == ""){
			$("#div01").hide();
		}else{
			//3. 请求数据。
			$.post("findUserByName.action",{username:username} ,function(data , status){
				//alert(data);
				$("#div01").show();
				$("#div01").html(data);
			});
		}
		
	})
});

