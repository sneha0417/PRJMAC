 <%@ taglib prefix="s" uri="/struts-tags" %>
 <% String contextPath=request.getContextPath(); %>
 <%
 String rownindex = request.getParameter("rownindex")==null?"0":request.getParameter("rownindex"); %>
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
 	function loadSearch() {

 		var employeeName=document.getElementById("txtpartyname").value;
 		var empId=document.getElementById("txtpartyid").value;
 		var contactNo=document.getElementById("txtcontactno").value;
 		
		getdata(employeeName,empId,contactNo);
	}
	function getdata(employeeName,empId,contactNo){
		 $("#refreshdiv").load('employeeDetailsSearchGrid.jsp?employeename='+employeeName.replace(/ /g, "%20")+'&empid='+empId+'&contactno='+contactNo+'&rownindex='+rownindex);
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
                <col width="12%" /> 
                <col width="28%" /> 
                <col width="12%" /> 
                <col width="28%" /> 
                <col width="20%" />
            </colgroup>
            
            <tr>
                <td class="lbl-right">Name</td>
                <td colspan="3">
                    <input type="text" name="txtpartyname" id="txtpartyname" value='<s:property value="txtpartyname"/>'>
                </td>
                
                <td align="center" rowspan="2" valign="middle">
                    <button type="button" name="btnsearch" id="btnsearch" class="myButton" onclick="loadSearch(); return false;">
                        Search
                    </button>
                </td>
            </tr>
            
            <tr>
                <td class="lbl-right">ID#</td>
                <td>
                    <input type="text" name="txtpartyid" id="txtpartyid" value='<s:property value="txtpartyid"/>'>
                </td>
                
                <td class="lbl-right">Contact No.</td>
                <td>
                    <input type="text" name="txtcontactno" id="txtcontactno" value='<s:property value="txtcontactno"/>'>
                    <input type="hidden" name="txtatype" id="txtatype" value='<s:property value="txtatype"/>'>
                </td>
            </tr>

        </table>
    </div>

    <div class="grid-container">
        <div id="refreshdiv">
            <jsp:include page="employeeDetailsSearchGrid.jsp"></jsp:include>
        </div>
    </div>

</div>

</body>
</html>