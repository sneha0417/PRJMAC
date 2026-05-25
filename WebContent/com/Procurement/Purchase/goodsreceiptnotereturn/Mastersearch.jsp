 <%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html>
<html>
<head>
 
<% String contextPath=request.getContextPath();%>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>GatewayERP(i)</title>
<%--   <jsp:include page="../../../../includes.jsp"></jsp:include>   --%> 
<style>
<link href="<%=contextPath%>/css/body.css" media="screen" rel="stylesheet" type="text/css" />
</style>
	<script type="text/javascript">

	$(document).ready(function () { 
	    
		   /* Date */ 	
	    $("#datess").jqxDateTimeInput({  width: '125px', height: '15px', formatString:"dd.MM.yyyy",value:null}); 
		   
	});   
		   
 	function loadSearchs() {
 		
 		var docnoss=document.getElementById("docnoss").value;
 		var accountss=document.getElementById("accountss").value;
 		var accnamesss=document.getElementById("accnamess").value;
 		var datess=document.getElementById("datess").value;
 		var reftypess=document.getElementById("reftypess").value;
 		
 		var accnamess = accnamesss.replace(' ', '%20');

		
	var aa="yes";
		getdata(docnoss,accountss,accnamess,datess,reftypess,aa);
 

	}
	function getdata(docnoss,accountss,accnamess,datess,reftypess,aa){
		
		 $("#refreshdivs").load('submasterSearch.jsp?docnoss='+docnoss+'&accountss='+accountss+'&accnamess='+accnamess+'&datess='+datess+'&reftypess='+reftypess+'&aa='+aa);

		}

	</script>
<style>
/* =========================================================
   SCOPED UI: Pure White Panel (Matches Reference)
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
                <td class="lbl-right">Doc No</td>
                <td>
                    <input type="text" name="docnoss" id="docnoss" value='<s:property value="docnoss"/>'>
                </td>
                
                <td class="lbl-right">Account</td>
                <td>
                    <input type="text" name="accountss" id="accountss" value='<s:property value="accountss"/>'>
                </td>
                
                <td align="center" rowspan="2" valign="middle">
                    <button type="button" name="searchs" id="searchs" class="myButton" onclick="loadSearchs(); return false;">
                        Search
                    </button>
                </td>
            </tr>
            
            <tr>
                <td class="lbl-right">Date</td>
                <td>
                    <div id="datess" name="datess" value='<s:property value="datess"/>'></div>
                </td>
                
                <td class="lbl-right">Account Name</td>
                <td>
                    <input type="text" name="accnamess" id="accnamess" value='<s:property value="accnamess"/>'>
                </td>
            </tr>

        </table>
    </div>

    <div class="grid-container">
        <div id="refreshdivs">
            <jsp:include page="Subsearch.jsp"></jsp:include> 
        </div>
    </div>

</div>

</body>
</html>