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
		document.getElementById("txtproductsname").focus();
		document.getElementById("txtcldocnos").value=$('#clientid').val();
		document.getElementById("txtestdates").value=$('#date').val();
		document.getElementById("txtgridservicetypeids").value=$('#txtgridservicetypeid').val();
		document.getElementById("txtgridscopeids").value=$('#txtgridscopeid').val();
	}); 

 	function loadSearch() {

 		var productsname=document.getElementById("txtproductsname").value;
 		var brandsname=document.getElementById("txtbrandsname").value;
 		var cldocnos=document.getElementById("txtcldocnos").value;
 		var estdates=document.getElementById("txtestdates").value;
 		var gridprdname=document.getElementById("txtgridprdname").value;
 		var gridunit=document.getElementById("txtgridunit").value;
 		var gridservicetypeid=document.getElementById("txtgridservicetypeids").value;
 		var gridscopeid=document.getElementById("txtgridscopeids").value;
 		
		var id="1";
		getdata(productsname,brandsname,cldocnos,estdates,id,gridprdname,gridunit,gridservicetypeid,gridscopeid);
	}
	function getdata(productsname,brandsname,cldocnos,estdates,id,gridprdname,gridunit,gridservicetypeid,gridscopeid){
		 $("#refreshProductDiv").load('productSearch.jsp?productsname='+productsname.replace(/ /g, "%20")+'&brandsname='+brandsname.replace(/ /g, "%20")+'&cldocnos='+cldocnos+'&estdates='+estdates+"&id="+id+"&gridprdname="+gridprdname+"&gridunit="+gridunit+"&stypeid="+gridservicetypeid+"&scopeid="+gridscopeid);
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

.search-panel input[type="text"]:focus{
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
                <col width="10%">
                <col width="35%">
                <col width="10%">
                <col width="20%">
                <col width="25%">
            </colgroup>

            <!-- Row 1 -->

            <tr>

                <td class="lbl-right">
                    Product
                </td>

                <td>
                    <input type="text"
                           name="txtproductsname"
                           id="txtproductsname"
                           value='<s:property value="txtproductsname"/>'>

                    <input type="hidden" name="txtcldocnos" id="txtcldocnos" value='<s:property value="txtcldocnos"/>'>
                    <input type="hidden" name="txtestdates" id="txtestdates" value='<s:property value="txtestdates"/>'>
                    <input type="hidden" name="txtgridservicetypeids" id="txtgridservicetypeids" value='<s:property value="txtgridservicetypeids"/>'>
                    <input type="hidden" name="txtgridscopeids" id="txtgridscopeids" value='<s:property value="txtgridscopeids"/>'>
                </td>

                <td class="lbl-right">
                    Brand
                </td>

                <td>
                    <input type="text"
                           name="txtbrandsname"
                           id="txtbrandsname"
                           value='<s:property value="txtbrandsname"/>'>
                </td>

                <td align="center">

                    <button type="button"
                            id="btnsearch"
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

            <!-- Row 2 -->

            <tr>

                <td class="lbl-right">
                    Product Name
                </td>

                <td>
                    <input type="text"
                           name="txtgridprdname"
                           id="txtgridprdname"
                           value='<s:property value="txtgridprdname"/>'>
                </td>

                <td class="lbl-right">
                    Unit
                </td>

                <td>
                    <input type="text"
                           name="txtgridunit"
                           id="txtgridunit"
                           value='<s:property value="txtgridunit"/>'>
                </td>

                <td></td>

            </tr>

        </table>

    </div>

    <!-- Grid -->

    <div class="grid-container">

        <div id="refreshProductDiv">

            <jsp:include page="productSearch.jsp"></jsp:include>

        </div>

    </div>

</div>

</body>
</html>