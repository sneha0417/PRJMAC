 <%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html>
<html>
<head>
 
<% String contextPath=request.getContextPath();%>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>GatewayERP(i)</title>
   <%--  <jsp:include page="../../../../includes.jsp"></jsp:include>    --%> 
<style>
<link href="<%=contextPath%>/css/body.css" media="screen" rel="stylesheet" type="text/css" />
</style>
	<script type="text/javascript">
	$(document).ready(function () {
 
	}); 

 	function loadSearch1() {
 		//alert("");
 		var clnames=document.getElementById("Cl_name1").value;
 		var mob=document.getElementById("Cl_mob1").value;
 		var clname = clnames.replace(' ', '%20');
	 
		getdata(clname,mob);
 

	}
	function getdata(clname,mob){
		
		 $("#subDiv").load('shipsubmastersearch.jsp?clname='+clname+'&mob='+mob);

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
                <col width="8%">
                <col width="45%">
                <col width="8%">
                <col width="22%">
                <col width="17%">
            </colgroup>

            <tr>

                <td class="lbl-right">
                    Name
                </td>

                <td>
                    <input type="text"
                           name="Cl_name1"
                           id="Cl_name1"
                           value='<s:property value="Cl_name1"/>'>
                </td>

                <td class="lbl-right">
                    MOB
                </td>

                <td>
                    <input type="text"
                           name="Cl_mob1"
                           id="Cl_mob1"
                           value='<s:property value="Cl_mob1"/>'>
                </td>

                <td align="center">

                    <button type="button"
                            id="btnrasearch1"
                            onclick="loadSearch1();"
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

        <div id="subDiv">

            <jsp:include page="shipsubmastersearch.jsp"></jsp:include>

        </div>

    </div>

</div>

</body>
</html>