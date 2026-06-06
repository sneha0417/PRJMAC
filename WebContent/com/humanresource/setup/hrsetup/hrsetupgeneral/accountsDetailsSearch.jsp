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
		 
		

			var accountsno=document.getElementById("txtaccountsno").value;
			var accountsname=document.getElementById("txtaccountsname").value;
		 
		    var rowindex=document.getElementById("rowindex").value;
			var check = 1;
	
			getAccountDetails(accountsno,accountsname,check,rowindex);
	}
		
	function getAccountDetails(accountsno,accountsname,check,rowindex){

		 $("#refreshAccountDetailsDiv").load("accountsDetailsFromGrid.jsp?accountno="+accountsno+'&accountname='+accountsname.replace(/ /g, "%20")+'&check='+check+'&rowindex='+rowindex);
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

#search{
    background:#ffffff !important;
    padding:10px;
}

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
                <col width="12%">
                <col width="25%">
                <col width="12%">
                <col width="35%">
                <col width="16%">
            </colgroup>

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
                    Account Name
                </td>

                <td>
                    <input type="text"
                           name="txtaccountsname"
                           id="txtaccountsname"
                           value='<s:property value="txtaccountsname"/>'>
                </td>

                <td align="center">

                    <button type="button"
                            id="btnAccountSearch"
                            onclick="loadAccountSearch();"
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

        <div id="refreshAccountDetailsDiv">

            <jsp:include page="accountsDetailsFromGrid.jsp"></jsp:include>

        </div>

    </div>

</div>

</body>
</html>