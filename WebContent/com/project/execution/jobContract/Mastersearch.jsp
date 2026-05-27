<%@ taglib prefix="s" uri="/struts-tags" %>
<% String contextPath=request.getContextPath();%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>GatewayERP(i)</title>
<%--   <jsp:include page="../../../../includes.jsp"></jsp:include>   --%> 
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
   Targeting ID #qotbtnrasearch directly to override body.css
========================================================= */
div#search.modern-ui input#qotbtnrasearch.myButton {
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
div#search.modern-ui input#qotbtnrasearch.myButton:hover {
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
    $("#surdate").jqxDateTimeInput({ width: '100%', height: '24px', formatString: "dd.MM.yyyy", value: null, theme: 'light' });

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

function qotloadSearch1() {
    var msdocno = document.getElementById("msdocno").value || "";
    var Cl_names = document.getElementById("Cl_names").value || "";
    var sereftype = document.getElementById("sereftype").value || "";
    
    /* Safe fetch for JQX Date Value */
    var surdate = $('#surdate').jqxDateTimeInput('val') || "";
    
    var cl_site = document.getElementById("cl_site").value || "";
    var cl_area = document.getElementById("cl_area").value || "";
    var Cl_amount = document.getElementById("Cl_amount").value || "";
    var srefno = document.getElementById("srefno").value || "";
    
    /* Safe fallback for missing formdetailcode HTML element */
    var dtypeElem = document.getElementById("formdetailcode");
    var dtype = dtypeElem ? dtypeElem.value : "";
    
    getdata1(Cl_names, msdocno, sereftype, surdate, dtype, cl_area, cl_site, Cl_amount, srefno);
}

function getdata1(Cl_names, msdocno, sereftype, surdate, dtype, cl_area, cl_site, Cl_amount, srefno) {
    var id = 1;
    /* Securely encode variables for the URL */
    $("#refreshdivmas").load('subMastersearch.jsp?Cl_names=' + encodeURIComponent(Cl_names) + 
                             '&msdocno=' + encodeURIComponent(msdocno) + 
                             '&sereftype=' + encodeURIComponent(sereftype) + 
                             '&surdate=' + encodeURIComponent(surdate) + 
                             '&dtype=' + encodeURIComponent(dtype) + 
                             '&id=' + id + 
                             '&cl_area=' + encodeURIComponent(cl_area) + 
                             '&cl_site=' + encodeURIComponent(cl_site) + 
                             '&Cl_amount=' + encodeURIComponent(Cl_amount) + 
                             '&srefno=' + encodeURIComponent(srefno));
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
                <td class="lbl-right">Docno</td>
                <td><input type="text" name="msdocno" id="msdocno" value='<s:property value="msdocno"/>'></td>
                
                <td class="lbl-right">Client</td>
                <td><input type="text" name="Cl_names" id="Cl_names" value='<s:property value="Cl_names"/>'></td>
                
                <td align="center" rowspan="4" valign="middle" style="padding-left: 10px;">
                    <input type="button" name="qotbtnrasearch" id="qotbtnrasearch" class="myButton" value="Search" onclick="qotloadSearch1(); return false;">
                </td>
            </tr>
            
            <tr>
                <td class="lbl-right">Ref. Type</td>
                <td>
                    <select id="sereftype" name="sereftype" onchange="refChange();">
                        <option value=""></option>
                        <option value="DIR" <s:if test="sereftype == 'DIR'">selected="selected"</s:if>>DIR</option>
                        <option value="SQOT" <s:if test="sereftype == 'SQOT'">selected="selected"</s:if>>SQOT</option>
                        <option value="ENQ" <s:if test="sereftype == 'ENQ'">selected="selected"</s:if>>ENQ</option>
                    </select>
                </td>
                
                <td class="lbl-right">Date</td>
                <td>
                    <div id="surdate" name="surdate"></div>
                    <input type="hidden" name="hidsurdate" id="hidsurdate" value='<s:property value="surdate"/>'>
                </td>
            </tr>
            
            <tr>
                <td class="lbl-right">Site</td>
                <td><input type="text" name="cl_site" id="cl_site" value='<s:property value="cl_site"/>'></td>
                
                <td class="lbl-right">Area</td>
                <td><input type="text" name="cl_area" id="cl_area" value='<s:property value="cl_area"/>'></td>
            </tr>
            
            <tr>
                <td class="lbl-right">Amount</td>
                <td><input type="text" name="Cl_amount" id="Cl_amount" value='<s:property value="Cl_amount"/>'></td>
                
                <td class="lbl-right">Ref. No</td>
                <td><input type="text" name="srefno" id="srefno" value='<s:property value="srefno"/>'></td>
            </tr>
        </table>
    </div>

    <div class="grid-container">
        <div id="refreshdivmas">
            <jsp:include page="subMastersearch.jsp"></jsp:include>
        </div>
    </div>
    
</div>
</body>
</html>