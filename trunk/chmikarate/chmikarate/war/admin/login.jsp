<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>
<%@ page import="javax.jdo.PersistenceManager" %>
<%@ page import="com.google.appengine.api.users.User" %>
<%@ page import="com.google.appengine.api.users.UserService" %>
<%@ page import="com.google.appengine.api.users.UserServiceFactory" %>
<%@ page import="com.chmikarate.Greeting" %>
<%@ page import="com.chmikarate.PMF" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="content-type" content="text/html; charset=utf-8" />
<title>:::全民道館 後台管理:::</title>
<meta name="keywords" content="" />
<meta name="description" content="" />
<link href="../default.css" rel="stylesheet" type="text/css" />
</head>
<body>
<div id="wrapper">
</div>
<div id="page">

<%
     UserService userService = UserServiceFactory.getUserService();
     if (!userService.isUserLoggedIn() ) {
   %>
      Please <A HREF="<%= 
          userService.createLoginURL("/admin/error.jsp") 
        %>">log in</A>>
   <% } else { %>
      Welcome, <%= userService.getCurrentUser().getNickname() %>!
        (<A HREF="<%= 
            userService.createLogoutURL("/admin/login.jsp")
          %>">log out</A>>)
   <%
     }
   %>

<br/><br/><br/><br/><br/><br/><br/>
<div class="post">
			<h2 class="title">全民道館 後台管理</h2>	
			<a href="/admin/homenews.jsp">首頁最新消息三則</a>
	</div>
</div>
</body>
</html>
