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
 		var accountss=document.getElementById("types").value;
 	 
 		var datess=document.getElementById("datess").value;
 		var prjdocnos=document.getElementById("prjdocnos").value;
 
 		
		
	var aa="yes";
		getdata(docnoss,accountss,datess,aa,prjdocnos);
 

	}
	function getdata(docnoss,accountss,datess,aa,prjdocnos){
		
		 $("#refreshdivs").load('Subsearch.jsp?docnoss='+docnoss+'&types='+accountss+'&datess='+datess+'&aa='+aa+"&prjdocnos="+prjdocnos);

		}

	</script>
<style>
/* =========================================================
   MASTER SEARCH UI - PURE WHITE PANEL
========================================================= */

body,
html{
    margin:0;
    padding:0;
    background:#ffffff !important;
    font-family:'Segoe UI',Tahoma,Verdana,sans-serif;
}

body[bgcolor]{
    background:#ffffff !important;
}

#search{
    background:#ffffff !important;
    padding:10px;
}

.jqx-widget-content,
.jqx-window-content,
.jqx-fill-state-normal{
    background:#ffffff !important;
}

/* Search Panel */

.search-panel{
    background:#ffffff !important;
    border:1px solid #d6d6d6;
    border-radius:4px;
    padding:12px;
    margin-bottom:12px;
}

.search-panel table{
    width:100%;
    border-collapse:collapse;
}

.search-panel td{
    padding:6px;
    vertical-align:middle;
}

.lbl-right{
    text-align:right;
    white-space:nowrap;
    font-size:12px;
    font-weight:500;
    color:#333;
    padding-right:8px;
}

.search-panel input[type="text"]{
    width:100%;
    height:28px;
    border:1px solid #cfcfcf;
    border-radius:3px;
    padding:2px 8px;
    box-sizing:border-box;
    background:#ffffff;
    font-size:12px;
}

.search-panel input[type="text"]:focus{
    border-color:#2563eb;
    outline:none;
}

/* Grid */

.grid-container{
    background:#ffffff !important;
    border:1px solid #cccccc;
    border-radius:4px;
    overflow:hidden;
}
</style>

<body>

<div id="search">

    <!-- Search Panel -->

    <div class="search-panel">

        <table>

            <colgroup>
                <col width="8%">
                <col width="16%">
                <col width="8%">
                <col width="20%">
                <col width="8%">
                <col width="20%">
                <col width="20%">
            </colgroup>

            <!-- Row 1 -->

            <tr>

                <td class="lbl-right">
                    Doc No
                </td>

                <td>
                    <input type="text"
                           name="docnoss"
                           id="docnoss"
                           value='<s:property value="docnoss"/>'>
                </td>

                <td class="lbl-right">
                    Type
                </td>

                <td>
                    <input type="text"
                           name="types"
                           id="types"
                           value='<s:property value="types"/>'>
                </td>

                <td class="lbl-right">
                    Job No
                </td>

                <td>
                    <input type="text"
                           name="prjdocnos"
                           id="prjdocnos"
                           value='<s:property value="prjdocnos"/>'>
                </td>

                <td></td>

            </tr>

            <!-- Row 2 -->

            <tr>

                <td class="lbl-right">
                    Date
                </td>

                <td>
                    <div id="datess"
                         name="datess"
                         value='<s:property value="datess"/>'>
                    </div>
                </td>

                <td colspan="4"></td>

                <td align="center">

                    <button type="button"
                            id="searchs"
                            onclick="loadSearchs();"
                            style="
                                width:110px;
                                height:30px;
                                background:#205fd3;
                                color:#ffffff;
                                border:1px solid #205fd3;
                                border-radius:4px;
                                font-size:12px;
                                font-weight:600;
                                cursor:pointer;">
                        Search
                    </button>

                </td>

            </tr>

        </table>

    </div>

    <!-- Grid -->

    <div class="grid-container">

        <div id="refreshdivs">

            <jsp:include page="Subsearch.jsp"></jsp:include>

        </div>

    </div>

</div>

</body>
</html>