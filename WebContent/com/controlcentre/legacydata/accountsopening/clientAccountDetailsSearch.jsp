<%@ taglib prefix="s" uri="/struts-tags" %>
<% String contextPath=request.getContextPath(); %>
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
   STRICTLY SCOPED UI (No Global Bleed, Bold Retained)
========================================================= */
.modern-ui {
    font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif; 
    font-size: 12px;
    font-weight: bold !important; /* Forces this component to be bold */
    padding: 10px;
    box-sizing: border-box;
    width: 100%;
    background-color: #ffffff !important;
    color: #333333 !important; 
}

/* Strict weight enforcement for injected content */
.modern-ui, .modern-ui table, .modern-ui td, .modern-ui input, .modern-ui select {
    font-weight: bold !important; 
    color: #333333 !important; 
}

/* Master Input Styles */
.modern-ui input[type="text"],
.modern-ui select {
    height: 24px !important;
    border: 1px solid #cccccc; 
    border-radius: 3px;
    padding: 2px 6px;
    font-size: 12px; 
    font-weight: bold !important; /* Makes the typed text inside inputs bold */
    font-family: inherit;
    box-sizing: border-box;
    background-color: #ffffff;
    color: #333333 !important; 
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

/* Table Alignment - 5 Column Layout */
.modern-ui table {
    border-collapse: separate;
    border-spacing: 5px 8px; 
    width: 100%;
    table-layout: fixed; 
}

.modern-ui td {
    vertical-align: middle;
}

/* Side-aligned labels */
.modern-ui .lbl-right { 
    text-align: right; 
    color: #333333 !important; 
    font-size: 12px; 
    font-weight: bold !important;
    white-space: nowrap; 
    padding-right: 5px;
}

/* =========================================================
   BULLETPROOF BUTTON UI: Dark Blue + Hover
========================================================= */
div#search.modern-ui input#btnClientAccountSearch.myButton {
    height: 24px !important; 
    padding: 0 24px !important;
    background-color: #205fd3 !important; /* Solid Dark Blue */
    background-image: none !important;
    color: #ffffff !important; /* White text for button */
    border: none !important;
    border-radius: 4px !important; 
    cursor: pointer !important;
    font-family: Arial, sans-serif !important; 
    font-size: 12px !important;
    font-weight: bold !important;
    line-height: 24px !important;
    transition: background-color 0.2s ease !important;
    width: 100% !important;
    box-sizing: border-box !important;
}

/* The Hover State */
div#search.modern-ui input#btnClientAccountSearch.myButton:hover {
    background-color: #124096 !important; /* Noticeably darker blue on hover */
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

<script type="text/javascript">
$(document).ready(function () {
    // Standardizing the jqxDateTimeInput to match the new 24px UI height
    $("#txtaccperiod").jqxDateTimeInput({ width: '100%', height: '24px', formatString: "dd.MM.yyyy" });
    
    // Safely pull from parent elements
    var cmbAccType = document.getElementById("cmbacctype");
    if(cmbAccType && document.getElementById("txtatypes")) {
        document.getElementById("txtatypes").value = cmbAccType.value;
    }
    
    // Wrapped in a try-catch to prevent JS crashing if window.parent is inaccessible or missing the element
    try {
        if(window.parent && window.parent.txtaccountperiodfrom) {
            var year = window.parent.txtaccountperiodfrom.value;
            if (year) {
                var newDate = year.split('-');
                if(newDate.length === 3) {
                    year = newDate[1] + "-" + newDate[0] + "-" + newDate[2];
                    $('#txtaccperiod').jqxDateTimeInput('setDate', new Date(year));
                }
            }
        }
    } catch (e) {
        console.warn("Could not fetch account period from parent window.");
    }
}); 

function loadClientAccountSearch() {
    var clientaccountno = document.getElementById("accountsno").value || "";
    var clientaccountname = document.getElementById("accountsname").value || "";
    var clientmobile = document.getElementById("clientmobileno").value || "";
    var curr = document.getElementById("txtcurrencies").value || "";
    var accounttype = document.getElementById("txtatypes").value || "";
    
    // Safely pull from jqxDateTimeInput with a standard DOM fallback
    var date = "";
    if ($('#txtaccperiod').length && typeof $('#txtaccperiod').jqxDateTimeInput === 'function') {
        date = $('#txtaccperiod').jqxDateTimeInput('val') || "";
    } else {
        var dateEl = document.getElementById("txtaccperiod");
        date = dateEl ? dateEl.value : "";
    }
    
    var checked = 1;

    getClientAccountDetails(clientaccountno, clientaccountname, clientmobile, curr, accounttype, date, checked);
}
    
function getClientAccountDetails(clientaccountno, clientaccountname, clientmobile, curr, accounttype, date, checked) {
    // Upgraded to robust URL encoding instead of manual space replacement
    $("#refreshClientAccountDiv").load("clientAccountDetailsSearchGrid.jsp?accountno=" + encodeURIComponent(clientaccountno) + 
                                       "&accountname=" + encodeURIComponent(clientaccountname) + 
                                       "&mobile=" + encodeURIComponent(clientmobile) + 
                                       "&currency=" + encodeURIComponent(curr) + 
                                       "&atype=" + encodeURIComponent(accounttype) + 
                                       "&date=" + encodeURIComponent(date) + 
                                       "&check=" + checked);
}
</script>
</head>

<body>
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
                    <input type="text" name="accountsno" id="accountsno" value='<s:property value="accountsno"/>'>
                </td>
                
                <td class="lbl-right">Currency</td>
                <td>
                    <input type="text" name="txtcurrencies" id="txtcurrencies" value='<s:property value="txtcurrencies"/>'>
                    
                    <input type="hidden" name="txtatypes" id="txtatypes" value='<s:property value="txtatypes"/>'>
                    <div style="display: none;" id="txtaccperiod" name="txtaccperiod"></div>
                </td>
                
                <td align="center" rowspan="2" valign="middle" style="padding-left: 10px;">
                    <input type="button" name="btnClientAccountSearch" id="btnClientAccountSearch" class="myButton" value="Search" onclick="loadClientAccountSearch(); return false;">
                </td>
            </tr>
            
            <tr>
                <td class="lbl-right">Account Name</td>
                <td>
                    <input type="text" name="accountsname" id="accountsname" value='<s:property value="accountsname"/>'>
                </td>
                
                <td class="lbl-right">Mobile</td>
                <td>
                    <input type="text" name="clientmobileno" id="clientmobileno" value='<s:property value="clientmobileno"/>'>
                </td>
            </tr>

        </table>
    </div>

    <div class="grid-container">
        <div id="refreshClientAccountDiv">
            <jsp:include page="clientAccountDetailsSearchGrid.jsp"></jsp:include>
        </div>
    </div>

</div>
</body>
</html>