<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%
    try {
        if (request.getSession().getAttribute("username") == null) {

            response.sendRedirect("/Simil");

        }
    } catch (Exception e) {
        e.printStackTrace();
    }
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" 
    "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" type="text/css" href="/Simil/supp/css/simil.css">
<script type="text/javascript" src="/Simil/supp/js/jquery-1.12.1.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Simil</title>
</head>
<body>
    <div id="wrapper">
        <div id="nav">
            <div id="logoDiv">
                <a id="logo" href="/Simil"><span id="logoSpan">Simil!</span></a>
            </div>

        </div>
        
        <div id="sideMenu">
            <div id="linkContainer">
                <ul>
                    <li><div class="menuItem"></div><a href="/Simil/views/Interests/Catalog.jsp">Interests</a></li>
                    <li><a href="/Simil/views/Panels/Catalog.jsp">Panels</a></li>
                    <%
                        //System.out.println("Account: " + request.getSession().getAttribute("accountType"));
                        if (request.getSession().getAttribute("accountType").equals("Administrator")) {
                    %>
                     <li><a href="/Simil/views/Dashboard/AdministratorTools.jsp">Administrator Tools</a></li>
                    <%
                        }
                    %>
                </ul>
            </div>
        </div>

            <div id="content">
                <form action="/Simil/LogoutController" method="POST">
                    <button type="submit" value="Logout">Logout</button>
                </form>
            </div>
        
    </div>
</body>
<script>
    
    $(function(){
        var expanded = false;
        $('#sideMenu').click(function(){
            if (!expanded){
                  $(this).animate({'left' : '0px'}, {duration : 200});
                  expanded = true;
            }
            else{
                $(this).animate({'left' : '-145px'}, {duration: 200});
                expanded = false;
            }
        });
    });
</script>
</html>