<%@ page language="java"  contentType="text/html; charset=UTF-8"
     import="java.util.*" %>
<%@ page import="kurt.qq.User,kurt.qq.*,java.sql.*"%>
<% request.setCharacterEncoding("gb2312"); %>


<table width="100%" border="0" cellpadding="0" cellspacing="0">
  <tr><td height="32" align="center" class="word_orange ">欢迎来到微聊！</td></tr>
  <tr>
  <td height="23" align="center"><a  href="#" onclick="set('所有人')">所有人</a></td>
  </tr>  
 <%	
 LinkedList<User> list=(LinkedList)application.getAttribute("users_online");
 for(int i=0;i<list.size();i++){
		User mylist=(User)list.get(i);
		%>
  <tr>
    <td height="23" align="center"><a href="#" onclick="set('<%=mylist.getName()%>')"><%=mylist.getName()%></a></td>
  </tr>
<%}%>
<tr><td height="30" align="center">当前在线[<font color="#FF6600"><%=list.size()%></font>]人</td></tr>
</table>