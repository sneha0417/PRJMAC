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

<style>
body,
html {
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

.modern-ui,
.modern-ui table,
.modern-ui td,
.modern-ui input {
    font-weight: 400 !important;
}

.modern-ui input[type="text"] {
    width: 100%;
    height: 24px !important;
    border: 1px solid #cccccc;
    border-radius: 3px;
    padding: 2px 6px;
    font-size: 12px;
    box-sizing: border-box;
    background: #ffffff;
    color: #333;
}

.modern-ui input[type="text"]:focus {
    border-color: #2563eb;
    outline: none;
}

.search-panel {
    background: #ffffff;
    border: 1px solid #cccccc;
    border-radius: 4px;
    padding: 15px 10px;
    margin-bottom: 15px;
    width: 100%;
    box-sizing: border-box;
}

.modern-ui table {
    width: 100%;
    border-collapse: separate;
    border-spacing: 5px 8px;
    table-layout: fixed;
}

.modern-ui td {
    vertical-align: middle;
}

.lbl-right {
    text-align: right;
    color: #333;
    font-size: 12px;
    font-weight: 600 !important;
    white-space: nowrap;
    padding-right: 6px;
}

div#search.modern-ui input#btnsearch.myButton {
    width: 100%;
    height: 24px !important;
    background-color: #205fd3 !important;
    color: #ffffff !important;
    border: none !important;
    border-radius: 4px !important;
    cursor: pointer;
    font-size: 12px !important;
    font-weight: 600 !important;
    transition: background-color .2s ease;
}

div#search.modern-ui input#btnsearch.myButton:hover {
    background-color: #124096 !important;
}

.grid-container {
    background: #ffffff;
    border: 1px solid #cccccc;
    border-radius: 4px;
    overflow: hidden;
    width: 100%;
    min-height: 200px;
}
</style>
 <%

 String contracttype = request.getParameter("contracttype")==null?"0":request.getParameter("contracttype");
 String cldocno = request.getParameter("cldocno")==null?"0":request.getParameter("cldocno"); 

 
 %>
<script type="text/javascript">
	$(document).ready(function () {}); 

 	function loadContractSearch() {
 		 
 		var contractType=document.getElementById("ctype").value;
 		var cldocno=1;
 		var contractno=document.getElementById("txtcontractsno").value;
 		var refno=1;
 
 		//alert(contractType);
		getdata(contractType,cldocno,contractno,refno);
	}
 	
	function getdata(contractType,cldocno,contractno,refno){
		 $("#refreshcontractdiv").load('contractDetailsSearchGrid.jsp?contracttype='+contractType+'&cldocno='+cldocno+'&contractno='+contractno.replace(/ /g, "%20")+'&refno='+refno);
	}

	</script>
<body>
<div id="search" class="modern-ui">

    <div class="search-panel">
        <table width="100%" border="0" cellspacing="0" cellpadding="0">
            <colgroup>
                <col width="15%" />
                <col width="65%" />
                <col width="20%" />
            </colgroup>

            <tr>
                <td class="lbl-right">Contract No.</td>
                <td>
                    <input type="text"
                           name="txtcontractsno"
                           id="txtcontractsno"
                           value='<s:property value="txtcontractsno"/>'>
                </td>

                <td align="center" valign="middle">
                    <input type="button"
                           name="btnsearch"
                           id="btnsearch"
                           class="myButton"
                           value="Search"
                           onclick="loadContractSearch();">
                </td>
            </tr>
        </table>
    </div>

    <div class="grid-container">
        <div id="refreshcontractdiv">
            <jsp:include page="contractDetailsSearchGrid.jsp"></jsp:include>
        </div>
    </div>

</div>
</body>
</html>