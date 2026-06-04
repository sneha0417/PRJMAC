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

<style type="text/css">
#search {
    background-color: #E0ECF8;
}
</style>

	<script type="text/javascript">
	$(document).ready(function () {
 		document.getElementById("txtatype").value=$('#cmbtype').val();
 		if(($('#cmbtype').val()=='GL') || ($('#cmbtype').val()=='HR')){
 			$('#txtcontactno').attr('readonly', true );
 		}
	}); 

 	function loadSearch() {

 		var partyname=document.getElementById("txtpartyname").value;
 		var accNo=document.getElementById("txtaccountno").value;
 		var contactNo=document.getElementById("txtcontactno").value;
 		var atype=document.getElementById("txtatype").value;
 		var chk = 1;
 		
		getdata(atype,partyname,accNo,contactNo,chk);
	}
	function getdata(atype,partyname,accNo,contactNo,chk){
		 $("#refreshdiv").load('accountsDetailsGrid.jsp?atype='+atype+'&partyname='+partyname+'&accNo='+accNo+'&contactNo='+contactNo+'&chk='+chk);
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

/* Table Layout */

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
    height:28px !important;
    border:1px solid #cfcfcf;
    border-radius:3px;
    padding:2px 8px;
    box-sizing:border-box;
    background:#fff;
    font-size:12px;
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
/* Search Button - FIXED */

.modern-ui .myButton,
.myButton{
    width:110px !important;
    height:30px !important;

    background:#205fd3 !important;
    background-image:none !important;

    color:#ffffff !important;
    font-size:12px !important;
    font-weight:600 !important;
    font-family:'Segoe UI',Tahoma,Verdana,sans-serif !important;

    border:1px solid #205fd3 !important;
    border-radius:4px !important;

    text-shadow:none !important;
    box-shadow:none !important;
    opacity:1 !important;

    cursor:pointer;
}

.modern-ui .myButton:hover,
.myButton:hover{
    background:#184fb4 !important;
    background-image:none !important;
    color:#ffffff !important;
}
</style>

<body>

<div id="search" class="modern-ui">

    <!-- Search Panel -->

    <div class="search-panel">

        <table>

            <colgroup>
                <col width="8%">
                <col width="28%">
                <col width="8%">
                <col width="22%">
                <col width="10%">
                <col width="18%">
                <col width="6%">
            </colgroup>

            <tr>

                <td class="lbl-right">
                    Name
                </td>

                <td>
                    <input type="text"
                           name="txtpartyname"
                           id="txtpartyname"
                           value='<s:property value="txtpartyname"/>'>
                </td>

                <td class="lbl-right">
                    Account
                </td>

                <td>
                    <input type="text"
                           name="txtaccountno"
                           id="txtaccountno"
                           value='<s:property value="txtaccountno"/>'>
                </td>

                <td class="lbl-right">
                    Contact No.
                </td>

                <td>
                    <input type="text"
                           name="txtcontactno"
                           id="txtcontactno"
                           value='<s:property value="txtcontactno"/>'>

                    <input type="hidden"
                           name="txtatype"
                           id="txtatype"
                           value='<s:property value="txtatype"/>'>
                </td>

                <td align="right">

                    <input type="button"
                           name="btnsearch"
                           id="btnsearch"
                           value="Search"
                           class="search-btn"
                           onclick="loadSearch();">

                </td>

            </tr>

        </table>

    </div>

    <!-- Grid -->

    <div class="grid-container">

        <div id="refreshdiv">

            <jsp:include page="accountsDetailsGrid.jsp"></jsp:include>

        </div>

    </div>

</div>

</body>
</html>