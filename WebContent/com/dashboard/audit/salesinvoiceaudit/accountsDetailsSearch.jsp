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
	
	
	function loadAccountSearch() {
		var masterdate="";
		

			var accountsno=document.getElementById("txtaccountsno").value;
			var accountsname=document.getElementById("txtaccountsname").value;
			var mob=document.getElementById("mob").value;
		
			var check = 1;
	
			getAccountDetails(accountsno,accountsname,mob,check,masterdate);
	}
		
	function getAccountDetails(accountsno,accountsname,mob,check,masterdate){

		 $("#refreshAccountDetailsDiv").load("accountsDetailsFromGrid.jsp?accountno="+accountsno+'&accountname='+accountsname.replace(/ /g, "%20")+'&mob='+mob+'&check='+check+'&masterdate='+masterdate);
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

#search,
.modern-ui{
    background:#ffffff !important;
    padding:10px;
    font-size:12px;
    color:#333;
}

/* Search Panel */

.modern-ui .search-panel{
    background:#ffffff !important;
    border:1px solid #d6d6d6;
    border-radius:4px;
    padding:12px;
    margin-bottom:12px;
}

/* Layout */

.modern-ui table{
    width:100%;
    border-collapse:collapse;
}

.modern-ui td{
    padding:6px;
    vertical-align:middle;
}

/* Labels */

.modern-ui .lbl-right{
    text-align:right;
    white-space:nowrap;
    font-size:12px;
    font-weight:500;
    padding-right:8px;
    color:#333;
}

/* Inputs */

.modern-ui input[type=text]{
    width:100%;
    height:26px !important;
    border:1px solid #cfcfcf;
    border-radius:3px;
    padding:2px 6px;
    font-size:12px;
    box-sizing:border-box;
    background:#fff;
}

.modern-ui input[type=text]:focus{
    border-color:#2563eb;
    outline:none;
}

/* Search Button */

.modern-ui .search-btn{
    width:110px;
    height:30px;
    background:#205fd3 !important;
    background-image:none !important;
    color:#ffffff !important;
    border:none !important;
    border-radius:4px;
    font-size:12px;
    font-weight:600;
    cursor:pointer;
}

.modern-ui .search-btn:hover{
    background:#184fb4 !important;
}

/* Grid */

.modern-ui .grid-container{
    background:#ffffff !important;
    border:1px solid #cccccc;
    border-radius:4px;
    overflow:hidden;
    min-height:250px;
}
</style>

<body>

<div id="search" class="modern-ui">

    <!-- Search Panel -->

    <div class="search-panel">

        <table>

            <colgroup>
                <col width="12%">
                <col width="28%">
                <col width="12%">
                <col width="28%">
                <col width="20%">
            </colgroup>

            <!-- Row 1 -->

            <tr>

                <td class="lbl-right">
                    Account No
                </td>

                <td>
                    <input type="text"
                           name="txtaccountsno"
                           id="txtaccountsno"
                           value='<s:property value="txtaccountsno"/>'>
                </td>

                <td class="lbl-right">
                    Mobile
                </td>

                <td>
                    <input type="text"
                           name="mob"
                           id="mob"
                           value='<s:property value="mob"/>'>

                    <input type="hidden"
                           name="txtsearchtype"
                           id="txtsearchtype"
                           value='<s:property value="txtsearchtype"/>'>
                </td>

                <td align="left">
                    <input type="button"
                           name="btnAccountSearch"
                           id="btnAccountSearch"
                           value="Search"
                           class="search-btn"
                           onclick="loadAccountSearch();">
                </td>

            </tr>

            <!-- Row 2 -->

            <tr>

                <td class="lbl-right">
                    Account Name
                </td>

                <td colspan="3">
                    <input type="text"
                           name="txtaccountsname"
                           id="txtaccountsname"
                           value='<s:property value="txtaccountsname"/>'>
                </td>

                <td></td>

            </tr>

        </table>

    </div>

    <!-- Grid -->

    <div class="grid-container">

        <div id="refreshAccountDetailsDiv">

            <jsp:include page="accountsDetailsFromGrid.jsp"></jsp:include>

        </div>

    </div>

</div>

</body>
</html>