 <%@ taglib prefix="s" uri="/struts-tags" %>
 <% String contextPath=request.getContextPath(); %>
 <%
 String rownindex = request.getParameter("rownindex")==null?"0":request.getParameter("rownindex");
 String id = request.getParameter("id")==null?"0":request.getParameter("id");%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link href="<%=contextPath%>/css/body.css" media="screen" rel="stylesheet" type="text/css" />
<title>GatewayERP(i)</title>

<style type="text/css">
#search {
    background-color: #E0ECF8;
}
</style>

	<script type="text/javascript">
	$(document).ready(function () {}); 
  
	var rownindex="<%=rownindex%>";
	var id="<%=id%>";
	
 	function loadUserSearch() {

 		var teamusername=document.getElementById("txtteamusername").value;
 		
		getdata(teamusername);
	}
 	
	function getdata(teamusername){
		 $("#refreshuserdiv").load('userDetailsSearchGrid.jsp?teamusername='+teamusername.replace(/ /g, "%20")+'&rownindex='+rownindex+'&id='+id);
	}

	</script>
<style>
/* =========================================================
   SCOPED UI: Pure White Panel
========================================================= */
body, html {
    margin: 0;
    padding: 0;
    background-color: #ffffff !important; 
    font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif; 
}

.modern-ui {
    font-size: 12px;
    color: #333;
    padding: 10px;
    box-sizing: border-box;
    width: 100%;
    background-color: #ffffff !important;
}

/* Master Input Styles */
.modern-ui input[type="text"],
.modern-ui select {
    height: 24px !important;
    border: 1px solid #cccccc; 
    border-radius: 3px;
    padding: 2px 6px;
    font-size: 12px; 
    font-family: inherit;
    box-sizing: border-box;
    background-color: #ffffff;
    color: #333;
    width: 100%;
}

.modern-ui input[type="text"]:focus,
.modern-ui select:focus {
    border-color: #2563eb;
    outline: none;
}

/* Panel Styling - Clean White Panel */
.modern-ui .search-panel {
    background-color: #ffffff !important;
    border: 1px solid #cccccc;
    border-radius: 4px;
    padding: 15px 10px;
    margin-bottom: 15px;
    width: 100%;
    box-sizing: border-box;
}

/* Table Alignment */
.modern-ui table {
    border-collapse: separate;
    border-spacing: 5px 8px; 
    width: 100%;
    table-layout: fixed; 
}

.modern-ui td {
    vertical-align: middle;
}

.modern-ui .lbl-right { 
    text-align: right; 
    color: #333;
    font-size: 12px; 
    font-weight: 500;
    font-family: inherit;
    white-space: nowrap; 
    padding-right: 5px;
}

/* Search Button */
.modern-ui .myButton {
    height: 28px;
    padding: 0 24px;
    background-color: #205fd3; 
    color: #ffffff;
    border: none;
    border-radius: 4px;
    cursor: pointer;
    font-size: 12px;
    font-weight: 600;
    font-family: inherit;
    transition: background-color 0.2s;
}

.modern-ui .myButton:hover {
    background-color: #1a4eb8;
}

/* Grid Container */
.modern-ui .grid-container {
    background-color: #ffffff !important;
    border: 1px solid #cccccc;
    border-radius: 4px;
    overflow: hidden;
    width: 100%;
    min-height: 200px;
}
</style>

<body style="background-color: #ffffff;">

<div id="search" class="modern-ui">

    <div class="search-panel">
        <table width="100%" border="0" cellspacing="0" cellpadding="0">
            <colgroup>
                <col width="15%" /> 
                <col width="45%" /> 
                <col width="40%" /> 
            </colgroup>
            
            <tr>
                <td class="lbl-right">User</td>
                <td>
                    <input type="text" name="txtteamusername" id="txtteamusername" value='<s:property value="txtteamusername"/>'>
                </td>
                
                <td align="left" style="padding-left: 10px;">
                    <button type="button" name="btnusersearch" id="btnusersearch" class="myButton" onclick="loadUserSearch(); return false;">
                        Search
                    </button>
                </td>
            </tr>
        </table>
    </div>

    <div class="grid-container">
        <div id="refreshuserdiv">
            <jsp:include page="userDetailsSearchGrid.jsp"></jsp:include>
        </div>
    </div>

</div>

</body>
</html>