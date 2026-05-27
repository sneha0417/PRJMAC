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

<script type="text/javascript">
	$(document).ready(function () {
		$("#txtaccperiod").jqxDateTimeInput({ width: '125px', height: '15px', formatString:"dd.MM.yyyy"});
		document.getElementById("txtatypes").value=document.getElementById("cmbacctype").value;
		
		 var year = window.parent.txtaccountperiodfrom.value;
		 var newDate = year.split('-');
		 year = newDate[1] + "-" + newDate[0] + "-" + newDate[2];
		 $('#txtaccperiod ').jqxDateTimeInput('setDate', new Date(year));
	}); 
	
	function loadClientAccountSearch() {
			var clientaccountno=document.getElementById("accountsno").value;
			var clientaccountname=document.getElementById("accountsname").value;
			var clientmobile=document.getElementById("clientmobileno").value;
			var curr=document.getElementById("txtcurrencies").value;
			var accounttype=document.getElementById("txtatypes").value;
			var date = document.getElementById("txtaccperiod").value;
			var checked = 1;
	
			getClientAccountDetails(clientaccountno,clientaccountname,clientmobile,curr,accounttype,date,checked);
	}
		
	function getClientAccountDetails(clientaccountno,clientaccountname,clientmobile,curr,accounttype,date,checked){
		 $("#refreshClientAccountDiv").load("clientAccountDetailsSearchGrid.jsp?accountno="+clientaccountno+'&accountname='+clientaccountname.replace(/ /g, "%20")+'&mobile='+clientmobile+'&currency='+curr+'&atype='+accounttype+'&date='+date+'&check='+checked);
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
                <col width="12%">
                <col width="25%">
                <col width="10%">
                <col width="15%">
                <col width="10%">
                <col width="18%">
                <col width="10%">
            </colgroup>

            <!-- ROW 1 -->
            <tr>

                <td class="lbl-right">Account No</td>

                <td>
                    <input type="text"
                           name="accountsno"
                           id="accountsno"
                           value='<s:property value="accountsno"/>'>
                </td>

                <td class="lbl-right">Currency</td>

                <td>
                    <input type="text"
                           name="txtcurrencies"
                           id="txtcurrencies"
                           value='<s:property value="txtcurrencies"/>'>

                    <input type="hidden"
                           name="txtatypes"
                           id="txtatypes"
                           value='<s:property value="txtatypes"/>'>

                    <div hidden="true"
                         id="txtaccperiod"
                         name="txtaccperiod"
                         value='<s:property value="txtaccperiod"/>'>
                    </div>
                </td>

                <td class="lbl-right">Mobile</td>

                <td>
                    <input type="text"
                           name="clientmobileno"
                           id="clientmobileno"
                           value='<s:property value="clientmobileno"/>'>
                </td>

                <td></td>

            </tr>

            <!-- ROW 2 -->
            <tr>

                <td class="lbl-right">Account Name</td>

                <td colspan="3">
                    <input type="text"
                           name="accountsname"
                           id="accountsname"
                           value='<s:property value="accountsname"/>'>
                </td>

                <td colspan="3" align="left">
                    <button type="button"
                            name="btnClientAccountSearch"
                            id="btnClientAccountSearch"
                            class="myButton"
                            onclick="loadClientAccountSearch(); return false;">
                        Search
                    </button>
                </td>

            </tr>

        </table>

    </div>

    <!-- GRID -->
    <div class="grid-container">

        <div id="refreshClientAccountDiv">
            <jsp:include page="clientAccountDetailsSearchGrid.jsp"></jsp:include>
        </div>

    </div>

</div>

</body>
</html>