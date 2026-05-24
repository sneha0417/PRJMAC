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
   SCOPED UI: Pure White Panel (BRV Standard)
========================================================= */
body, html {
    margin: 0;
    padding: 0;
    background-color: #ffffff !important; /* Forced pure white for the entire page */
    font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif; 
}

.modern-ui {
    font-size: 12px;
    color: #333;
    padding: 10px;
    box-sizing: border-box;
    width: 100%;
    background-color: #ffffff !important; /* Forced pure white */
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
    background-color: #ffffff !important; /* Pure white inside the border */
    border: 1px solid #cccccc;
    border-radius: 4px;
    padding: 15px 10px;
    margin-bottom: 15px;
    width: 100%;
    box-sizing: border-box;
}

/* Table Alignment - STRICT PERCENTAGE GRID */
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

/* Search Button - Standard Blue */
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
    width: 100%; /* Ensures button fills its grid cell nicely */
}

.modern-ui .myButton:hover {
    background-color: #1a4eb8;
}

/* Grid Container */
.modern-ui .grid-container {
    background-color: #ffffff !important; /* Pure white */
    border: 1px solid #cccccc;
    border-radius: 4px;
    overflow: hidden;
    width: 100%;
    min-height: 200px;
}
</style>

<script type="text/javascript">
    $(document).ready(function () {
        document.getElementById("txtdoctypes").value = document.getElementById("formdetailcode").value;
        document.getElementById("txtsearchtype").value = document.getElementById("txtforsearch").value;
        document.getElementById("txtnewdates").value = $('#maindate').val();
    }); 
    
    function loadAccountSearch() {
        var accountsno = document.getElementById("txtaccountsno").value;
        var accountsname = document.getElementById("txtaccountsname").value;
        var currs = document.getElementById("txtaccountcurrency").value;
        var formcode = document.getElementById("txtdoctypes").value;
        var searchtype = document.getElementById("txtsearchtype").value;
        var dates = document.getElementById("txtnewdates").value;
        var check = 1;

        getAccountDetails(accountsno, accountsname, currs, formcode, searchtype, dates, check);
    }
        
    function getAccountDetails(accountsno, accountsname, currs, formcode, searchtype, dates, check){
         $("#refreshAccountDetailsDiv").load("../../accountDetailsSearchGrid.jsp?accountno=" + accountsno + 
                                             "&accountname=" + accountsname.replace(/ /g, "%20") + 
                                             "&currency=" + currs + 
                                             "&dtype=" + formcode + 
                                             "&searchtype=" + searchtype + 
                                             "&dates=" + dates + 
                                             "&check=" + check);
    }
</script>
</head>

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
                <td class="lbl-right">Account No</td>
                <td>
                    <input type="text" name="txtaccountsno" id="txtaccountsno" value='<s:property value="txtaccountsno"/>'>
                </td>
                
                <td class="lbl-right">Currency</td>
                <td>
                    <input type="text" name="txtaccountcurrency" id="txtaccountcurrency" value='<s:property value="txtaccountcurrency"/>'>
                    <input type="hidden" name="txtdoctypes" id="txtdoctypes" value='<s:property value="txtdoctypes"/>'>
                    <input type="hidden" name="txtsearchtype" id="txtsearchtype" value='<s:property value="txtsearchtype"/>'>
                    <input type="hidden" name="txtnewdates" id="txtnewdates" value='<s:property value="txtnewdates"/>'>
                </td>
                
                <td align="center" rowspan="2" valign="middle" style="padding-left: 10px;">
                    <button type="button" name="btnAccountSearch" id="btnAccountSearch" class="myButton" onclick="loadAccountSearch(); return false;">
                        Search
                    </button>
                </td>
            </tr>
            
            <tr>
                <td class="lbl-right">Account Name</td>
                <td colspan="3">
                    <input type="text" name="txtaccountsname" id="txtaccountsname" value='<s:property value="txtaccountsname"/>'>
                </td>
            </tr>

        </table>
    </div>

    <div class="grid-container">
        <div id="refreshAccountDetailsDiv">
            <jsp:include page="accountDetailsSearchGrid.jsp"></jsp:include>
        </div>
    </div>

</div>

</body>
</html>