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
/* ===== MASTER LAYOUT COMPLIANT WITH REFERENCE UI ===== */
body, html, #mainBG, .hidden-scrollbar {
    height: 100%;
    margin: 0;
    overflow: hidden;
}

form {
    height: 100%;
    margin: 0;
}

.master-container {
    display: flex;
    width: 100%;
    height: 100vh;
    font-family: 'Segoe UI', 'Roboto', 'Arial', sans-serif;
    background-color: #f4f7f9;
}

/* Sidebar Wrapper Layout */
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

/* Sidebar Custom Scrollbar */
.sidebar-scroll-content::-webkit-scrollbar {
    width: 6px;
}
.sidebar-scroll-content::-webkit-scrollbar-track {
    background: transparent;
}
.sidebar-scroll-content::-webkit-scrollbar-thumb {
    background-color: #cbd5e1;
    border-radius: 10px;
}

/* UI Cards Panels */
.filter-card {
    background: #f8fafc;
    border: 1px solid #e3e8ee;
    border-radius: 12px;
    padding: 15px;
    margin-bottom: 12px;
}

.grid-card {
    background: #fff;
    border: 1px solid #e1e8ed;
    border-radius: 8px;
    padding: 15px;
    margin-bottom: 15px;
    box-shadow: 0 1px 3px rgba(0,0,0,0.02);
}

.card-header {
    font-size: 11px; 
    font-weight: 600; 
    color: #4e5e71; 
    margin-bottom: 10px; 
    text-transform: uppercase; 
    letter-spacing: 0.5px;
    border-bottom: 1px solid #e3e8ee;
    padding-bottom: 5px;
}

/* Layout Form Filter Grids */
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
    width: 90px;
    white-space: nowrap; 
    line-height: 1.2;
}

/* ===== ENFORCED UNIFORM 24px GRID INPUTS ELEMENTS ===== */
input[type="text"], select,
.release-filter-table input[type="text"],
.release-filter-table select {
    width: 100%;
    height: 24px;
    padding: 2px 8px;
    border: 1px solid #ccd6e0 !important;
    border-radius: 4px;
    font-size: 12px;
    background-color: #ffffff !important;
    box-shadow: none !important;
    box-sizing: border-box;
    color: #333;
    outline: none;
}

input:-webkit-autofill {
    -webkit-box-shadow: 0 0 0 30px white inset !important;
}

/* Specific styling for Textarea & Checkbox */
textarea, .release-filter-table textarea {
    width: 100%;
    padding: 6px 8px;
    border: 1px solid #ccd6e0 !important;
    border-radius: 4px;
    font-size: 12px;
    background-color: #ffffff !important;
    box-sizing: border-box;
    color: #333;
    resize: none;
    outline: none;
}

.release-filter-table input[type="checkbox"],
.checkbox-center-row input[type="checkbox"] {
    width: auto;
    height: auto;
    margin: 0;
    vertical-align: middle;
    cursor: pointer;
}

.checkbox-center-row {
    display: flex; 
    align-items: center; 
    justify-content: center; 
    gap: 6px; 
    margin: 5px 0;
}

.checkbox-center-row label {
    font-size: 11.5px;
    font-weight: 600;
    color: #4e5e71;
    cursor: pointer;
}

/* Readonly fields styling setup */
input[readonly], select[readonly], textarea[readonly],
input:disabled, select:disabled, textarea:disabled,
.release-filter-table input[readonly] {
    background-color: #f3f6f9 !important; 
    color: #555;
    cursor: default;
}

/* Search Box Wrapper Controls */
.search-input-wrapper {
    position: relative;
    display: flex;
    align-items: center;
    width: 100%;
}

.search-input-wrapper input[type="text"] {
    width: 100%;
    padding-right: 26px; 
    cursor: pointer;
}

.search-icon {
    position: absolute;
    right: 6px;
    width: 12px;
    height: 12px;
    background-image: url('data:image/svg+xml;utf8,<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" fill="none" stroke="%23999" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><circle cx="11" cy="11" r="8"></circle><line x1="21" y1="21" x2="16.65" y2="16.65"></line></svg>');
    background-size: cover;
    background-repeat: no-repeat;
    pointer-events: none; 
    opacity: 0.8;
}

/* Native SVG Icon Buttons */
.btn-icon-inline {
    background: transparent;
    border: none;
    cursor: pointer;
    padding: 2px 2px 2px 6px; 
    display: flex;
    align-items: center;
    justify-content: center;
}
.btn-icon-inline svg {
    opacity: 0.7;
    transition: opacity 0.2s;
}
.btn-icon-inline:hover svg {
    opacity: 1;
    stroke: #2563eb; 
}

/* Form Layout Container Blocks for JQX widgets */
.release-filter-table div[id^="fromdate"],
.release-filter-table div[id^="todate"],
.release-filter-table div[id^="quotdate"] {
    width: 100%;
}

/* ===== SUMMARY TOTALS BAR ===== */
.summary-bar {
    display: flex;
    justify-content: flex-end;
    align-items: center;
    gap: 15px;
    background: #f8fafc;
    border: 1px solid #e1e8ed;
    border-radius: 8px;
    padding: 12px 20px;
    margin-bottom: 15px;
}
.summary-label {
    font-weight: 600;
    font-size: 12px;
    color: #334155;
}

/* ===== REQUIRED VISUAL BLUE BUTTON SCALING DEFINITIONS ===== */
.btn-primary {
    height: 28px;
    background-color: #1e6bf2;
    border: none;
    border-radius: 8px;
    color: #ffffff;
    font-size: 12px;
    font-weight: 700;
    cursor: pointer;
    transition: background-color 0.2s ease, transform 0.1s ease;
    display: flex;
    align-items: center;
    justify-content: center;
    padding: 0 10px;
    width: 100%;
}

.btn-primary:hover {
    background-color: #1656c7;
}

.btn-primary:active {
    transform: scale(0.98);
}

.btn-primary:disabled {
    background-color: #9abaf5;
    cursor: not-allowed;
    transform: none;
}

.btn-secondary {
    background-color: #64748b;
}

.btn-secondary:hover {
    background-color: #475569;
}

.release-actions {
    display: flex;
    flex-direction: column;
    gap: 8px;
    margin-top: 15px;
}

/* Flexible Right Workspace Panel */
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
		 $('#siteGridID').jqxGrid('clear');
         
         // Enforced 24px JQX Criteria
         $("#fromdate").jqxDateTimeInput({ width: '100%', height: '24px',formatString:"dd.MM.yyyy"});
         $("#todate").jqxDateTimeInput({ width: '100%', height: '24px',formatString:"dd.MM.yyyy"});
         $("#quotdate").jqxDateTimeInput({ width: '100%', height: '24px',formatString:"dd.MM.yyyy", value: null});
	    	  
		 $('#quotwindow').jqxWindow({ width: '45%', height: '58%',  maxHeight: '90%' ,maxWidth: '80%' ,title: 'Quotation Search' , position: { x: 200, y: 120 }, keyboardCloseKey: 27});
		 $('#quotwindow').jqxWindow('close') ; 
		 $('#sidesearchwndow').jqxWindow({  width: '45%', height: '80%',  maxHeight: '90%' ,maxWidth: '80%' ,title: 'Search ' , position: { x: 725, y: 0 }, keyboardCloseKey: 27});
		 $('#sidesearchwndow').jqxWindow('close'); 
		 $('#servicetypewindow').jqxWindow({ width: '25%', height: '70%',  maxHeight: '85%' ,maxWidth: '80%' ,title: ' Service Type Search' , position: { x: 250, y: 60 }, keyboardCloseKey: 27});
		 $('#servicetypewindow').jqxWindow('close');
		 $('#unitsearchwindow').jqxWindow({ width :'25%',height:'58%',maxHeight:'70%',maxWidth:'45%',title:'Unit Search',position:{	x : 420,y : 87},theme : 'energyblue',showCloseButton : true,keyboardCloseKey : 27 });
		 $('#unitsearchwindow').jqxWindow('close');
		 $('#sertypefowindow').jqxWindow({ width: '30%', height: '65%',  maxHeight: '85%' ,maxWidth: '80%' ,title: 'Service Type' , position: { x: 250, y: 60 }, keyboardCloseKey: 27});
		 $('#sertypefowindow').jqxWindow('close');
		 $('#siteinfowindow').jqxWindow({ width: '25%', height: '65%',  maxHeight: '85%' ,maxWidth: '80%' ,title: 'Site Search' , position: { x: 250, y: 60 }, keyboardCloseKey: 27});
		 $('#siteinfowindow').jqxWindow('close');
		 $('#clientsearch1').jqxWindow({ width: '50%', height: '55%',  maxHeight: '85%' ,maxWidth: '80%' ,title: 'Client Search' , position: { x: 250, y: 120 }, keyboardCloseKey: 27});
		 $('#clientsearch1').jqxWindow('close');
		 $('#sitewindow').jqxWindow({ width: '25%', height: '60%',  maxHeight: '60%' ,maxWidth: '80%' ,title: ' Site Search' , position: { x: 250, y: 60 }, keyboardCloseKey: 27});
		 $('#sitewindow').jqxWindow('close');
		 $('#sidesearchwndowqot').jqxWindow({ width: '45%', height: '80%',  maxHeight: '90%' ,maxWidth: '80%' ,title: 'Search ' , position: { x: 725, y: 0 }, keyboardCloseKey: 27});
		 $('#sidesearchwndowqot').jqxWindow('close');
		 $('#areainfowindow').jqxWindow({ width: '25%', height: '70%',  maxHeight: '85%' ,maxWidth: '80%' ,title: ' Area Search' , position: { x: 250, y: 60 }, keyboardCloseKey: 27});
		 $('#areainfowindow').jqxWindow('close');
		 $('#scopesearchwindow').jqxWindow({ width: '25%', height: '60%',  maxHeight: '60%' ,maxWidth: '80%' ,title: ' Scope Search' , position: { x: 250, y: 60 }, keyboardCloseKey: 27});
		 $('#scopesearchwindow').jqxWindow('close');
			  
		 var fromdates=new Date($('#fromdate').jqxDateTimeInput('getDate'));
		 var onemounth=new Date(new Date(fromdates).setMonth(fromdates.getMonth()-1)); 
	     $('#fromdate').jqxDateTimeInput('setDate', new Date(onemounth));
		       
	     $('#todate').on('change', function (event) {
			var fromdates=new Date($('#fromdate').jqxDateTimeInput('getDate'));
			var todates=new Date($('#todate').jqxDateTimeInput('getDate')); 
			if(fromdates>todates){
				$.messager.alert('Message','To Date Less Than From Date  ','warning');   
				return false;
			}   
		 });
	          
		 $('#txtclient').dblclick(function(){
		    $('#clientsearch1').jqxWindow('open');
		    clientSearchContent('clientINgridsearch.jsp?', $('#clientsearch1')); 
		 });
		  	 
		 $('#qutname').dblclick(function(){
			if(document.getElementById("cmbbranch").value=="" || document.getElementById("cmbbranch").value=='a'){
				$.messager.alert('Warning','Please Select Branch');
				return false;
			}
				  	   
			var fromdates=new Date($('#fromdate').jqxDateTimeInput('getDate'));
			var todates=new Date($('#todate').jqxDateTimeInput('getDate')); //del date
			if(fromdates>todates){
			   	$.messager.alert('Message','To Date Less Than From Date  ','warning');   
			   	return false;
			}
			var fromdate= $("#fromdate").val();
			var todate= $("#todate").val();
			$('#quotwindow').jqxWindow('open');
			$('#quotwindow').jqxWindow('focus');
			getQuotationGrid(fromdate,todate);
		 });  
		 
		 $('#qutno').dblclick(function(){
			if(document.getElementById("cmbbranch").value=="" || document.getElementById("cmbbranch").value=='a'){
				$.messager.alert('Warning','Please Select Branch');
				return false;
			}
				  	   
			var fromdates=new Date($('#fromdate').jqxDateTimeInput('getDate'));
			var todates=new Date($('#todate').jqxDateTimeInput('getDate')); //del date
			if(fromdates>todates){
			   	$.messager.alert('Message','To Date Less Than From Date  ','warning');   
			   	return false;
			}
			var fromdate= $("#fromdate").val();
			var todate= $("#todate").val();
			$('#quotwindow').jqxWindow('open');
			$('#quotwindow').jqxWindow('focus');
			getQuotationGrid(fromdate,todate);
		 }); 

		 $('#btnsave').attr('disabled',true); 
		 $('#quotdate').jqxDateTimeInput({disabled: true});
	});
	
	function scopeSearchContent(url) {
		$('#scopesearchwindow').jqxWindow('open');
		$.get(url).done(function(data) {
			$('#scopesearchwindow').jqxWindow('setContent', data);
			$('#scopesearchwindow').jqxWindow('bringToFront');
		});
	}
  
  function getScopeGroup() {
		var x = new XMLHttpRequest();
		x.onreadystatechange = function() {
			if (x.readyState == 4 && x.status == 200) {
				var items = x.responseText;
				items = items.split('####');
				var scopeGroupItems = items[0].split(",");
				var scopeGroupIdItems = items[1].split(",");
				var optionsscopegroup = '<option value="">--Select--</option>';
				for (var i = 0; i < scopeGroupItems.length; i++) {
					optionsscopegroup += '<option value="' + scopeGroupIdItems[i] + '">'
							+ scopeGroupItems[i] + '</option>';
				}
				$("select#cmbscopegroup").html(optionsscopegroup);
				if ($('#hidcmbscopegroup').val() != null) {
					$('#cmbscopegroup').val($('#hidcmbscopegroup').val());
				}
			} else {
			}
		}
		x.open("GET", "getScopeGroup.jsp?contrmode="+$('#txtcontrmode').val(), true);
		x.send();
	}
  
  function getScopeGroupAdvanced() {
		var x = new XMLHttpRequest();
		x.onreadystatechange = function() {
			if (x.readyState == 4 && x.status == 200) {
				var items = x.responseText;
				items = items.split('####');
				var scopeGroupItems = items[0].split(",");
				var scopeGroupIdItems = items[1].split(",");
				var optionsscopegroup = '<option value="">--Select--</option>';
				for (var i = 0; i < scopeGroupItems.length; i++) {
					optionsscopegroup += '<option value="' + scopeGroupIdItems[i] + '">'
							+ scopeGroupItems[i] + '</option>';
				}
				$("select#cmbscopegroupchange").html(optionsscopegroup);
				if ($('#hidcmbscopegroupchange').val() != null) {
					$('#cmbscopegroupchange').val($('#hidcmbscopegroupchange').val());
				}
				$('#cmbscopegroupchange').attr('disabled', true );
				$('#btnProcess').attr('disabled', true );
			} else {
			}
		}
		x.open("GET", "getScopeGroupAdvanced.jsp?contrmode="+$('#txtcontrmode').val(), true);
		x.send();
	}
  
  function getPreSalesScopeAllowed(){
		var x = new XMLHttpRequest();
		x.onreadystatechange = function() {
			if (x.readyState == 4 && x.status == 200) {
				var items = x.responseText;
			    $('#presalesscopeallowed').val(items);
			    
			  if(parseInt(items)==1){
					$('#cmbscopegroupchange').show(); 
					$('#btnProcess').show();
					document.getElementById("lblscopegroup").style.display = 'inline-block';
        			$('#qutDetSubGrid').jqxGrid('showcolumn', 'scope');
					$('#qutDetSubGrid').jqxGrid('showcolumn', 'scopeamount');
					$('#qutDetGrid').jqxGrid('showcolumn', 'scope');
					$('#qutDetGrid').jqxGrid('showcolumn', 'scopeamount');
					$('#qutDetSubGrid').jqxGrid('setcolumnproperty', 'desc1', 'width', '14%');
					$('#qutDetSubGrid').jqxGrid('setcolumnproperty', 'proname', 'width', '10%');
					$('#qutDetGrid').jqxGrid('setcolumnproperty', 'desc1', 'width', '14%');
					$('#qutDetGrid').jqxGrid('setcolumnproperty', 'proname', 'width', '11%');
			    } else {
			    	$('#cmbscopegroupchange').hide();
			    	$('#btnProcess').hide();
			    	document.getElementById("lblscopegroup").style.display = 'none';
			    	$('#qutDetSubGrid').jqxGrid('hidecolumn', 'scope');
					$('#qutDetSubGrid').jqxGrid('hidecolumn', 'scopeamount');
					$('#qutDetGrid').jqxGrid('hidecolumn', 'scope');
					$('#qutDetGrid').jqxGrid('hidecolumn', 'scopeamount');
					$('#qutDetSubGrid').jqxGrid('setcolumnproperty', 'desc1', 'width', '23%');
					$('#qutDetSubGrid').jqxGrid('setcolumnproperty', 'proname', 'width', '15%');
					$('#qutDetGrid').jqxGrid('setcolumnproperty', 'desc1', 'width', '23%');
					$('#qutDetGrid').jqxGrid('setcolumnproperty', 'proname', 'width', '16%');
			    }
		}
		}
		x.open("GET", "getPreSalesScopeAllowed.jsp", true);
		x.send();
	}
  
  	function funscopegroupchange(){
  		$('#cmbscopegroup').val($('#cmbscopegroupchange').val());
  	}
  	
  	function funProcessBtn(){
  		if($('#quttrno').val().trim()==""){
				$.messager.alert('Message','Select a Quotation.','warning');
	     		return 0;
		}
  		if($('#cmbscopegroupchange').val().trim()==""){
  				$.messager.alert('Message','Select a Scope Group.','warning');
		     	return 0;
  		}
  		
  		$('#txtscopegroupchanged').val('1');
  		if($('#reftype').val()=="ENQ"){
  				$("#loadsubgriddata").load("estimationGrid.jsp?docno="+$("#quttrno").val()+"&scopegroupid="+$("#cmbscopegroupchange").val()+"&scopegroupchanged="+$("#txtscopegroupchanged").val()+"&check=1");
  		}
  	}

	 function setValues(){
		 getPreSalesScopeAllowed();getScopeGroup();getScopeGroupAdvanced();
		 
		 if($('#hidquotdate').val()!=""){
			 $("#quotdate").jqxDateTimeInput('val', $('#hidquotdate').val());
			 $('#quotdate').jqxDateTimeInput({disabled: false});
		  }
		var qutno=document.getElementById("quttrno").value;
		
		if(qutno>0){
			 if($('#reftype').val()=="ENQ"){
					$("#loadsubgriddata").load("estimationGrid.jsp?docno="+qutno+"&check=1");
			 }
			 $("#loadgriddata").load("quotationGrid.jsp?docno="+qutno+"&revision="+$('#revision').val()+"&check=1");
			 $("#loadsitegriddata").load("siteGrid.jsp?docno="+qutno+"&check=1");
		}
		
		if($('#msg').val()!=""){
			 $.messager.alert('Message',$('#msg').val());
		}
	}

	function getQuotation(event){
			if(document.getElementById("cmbbranch").value=="" || document.getElementById("cmbbranch").value=='a'){
				$.messager.alert('Warning','Please Select Branch');
				return false;
			}
		  var fromdates=new Date($('#fromdate').jqxDateTimeInput('getDate'));
		  var todates=new Date($('#todate').jqxDateTimeInput('getDate')); //del date
		  if(fromdates>todates){
			   $.messager.alert('Message','To Date Less Than From Date  ','warning');   
		   	   return false;
		  }
		  var fromdate= $("#fromdate").val();
		  var todate= $("#todate").val();
		  var x= event.keyCode;
	 	  if(x==114){
		 	getQuotationGrid(fromdate,todate);
	 	  }
	}

function getQuotationGrid(fromdate,todate){  
	  var cmbbranch= $("#cmbbranch").val();
 	  $('#quotwindow').jqxWindow('open');
 	  quotationSearchContent('quotationSearchOuter.jsp?fromdate='+fromdate+'&todate='+todate+'&brhid='+cmbbranch);  
}
 	 
function getservicetype(rowBoundIndex){
	  $('#servicetypewindow').jqxWindow('open');
      serviceSearchContent('servicesearch.jsp?rowBoundIndex='+rowBoundIndex);
}
 	 
function serviceSearchContent(url) {
	 $.get(url).done(function (data) {
	     $('#servicetypewindow').jqxWindow('setContent', data);
	 }); 
}
function quotationSearchContent(url) {
	 $.get(url).done(function (data) {
		$('#quotwindow').jqxWindow('setContent', data);
	}); 
} 
	
function productSearchContent(url) {
 	 $.get(url).done(function (data) {
 		 $('#sidesearchwndow').jqxWindow('open');
 		 $('#sidesearchwndow').jqxWindow('setContent', data);
 	 }); 
} 
 
function getserType(rowBoundIndex){
	 $('#sertypefowindow').jqxWindow('open');
     serTypeSearchContent('servicetypesearch.jsp?rowBoundIndex='+rowBoundIndex);
}
	 
function serTypeSearchContent(url) {
	 $.get(url).done(function (data) {
	     $('#sertypefowindow').jqxWindow('setContent', data);
	 }); 
}
	 
function productSearchContentqot(url) {
 	 $.get(url).done(function (data) {
 		 $('#sidesearchwndowqot').jqxWindow('open');
 		 $('#sidesearchwndowqot').jqxWindow('setContent', data);
 	}); 
} 

function getsite(rowBoundIndex){
	$('#siteinfowindow').jqxWindow('open');
    siteSearchContent('servicesitesearch.jsp?rowBoundIndex='+rowBoundIndex+'&hidtrno='+$('#quttrno').val());
}
 
function getareas(rowBoundIndex){
	$('#areainfowindow').jqxWindow('open');
    areaSearchContent('area.jsp?rowBoundIndex='+rowBoundIndex);
}
 	 
function siteSearchContent(url) {
	 $.get(url).done(function (data) {
	     $('#siteinfowindow').jqxWindow('setContent', data);
	 }); 
} 
		
function areaSearchContent(url) {
	 $.get(url).done(function (data) {
	     $('#areainfowindow').jqxWindow('setContent', data);
	 }); 
}
 	 
function unitSearchContent(url) {
	$('#unitsearchwindow').jqxWindow('open');
	$.get(url).done(function(data) {
		$('#unitsearchwindow').jqxWindow('setContent', data);
		$('#unitsearchwindow').jqxWindow('bringToFront');
	});
}
 
function funExportBtn(){
}

function getClient(event){
	 var x= event.keyCode;
	 if(x==114){
	     $('#clientsearch1').jqxWindow('open');
	     clientSearchContent('clientINgridsearch.jsp?', $('#clientsearch1'));    
	 }
} 

function clientSearchContent(url) {
    $.get(url).done(function (data) {
	     $('#clientsearch1').jqxWindow('setContent', data);
   	}); 
}

function getsiteEst(rowBoundIndex,reftrno,id){
	 $('#sitewindow').jqxWindow('open');
	 var reftype=$('#reftype').val();
	 siteSearchContentEst("sitesearch.jsp?rowBoundIndex="+rowBoundIndex+"&reftrno="+reftrno+"&id="+id+"&reftype="+reftype);
}
	     	 
function siteSearchContentEst(url) {
	 $.get(url).done(function (data) {
	     $('#sitewindow').jqxWindow('setContent', data);
	 }); 
}
    
function funreload(event)
{
	var  trno=$("#quttrno").val();
	var  brhid=$("#cmbbranch").val();
	if(trno==""){
		$.messager.alert('Message','Select Quotation','warning');
		return 0;
	}
	 $("#overlay, #PleaseWait").show();
	 if($('#reftype').val()=="ENQ" || $('#reftype').val()=="SRVE"){
			$("#loadsubgriddata").load("estimationGrid.jsp?docno="+trno+"&check=1");
	 } 
	 
	 $("#loadgriddata").load("quotationGrid.jsp?docno="+trno+"&revision="+$('#revision').val()+"&check=1"+"&brhid="+brhid);
	 $("#loadsitegriddata").load("siteGrid.jsp?docno="+trno+"&check=1"+"&brhid="+brhid);
	 
	 if(parseInt($('#cmbscopegroup').val())==1){
   	  	$('#cmbscopegroupchange').attr('disabled', false );
   	  	$('#btnProcess').attr('disabled', false );
     }
}

function saveEst(revmsg){
	$('#btnval').val("SE");
	var rows1 = $("#qutDetSubGrid").jqxGrid('getrows');
  	var reftype=$("#reftype").val();
	var srno=0; 
	var actid=0,val=0,estgridlen=0;
  	for(var i=0 ; i < rows1.length ; i++){
  		var chk1 = rows1[i].desc1;
  		var chk2 = rows1[i].prodoc;
  		if((typeof(chk1)!="undefined" && typeof(chk1)!="NaN" && chk1!="") || (typeof(prodoc)!="undefined" && typeof(prodoc)!="NaN" && prodoc!="")){  
  			newTextBox = $(document.createElement("input"))
		       .attr("type", "dil")
		       .attr("id", "mate"+i)
		       .attr("name", "mate"+i)
		       .attr("hidden", "true"); 
	 
		    if(reftype=="DIR"){  
     		    srno=srno+1;
     	    }else{
     		    srno=rows1[i].sitesrno;
     	    }
		    newTextBox.val(rows1[i].desc1+" :: "+rows1[i].prodoc+" :: "+rows1[i].psrno+" :: "+rows1[i].unitdocno+" :: "+rows1[i].qty+" :: "+rows1[i].amount+" :: "+rows1[i].total+" :: "+rows1[i].margin+" :: "+rows1[i].nettotal+" :: "+actid+" :: "+rows1[i].site+" :: "+rows1[i].stypeid+" :: "+srno+" :: "+rows1[i].marginper+" :: "+rows1[i].scopeid+" :: "+rows1[i].scopeamount+" :: "+rows1[i].stdprice+" :: "+rows1[i].lbrchg+" :: "+rows1[i].scopestdcost+" :: " );
		    newTextBox.appendTo('form'); 
		    val++;
		    estgridlen++;
  		} 
  	}	
  	$('#estimationgrdlen').val(estgridlen);  
  	if(val==0){
  		$.messager.alert('Message','There is no data to update!!!','warning');     
	    return false;
  	}
  	$.messager.confirm('Message', revmsg+'<br><b>Do you want to save changes?<b>', function(r){  
			if(r==false) {
				return false; 
			} else {
				$('#frmqtDetails').submit();    
			    return 1;
			}
	}); 
}

function saveQot(revmsg){ 
	$('#btnval').val("SQ");
	var qut_nettotal=$('#qutnettotal').val();
	var estimation_total=$('#estimationtotal').val();
	if($('#reftype').val()=="ENQ"){
		if(qut_nettotal<estimation_total){
			$.messager.alert('Message','Amount Mismatch ','warning');   
		    return false;
		}
	}
	
  	var rows1 = $("#qutDetGrid").jqxGrid('getrows');
  	var val=0,quotgridlen=0;
  	for(var i=0 ; i < rows1.length ; i++){
		var chk1 = rows1[i].stypeid; 
		if(typeof(chk1)!="undefined" && typeof(chk1)!="NaN" && chk1!="" && chk1!="0"){
			newTextBox = $(document.createElement("input"))
			       .attr("type", "dil")
			       .attr("id", "service"+i)
			       .attr("name", "service"+i)
			       .attr("hidden", "true"); 
			    
			newTextBox.val(rows1[i].stypeid+" :: "+rows1[i].proname+" :: "+rows1[i].qty+" :: "+rows1[i].amount+" :: "+rows1[i].total+" :: "+rows1[i].desc1+" :: "+rows1[i].siteid+" :: "+rows1[i].unitid+" :: "+rows1[i].psrno+" :: "+rows1[i].scopeid+" :: "+rows1[i].scopeamount+" :: "+rows1[i].stdprice+" :: "+rows1[i].lbrchg+" :: "+rows1[i].scopestdcost+" :: ");
			newTextBox.appendTo('form');
			quotgridlen++;
			val++;
		}
	}  
  	$('#qutgridlen').val(quotgridlen);  
  	 
  	var rows2 = $("#siteGridID").jqxGrid('getrows');
	$('#sitegridlen').val(rows2.length);
	for(var i=0 ; i < rows2.length ; i++){
		newTextBox = $(document.createElement("input"))
		       .attr("type", "dil")
		       .attr("id", "site"+i)
		       .attr("name", "site"+i)
		       .attr("hidden", "true"); 
		    
		newTextBox.val(rows2[i].site+" :: "+rows2[i].areaid+" :: "+rows2[i].rowno+" :: ");
		newTextBox.appendTo('form');
	}
	  	
  	if(val==0){
  		$.messager.alert('Message','There is no data to update!!!','warning');           
	    return false;  
  	}
  	$.messager.confirm('Message', revmsg+'<br><b>Do you want to save changes?<b>', function(r){  
		if(r==false) {
			return false; 
		} else {
			$('#frmqtDetails').submit();
		    return 1;
		}
    }); 
}
function saveReQot()
{
	var  brhid=$("#cmbbranch").val();
	var enqno=document.getElementById("enqno").value;
	var reftype=$('#reftype').val(); 
	
	var rows1 = $("#qutDetGrid").jqxGrid('getrows');
	  var val=0;
	  for(var i=0 ; i < rows1.length ; i++){  
			var chk1 = rows1[i].stypeid; 
			if(typeof(chk1)!="undefined" && typeof(chk1)!="NaN" && chk1!="" && chk1!="0"){
			   val++;
			}
	  }  
	  if(val==0){
	  		$.messager.alert('Message','Please submit before reloading quotation!!!','warning');                  
		    return false;  
	  }
	  
	 $("#qutDetGrid").jqxGrid('clear');
	 $("#loadgriddata").load("quotationGrid.jsp?enqno="+enqno+"&reftype="+reftype+"&load=2"+"&check=1"+"&brhid="+brhid);
}

function fundisamt(){
	var  Total=parseFloat(document.getElementById('qutnettotal').value);
	var  disamt=parseFloat(document.getElementById('txtdiscount').value);
	var netval=parseFloat(Total)-parseFloat(disamt);
	funRoundAmt(netval,"txtnettotal");    
}
	
function disablebtn(){
}

function funchkrev(){
	if(document.getElementById("chkrev").checked){
		document.getElementById("hidchkrev").value = 1;
	} else{
		document.getElementById("hidchkrev").value = 0;
	}
}

function funchkestrev(){    
	if(document.getElementById("chkestrev").checked){
		document.getElementById("hidchkestrev").value = 1;        
	} else{
		document.getElementById("hidchkestrev").value = 0;
	}
}
	
function revisionvalidation(value){
	var revmsg="";
	var x = new XMLHttpRequest();
	x.onreadystatechange = function(){
		if(x.readyState == 4 && x.status == 200){
			var items = x.responseText.split('####');
			if(value=="Save Estimation"){
				if(document.getElementById("chkestrev").checked){
					revmsg="Quotation revision no is "+items[1]+"<br>Estimation revising to "+(parseInt(items[0])+1);
					saveEst(revmsg);
				}else{
					saveEst(revmsg);
				}
			}else if(value=="Save Quotation"){
				if(document.getElementById("chkrev").checked){
					revmsg="Estimation revision no is "+items[0]+"<br> Quotation revising to "+(parseInt(items[1])+1);
					saveQot(revmsg);
				}else{
					saveQot(revmsg);  
				}
			}else{}
		}else{}
	}
	x.open("GET","getRevisions.jsp?trno="+$('#quttrno').val());   
	x.send();   
}   
	
</script>
</head>

<body onload="setValues(); disablebtn();getBranch();">  
<form id="frmqtDetails" action="savequtdetails" method="post" autocomplete="off">
<div id="mainBG" class="homeContent" data-type="background"> 
<div class='hidden-scrollbar'>

<div class="master-container">

    <div class="sidebar-filters">
        <div class="sidebar-fixed-top">
            <div class="filter-card" style="padding: 10px; margin-bottom: 0;">
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
                </table>
            </div>

            <div class="filter-card">
                <table class="release-filter-table">
                    <tr>
                        <td class="label-cell">Quotation No</td>
                        <td>
                            <div class="search-input-wrapper">
                                <input type="text" id="qutno" name="qutno" readonly="readonly" placeholder="Double click to search" value='<s:property value="qutno"/>' onKeyDown="getQuotation(event);" ondblclick="getQuotation(event);">
                                <div class="search-icon"></div>
                            </div>
                        </td>
                    </tr>
                    <tr>
                        <td class="label-cell">Quotation</td>
                        <td>
                            <div class="search-input-wrapper">
                                <input type="text" id="qutname" name="qutname" readonly="readonly" placeholder="Double click to search" value='<s:property value="qutname"/>' onKeyDown="getQuotation(event);" ondblclick="getQuotation(event);">
                                <div class="search-icon"></div>
                            </div>
                            <input type="hidden" id="quttrno" name="quttrno" value='<s:property value="quttrno"/>' >
                        </td>
                    </tr>
                    <tr>
                        <td class="label-cell">ScopeGrp.</td>
                        <td>
                            <div style="display: flex; align-items: center; gap: 4px; width: 100%;">
                                <select id="cmbscopegroupchange" name="cmbscopegroupchange" style="flex: 1;" onchange="funscopegroupchange();" value='<s:property value="cmbscopegroupchange"/>'>
                                    <option value="">--Select--</option>
                                </select>
                                <input type="hidden" id="hidcmbscopegroupchange" name="hidcmbscopegroupchange" value='<s:property value="hidcmbscopegroupchange"/>'/>
                                <button type="button" class="btn-icon-inline" id="btnProcess" title="Scope Update" onclick="funProcessBtn();">
                                    <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" viewBox="0 0 24 24" fill="none" stroke="#64748b" stroke-width="2.5" stroke-linecap="round" stroke-linejoin="round"><path d="M21.5 2v6h-6M21.34 15.57a10 10 0 1 1-.59-10.87l5.25 4.68"/></svg>
                                </button>
                            </div>
                        </td>
                    </tr>
                </table>
                
                <div class="checkbox-center-row">
                    <input type="checkbox" id="chkestrev" name="chkestrev" value="" onchange="funchkestrev();" onclick="$(this).attr('value', this.checked ? 1 : 0)" /> 
                    <label for="chkestrev">Estimation Revision</label>
                    <input type="hidden" id="hidchkestrev" name="hidchkestrev" value='<s:property value="hidchkestrev"/>'/>
                </div>
                
                <div class="release-actions">
                    <button type="button" id="btnsaveest" name="btnsaveest" class="btn-primary btn-secondary" onclick="revisionvalidation(this.innerHTML);">Save Estimation</button>
                </div>
            </div>

            <div class="filter-card">
                <table class="release-filter-table">
                    <tr>
                        <td class="label-cell">Quot. Date</td>
                        <td>
                            <div id='quotdate' name='quotdate' value='<s:property value="quotdate"/>'></div>
                            <input type="hidden" id="hidquotdate" name="hidquotdate" value='<s:property value="hidquotdate"/>'/>
                        </td>
                    </tr>
                    <tr>
                        <td class="label-cell">Subject</td>
                        <td><input type="text" id="txtsubject" name="txtsubject" value='<s:property value="txtsubject"/>'></td>
                    </tr>
                    <tr>
                        <td class="label-cell">Client</td>
                        <td>
                            <div class="search-input-wrapper">
                                <input type="text" id="txtclient" name="txtclient" readonly="readonly" placeholder="Double click to search" onKeyDown="getClient(event);" ondblclick="getClient(event);">
                                <div class="search-icon"></div>
                            </div>
                            <input type="hidden" id="clientid" name="clientid">
                        </td>
                    </tr>
                    <tr>
                        <td class="label-cell">Remarks</td>
                        <td><textarea rows="4" id="txtremarks" name="txtremarks"><s:property value="txtremarks"/></textarea></td>
                    </tr>
                </table>

                <div class="checkbox-center-row">
                    <input type="checkbox" id="chkrev" name="chkrev" value="" onchange="funchkrev();" onclick="$(this).attr('value', this.checked ? 1 : 0)" /> 
                    <label for="chkrev">Quotation Revision</label>
                    <input type="hidden" id="hidchkrev" name="hidchkrev" value='<s:property value="hidchkrev"/>'/>
                </div>

                <div class="release-actions">
                    <button type="button" id="btnsavereqot" name="btnsavereqot" class="btn-primary btn-secondary" onclick="saveReQot();">Reload Quotation</button>
                    <button type="button" id="btnsaveqot" name="btnsaveqot" class="btn-primary" onclick="revisionvalidation(this.innerHTML);">Save Quotation</button>
                </div>
            </div>

            <input type="hidden" name="gridtext" id="gridtext" value='<s:property value="gridtext"/>' />   
            <input type="hidden" name="gridtext1" id="gridtext1" value='<s:property value="gridtext1"/>' />
            <input type="hidden" name="gridtext3" id="gridtext3" value='<s:property value="gridtext3"/>' />   
            <input type="hidden" id="estimationtotal" name="estimationtotal">
            <input type="hidden" id="qutnettotal" name="qutnettotal">
            <input type="hidden" id="qutgridlen" name="qutgridlen">
            <input type="hidden" id="estimationgrdlen" name="estimationgrdlen">
            <input type="hidden" id="sitegridlen" name="sitegridlen">
            <input type="hidden" id="hidtrno" name="hidtrno" value='<s:property value="hidtrno"/>'>
            <input type="hidden" id="msg" name="msg">
            <input type="hidden" id="cldocno" name="cldocno" value='<s:property value="cldocno"/>'>
            <input type="hidden" id="date" name="date" value='<s:property value="date"/>'>
            <input type="hidden" id="brhid" name="brhid" value='<s:property value="brhid"/>'>
            <input type="hidden" id="datas" name="datas" >
            <input type="hidden" id="reftype" name="reftype" value='<s:property value="reftype"/>'>
            <input type="hidden" id="revision" name="revision" value='<s:property value="revision"/>'>
            <input type="hidden" id="btnval" name="btnval" value='<s:property value="btnval"/>'>
            <input type="hidden" id="enqno" name="enqno" value='<s:property value="enqno"/>'>
            <input type="hidden" id="surtrno" name="surtrno" value='<s:property value="surtrno"/>'>
            <input type="hidden" id="productchk" name="productchk" value='<s:property value="productchk"/>'/>
            <input type="hidden" id="txtgridservicetypeid" name="txtgridservicetypeid" value='<s:property value="txtgridservicetypeid"/>' />  
            <input type="hidden" id="txtgridscopeid" name="txtgridscopeid" value='<s:property value="txtgridscopeid"/>' />
            <input type="hidden" id="txtgridqotservicetypeid" name="txtgridqotservicetypeid" value='<s:property value="txtgridqotservicetypeid"/>' />  
            <input type="hidden" id="txtgridqotscopeid" name="txtgridscopeid" value='<s:property value="txtgridqotscopeid"/>' />        
            <input type="hidden" name="txtgridscopeproduct" id="txtgridscopeproduct" value='<s:property value="txtgridscopeproduct"/>'>
            <input type="hidden" id="presalesscopeallowed" name="presalesscopeallowed" value='<s:property value="presalesscopeallowed"/>'/>
            <input type="hidden" id="txtcontrmode" name="txtcontrmode" value='<s:property value="txtcontrmode"/>'/>
            <input type="hidden" id="txtscopegroupchanged" name="txtscopegroupchanged" value='<s:property value="txtscopegroupchanged"/>'/>   
            <select id="cmbscopegroup" name="cmbscopegroup" hidden="true" value='<s:property value="cmbscopegroup"/>'><option value="">--Select--</option></select>
            <input type="hidden" id="hidcmbscopegroup" name="hidcmbscopegroup" value='<s:property value="hidcmbscopegroup"/>'/>

        </div>
    </div>

    <div class="main-content-area">
        
        <div class="grid-card">
            <div class="card-header">Estimation Details</div>
            <div id="loadsubgriddata">
                <jsp:include page="estimationGrid.jsp"></jsp:include> 
            </div>
        </div>

        <div class="grid-card">
            <div class="card-header">Quotation Details</div>
            <div id="loadgriddata">
                <jsp:include page="quotationGrid.jsp"></jsp:include> 
            </div>
        </div>

        <div class="summary-bar">
            <div class="summary-label">Discount</div>
            <div>
                <input type="text" id="txtdiscount" name="txtdiscount" style="width: 120px; text-align: right;" value='<s:property value="txtdiscount"/>' onblur="funRoundAmt(this.value,this.id);fundisamt();">
            </div>
            <div class="summary-label" style="margin-left: 20px;">Net Total</div>
            <div>
                <input type="text" id="txtnettotal" name="txtnettotal" readonly style="width: 120px; text-align: right;" value='<s:property value="txtnettotal"/>' onblur="funRoundAmt(this.value,this.id);">
            </div>
        </div>

        <div class="grid-card">
            <div class="card-header">Site Details</div>
            <div id="loadsitegriddata">
                <jsp:include page="siteGrid.jsp"></jsp:include> 
            </div>
        </div>

    </div>

</div>

<div id="quotwindow"><div></div></div>
<div id="sidesearchwndow"><div></div></div>
<div id="servicetypewindow"><div></div></div>
<div id="unitsearchwindow"><div></div></div>
<div id="sertypefowindow"><div></div></div>
<div id="siteinfowindow"><div></div></div>
<div id="clientsearch1"><div></div></div> 
<div id="sitewindow"><div></div></div>
<div id="sidesearchwndowqot"><div></div></div>
<div id="areainfowindow"><div></div></div>
<div id="scopesearchwindow"><div></div></div>

</div>
</div>
</form>
</body>
</html>