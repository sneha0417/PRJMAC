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
	  $("#invdate").jqxDateTimeInput({ width: '125px', height: '15px',formatString:"dd.MM.yyyy",value:null}); 
	}); 

 	function invloadSearch1() {
 		
 		var invdate=document.getElementById("invdate").value;
 		 var Cl_namess=document.getElementById("Cl_names").value;
 		var contno=document.getElementById("contno").value;
 		var invtype=document.getElementById("invtype").value;
 		var msdocno=document.getElementById("msdocno").value; 
 		var Cl_names = Cl_namess.replace(' ', '%20');
 		
	getdata1(Cl_names,msdocno,contno,invdate,invtype);

	}
 	
	function getdata1(Cl_names,msdocno,contno,invdate,invtype){
		
		 $("#refreshdivmas").load('subMastersearch.jsp?Cl_names='+Cl_names+'&msdocno='+msdocno+'&contno='+contno+'&invdate='+invdate+'&invtype='+invtype);
		
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

/* Force jqx popup background white */

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

/* Layout */

.search-panel table{
    width:100%;
    border-collapse:collapse;
}

.search-panel td{
    padding:6px;
    vertical-align:middle;
}

/* Labels */

.lbl-right{
    text-align:right;
    white-space:nowrap;
    font-size:12px;
    font-weight:500;
    color:#333;
    padding-right:8px;
}

/* Inputs */

.search-panel input[type="text"],
.search-panel select{
    width:100%;
    height:28px;
    border:1px solid #cfcfcf;
    border-radius:3px;
    padding:2px 8px;
    box-sizing:border-box;
    background:#ffffff;
    font-size:12px;
}

.search-panel input[type="text"]:focus,
.search-panel select:focus{
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
                <col width="12%">
                <col width="8%">
                <col width="28%">
                <col width="12%">
                <col width="18%">
                <col width="14%">
            </colgroup>

            <!-- Row 1 -->

            <tr>

                <td class="lbl-right">
                    Doc No
                </td>

                <td>
                    <input type="text"
                           name="msdocno"
                           id="msdocno"
                           value='<s:property value="msdocno"/>'>
                </td>

                <td class="lbl-right">
                    Client
                </td>

                <td>
                    <input type="text"
                           name="Cl_names"
                           id="Cl_names"
                           value='<s:property value="Cl_names"/>'>
                </td>

                <td class="lbl-right">
                    Contract Type
                </td>

                <td>
                    <select name="invtype"
                            id="invtype">
                        <option value="">----select----</option>
                        <option value="AMC">AMC</option>
                        <option value="SJOB">SJOB</option>
                    </select>
                </td>

                <td></td>

            </tr>

            <!-- Row 2 -->

            <tr>

                <td class="lbl-right">
                    Date
                </td>

                <td>
                    <div id="invdate"
                         name="invdate"
                         value='<s:property value="invdate"/>'>
                    </div>
                </td>

                <td class="lbl-right">
                    Invoice No
                </td>

                <td>
                    <input type="text"
                           name="contno"
                           id="contno"
                           value='<s:property value="contno"/>'>
                </td>

                <td colspan="2"></td>

                <td align="center">

                    <button type="button"
                            id="invbtnrasearch"
                            onclick="invloadSearch1();"
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

        <div id="refreshdivmas">

            <jsp:include page="subMastersearch.jsp"></jsp:include>

        </div>

    </div>

</div>

</body>
</html>