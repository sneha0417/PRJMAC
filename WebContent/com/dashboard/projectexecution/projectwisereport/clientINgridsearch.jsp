 <%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html>
<html>
<head>
 
<% String contextPath=request.getContextPath();%>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>GatewayERP(i)</title>
     <%-- <jsp:include page="../../../../includes.jsp"></jsp:include>  --%>
<style>
<link href="<%=contextPath%>/css/body.css" media="screen" rel="stylesheet" type="text/css" />
</style>
	<script type="text/javascript">
	$(document).ready(function () {
	 /* $("#dr_DOB").jqxDateTimeInput({ width: '125px', height: '15px',formatString:"dd.MM.yyyy",value:null}); */
	}); 

 	function loadSearch() {
 		//alert("");
 		var clnames=document.getElementById("Cl_name").value;
 		var mob=document.getElementById("Cl_mob").value;
 		var clname = clnames.replace(' ', '%20');
		
	//alert(""+clname);
		getdata(clname,mob);
 

	}
	function getdata(clname,mob){
		
		var id=1;
		$("#refreshdiv1").load('searchClient.jsp?clname='+clname+'&mob='+mob+'&id='+id);

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

/* Remove jqx blue background */

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
    padding:10px;
    margin-bottom:10px;
}

/* Table */

.search-panel table{
    width:100%;
    border-collapse:collapse;
}

.search-panel td{
    padding:5px;
    vertical-align:middle;
}

/* Labels */

.lbl-right{
    text-align:right;
    font-size:12px;
    font-weight:500;
    color:#333;
    white-space:nowrap;
    padding-right:8px;
}

/* Inputs */

.search-panel input[type=text]{
    width:100%;
    height:26px;
    border:1px solid #cfcfcf;
    border-radius:3px;
    padding:2px 8px;
    box-sizing:border-box;
    background:#fff;
    font-size:12px;
}

.search-panel input[type=text]:focus{
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
                <col width="36%">
                <col width="8%">
                <col width="30%">
                <col width="18%">
            </colgroup>

            <tr>

                <td class="lbl-right">
                    Name
                </td>

                <td>
                    <input type="text"
                           name="Cl_name"
                           id="Cl_name"
                           value='<s:property value="Cl_name"/>'>
                </td>

                <td class="lbl-right">
                    MOB
                </td>

                <td>
                    <input type="text"
                           name="Cl_mob"
                           id="Cl_mob"
                           value='<s:property value="Cl_mob"/>'>
                </td>

                <td align="center">

                    <button type="button"
                            id="btnrasearch"
                            onclick="loadSearch();"
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

        <div id="refreshdiv1">

            <jsp:include page="searchClient.jsp"></jsp:include>

        </div>

    </div>

</div>

</body>
</html>