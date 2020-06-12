//1. 捕捉到键盘弹起的事件 
//在文档准备就绪的时候，对某一个元素进行onkeyup事件监听
/*$(document).ready(function(){
	
})*/
$(function(){
	$("#finduser").keyup(function() {
		//2。 获取输入框的值 
		//var word = $("#word").val();
		//this  对应就是执行这个方法的那个对象， $("#word")
		var username = $(this).val();
		$.post("/user/findUserByName.action",{username:username} ,function(data , status){
			
		});
	})
});

