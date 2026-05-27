 <%@ taglib prefix="s" uri="/struts-tags" %>
 <% String contextPath=request.getContextPath();%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link href="<%=contextPath%>/css/body.css" media="screen" rel="stylesheet" type="text/css" />
<title>GatewayERP(i)</title>

	<script type="text/javascript">
	$(document).ready(function () {
	 	$("#tebdate").jqxDateTimeInput({ width: '110px', height: '15px',formatString:"dd.MM.yyyy",value:null});
	}); 

 	function loadSearch() {

 		var partyname=document.getElementById("txtpartyname").value;
 		var docNo=document.getElementById("txtdocno").value;
 		var date=document.getElementById("tebdate").value;
 		var tbamount=document.getElementById("txttbamount").value;
 		var lsamount=document.getElementById("txtlsamount").value;
 		var travelamount=document.getElementById("txttravelamount").value;
 		var branch=document.getElementById("brchName").value;
	
		getdata(partyname,docNo,date,tbamount,lsamount,travelamount,branch);
	}
	function getdata(partyname,docNo,date,tbamount,lsamount,travelamount,branch){
		 $("#refreshdiv").load('tebMainSearchGrid.jsp?partyname='+partyname.replace(/ /g, "%20")+'&docNo='+docNo+'&date='+date+'&tbamount='+tbamount+'&lsamount='+lsamount+'&travelamount='+travelamount+'&branch='+branch);
		}

	</script>
<style>
/* =========================================================
   MASTER SEARCH UI
========================================================= */
body, html {
    margin: 0;
    padding: 0;
    background: #ffffff !important;
    font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
}

.modern-ui {
    font-size: 12px;
    color: #333;
    padding: 10px;
    box-sizing: border-box;
    width: 100%;
    background: #ffffff !important;
}

/* Search Panel */
.modern-ui .search-panel {
    background: #ffffff;
    border: 1px solid #cccccc;
    border-radius: 4px;
    padding: 18px 15px 12px;
    margin-bottom: 15px;
    box-sizing: border-box;
}

/* Structured Grid */
.modern-ui table {
    width: 100%;
    border-collapse: separate;
    border-spacing: 10px 12px;
    table-layout: fixed;
}

.modern-ui td {
    vertical-align: middle;
}

/* Labels */
.modern-ui .lbl-right {
    text-align: right;
    font-size: 12px;
    font-weight: 500;
    color: #333;
    white-space: nowrap;
    padding-right: 6px;
}

/* Inputs */
.modern-ui input[type="text"],
.modern-ui select {
    width: 100%;
    height: 28px !important;
    border: 1px solid #cfcfcf;
    border-radius: 3px;
    padding: 2px 8px;
    font-size: 12px;
    font-family: inherit;
    background: #ffffff;
    color: #333;
    box-sizing: border-box;
}

.modern-ui input[type="text"]:focus,
.modern-ui select:focus {
    border-color: #2563eb;
    outline: none;
}

/* Search Button */
.modern-ui .myButton {
    height: 30px;
    min-width: 110px;
    padding: 0 22px;
    background: #205fd3;
    border: none;
    border-radius: 4px;
    color: #ffffff;
    font-size: 12px;
    font-weight: 600;
    cursor: pointer;
    transition: background 0.2s;
}

.modern-ui .myButton:hover {
    background: #1b4fb3;
}

/* Grid Container */
.modern-ui .grid-container {
    background: #ffffff;
    border: 1px solid #cccccc;
    border-radius: 4px;
    overflow: hidden;
    min-height: 250px;
}
</style>

<body style="background:#ffffff;">

<div id="search" class="modern-ui">

    <!-- SEARCH PANEL -->
    <div class="search-panel">

        <table border="0" cellspacing="0" cellpadding="0">

            <colgroup>
                <col width="10%">
                <col width="22%">
                <col width="10%">
                <col width="22%">
                <col width="10%">
                <col width="14%">
                <col width="12%">
            </colgroup>

            <!-- ROW 1 -->
            <tr>

                <td class="lbl-right">Date</td>

                <td>
                    <div id="tebdate"
                         name="tebdate"
                         value='<s:property value="tebdate"/>'>
                    </div>

                    <input type="hidden"
                           name="hidtebdate"
                           id="hidtebdate"
                           value='<s:property value="hidtebdate"/>'>
                </td>

                <td class="lbl-right">Name</td>

                <td>
                    <input type="text"
                           name="txtpartyname"
                           id="txtpartyname"
                           value='<s:property value="txtpartyname"/>'>
                </td>

                <td class="lbl-right">Doc No</td>

                <td>
                    <input type="text"
                           name="txtdocno"
                           id="txtdocno"
                           value='<s:property value="txtdocno"/>'>
                </td>

                <td align="left">
                    <button type="button"
                            name="btnsearch"
                            id="btnsearch"
                            class="myButton"
                            onclick="loadSearch(); return false;">
                        Search
                    </button>
                </td>

            </tr>

            <!-- ROW 2 -->
            <tr>

                <td class="lbl-right">Terminal Benefit</td>

                <td>
                    <input type="text"
                           name="txtamount"
                           id="txttbamount"
                           value='<s:property value="txtamount"/>'>
                </td>

                <td class="lbl-right">Leave Salary</td>

                <td>
                    <input type="text"
                           name="txtamount"
                           id="txtlsamount"
                           value='<s:property value="txtamount"/>'>
                </td>

                <td class="lbl-right">Travel</td>

                <td>
                    <input type="text"
                           name="txttravelamount"
                           id="txttravelamount"
                           value='<s:property value="txttravelamount"/>'>
                </td>

                <td></td>

            </tr>

        </table>

    </div>

    <!-- GRID -->
    <div class="grid-container">

        <div id="refreshdiv">
            <jsp:include page="tebMainSearchGrid.jsp"></jsp:include>
        </div>

    </div>

</div>

</body>
</html>