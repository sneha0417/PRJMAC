<jsp:include page="../../../../includes.jsp"></jsp:include>    
<%@ taglib prefix="s" uri="/struts-tags" %>
<%
	String contextPath=request.getContextPath();
 %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>GatewayERP(i)</title>
<link href="../../../../css/dashboard.css" media="screen" rel="stylesheet" type="text/css" />  

<style type="text/css">
/* ===== MASTER LAYOUT ===== */
body, html, #mainBG, .hidden-scrollbar {
    height: 100%;
    margin: 0;
    overflow: hidden;
}

.master-container {
    display: flex;
    width: 100%;
    height: 100vh;
    font-family: 'Segoe UI', 'Roboto', 'Arial', sans-serif;
    background-color: #f4f7f9;
}

/* Sidebar (LEFT SIDE ONLY) */
.sidebar-filters {
    width: 350px;
    flex: 0 0 350px;
    background: #fff;
    border-right: 1px solid #e1e8ed;
    display: flex;
    flex-direction: column;
    height: 100%;
    box-shadow: 2px 0 8px rgba(0,0,0,.05);
    z-index: 2;
}

.sidebar-fixed-top {
    padding: 15px 20px;
    border-bottom: 1px solid #f0f4f8;
}

.sidebar-scroll-content {
    flex: 1;
    overflow-y: auto;
    padding: 15px 20px 25px;
}

/* Cards */
.filter-card {
    background: #f8fafc;
    border: 1px solid #e3e8ee;
    border-radius: 12px;
    padding: 15px;
    margin-bottom: 12px;
}

/* Tables */
.release-filter-table {
    width: 100%;
    border-spacing: 0 10px;
}

.release-filter-table .label-cell {
    text-align: right;
    padding-right: 12px;
    font-size: 12px;
    color: #4e5e71;
    font-weight: 600;
    width: 80px;
}

/* ===== UNIFORM 24px INPUTS & SELECTS ===== */
input[type="text"], select,
.release-filter-table input[type="text"],
.release-filter-table select {
    width: 100%;
    height: 24px;             
    padding: 2px 8px;         
    border: 1px solid #ccd6e0;
    border-radius: 4px;       
    font-size: 12px;          
    background-color: #ffffff;
    box-sizing: border-box;
    color: #333;
}

/* Textarea styling */
textarea {
    width: 100%;
    padding: 6px 8px;
    border: 1px solid #ccd6e0;
    border-radius: 4px;
    font-size: 12px;
    background-color: #ffffff;
    box-sizing: border-box;
    color: #333;
    font-family: 'Segoe UI', 'Tahoma', sans-serif;
    resize: none;
}

/* Readonly / disabled look - NO BAN ICON */
input[readonly],
input:disabled,
select:disabled,
textarea[readonly],
textarea:disabled {
    background-color: #f3f6f9 !important;
    color: #555;
    cursor: default; /* Overrides any inherited not-allowed cursor */
}

/* jqx date/time containers */
.release-filter-table div[id^="fromdate"],
.release-filter-table div[id^="todate"] {
    width: 100%;
}

/* Add/Remove small buttons replacing old .myButtons */
.btn-small {
    height: 24px;
    padding: 0 10px;
    background: #64748b;
    color: white;
    border: none;
    border-radius: 4px;
    cursor: pointer;
    font-weight: bold;
    display: flex;
    align-items: center;
    justify-content: center;
}
.btn-small:hover { background: #475569; }

/* Main Buttons replacing old .myButtons */
.btn-submit {
    flex: 1;
    height: 30px;
    background: #2563eb;
    color: #fff;
    border: none;
    border-radius: 4px;
    font-size: 13px;
    font-weight: 600;
    cursor: pointer;
    transition: background 0.2s, transform 0.1s;
}
.btn-submit:hover:not(:disabled) { background: #1d4ed8; }
.btn-submit:disabled { background: #9ca3af; }
.btn-submit:active:not(:disabled) { transform: scale(0.98); }

.btn-secondary { background: #64748b; }
.btn-secondary:hover:not(:disabled) { background: #475569; }

.button-group {
    display: flex;
    gap: 10px;
    margin-top: 15px;
}

/* Main Content Area (RIGHT SIDE) */
.main-content-area {
    flex: 1;
    height: 100vh;
    overflow: auto;
    background: #ffffff;
    padding: 15px;
    box-sizing: border-box;
}
</style>

<script type="text/javascript">

	$(document).ready(function () {
	 
		 // Enforced 100% width and 24px height
		 $("#fromdate").jqxDateTimeInput({ width: '100%', height: '24px',formatString:"dd.MM.yyyy"});
		 $("#todate").jqxDateTimeInput({ width: '100%', height: '24px',formatString:"dd.MM.yyyy"});
		 
		 $("body").prepend('<div id="overlay" class="ui-widget-overlay" style="z-index: 1; display: none;"></div>');
	     $("body").prepend("<div id='PleaseWait' style='display: none;position:absolute; z-index: 1;top:180px;right:550px;'><img src='../../../../icons/31load.gif'/></div>");
		 
	      $('#ptypewindow').jqxWindow({ width: '50%',height: '60%',  maxHeight: '80%'  ,maxWidth: '50%' , title: 'Product Type Search' ,position: { x: 250, y: 60 }, keyboardCloseKey: 27});
		   $('#ptypewindow').jqxWindow('close');
		   $('#brandwindow').jqxWindow({ width: '49%', height: '65%',  maxHeight: '75%' ,maxWidth: '50%' , title: 'Brand Search' ,position: { x: 250, y: 60 }, keyboardCloseKey: 27});
		   $('#brandwindow').jqxWindow('close');
		   $('#modelwindow').jqxWindow({ width: '50%',height: '60%',  maxHeight: '80%' ,maxWidth: '50%' , title: 'Model Search' ,position: { x: 250, y: 60 }, keyboardCloseKey: 27});
		   $('#modelwindow').jqxWindow('close');
		   $('#submodelwindow').jqxWindow({ width: '50%',height: '60%',  maxHeight: '80%' ,maxWidth: '50%' , title: 'Model Search' ,position: { x: 250, y: 60 }, keyboardCloseKey: 27});
		   $('#submodelwindow').jqxWindow('close');
		   $('#productwindow').jqxWindow({ width: '50%',height: '60%',  maxHeight: '80%'  ,maxWidth: '50%' , title: 'Product Search' ,position: { x: 250, y: 60 }, keyboardCloseKey: 27});
		   $('#productwindow').jqxWindow('close');
		   $('#pcategorywindow').jqxWindow({ width: '50%', height: '60%',  maxHeight: '80%' ,maxWidth: '50%' , title: 'Category Search' ,position: { x: 250, y: 60 }, keyboardCloseKey: 27});
		   $('#pcategorywindow').jqxWindow('close');
		   $('#pdeptwindow').jqxWindow({ width: '50%', height: '60%',  maxHeight: '80%' ,maxWidth: '50%' , title: 'Department Search' ,position: { x: 250, y: 60 }, keyboardCloseKey: 27});
		   $('#pdeptwindow').jqxWindow('close');
		   $('#psubcategorywindow').jqxWindow({ width: '50%', height: '60%',  maxHeight: '80%' ,maxWidth: '50%' , title: 'Sub Category Search' ,position: { x: 250, y: 60 }, keyboardCloseKey: 27});
		   $('#psubcategorywindow').jqxWindow('close');
		
	     
	     
		  var curfromdate= $('#fromdate').jqxDateTimeInput('getDate');
	     var oneyeardate=new Date(new Date(curfromdate).setMonth(curfromdate.getMonth()-1));
	     var oneyearbackdate=new Date(new Date(oneyeardate).setDate(oneyeardate.getDate()));
	     $('#fromdate').jqxDateTimeInput('setDate', new Date(oneyearbackdate)); 
	});

	function funExportBtn(){
		 JSONToCSVCon(exdata, 'Product List', true);
	}
	
	
	function funreload(event){
		var prodvalue=$('#prodsearchby').val().trim();
		var type;
		var branchid;
		var hidbrand;
		var hidtype;
		var hidproduct;
		var hidcat;
		var hidsubcat;
		var frmdate;
		var todate;
		var hidsubcat;
		
		 	 branchid=document.getElementById("cmbbranch").value;
		 	 hidbrand=document.getElementById("hidbrandid").value;
			 hidtype=document.getElementById("hidtypeid").value;
			 hidproduct=document.getElementById("hidproductid").value;
			 hidcat=document.getElementById("hidcatid").value;
			 hidsubcat=document.getElementById("hidsubcatid").value;
			 hidept=document.getElementById("hideptid").value;
			 frmdate=$('#fromdate').jqxDateTimeInput('val');
			 //document.getElementById("fromdate").value;
			 todate=$('#todate').jqxDateTimeInput('val');
			 
	
		       $("#overlay, #PleaseWait").show();
		  
		 $("#productdiv").load("productlistgrid.jsp?todate="+todate+"&frmdate="+frmdate+"&hidbrand="+hidbrand+"&hidtype="+hidtype+"&hidcat="+hidcat+"&hidsubcat="+hidsubcat+"&hidproduct="+hidproduct+"&branchid="+branchid+"&hidept="+hidept+"&type=1");
			
			 
		}
	
	
	function getPtype(){
		 
	 	  $('#ptypewindow').jqxWindow('open');
			$('#ptypewindow').jqxWindow('focus');
			typeSearchContent('typeSearch.jsp', $('#ptypewindow'));

	}


	function getPbrand(t){
		 
		  $('#brandwindow').jqxWindow('open');
			$('#brandwindow').jqxWindow('focus');
			brandSearchContent('brandSearch.jsp?id='+t, $('#brandwindow'));

	}


	function getPcategory(){

		  $('#pcategorywindow').jqxWindow('open');
			$('#pcategorywindow').jqxWindow('focus');
			 categorySearchContent('catSearch.jsp', $('#pcategorywindow'));
	}

	function getDept(){

		  $('#pdeptwindow').jqxWindow('open');
			$('#pdeptwindow').jqxWindow('focus');
			 deptSearchContent('deptSearch.jsp', $('#pdeptwindow'));
	}


	function getPsubcategory(){
		var catid=$('#hidcatid').val().trim();
		 $('#psubcategorywindow').jqxWindow('open');
			$('#psubcategorywindow').jqxWindow('focus');
			 subcategorySearchContent('subcatSearch.jsp?catid='+catid, $('#psubcategorywindow'));

	}


	function getProduct(){
		
		var brandid=$('#hidbrandid').val().trim();
		var catid=$('#hidcatid').val().trim();
		var subcatid=$('#hidsubcatid').val().trim();
		
		 $('#productwindow').jqxWindow('open');
			$('#productwindow').jqxWindow('focus');
			 productSearchContent('productSearch.jsp?brandid='+brandid+'&catid='+catid+'&subcatid='+subcatid, $('#productwindow'));

	}


	function typeSearchContent(url) {
	  //alert(url);
	    $.get(url).done(function (data) {
	//alert(data);
	  $('#ptypewindow').jqxWindow('setContent', data);

	}); 
	}
	function brandSearchContent(url) {
	  //alert(url);
	    $.get(url).done(function (data) {
	//alert(data);
	  $('#brandwindow').jqxWindow('setContent', data);

	}); 
	}

	function modelSearchContent(url) {
	  //alert(url);
	    $.get(url).done(function (data) {
	//alert(data);
	  $('#modelwindow').jqxWindow('setContent', data);

	}); 
	}

	function subModelSearchContent(url) {
		  //alert(url);
		    $.get(url).done(function (data) {
		//alert(data);
		  $('#submodelwindow').jqxWindow('setContent', data);

		}); 
		}

	function categorySearchContent(url) {
	  //alert(url);
	    $.get(url).done(function (data) {
	//alert(data);
	  $('#pcategorywindow').jqxWindow('setContent', data);

	}); 
	}

	function deptSearchContent(url) {
		  //alert(url);
		    $.get(url).done(function (data) {
		//alert(data);
		  $('#pdeptwindow').jqxWindow('setContent', data);

		}); 
		}

	function subcategorySearchContent(url) {
	  //alert(url);
	    $.get(url).done(function (data) {
	//alert(data);
	  $('#psubcategorywindow').jqxWindow('setContent', data);

	}); 
	}

	function productSearchContent(url) {
		  //alert(url);
		    $.get(url).done(function (data) {
		//alert(data);
		  $('#productwindow').jqxWindow('setContent', data);

		}); 
		}
	
	function setprodSearch(){
		var value=$('#prodsearchby').val().trim();

		if(value=="ptype"){
			getPtype();
		}
		else if(value=="pbrand"){
			getPbrand(2);
		}
		else if(value=="pdept"){
			getDept();
		}
		else if(value=="product"){
			getProduct();
		}
		else if(value=="pcategory"){
			getPcategory();
		}
		else if(value=="psubcategory"){
			getPsubcategory();
		}
		
		
		else{
			
		}
	}
	
	function fundisable(){
		

		 
		 }
	
	function funClearData(){
		
		 
		 document.getElementById("hidbrandid").value="";
		 document.getElementById("hidtypeid").value="";
		 document.getElementById("hidproductid").value="";
		 document.getElementById("hidcatid").value="";
		 document.getElementById("hidsubcatid").value=""; 
		 document.getElementById("hidbrand").value="";
		 document.getElementById("hidtype").value="";
		 document.getElementById("hidproduct").value="";
		 document.getElementById("hidcat").value="";
		 document.getElementById("hidsubcat").value="";
		 document.getElementById("prodsearchby").value="";
		 document.getElementById("searchdetails").value="";
		 document.getElementById("hideptid").value="";
		 document.getElementById("hidept").value="";
		 document.getElementById("cmbbranch").value="a";
		 //$("#partSearchdiv").load("partSearchGrid.jsp");
		
	}
	
</script>
</head>
<body onload="getBranch();">
<div id="mainBG" class="homeContent" data-type="background"> 
<div class='hidden-scrollbar'>

<div class="master-container">
    
    <!-- Sidebar Filters (LEFT SIDE - MODERNIZED) -->
    <div class="sidebar-filters">
        <div class="sidebar-fixed-top">
            <div class="filter-card" style="padding: 10px;">
                <jsp:include page="../../heading.jsp"></jsp:include>
            </div>
        </div>

        <div class="sidebar-scroll-content">
            
            <div class="filter-card">
                <!-- Hidden by original logic, preserved placement but structured properly -->
                <div style="display: none;">
                    <div id="fromdate" name="fromdate" value='<s:property value="fromdate"/>'></div>
                    <div id="todate" name="todate" value='<s:property value="todate"/>'></div>
                </div>

                <table class="release-filter-table">
                    <tr>
                        <td class="label-cell">Product</td>
                        <td>
                            <div style="display: flex; gap: 4px; align-items: center;">
                                <select name="prodsearchby" id="prodsearchby">
                                    <option value="">--Select--</option>
                                    <option value="ptype">TYPE</option>
                                    <option value="pbrand">BRAND</option>
                                    <option value="pdept">DEPARTMENT</option>  
                                    <option value="pcategory">CATEGORY</option>
                                    <option value="psubcategory">SUB CATEGORY</option>
                                    <!-- <option value="product">PRODUCT</option> -->
                                </select>
                                <button type="button" name="btnadditem" id="additem" class="btn-small" onClick="setprodSearch();">+</button>
                                <button type="button" name="btnremoveitem" id="btnremoveitem" class="btn-small" onclick="setRemove();">-</button>
                            </div>
                        </td>
                    </tr>
                    
                    <tr>
                        <td colspan="2">
                            <textarea id="searchdetails" name="searchdetails" rows="18" readonly></textarea>
                        </td>
                    </tr>
                </table>
                
                <div class="button-group">
                    <button type="button" name="btnclear" id="btnclear" class="btn-submit btn-secondary" onclick="funClearData();">Clear</button>
                </div>
            </div>

            <!-- Hidden Fields required for logic grouped together -->
            <div style="display: none;">
                <input type="hidden" name="hidbrandid" id="hidbrandid">
                <input type="hidden" name="hidtypeid" id="hidtypeid">
                <input type="hidden" name="hideptid" id="hideptid">
                <input type="hidden" name="hidcatid" id="hidcatid">
                <input type="hidden" name="hidsubcatid" id="hidsubcatid">
                <input type="hidden" name="hidproductid" id="hidproductid">
                
                <input type="hidden" name="hidbrand" id="hidbrand">
                <input type="hidden" name="hidept" id="hidept">
                <input type="hidden" name="hidtype" id="hidtype">
                <input type="hidden" name="hidcat" id="hidcat">
                <input type="hidden" name="hidsubcat" id="hidsubcat">
                <input type="hidden" name="hidproduct" id="hidproduct">
            </div>

        </div>
    </div>

    <!-- Main Content Area (RIGHT SIDE - EXACT ORIGINAL HTML) -->
    <div class="main-content-area">
        <table width="100%">
            <tr>
                 <td><div id="productdiv"><jsp:include page="productlistgrid.jsp"></jsp:include></div></td>
            </tr>
        </table>
    </div>

</div>

<!-- Popups / Windows -->
<div id="ptypewindow"><div></div></div>
<div id="brandwindow"><div></div></div>
<div id="modelwindow"><div></div></div>
<div id="submodelwindow"><div></div></div>
<div id="productwindow"><div></div></div>
<div id="pcategorywindow"><div></div></div>
<div id="pdeptwindow"><div></div></div>
<div id="psubcategorywindow"><div></div></div>

</div>
</div>
</body>
</html>