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
		document.getElementById("txtestdates").value=$('#todate').val();
		document.getElementById("txtgridqotservicetypeids").value=$('#txtgridqotservicetypeid').val();
		document.getElementById("txtgridqotscopeids").value=$('#txtgridqotscopeid').val();
	}); 

 	function loadSearch() {

 		var productsname=document.getElementById("txtproductsname").value;
 		var brandsname=document.getElementById("txtbrandsname").value;
 		var cldocnos=document.getElementById("txtcldocnos").value;
 		var estdates=document.getElementById("txtestdates").value;
 		var gridprdname=document.getElementById("txtgridprdname").value;
 		var gridunit=document.getElementById("txtgridunit").value;
 		var gridservicetypeid=document.getElementById("txtgridqotservicetypeids").value;
 		var gridscopeid=document.getElementById("txtgridqotscopeids").value;
		
		var id="1";
		getdata(productsname,brandsname,cldocnos,estdates,id,gridprdname,gridunit,gridservicetypeid,gridscopeid);
	}
	function getdata(productsname,brandsname,cldocnos,estdates,id,gridprdname,gridunit,gridservicetypeid,gridscopeid){
		 $("#refreshProductDivqot").load('productSearchqot.jsp?productsname='+productsname.replace(/ /g, "%20")+'&brandsname='+brandsname.replace(/ /g, "%20")+'&cldocnos='+cldocnos+'&estdates='+estdates+"&id="+id+"&gridprdname="+gridprdname.replace(/ /g, "%20")+"&gridunit="+gridunit+"&stypeid="+gridservicetypeid+"&scopeid="+gridscopeid);
		}

	</script>
<style>
/* =========================================================
   MASTER SEARCH UI - PURE WHITE PANEL
========================================================= */

body, html{
    margin:0;
    padding:0;
    background:#ffffff !important;
    font-family:'Segoe UI',Tahoma,Verdana,sans-serif;
}

.modern-ui{
    padding:10px;
    font-size:12px;
    color:#333;
    background:#ffffff;
}

/* Search Panel */

.modern-ui .search-panel{
    background:#ffffff;
    border:1px solid #d6d6d6;
    border-radius:4px;
    padding:12px;
    margin-bottom:12px;
}

/* Table */

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
    background:#ffffff;
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
                    Product
                </td>

                <td>
                    <input type="text"
                           name="txtproductsname"
                           id="txtproductsname"
                           value='<s:property value="txtproductsname"/>'>
                </td>

                <td class="lbl-right">
                    Brand
                </td>

                <td>
                    <input type="text"
                           name="txtbrandsname"
                           id="txtbrandsname"
                           value='<s:property value="txtbrandsname"/>'>

                    <input type="hidden" name="txtcldocnos" id="txtcldocnos" value='<s:property value="txtcldocnos"/>'>
                    <input type="hidden" name="txtestdates" id="txtestdates" value='<s:property value="txtestdates"/>'>
                    <input type="hidden" name="txtgridqotservicetypeids" id="txtgridqotservicetypeids" value='<s:property value="txtgridqotservicetypeids"/>'>
                    <input type="hidden" name="txtgridqotscopeids" id="txtgridqotscopeids" value='<s:property value="txtgridqotscopeids"/>'>
                </td>

                <td align="left">
                    <input type="button"
                           name="btnsearch"
                           id="btnsearch"
                           value="Search"
                           class="search-btn"
                           onclick="loadSearch();">
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

        <div id="refreshProductDivqot">
            <jsp:include page="productSearchqot.jsp"></jsp:include>
        </div>

    </div>

</div>

</body>
</html>