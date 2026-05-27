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
    font-weight: 600 !important; /* Only labels stay bold */
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
    font-weight: 600 !important;
    transition: background-color 0.2s;
    width: 100%;
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

<script type="text/javascript">
$(document).ready(function () {
    /* Initialize both JQX Date widgets */
    $("#securitychequedate").jqxDateTimeInput({ width: '100%', height: '24px', formatString: "dd.MM.yyyy", value: null, theme: 'light' });
    $("#chqdate").jqxDateTimeInput({ width: '100%', height: '24px', formatString: "dd.MM.yyyy", value: null, theme: 'light' });

    /* Force internal alignment for JQX widgets */
    setTimeout(function () {
        $(".jqx-datetimeinput").css({"margin-top": "0px", "border-color": "#cccccc", "border-radius": "3px", "background-color": "#ffffff"});
        $(".jqx-datetimeinput").find("input").css({
            "margin-top": "0px", "line-height": "24px", "font-size": "12px", 
            "font-family": "inherit", "padding": "0 6px", "box-sizing":"border-box", "background-color": "#ffffff"
        });
        $(".jqx-datetimeinput").find(".jqx-action-button").css({"top": "0px", "height": "24px"});
    }, 50);
}); 

function loadSearch() {
    var partyname = document.getElementById("txtpartyname").value || "";
    var docNo = document.getElementById("txtdocno").value || "";
    var date = $('#securitychequedate').jqxDateTimeInput('val') || "";
    var amount = document.getElementById("txtamounts").value || "";
    var chequeNo = document.getElementById("txtchqno").value || "";
    var chequeDt = $('#chqdate').jqxDateTimeInput('val') || "";
    var check = 1;
    
    getdata(partyname, docNo, date, amount, chequeNo, chequeDt, check);
}

function getdata(partyname, docNo, date, amount, chequeNo, chequeDt, check){
    /* Securely encode variables for the URL to prevent breaking characters */
    $("#refreshdiv").load('secMainSearchGrid.jsp?partyname=' + encodeURIComponent(partyname) + 
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
                <col width="10%" /> <col width="30%" /> 
                <col width="10%" /> <col width="30%" />
                <col width="20%" />
            </colgroup>
            
            <tr>
                <td class="lbl-right">Name</td>
                <td><input type="text" name="txtpartyname" id="txtpartyname" value='<s:property value="txtpartyname"/>'></td>
                
                <td class="lbl-right">Doc No</td>
                <td><input type="text" name="txtdocno" id="txtdocno" value='<s:property value="txtdocno"/>'></td>
                
                <td align="center" rowspan="3" valign="middle" style="padding-left: 10px;">
                    <button type="button" name="btnsearch" id="btnsearch" class="myButton" onclick="loadSearch(); return false;">
                        Search
                    </button>
                </td>
            </tr>
            
            <tr>
                <td class="lbl-right">Date</td>
                <td>
                    <div id="securitychequedate" name="securitychequedate"></div>
                    <input type="hidden" name="hidsecuritychequedate" id="hidsecuritychequedate" value='<s:property value="hidsecuritychequedate"/>'>
                </td>
                
                <td class="lbl-right">Amount</td>
                <td><input type="text" name="txtamounts" id="txtamounts" value='<s:property value="txtamounts"/>'></td>
            </tr>

            <tr>
                <td class="lbl-right">Cheque No</td>
                <td><input type="text" id="txtchqno" name="txtchqno" value='<s:property value="txtchqno"/>'></td>
                
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
            <jsp:include page="secMainSearchGrid.jsp"></jsp:include>
        </div>
    </div>
</div>
</body>
</html>