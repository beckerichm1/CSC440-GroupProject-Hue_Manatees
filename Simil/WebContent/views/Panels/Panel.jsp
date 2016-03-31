
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
                <div id="panelHead">
                    <div id="panelName"></div>
                    <div id="panelDescription"></div>
                </div>
                <div id="panelMembers">
                    <h4>Panel Members</h4>
                    <ul id="memberList"></ul>
                </div>
                <form action="/Simil/LogoutController" method="POST">
                    <button type="submit" value="Logout">Logout</button>
                </form>
            </div>
        
    </div>
</body>
<script>
	$(document).ready(function() {
		var id = ${param.id};
		console.log("This panelID is: " + id);
		getPanelDetails(id);
		getPanelMembers(id);
	});

	function getPanelDetails(id) {
		var url = "/Simil/PanelServlet";
		$.ajax({
			url : url,
			datatype : 'json',
			type: "GET",
			data : {
				param: "one",
				id : id
			},
			success : function(data) {
				console.log("getPanelDetails succeeded. Returning data.");
				fillPanelDetails(data);
			},
			error : function() {
				alert('error');
			}
		});
	}
	
	function getPanelMembers(id){	// Might be causing problems, PanelAccountServlet vs Controller
		var url = "/Simil/PanelAccountServlet";
		$.ajax({
			url: url,
			datatype : 'json',
			type: "GET",
			data : {id : id},
			success : function(data) {
				console.log("getPanelMembers succeeded. Returning data.");
				fillPanelMembers(data);
			},
			error : function() {
				alert('Error getting panel members...');
			}
		})
	}
	
	function fillPanelDetails(data){
		var nameDiv= $('#panelName');
		var descDiv = $('#panelDescription');
		
		nameDiv.append("<h1 id='panelName'>" + data[1] + "</h1>");
		descDiv.append("<p id='panelDescription'>" + data[2] + "</p>");
		
		console.log("PanelDetails Data is: " + data);

	}
	
	function fillPanelMembers(data){
	    var membersDiv = $('#memberList');
		console.log("PanelMembers Data is: " + data);
		
		for (var i = 0; i < data.length; i++){
			membersDiv.append("<li>"+ data[i] +"</li>")
		}
	}
	
	function generatePage(data) {
		console.log("Data is: " + data);
		console.log("Data[0] is: " + data[0]);
		console.log("Data[1] is: " + data[1]);
		console.log("Data[2] is: " + data[2]);
	}
</script>
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