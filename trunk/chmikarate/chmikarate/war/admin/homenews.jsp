<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>
<%@ page import="javax.jdo.PersistenceManager" %>
<%@ page import="com.google.appengine.api.users.User" %>
<%@ page import="com.google.appengine.api.users.UserService" %>
<%@ page import="com.google.appengine.api.users.UserServiceFactory" %>
<%@ page import="javax.jdo.Query"%>
<%@ page import="com.chmikarate.HomeNews" %>
<%@ page import="com.chmikarate.PMF" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="content-type" content="text/html; charset=utf-8" />
<title>:::全民道館 後台管理:::</title>
<meta name="keywords" content="" />
<meta name="description" content="" />
<link href="../default.css" rel="stylesheet" type="text/css" />
    <script src="../js/ckeditor.js" type="text/javascript"></script>
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
<h2 class="title">首頁最新消息﹣三則</h2>
	<div class="news">
			<%
    PersistenceManager pm = PMF.get().getPersistenceManager();
    String querys = "select from " + HomeNews.class.getName()+ " order by date desc";
    Query query = pm.newQuery(querys);
    query.setRange(0, 3);
    List<HomeNews> homenews = (List<HomeNews>) query.execute();
    if (homenews.isEmpty()) {
%>
<p>The homenews has no messages.</p>
<%
    } else {
        for (HomeNews g : homenews) {
%>
<%= g.getContent() %>
<br/>
<a href="/news.jsp">詳細內容...</a>
<HR/>
<%

        }
    }
    pm.close();
%>
    <form action="/homenewsservlet" method="post">
       <!-- <div><textarea name="content" rows="3" cols="60"></textarea></div><br/> -->
       <div style="width:300px;height:20px"><span id="annContexTip" class="msg rn" style="display:none;"></span><br/></div>
				<div id="ann_ta_div" style="width:600px;">
					<textarea name="content" id="ann_ta" cols="30" rows="5"></textarea>
					<script type="text/javascript">
						CKEDITOR.replace('ann_ta');
						CKEDITOR.config.contentsCss = '/css/yaodian100_news.css';
					</script>
				</div>
      <div><input type="submit" value="Post HomeNews" /></div>
    </form>
			</div>
	</div>
</div>
</body>
</html>
