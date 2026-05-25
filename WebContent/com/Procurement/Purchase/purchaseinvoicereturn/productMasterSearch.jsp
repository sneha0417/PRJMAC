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
		document.getElementById("txtgridscopeids").value=$('#txtgridscopeid').val();
		document.getElementById("txtgridscopeproducts").value=$('#txtgridscopeproduct').val();
	}); 

 	function loadSearch() {

 		var productsname=document.getElementById("txtproductsname").value;
 		var brandsname=document.getElementById("jqxBrandInput").value;
 		var cldocnos=document.getElementById("txtcldocnos").value;
 		var estdates=document.getElementById("txtestdates").value;
 		var gridprdname=document.getElementById("txtgridprdname").value;
 		var gridunit=document.getElementById("txtgridunit").value;
 		var gridscategory=document.getElementById("txtgridscategory").value;
		var gridssubcategory=document.getElementById("jqxSubCategoryInput").value;
 		var gridscopeid=document.getElementById("txtgridscopeids").value;
 		var gridscopeproduct=document.getElementById("txtgridscopeproducts").value;
 		
		var id="1";
		getdata(productsname,brandsname,cldocnos,estdates,id,gridprdname,gridunit,gridscategory,gridssubcategory,gridscopeid,gridscopeproduct);
	}
	function getdata(productsname,brandsname,cldocnos,estdates,id,gridprdname,gridunit,gridscategory,gridssubcategory,gridscopeid,gridscopeproduct){
		 var dates=document.getElementById("masterdate").value; 
		 var cmbbilltype=document.getElementById("cmbbilltype").value;
		 var accdocno = document.getElementById("accdocno").value; 
    	 var reqmasterdocno = document.getElementById("reqmasterdocno").value; 
		$("#refreshProductDiv").load('productSearch.jsp?productsname='+productsname.replace(/ /g, "%20")+'&brandsname='+brandsname.replace(/ /g, "%20")+'&cldocnos='+cldocnos+'&estdates='+estdates+"&id="+id+"&gridprdname="+gridprdname.replace(/ /g, "%20")+"&gridunit="+gridunit+"&gridcategory="+gridscategory.replace(/ /g, "%20")+"&gridssubcategory="+gridssubcategory.replace(/ /g, "%20")+"&scopeid="+gridscopeid+"&scopeproduct="+gridscopeproduct+'&reqmasterdocno='+reqmasterdocno+'&dtype='+document.getElementById("reftype").value+"&dates="+dates+"&cmbbilltype="+cmbbilltype+"&accdocno="+accdocno);
		}

	</script>
<style>
/* =========================================================
   SCOPED UI: Pure White Panel (Matches Reference)
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
                <td class="lbl-right">Product</td>
                <td>
                    <input type="text" name="txtproductsname" id="txtproductsname" value='<s:property value="txtproductsname"/>'>
                </td>
                
                <td class="lbl-right">Product Name</td>
                <td>
                    <input type="text" name="txtgridprdname" id="txtgridprdname" value='<s:property value="txtgridprdname"/>'>
                </td>
                
                <td align="center" rowspan="3" valign="middle">
                    <button type="button" name="btnsearch" id="btnsearch" class="myButton" onclick="loadSearch(); return false;">
                        Search
                    </button>
                </td>
            </tr>
            
            <tr>
                <td class="lbl-right">Brand</td>
                <td>
                    <div id="brandDiv">
                        <jsp:include page="brandInputSearch.jsp"></jsp:include>
                    </div>
                    <input type="hidden" name="txtcldocnos" id="txtcldocnos" value='<s:property value="txtcldocnos"/>'>
                    <input type="hidden" name="txtestdates" id="txtestdates" value='<s:property value="txtestdates"/>'>
                    <input type="hidden" name="txtgridscopeids" id="txtgridscopeids" value='<s:property value="txtgridscopeids"/>'>
                    <input type="hidden" name="txtgridscopeproducts" id="txtgridscopeproducts" value='<s:property value="txtgridscopeproducts"/>'>
                </td>
                
                <td class="lbl-right">Unit</td>
                <td>
                    <input type="text" name="txtgridunit" id="txtgridunit" value='<s:property value="txtgridunit"/>'>
                </td>
            </tr>

            <tr>
                <td class="lbl-right">Category</td>
                <td>
                    <input type="text" name="txtgridscategory" id="txtgridscategory" value='<s:property value="txtgridscategory"/>'>
                </td>
                
                <td class="lbl-right">Sub Category</td>
                <td>
                    <div id="subCategoryDiv">
                        <jsp:include page="subCategoryInputSearch.jsp"></jsp:include>
                    </div>
                </td>
            </tr>

        </table>
    </div>

    <div class="grid-container">
        <div id="refreshProductDiv">
            <jsp:include page="productSearch.jsp"></jsp:include>
        </div>
    </div>

</div>

</body>
</html>