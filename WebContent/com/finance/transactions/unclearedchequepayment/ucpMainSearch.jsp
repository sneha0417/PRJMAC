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
div#search.modern-ui input#btnsearch.myButton {
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
div#search.modern-ui input#btnsearch.myButton:hover {
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
    // Standardizing the jqx widgets to match the 24px UI height
    $("#unclearchequedate").jqxDateTimeInput({ width: '100%', height: '24px', formatString: "dd.MM.yyyy", value: null });
    $("#chqdate").jqxDateTimeInput({ width: '100%', height: '24px', formatString: "dd.MM.yyyy", value: null });
}); 

function loadSearch() {
    var partyname = document.getElementById("txtpartyname").value || "";
    var docNo = document.getElementById("txtdocno").value || "";
    
    // Safely pull from first jqxDateTimeInput
    var date = "";
    if ($('#unclearchequedate').length && typeof $('#unclearchequedate').jqxDateTimeInput === 'function') {
        date = $('#unclearchequedate').jqxDateTimeInput('val') || "";
    } else {
        var dateEl = document.getElementById("unclearchequedate");
        date = dateEl ? dateEl.value : "";
    }
    
    var amount = document.getElementById("txtamount").value || "";
    var chequeNo = document.getElementById("txtchqno").value || "";
    
    // Safely pull from second jqxDateTimeInput
    var chequeDt = "";
    if ($('#chqdate').length && typeof $('#chqdate').jqxDateTimeInput === 'function') {
        chequeDt = $('#chqdate').jqxDateTimeInput('val') || "";
    } else {
        var chqDateEl = document.getElementById("chqdate");
        chequeDt = chqDateEl ? chqDateEl.value : "";
    }
    
    var check = 1;
    
    getdata(partyname, docNo, date, amount, chequeNo, chequeDt, check);
}

function getdata(partyname, docNo, date, amount, chequeNo, chequeDt, check) {
    // Securely encode all variables for the URL
    $("#refreshdiv").load('ucpMainSearchGrid.jsp?partyname=' + encodeURIComponent(partyname) + 
                          '&docNo=' + encodeURIComponent(docNo) + 
                          '&date=' + encodeURIComponent(date) + 
                          '&amount=' + encodeURIComponent(amount) + 
                          '&chequeNo=' + encodeURIComponent(chequeNo) + 
                          '&chequeDt=' + encodeURIComponent(chequeDt) + 
                          '&check=' + check);
}
</script>
</head>

<body>
<div id="search" class="modern-ui">

    <div class="search-panel">
        <table width="100%" border="0" cellspacing="0" cellpadding="0">
            <colgroup>
                <col width="10%" /> <col width="35%" /> 
                <col width="12%" /> <col width="23%" />
                <col width="20%" />
            </colgroup>
            
            <tr>
                <td class="lbl-right">Name</td>
                <td><input type="text" name="txtpartyname" id="txtpartyname" value='<s:property value="txtpartyname"/>'></td>
                
                <td class="lbl-right">Doc No</td>
                <td><input type="text" name="txtdocno" id="txtdocno" value='<s:property value="txtdocno"/>'></td>
                
                <td align="center" rowspan="3" valign="middle" style="padding-left: 10px;">
                    <input type="button" name="btnsearch" id="btnsearch" class="myButton" value="Search" onclick="loadSearch(); return false;">
                </td>
            </tr>
            
            <tr>
                <td class="lbl-right">Date</td>
                <td>
                    <div id="unclearchequedate" name="unclearchequedate"></div>
                    <input type="hidden" name="hidunclearchequedate" id="hidunclearchequedate" value='<s:property value="hidunclearchequedate"/>'>
                </td>
                
                <td class="lbl-right">Amount</td>
                <td><input type="text" name="txtamount" id="txtamount" value='<s:property value="txtamount"/>'></td>
            </tr>
            
            <tr>
                <td class="lbl-right">Cheque No</td>
                <td><input type="text" name="txtchqno" id="txtchqno" value='<s:property value="txtchqno"/>'></td>
                
                <td class="lbl-right">Cheque Date</td>
                <td>
                    <div id="chqdate" name="chqdate"></div>
                    <input type="hidden" name="hidchqdate" id="hidchqdate" value='<s:property value="hidchqdate"/>'>
                </td>
            </tr>
        </table>
    </div>

    <div class="grid-container">
        <div id="refreshdiv">
            <jsp:include page="ucpMainSearchGrid.jsp"></jsp:include>
        </div>
    </div>

</div>
</body>
</html>