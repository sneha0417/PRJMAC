<%@ taglib prefix="s" uri="/struts-tags" %>
<% String contextPath=request.getContextPath();%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>GatewayERP(i)</title>
<link href="<%=contextPath%>/css/body.css" media="screen" rel="stylesheet" type="text/css" />

<style>
/* =========================================================
   SCOPED UI: Pure White Panel (Strict Weight Control)
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

/* Strict weight enforcement for injected content */
.modern-ui, .modern-ui table, .modern-ui td, .modern-ui input, .modern-ui select, .modern-ui button {
    font-weight: 400 !important; 
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

/* Panel Styling */
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
    border-spacing: 5px 10px; 
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
    font-weight: 600 !important;
    white-space: nowrap; 
    padding-right: 5px;
}

/* =========================================================
   BULLETPROOF BUTTON UI: Dark Blue + Hover
========================================================= */
.modern-ui .myButton {
    height: 24px !important; 
    padding: 0 24px !important;
    background-color: #205fd3 !important; 
    background-image: none !important;
    color: #ffffff !important;
    border: none !important;
    border-radius: 4px !important; 
    cursor: pointer !important;
    font-family: Arial, sans-serif !important; 
    font-size: 12px !important;
    font-weight: 600 !important;
    line-height: 24px !important;
    transition: background-color 0.2s ease !important;
    width: 120px !important; 
    box-sizing: border-box !important;
    white-space: nowrap !important;
}

.modern-ui .myButton:hover {
    background-color: #124096 !important; 
}

/* Grid Container */
.modern-ui .grid-container {
    background-color: #ffffff !important;
    border: 1px solid #cccccc;
    border-radius: 4px;
    overflow: hidden;
    width: 100%;
    min-height: 250px;
}
</style>

<script type="text/javascript">
	function loadAccountSearch() {
		var masterdate="";
		var accountsno=document.getElementById("txtaccountsno").value;
		var accountsname=document.getElementById("txtaccountsname").value;
		var mob=document.getElementById("mob").value;
		var check = 1;

		getAccountDetails(accountsno,accountsname,mob,check,masterdate);
	}
		
	function getAccountDetails(accountsno,accountsname,mob,check,masterdate){
		 $("#refreshAccountDetailsDiv").load("accountsDetailsFromGrid.jsp?accountno="+accountsno+'&accountname='+accountsname.replace(/ /g, "%20")+'&mob='+mob+'&check='+check+'&masterdate='+masterdate);
	}
</script>
</head>

<body>

<div id="search" class="modern-ui">

    <!-- Search Panel -->
    <div class="search-panel">
        <table width="100%" border="0" cellspacing="0" cellpadding="0">
            <!-- 4-Column Balanced Grid -->
            <colgroup>
                <col width="15%"> 
                <col width="35%"> 
                <col width="15%"> 
                <col width="35%"> 
            </colgroup>

            <!-- FIRST ROW -->
            <tr>
                <td class="lbl-right">Account No</td>
                <td>
                    <input type="text"
                           name="txtaccountsno"
                           id="txtaccountsno"
                           value='<s:property value="txtaccountsno"/>'>
                </td>

                <td class="lbl-right">Account Name</td>
                <td>
                    <input type="text"
                           name="txtaccountsname"
                           id="txtaccountsname"
                           value='<s:property value="txtaccountsname"/>'>
                </td>
            </tr>

            <!-- SECOND ROW -->
            <tr>
                <td class="lbl-right">Mobile</td>
                <td>
                    <input type="text"
                           name="mob"
                           id="mob"
                           value='<s:property value="mob"/>'>

                    <input type="hidden"
                           name="txtsearchtype"
                           id="txtsearchtype"
                           value='<s:property value="txtsearchtype"/>'>
                </td>

                <!-- Aligned far-right to anchor perfectly beneath the inputs -->
                <td colspan="2" align="right" valign="middle">
                    <input type="button"
                           name="btnAccountSearch"
                           id="btnAccountSearch"
                           value="Search"
                           class="myButton"
                           onclick="loadAccountSearch();">
                </td>
            </tr>
        </table>
    </div>

    <!-- Grid -->
    <div class="grid-container">
        <div id="refreshAccountDetailsDiv">
            <jsp:include page="accountsDetailsFromGrid.jsp"></jsp:include>
        </div>
    </div>

</div>

</body>
</html>