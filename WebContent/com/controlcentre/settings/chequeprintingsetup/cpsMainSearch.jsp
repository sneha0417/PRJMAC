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
    padding: 10px;
    box-sizing: border-box;
    width: 100%;
    background-color: #ffffff !important;
    color: #333333 !important; /* Forced text color to guarantee visibility */
}

/* Strict weight enforcement for injected content */
.modern-ui, .modern-ui table, .modern-ui td, .modern-ui input, .modern-ui select {
    font-weight: 400 !important; 
    color: #333333 !important; /* Forces all table text to be visible dark grey */
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
    color: #333333 !important; /* Forces input text to be visible */
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

/* Table Alignment - Side-by-Side */
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
    font-weight: 600 !important;
    white-space: nowrap; 
    padding-right: 5px;
}

/* =========================================================
   BULLETPROOF BUTTON UI: Dark Blue + Hover
   Targeting ID #btnsearch directly to override body.css
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
    font-weight: 600 !important;
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
    /* Initialize JQX Date widget to match UI standards */
    $("#chqsetdate").jqxDateTimeInput({ width: '100%', height: '24px', formatString: "dd.MM.yyyy", value: null, theme: 'light' });

    /* Force internal alignment for JQX widgets to prevent layout breaks */
    setTimeout(function () {
        $(".jqx-datetimeinput").css({"margin-top": "0px", "border-color": "#cccccc", "border-radius": "3px", "background-color": "#ffffff"});
        $(".jqx-datetimeinput").find("input").css({
            "margin-top": "0px", "line-height": "24px", "font-size": "12px", 
            "font-family": "inherit", "padding": "0 6px", "box-sizing":"border-box", 
            "background-color": "#ffffff", "color": "#333333"
        });
        $(".jqx-datetimeinput").find(".jqx-action-button").css({"top": "0px", "height": "24px"});
    }, 50);
}); 

function loadSearch() {
    /* Safe fetch for JQX Date Value */
    var chqdate = $('#chqsetdate').jqxDateTimeInput('val') || "";
    var documentno = document.getElementById("txtdocno").value || "";
    var bankid = document.getElementById("txtbanksid").value || "";
    var bankname = document.getElementById("txtbanksname").value || "";

    getdata(chqdate, documentno, bankid, bankname);
}

function getdata(chqdate, documentno, bankid, bankname) {
    /* Securely encode variables for the URL */
    $("#refreshdiv").load('cpsMainSearchGrid.jsp?chqdate=' + encodeURIComponent(chqdate) + 
                          '&documentno=' + encodeURIComponent(documentno) + 
                          '&bankid=' + encodeURIComponent(bankid) + 
                          '&bankname=' + encodeURIComponent(bankname));
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
                <td class="lbl-right">Date</td>
                <td>
                    <div id="chqsetdate" name="chqsetdate"></div>
                    <input type="hidden" name="hidchqsetdate" id="hidchqsetdate" value='<s:property value="hidchqsetdate"/>'>
                </td>
                
                <td class="lbl-right">Doc No</td>
                <td><input type="text" name="txtdocno" id="txtdocno" value='<s:property value="txtdocno"/>'></td>
                
                <td align="center" rowspan="2" valign="middle" style="padding-left: 10px;">
                    <input type="button" name="btnsearch" id="btnsearch" class="myButton" value="Search" onclick="loadSearch(); return false;">
                </td>
            </tr>
            
            <tr>
                <td class="lbl-right">Bank Name</td>
                <td><input type="text" name="txtbanksname" id="txtbanksname" value='<s:property value="txtbanksname"/>'></td>
                
                <td class="lbl-right">Bank Id</td>
                <td><input type="text" name="txtbanksid" id="txtbanksid" value='<s:property value="txtbanksid"/>'></td>
            </tr>
        </table>
    </div>

    <div class="grid-container">
        <div id="refreshdiv">
            <jsp:include page="cpsMainSearchGrid.jsp"></jsp:include>
        </div>
    </div>
    
</div>
</body>
</html>