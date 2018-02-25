<%@ page contentType="text/html; charset=gb2312" language="java"%>
<% request.setCharacterEncoding("gb2312"); %>
<%@ page import="java.util.*"%>
<%@ page import="kurt.qq.User"%>
<%
	LinkedList<User> temp=(LinkedList)application.getAttribute("users_online");
	if(temp!=null){
     for(int i=0;i<temp.size();i++){
		User mylist=(User)temp.get(i);
		if(mylist.getName().equals(session.getAttribute("name"))){
			temp.remove(i);
			session.setAttribute("name","null");
			session.invalidate();
		}
		if(temp.size()==0){
				//application.removeAttribute("message");
		}
	}
	}
	response.sendRedirect("index.jsp");
%>