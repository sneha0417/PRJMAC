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
    width: 330px;
    flex: 0 0 330px;
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

/* Readonly / disabled look - NO BAN ICON */
input[readonly],
input:disabled,
select:disabled {
    background-color: #f3f6f9 !important;
    color: #555;
    cursor: default; /* Overrides any inherited not-allowed cursor */
}

/* jqx date/time containers */
.release-filter-table div[id^="fromdate"],
.release-filter-table div[id^="todate"] {
    width: 100%;
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

	 $("body").prepend('<div id="overlay" class="ui-widget-overlay" style="z-index: 1; display: none;"></div>');
	 $("body").prepend("<div id='PleaseWait' style='display: none;position:absolute; z-index: 1;top:180px;right:550px;'><img src='../../../../icons/31load.gif'/></div>");
	     
	 $('#txtsergroup').dblclick(function(){
	    var id=1;
	    $('#grpinfowindow').jqxWindow('open');
	    grpSearchContent('servicegrpsearchgrid.jsp?id='+id);
	 });
	     
	 $('#txtclientname').dblclick(function(){
		accountsSearchContent('clientAccountDetailsSearch.jsp');
	 });
	     
	 $('#txtcontract').dblclick(function(){
	    var contractType=$("#ctype").val();
	 	var  cldocno="";
		$('#contractwindow').jqxWindow('open');
		contractSearchContent('contractDetailsSearch.jsp?contracttype='+contractType+'&cldocno='+cldocno, $('#contractwindow'));  
	 });
	 
	 $('#accountDetailsWindow').jqxWindow({width: '51%', height: '58%',  maxHeight: '70%' ,maxWidth: '51%' , title: 'Client Search',position: { x: 300, y: 87 } , theme: 'energyblue', showCloseButton: true, keyboardCloseKey: 27});
	 $('#accountDetailsWindow').jqxWindow('close');
	 
	 $('#contractwindow').jqxWindow({width: '33%', height: '50%',  maxHeight: '60%' ,maxWidth: '40%' , title: 'Contract Search',position: { x: 300, y: 87 } , theme: 'energyblue', showCloseButton: true, keyboardCloseKey: 27});
	 $('#contractwindow').jqxWindow('close');
	 
	 $('#grpinfowindow').jqxWindow({ width: '25%', height: '60%',  maxHeight: '85%' ,maxWidth: '80%' ,title: 'Assign Group' , position: { x: 250, y: 60 }, keyboardCloseKey: 27});
	 $('#grpinfowindow').jqxWindow('close');

	 $('#brandsearchwindow').jqxWindow({
		width : '25%',
		height : '58%',
		maxHeight : '70%',
		maxWidth : '70%',
		title : 'Brand Search',
		position : {
			x : 420,
			y : 87
		},
		theme : 'energyblue',
		showCloseButton : true,
		keyboardCloseKey : 27
	 });
	 $('#brandsearchwindow').jqxWindow('close');	
	 
	 $('#productwindow').jqxWindow({ width: '50%',height: '62%',  maxHeight: '80%'  ,maxWidth: '50%' , title: 'Product Search' ,position: { x: 250, y: 60 }, keyboardCloseKey: 27});
	 $('#productwindow').jqxWindow('close');   
			   
	 // Enforced 100% width and 24px height
	 $("#fromdate").jqxDateTimeInput({ width: '100%', height: '24px',formatString:"dd.MM.yyyy"});
	 $("#todate").jqxDateTimeInput({ width: '100%', height: '24px',formatString:"dd.MM.yyyy"});
	 
	 var fromdates=new Date($('#fromdate').jqxDateTimeInput('getDate'));
	 var onemounth=new Date(new Date(fromdates).setMonth(fromdates.getMonth()-1)); 
	    
     $('#fromdate').jqxDateTimeInput('setDate', new Date(onemounth));
	 $('#todate').on('change', function (event) {
		   var fromdates=new Date($('#fromdate').jqxDateTimeInput('getDate'));
		 
		  // out date
		   var todates=new Date($('#todate').jqxDateTimeInput('getDate')); //del date
		 	 
		   if(fromdates>todates){
			   $.messager.alert('Message','To Date Less Than From Date  ','warning');   
		       return false;
		  }   
	 });
	 
	 $('#name').dblclick(function(){
		if($('#type').val()=="BR") {
			brandFormSearchContent('brandFormSearchGrid.jsp');  
		} else if($('#type').val()=="PR") {
			productSearchContent('productSearch1.jsp');
		}
	 });  
});


function brandFormSearchContent(url) {
	$('#brandsearchwindow').jqxWindow('open');
	$.get(url).done(function(data) {
		$('#brandsearchwindow').jqxWindow('setContent', data);
		$('#brandsearchwindow').jqxWindow('bringToFront');
	});
}

function productSearchContent(url) {
	$('#productwindow').jqxWindow('open');
	$.get(url).done(function (data) {
	    $('#productwindow').jqxWindow('setContent', data);
	}); 
}

function getname(event) {
	if($('#type').val()=="BR") {
	    brandFormSearchContent('brandFormSearchGrid.jsp');  
	} else if($('#type').val()=="PR") {
	    productSearchContent('productSearch.jsp');
    }
}

function funExportBtn(){
	JSONToCSVCon(servicereportlistexcel, 'Reserved Product', true);
}

function funreload(event) {
	var fromdates=new Date($('#fromdate').jqxDateTimeInput('getDate'));
	var todates=new Date($('#todate').jqxDateTimeInput('getDate')); 
	 	 
	if(fromdates>todates){
		$.messager.alert('Message','To Date Less Than From Date  ','warning');   
	    return false;
	}
	  
    var barchval = document.getElementById("cmbbranch").value;
	var fromdate= $("#fromdate").val();
	var todate= $("#todate").val();
	var rds=$('#ctype').val(); 
	var contrctid= $("#contracttrno").val();
	var clientid=$('#txtclientaccountdocno').val();
	var cldocno=$("#hidcldocno").val();
	var type=$("#type").val(); 
	var brandid="";
	var productid="";
	
	if(type=="BR"){
		brandid=$("#brandid").val();
	}
	if(type=="PR"){
		productid=$("#psrno").val();
	}
	 
	$("#overlay, #PleaseWait").show();
	$("#loadgriddata").load("gridDetails.jsp?barchval="+barchval+"&froms="+fromdate+"&tos="+todate+"&rds="+rds+"&contrctid="+contrctid+"&clientid="+clientid+"&type="+type+"&brandid="+brandid+"&productid="+productid+"&cldocno="+cldocno);
}

function getClientAccount(event){
    var x= event.keyCode;
    if(x==114){
  	    accountsSearchContent('clientAccountDetailsSearch.jsp');
    }
}

function accountsSearchContent(url) {
    $('#accountDetailsWindow').jqxWindow('open');
	$.get(url).done(function (data) {
	    $('#accountDetailsWindow').jqxWindow('setContent', data);
	    $('#accountDetailsWindow').jqxWindow('bringToFront');
    }); 
}

function getgrpcode(event,id){
	 var x= event.keyCode;
	 if(x==114){
	    $('#grpinfowindow').jqxWindow('open');
        grpSearchContent('servicegrpsearchgrid.jsp');
  	 }
}
  	 
function grpSearchContent(url) {
	 $.get(url).done(function (data) {
        $('#grpinfowindow').jqxWindow('setContent', data);
     }); 
}
	
function clearnames() {
	$("#name").val("");
	$("#brandid").val("");
	$("#psrno").val("");	
}

function getcontract(event){
    alert(document.getElementById("ctype").value);
	var contractType=document.getElementById("ctype").value;
	alert(contractType);
	var cldocno="";
	var x= event.keyCode;
	if(x==114){
	 	$('#contractwindow').jqxWindow('open');
	 	contractSearchContent('contractDetailsSearch.jsp?contracttype='+contractType+'&cldocno='+cldocno, $('#contractwindow'));
	}
}
	    	 
function contractSearchContent(url) {
	$.get(url).done(function (data) {
		$('#contractwindow').jqxWindow('setContent', data);
	}); 
}
</script>
</head>
<body onload="getBranch();">
<div id="mainBG" class="homeContent" data-type="background"> 
<div class='hidden-scrollbar'>

<div class="master-container">
    
    <div class="sidebar-filters">
        <div class="sidebar-fixed-top">
            <div class="filter-card" style="padding: 10px;">
                <jsp:include page="../../heading.jsp"></jsp:include>
            </div>
        </div>

        <div class="sidebar-scroll-content">
            
            <div class="filter-card">
                <table class="release-filter-table">
                    <tr>
                        <td class="label-cell">From</td>
                        <td><div id='fromdate' name='fromdate' value='<s:property value="fromdate"/>'></div></td>
                    </tr>
                    
                    <tr>
                        <td class="label-cell">To</td>
                        <td><div id='todate' name='todate' value='<s:property value="todate"/>'></div></td>
                    </tr>
                    
                    <tr>
                        <td class="label-cell">Type</td>
                        <td>
                            <select id="type" name="type" onchange="clearnames()">
                                <option value="BR">Brand</option>
                                <option value="PR">Product</option>
                            </select>
                        </td>
                    </tr>
                    
                    <tr>
                        <td class="label-cell">Name</td>
                        <td><input type="text" id="name" placeholder="Press F3 for Search" readonly="readonly" onKeyDown="getname(event);" name="name" value='<s:property value="name"/>'></td>
                    </tr>
                    
                    <tr>
                        <td class="label-cell">Job Type</td>
                        <td>
                            <select id="ctype" name="ctype" value='<s:property value="ctype"/>'>
                                <option value="ALL">ALL</option>
                                <option value="AMC">AMC</option>
                                <option value="SJOB">SJOB</option>
                            </select>
                        </td>
                    </tr>
                    
                    <tr>
                        <td class="label-cell">Job No</td>
                        <td><input type="text" name="txtcontract" id="txtcontract" placeholder="Press F3 To Search" onKeyDown="getcontract(event);" readonly value='<s:property value="txtcontract"/>'></td>
                    </tr>
                    
                    <tr>
                        <td class="label-cell">Client</td>
                        <td><input type="text" id="txtclientname" name="txtclientname" readonly="readonly" placeholder="Press F3 to Search" value='<s:property value="txtclientname"/>' onkeydown="getClientAccount(event);"/></td>
                    </tr>
                </table>
            </div>

            <div style="display: none;">
                <input type="hidden" id="txtclientaccountdocno" name="txtclientaccountdocno" value='<s:property value="txtclientaccountdocno"/>'/>
                <input type="hidden" id="sergroupid" name="sergroupid" value='<s:property value="sergroupid"/>'>
                <input type="hidden" id="brandid" name="brandid" >
                <input type="hidden" id="psrno" name="psrno" >
                <input type="hidden" id="contracttrno" name="contracttrno" value='<s:property value="contracttrno"/>'>
                <input type="hidden" id="hidcldocno" name="hidcldocno" value='<s:property value="hidcldocno"/>'>
                <input type="hidden" id="acno" name="acno" value='<s:property value="acno"/>'>
            </div>
            
        </div>
    </div>

    <div class="main-content-area">
        <table width="100%">
            <tr><div id="loadgriddata">
                    <jsp:include page="gridDetails.jsp"></jsp:include> 
                </div></tr>
        </table>
    </div>

</div>

    <div id="brandsearchwindow"><div></div><div></div></div>
	<div id="productwindow"><div></div></div>
    <div id="accountDetailsWindow"><div></div></div>
	<div id="grpinfowindow"><div></div></div>
	<div id="contractwindow"><div></div></div>

</div>
</body>
</html>