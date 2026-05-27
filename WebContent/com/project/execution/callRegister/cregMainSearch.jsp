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
.modern-ui, .modern-ui table, .modern-ui td, .modern-ui input, .modern-ui select {
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
    color: #ffffff !important;
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
    $("#cregdate").jqxDateTimeInput({ width: '100%', height: '24px', formatString: "dd.MM.yyyy", value: null, theme: 'light' });

    /* Force internal alignment for JQX widgets to prevent layout breaks */
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
    var clientsname = document.getElementById("txtclientsname").value || "";
    var docNo = document.getElementById("txtdocno").value || "";
    var date = $('#cregdate').jqxDateTimeInput('val') || "";
    var contractstype = document.getElementById("cmbcontractstype").value || "";
    var contractsno = document.getElementById("txtcontractsno").value || "";
    
    getdata(clientsname, docNo, date, contractstype, contractsno);
}

function getdata(clientsname, docNo, date, contractstype, contractsno){
    /* Securely encode variables for the URL */
    $("#refreshdiv").load('cregMainSearchGrid.jsp?clientsname=' + encodeURIComponent(clientsname) + 
                          '&docNo=' + encodeURIComponent(docNo) + 
                          '&date=' + encodeURIComponent(date) + 
                          '&contractstype=' + encodeURIComponent(contractstype) + 
                          '&contractsno=' + encodeURIComponent(contractsno));
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
                    <div id="cregdate" name="cregdate"></div>
                    <input type="hidden" name="hidcregdate" value='<s:property value="cregdate"/>'>
                </td>
                
                <td class="lbl-right">Doc No</td>
                <td><input type="text" name="txtdocno" id="txtdocno" value='<s:property value="txtdocno"/>'></td>
                
                <td align="center" rowspan="3" valign="middle" style="padding-left: 10px;">
                    <input type="button" name="btnsearch" id="btnsearch" class="myButton" value="Search" onclick="loadSearch(); return false;">
                </td>
            </tr>
            
            <tr>
                <td class="lbl-right">Client</td>
                <td><input type="text" name="txtclientsname" id="txtclientsname" value='<s:property value="txtclientsname"/>'></td>
                
                <td class="lbl-right">Cont. Type</td>
                <td>
                    <select id="cmbcontractstype" name="cmbcontractstype">
                        <option value=''>-- Select --</option>
                        <option value='AMC' <s:if test="cmbcontractstype == 'AMC'">selected="selected"</s:if>>AMC</option>
                        <option value='SJOB' <s:if test="cmbcontractstype == 'SJOB'">selected="selected"</s:if>>SJOB</option>
                    </select>
                </td>
            </tr>
            
            <tr>
                <td class="lbl-right">Contract</td>
                <td><input type="text" id="txtcontractsno" name="txtcontractsno" value='<s:property value="txtcontractsno"/>'></td>
                
                <td class="lbl-right"></td>
                <td></td>
            </tr>
        </table>
    </div>

    <div class="grid-container">
        <div id="refreshdiv">
            <jsp:include page="cregMainSearchGrid.jsp"></jsp:include>
        </div>
    </div>
    
</div>
</body>
</html>