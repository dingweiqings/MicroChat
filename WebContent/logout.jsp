<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" info="by Kurt" errorPage="error.jsp"%>
    

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">


<title>退出</title>


</head>
<body  >
<input name="buttonExit" type="button" class="btn_orange" value="退出聊天室"
onclick="exit()">
<script>
function exit(){
	window.location.href="leave.jsp";
	alert("欢迎下次光临");
	
}
</script>
 
</body>
</html>