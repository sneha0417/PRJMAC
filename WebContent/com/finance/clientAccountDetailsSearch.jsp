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
   SCOPED UI: Pure White Panel (BRV Standard)
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
    width: 100%; /* Spans the button nicely across its column */
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

<script type="text/javascript">
    $(document).ready(function () {
        if(document.getElementById("txtforsearch").value == "2"){
            document.getElementById("txtatypes").value = document.getElementById("cmbtype").value;
        }
        else if(document.getElementById("txtforsearch").value == "3"){
            document.getElementById("txtatypes").value = document.getElementById("cmbacctype").value;
        } else {
            document.getElementById("txtatypes").value = document.getElementById("cmbtotype").value;
        }
        
        document.getElementById("txtdocumenttypes").value = document.getElementById("formdetailcode").value;
        document.getElementById("txtcreditdebit").value = document.getElementById("txtforsearch").value;
        document.getElementById("txtnewdate").value = $('#maindate').val();
    }); 
    
    function loadClientAccountSearch() {
        var clientaccountno = document.getElementById("accountsno").value;
        var clientaccountname = document.getElementById("accountsname").value;
        var clientmobile = document.getElementById("clientmobileno").value;
        var curr = document.getElementById("txtcurrencies").value;
        var accounttype = document.getElementById("txtatypes").value;
        var code = document.getElementById("txtdocumenttypes").value;
        var debitcredit = document.getElementById("txtcreditdebit").value;
        var date = document.getElementById("txtnewdate").value;
        var checked = 1;

        getClientAccountDetails(clientaccountno, clientaccountname, clientmobile, curr, accounttype, code, debitcredit, date, checked);
    }
        
    function getClientAccountDetails(clientaccountno, clientaccountname, clientmobile, curr, accounttype, code, debitcredit, date, checked){
         $("#refreshClientAccountDiv").load("../../clientAccountDetailsSearchGrid.jsp?accountno=" + clientaccountno + 
                                            "&accountname=" + clientaccountname.replace(/ /g, "%20") + 
                                            "&mobile=" + clientmobile + 
                                            "&currency=" + curr + 
                                            "&atype=" + accounttype + 
                                            "&dtype=" + code + 
                                            "&debitcredit=" + debitcredit + 
                                            "&date=" + date + 
                                            "&check=" + checked);
    }
</script>
</head>

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
                <td class="lbl-right">Account No</td>
                <td>
                    <input type="text" name="accountsno" id="accountsno" value='<s:property value="accountsno"/>'>
                </td>
                
                <td class="lbl-right">Currency</td>
                <td>
                    <input type="text" name="txtcurrencies" id="txtcurrencies" value='<s:property value="txtcurrencies"/>'>
                    <input type="hidden" name="txtatypes" id="txtatypes" value='<s:property value="txtatypes"/>'>
                    <input type="hidden" name="txtdocumenttypes" id="txtdocumenttypes" value='<s:property value="txtdocumenttypes"/>'>
                </td>
                
                <td align="center" rowspan="2" valign="middle" style="padding-left: 10px;">
                    <button type="button" name="btnClientAccountSearch" id="btnClientAccountSearch" class="myButton" onclick="loadClientAccountSearch(); return false;">
                        Search
                    </button>
                </td>
            </tr>
            
            <tr>
                <td class="lbl-right">Account Name</td>
                <td>
                    <input type="text" name="accountsname" id="accountsname" value='<s:property value="accountsname"/>'>
                </td>
                
                <td class="lbl-right">Mobile</td>
                <td>
                    <input type="text" name="clientmobileno" id="clientmobileno" value='<s:property value="clientmobileno"/>'>
                    <input type="hidden" name="txtcreditdebit" id="txtcreditdebit" value='<s:property value="txtcreditdebit"/>'>
                    <input type="hidden" name="txtnewdate" id="txtnewdate" value='<s:property value="txtnewdate"/>'>
                </td>
            </tr>

        </table>
    </div>

    <div class="grid-container">
        <div id="refreshClientAccountDiv">
            <jsp:include page="clientAccountDetailsSearchGrid.jsp"></jsp:include>
        </div>
    </div>

</div>

</body>
</html>