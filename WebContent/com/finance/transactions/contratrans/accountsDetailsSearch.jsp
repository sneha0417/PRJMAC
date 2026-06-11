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
div#search.modern-ui input#btnAccountSearch.myButton {
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
div#search.modern-ui input#btnAccountSearch.myButton:hover {
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
    /* Safely fetch values from parent DOM to avoid crashing */
    var cmbtype = document.getElementById("cmbtype");
    if (cmbtype && document.getElementById("txtfromtypes")) {
        document.getElementById("txtfromtypes").value = cmbtype.value;
    }
    
    var cmbtotype = document.getElementById("cmbtotype");
    if (cmbtotype && document.getElementById("txttotypes")) {
        document.getElementById("txttotypes").value = cmbtotype.value;
    }
    
    var txtfromorto = document.getElementById("txtfromorto");
    if (txtfromorto && document.getElementById("txtfromto")) {
        document.getElementById("txtfromto").value = txtfromorto.value;
    }
    
    var mainDateVal = $('#maindate').length ? $('#maindate').val() : "";
    if (document.getElementById("txtnewdates")) {
        document.getElementById("txtnewdates").value = mainDateVal;
    }
}); 
    
function loadAccountSearch() {
    var accountsno = document.getElementById("txtaccountsno").value || "";
    var accountsname = document.getElementById("txtaccountsname").value || "";
    var currs = document.getElementById("txtaccountcurrency").value || "";
    var fromto = document.getElementById("txtfromto").value || "";
    var dates = document.getElementById("txtnewdates").value || "";
    var check = 1;
    var type = "";
    
    /* Safely map the type parameter depending on fromto state */
    if (fromto == "2") {
        var fromTypesEl = document.getElementById("txtfromtypes");
        type = fromTypesEl ? fromTypesEl.value : "";
    } else if (fromto == "3") {
        var toTypesEl = document.getElementById("txttotypes");
        type = toTypesEl ? toTypesEl.value : "";
    }

    getAccountDetails(accountsno, accountsname, currs, fromto, type, dates, check);
}
        
function getAccountDetails(accountsno, accountsname, currs, fromto, type, dates, check) {
    /* Securely encode all variables for the URL */
    $("#refreshAccountDetailsDiv").load("accountDetailsSearchGrid.jsp?accountno=" + encodeURIComponent(accountsno) + 
                                        "&accountname=" + encodeURIComponent(accountsname) + 
                                        "&currency=" + encodeURIComponent(currs) + 
                                        "&type=" + encodeURIComponent(type) + 
                                        "&fromto=" + encodeURIComponent(fromto) + 
                                        "&dates=" + encodeURIComponent(dates) + 
                                        "&check=" + check);
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
                    <input type="text" name="txtaccountsno" id="txtaccountsno" value='<s:property value="txtaccountsno"/>'>
                </td>
                
                <td class="lbl-right">Currency</td>
                <td>
                    <input type="text" name="txtaccountcurrency" id="txtaccountcurrency" value='<s:property value="txtaccountcurrency"/>'>
                    <input type="hidden" name="txtfromtypes" id="txtfromtypes" value='<s:property value="txtfromtypes"/>'>
                    <input type="hidden" name="txttotypes" id="txttotypes" value='<s:property value="txttotypes"/>'>
                    <input type="hidden" name="txtfromto" id="txtfromto" value='<s:property value="txtfromto"/>'>
                    <input type="hidden" name="txtnewdates" id="txtnewdates" value='<s:property value="txtnewdates"/>'>
                </td>
                
                <td align="center" rowspan="2" valign="middle" style="padding-left: 10px;">
                    <input type="button" name="btnAccountSearch" id="btnAccountSearch" class="myButton" value="Search" onclick="loadAccountSearch(); return false;">
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