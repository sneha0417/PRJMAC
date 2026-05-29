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

<style type="text/css">
#search {
    background-color: #E0ECF8;
}
</style>

	<script type="text/javascript">
	$(document).ready(function () {
		document.getElementById("txtempprocessprint").value=document.getElementById("hidchckpayrollprocess").value;
	}); 

 	function loadSearch() {

 		var employeeName=document.getElementById("txtpartyname").value;
 		var empId=document.getElementById("txtpartyid").value;
 		var contactNo=document.getElementById("txtcontactno").value;
 		var processPrint=document.getElementById("txtempprocessprint").value;
 		var employeebranchchk=window.parent.employeebranchchk.value; 
 		var branch=document.getElementById("brchName").value;
		getdata(employeeName,empId,contactNo,processPrint, employeebranchchk, branch);
	}
	function getdata(employeeName,empId,contactNo,processPrint, employeebranchchk, branch){
		 $("#refreshdiv").load('employeeDetailsSearchGrid.jsp?employeename='+employeeName.replace(/ /g, "%20")+'&empid='+empId+'&contactno='+contactNo+'&processPrint='+processPrint+'&branchid='+branch+'&employeebranchchk='+employeebranchchk);
		}

	</script>
<style>
/* =========================================================
   MASTER SEARCH UI
========================================================= */
body, html {
    margin: 0;
    padding: 0;
    background: #ffffff !important;
    font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
}

.modern-ui {
    font-size: 12px;
    color: #333;
    padding: 10px;
    box-sizing: border-box;
    width: 100%;
    background: #ffffff !important;
}

/* Search Panel */
.modern-ui .search-panel {
    background: #ffffff;
    border: 1px solid #cccccc;
    border-radius: 4px;
    padding: 18px 15px 12px;
    margin-bottom: 15px;
    box-sizing: border-box;
}

/* Structured Layout */
.modern-ui table {
    width: 100%;
    border-collapse: separate;
    border-spacing: 10px 12px;
    table-layout: fixed;
}

.modern-ui td {
    vertical-align: middle;
}

/* Labels */
.modern-ui .lbl-right {
    text-align: right;
    font-size: 12px;
    font-weight: 500;
    color: #333;
    white-space: nowrap;
    padding-right: 6px;
}

/* Inputs */
.modern-ui input[type="text"],
.modern-ui select {
    width: 100%;
    height: 28px !important;
    border: 1px solid #cfcfcf;
    border-radius: 3px;
    padding: 2px 8px;
    font-size: 12px;
    font-family: inherit;
    background: #ffffff;
    color: #333;
    box-sizing: border-box;
}

.modern-ui input[type="text"]:focus,
.modern-ui select:focus {
    border-color: #2563eb;
    outline: none;
}

/* Search Button */
.modern-ui .myButton {
    height: 30px;
    min-width: 110px;
    padding: 0 22px;
    background: #205fd3;
    border: none;
    border-radius: 4px;
    color: #ffffff;
    font-size: 12px;
    font-weight: 600;
    cursor: pointer;
    transition: background 0.2s;
}

.modern-ui .myButton:hover {
    background: #1b4fb3;
}

/* Grid Container */
.modern-ui .grid-container {
    background: #ffffff;
    border: 1px solid #cccccc;
    border-radius: 4px;
    overflow: hidden;
    min-height: 250px;
}
</style>

<body style="background:#ffffff;">

<div id="search" class="modern-ui">

    <!-- SEARCH PANEL -->
    <div class="search-panel">

        <table border="0" cellspacing="0" cellpadding="0">

            <colgroup>
                <col width="10%">
                <col width="30%">
                <col width="12%">
                <col width="28%">
                <col width="20%">
            </colgroup>

            <!-- ROW 1 -->
            <tr>

                <td class="lbl-right">Name</td>

                <td colspan="3">
                    <input type="text"
                           name="txtpartyname"
                           id="txtpartyname"
                           value='<s:property value="txtpartyname"/>'>
                </td>

                <td align="left">
                    <button type="button"
                            name="btnsearch"
                            id="btnsearch"
                            class="myButton"
                            onclick="loadSearch(); return false;">
                        Search
                    </button>
                </td>

            </tr>

            <!-- ROW 2 -->
            <tr>

                <td class="lbl-right">ID#</td>

                <td>
                    <input type="text"
                           name="txtpartyid"
                           id="txtpartyid"
                           value='<s:property value="txtpartyid"/>'>
                </td>

                <td class="lbl-right">Contact No.</td>

                <td>
                    <input type="text"
                           name="txtcontactno"
                           id="txtcontactno"
                           value='<s:property value="txtcontactno"/>'>

                    <input type="hidden"
                           name="txtatype"
                           id="txtatype"
                           value='<s:property value="txtatype"/>'>

                    <input type="hidden"
                           name="txtempprocessprint"
                           id="txtempprocessprint"
                           value='<s:property value="txtempprocessprint"/>'>
                </td>

                <td></td>

            </tr>

        </table>

    </div>

    <!-- GRID -->
    <div class="grid-container">

        <div id="refreshdiv">
            <jsp:include page="employeeDetailsSearchGrid.jsp"></jsp:include>
        </div>

    </div>

</div>

</body>
</html>