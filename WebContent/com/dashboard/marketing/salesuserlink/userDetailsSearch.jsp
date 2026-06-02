 <%@ taglib prefix="s" uri="/struts-tags" %>
 <% String contextPath=request.getContextPath(); %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link href="<%=contextPath%>/css/body.css" media="screen" rel="stylesheet" type="text/css" />
<title>GatewayERP(i)</title>



<script type="text/javascript">
	$(document).ready(function () {}); 

 	function loadSearch() {

 		var usersname=document.getElementById("txtusersname").value;
 		var usersrole=document.getElementById("txtusersrole").value;
 		var chk = 1;
 		
		getdata(usersname,usersrole,chk);
	}
 	
	function getdata(usersname,usersrole,chk){
		 $("#refreshdiv").load('userDetailsSearchGrid.jsp?usersname='+usersname.replace(/ /g, "%20")+'&usersrole='+usersrole.replace(/ /g, "%20")+'&chk='+chk);
	}

</script>
<style>
/* =========================================================
   MASTER SEARCH UI
========================================================= */

body, html{
    margin:0;
    padding:0;
    background:#ffffff !important;
    font-family:'Segoe UI',Tahoma,Verdana,sans-serif;
}

.modern-ui{
    padding:10px;
    font-size:12px;
    color:#333;
}

/* Search Panel */

.modern-ui .search-panel{
    background:#ffffff;
    border:1px solid #d6d6d6;
    border-radius:4px;
    padding:12px;
    margin-bottom:12px;
}

/* Table */

.modern-ui table{
    width:100%;
    border-collapse:collapse;
}

.modern-ui td{
    padding:4px;
    vertical-align:middle;
}

/* Labels */

.modern-ui .lbl-right{
    text-align:right;
    white-space:nowrap;
    font-size:12px;
    font-weight:500;
    padding-right:8px;
}

/* Inputs */

.modern-ui input[type=text]{
    width:100%;
    height:26px !important;
    border:1px solid #cfcfcf;
    border-radius:3px;
    padding:2px 6px;
    font-size:12px;
    box-sizing:border-box;
    background:#fff;
}

.modern-ui input[type=text]:focus{
    border-color:#2563eb;
    outline:none;
}

/* Force Blue Search Button */

.modern-ui .search-btn{
    width:100px;
    height:30px;
    background:#205fd3 !important;
    background-image:none !important;
    color:#ffffff !important;
    border:none !important;
    border-radius:4px;
    font-size:12px;
    font-weight:600;
    cursor:pointer;
}

.modern-ui .search-btn:hover{
    background:#184fb4 !important;
}

/* Grid */

.modern-ui .grid-container{
    background:#ffffff;
    border:1px solid #cccccc;
    border-radius:4px;
    overflow:hidden;
}
</style>

<body>

<div id="search" class="modern-ui">

    <!-- Search Panel -->
    <div class="search-panel">

        <table>

            <tr>

                <td class="lbl-right" width="10%">
                    User
                </td>

                <td width="35%">
                    <input type="text"
                           name="txtusersname"
                           id="txtusersname"
                           value='<s:property value="txtusersname"/>'>
                </td>

                <td class="lbl-right" width="10%">
                    Role
                </td>

                <td width="35%">
                    <input type="text"
                           name="txtusersrole"
                           id="txtusersrole"
                           value='<s:property value="txtusersrole"/>'>
                </td>

                <td width="10%" align="right">

                    <input type="button"
                           id="btnsearch"
                           name="btnsearch"
                           value="Search"
                           class="search-btn"
                           onclick="loadSearch();">

                </td>

            </tr>

        </table>

    </div>

    <!-- Grid -->
    <div class="grid-container">

        <div id="refreshdiv">
            <jsp:include page="userDetailsSearchGrid.jsp"></jsp:include>
        </div>

    </div>

</div>

</body>
</html>