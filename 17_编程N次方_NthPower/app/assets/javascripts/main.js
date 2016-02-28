$(function() {
  // constants
  var SHOW_CLASS = 'show',
      HIDE_CLASS = 'hide',
      ACTIVE_CLASS = 'active';
  
  $( '.tabs' ).on( 'click', 'li a', function(e){
    e.preventDefault();
    var $tab = $( this ),
         href = $tab.attr( 'href' );
  
     $( '.active' ).removeClass( ACTIVE_CLASS );
     $tab.addClass( ACTIVE_CLASS );
  
     $( '.show' )
        .removeClass( SHOW_CLASS )
        .addClass( HIDE_CLASS )
        .hide();
    
      $(href)
        .removeClass( HIDE_CLASS )
        .addClass( SHOW_CLASS )
        .hide()
        .fadeIn( 550 );
  });
			  $("#myform").submit(function(){
        	   	if(checkName()==true){
        	   		if(checkPwd()==true){
        	   			if(checkRePwd()==true){
        	   				alert("注册成功！")
        	   				return true;
        	   			}else{
        	   				alert("重置密码错误，注册失败！");
   		        	   		return false;
        	   			}
        	   		}else{
        	   			alert("密码格式错误，注册失败！");
		        	   	return false;
        	   		}
        	   		
        	   	}else{
        	   		alert("用户名错误,注册失败！");
        	   		return false;
        	   	}
          });
})( jQuery );
var flag;  
function checkName(){
	var username=document.getElementById("username").value;
	if(username==null||username==""){
		alert("用户名不能为空！");
		flag=false;
	}
	else{
		var regex=/^[0-9A-Za-z_]{4,20}$/;
		if(regex.test(username)){
		    flag=true;
            /* $.ajax(
             {
                 url:"users/find_by_name",
                 dataType:"html",
                 data:{username:username},
                 success:function(data,textStatus)
                 {                    
                    if(data==0){
                    	flag=false;
                    	alert("用户名已经存在，重新选择用户名！");
                    }else if(data==1)
                    {
                    	flag=true;
                      alert("该用户名可以用！");
                    }
                 }
             });*/
		}
		else{
			flag=false;
			alert("用户名必须以数字字母下划线开头，个数在4-20之间！");
			flag=false;
		}
	}	
	return flag;
}
function checkPwd(){
	var flag;
	var pwd1 = document.getElementById("password").value;
	var regex=/^[0-9a-zA-Z]{4,20}/g;
	if(regex.test(pwd1)){
		flag=true;
	}
	else {
		flag=false;
	  alert("密码必须以数字字母开头，个数在4-20之间！");
	}
	return flag;
}
function checkRePwd(){
	var flag;
	var pwd1 = document.getElementById("password").value;
	var pwd2 = document.getElementById("repassword").value;
	var regex=/^[0-9a-zA-Z]{4,20}/g;
	if(regex.test(pwd2)){
		if(pwd2==pwd1){
			flag=true;
		}
		else{
			flag=false;
			alert("确认密码错误，请重新输入密码!");
		}
	}else{
		flag=false;
		alert("密码必须以数字字母开头，个数在4-20之间！");
	}
	return flag;
}