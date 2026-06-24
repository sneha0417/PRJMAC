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
<% String dtype =request.getParameter("dtype")==null?"0":request.getParameter("dtype").toString().trim(); %>

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
========================================================= */
div#search.modern-ui input#btnjobsearch.myButton {
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
    width: 100% !important;
    box-sizing: border-box !important;
}

div#search.modern-ui input#btnjobsearch.myButton:hover {
    background-color: #124096 !important; 
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
		document.getElementById("txtdtype").value='<%=dtype%>';
	});   
		   
  	function loadJobSearch() {
 		
 		var docnoss=document.getElementById("docnoss").value;
 		var refnames=document.getElementById("refnames").value;
 		var dtype=document.getElementById("txtdtype").value;
 		var docno=document.getElementById("docnoss").value;
 		
		getdatas(docnoss,refnames,docno,dtype);
	}

  	function getdatas(docnoss,refnames,docno,dtype){
		 $("#jobSearchDiv").load('jobDetailsSearchGrid.jsp?docnoss='+docnoss+'&refnames='+refnames.replace(/ /g, "%20")+'&docno='+docno+'&dtype='+dtype+'&check=1');
	}  
</script>
</head>

<body>
<div id="search" class="modern-ui">

    <div class="search-panel">
        <table width="100%" border="0" cellspacing="0" cellpadding="0">
            <colgroup>
                <col width="10%" /> <col width="40%" /> 
                <col width="10%" /> <col width="25%" />
                <col width="15%" />
            </colgroup>
            
            <tr>
                <td class="lbl-right">Doc No</td>
                <td>
                    <input type="text" name="docnoss" id="docnoss" value='<s:property value="docnoss"/>'>
                    <input type="hidden" name="txtdtype" id="txtdtype" value='<s:property value="txtdtype"/>'>
                </td>
                
                <td class="lbl-right">Customer</td>
                <td>
                    <input type="text" name="refnames" id="refnames" value='<s:property value="refnames"/>'>
                </td>
                
                <td align="center" valign="middle" style="padding-left: 10px;">
                    <input type="button" name="btnjobsearch" id="btnjobsearch" class="myButton" value="Search" onclick="loadJobSearch();">
                </td>
            </tr>
        </table>
    </div>

    <div class="grid-container">
        <div id="jobSearchDiv">
            <jsp:include page="jobDetailsSearchGrid.jsp"></jsp:include>
        </div>
    </div>
    
</div>
</body>
</html>