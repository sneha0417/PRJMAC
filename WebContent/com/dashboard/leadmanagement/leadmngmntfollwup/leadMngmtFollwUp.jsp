<jsp:include page="../../../../includes.jsp"></jsp:include>    
<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>GatewayERP(i)</title>
<link href="../../../../css/dashboard.css" media="screen" rel="stylesheet" type="text/css" />  

<script type="text/javascript">

	$(document).ready(function () {
		
		
		 $("#date").jqxDateTimeInput({ width: '125px', height: '15px',formatString:"dd.MM.yyyy"});
		 
		   $("#followupdate").jqxDateTimeInput({ width: '125px', height: '15px',formatString:"dd.MM.yyyy"});
		   
		   $("#fromdate").jqxDateTimeInput({ width: '125px', height: '15px',formatString:"dd.MM.yyyy"});
			 $("#todate").jqxDateTimeInput({ width: '125px', height: '15px',formatString:"dd.MM.yyyy"});
			
			 var fromdates=new Date($('#fromdate').jqxDateTimeInput('getDate'));
			 var onemounth=new Date(new Date(fromdates).setMonth(fromdates.getMonth()-1)); 
			  
		     $('#fromdate').jqxDateTimeInput('setDate', new Date(onemounth));
		     $('#todate').on('change', function (event) {
					
				   var fromdates=new Date($('#fromdate').jqxDateTimeInput('getDate'));
				 lead
				  // out date
				 	 var todates=new Date($('#todate').jqxDateTimeInput('getDate')); //del date
				 	 
				   if(fromdates>todates){
					   
					   $.messager.alert('Message','To Date Less Than From Date  ','warning');   
					 
				   return false;
				  }})
		   
		 $("body").prepend('<div id="overlay" class="ui-widget-overlay" style="z-index: 1; display: none;"></div>');
	     $("body").prepend("<div id='PleaseWait' style='display: none;position:absolute; z-index: 1;top:180px;right:550px;'><img src='../../../../icons/31load.gif'/></div>");

	     $('#salesmanwindow').jqxWindow({ width: '25%', height: '60%',  maxHeight: '62%' ,maxWidth: '60%' , title: 'Salesman Search'  , theme: 'energyblue', position: { x: 250, y: 120 }, keyboardCloseKey: 27});
		   $('#salesmanwindow').jqxWindow('close');
	     
		   
		   $('#txtsalesman').dblclick(function(){
		  	    $('#salesmanwindow').jqxWindow('open');
		   
		  	//  salesmanSearchContent('salesmansearch.jsp');
		  	  salesmanSearchContent('salesmanMasterSearch.jsp?', $('#salesmanwindow'));
	     });
	 
		   getCategory();
	});
	
	
	function getProcess() {
		var x = new XMLHttpRequest();
		x.onreadystatechange = function() {
			if (x.readyState == 4 && x.status == 200) {
				var items = x.responseText;
				items = items.split('####');
				
				var srno  = items[0].split(",");
				var process = items[1].split(",");
				var optionsbranch = '<option value="" selected>-- Select -- </option>';
				for (var i = 0; i < process.length; i++) {
					optionsbranch += '<option  value="' + srno[i].trim()+'">'
					+ process[i] + '</option>';
				}
				$("select#cmbprocess").html(optionsbranch);
				
			} else {}
		}
		x.open("GET","getProcess.jsp", true);
		x.send();
	}
	
	/* function getPriority() {
		var x = new XMLHttpRequest();
		x.onreadystatechange = function() {
			if (x.readyState == 4 && x.status == 200) {
				var items = x.responseText;
				items = items.split('####');
				
				var srno  = items[0].split(",");
				var process = items[1].split(",");
				var optionsbranch = '<option value="" selected>-- Select -- </option>';
				for (var i = 0; i < process.length; i++) {
					optionsbranch += '<option  value="' + srno[i].trim()+'">'
					+ process[i] + '</option>';
				}
				$("select#cmbpriority").html(optionsbranch);
				
			} else {}
		}
		x.open("GET","getPriority.jsp", true);
		x.send();
	} */
	
	
  
	
	function disable(){
		 
		 $('#cmbcategory').attr("disabled",true);
		 $('#date').jqxDateTimeInput({ disabled: true});
		 $('#cmbprocess').attr("disabled",true);
		 $('#cmbpriority').attr("disabled",true); 
		 $('#txtremarks').attr("readonly",true);
		 $('#btnupdate').attr("disabled",true);
		 $('#txtsalesman').attr("disabled",true);
		 $("#amcfollowupGrid").jqxGrid('clear');
		 $("#amcfollowupGrid").jqxGrid("addrow", null, {}); 
		 $("#amcfollowupGrid").jqxGrid({ disabled: true}); 
		
	}
	
	
	function funreload(event){
		disable();
		 var fromdate = $('#fromdate').val();
		 var todate = $('#todate').val();
		 var branchval = document.getElementById("cmbbranch").value;
		 var chkfollowup = $('#hidchckfollowup').val();
		 var followupdate = $('#followupdate').val();
		 var salesmanid=$('#cmbsalesman').val()
		 $("#overlay, #PleaseWait").show();  
		 $("#leadFollowupDiv").load("leadMngmtFollowupGrid.jsp?branchval="+branchval+"&followupdate="+followupdate+'&fromdate='+fromdate+'&todate='+todate+"&chkfollowup="+chkfollowup+"&check=1"+"&salesmanid="+salesmanid);
	}
	
	function funUpdate(event){     
		
		 var rdocno=$('#txtrdocno').val();
		 var date =  $('#date').val();
		 var remarks = $('#txtremarks').val();
	     var proid=$('#cmbprocess').val();
	     var priorityid=$("#cmbpriority").val();  
		 var branchid =$("#txtbrchid").val(); 
		 var userid=$("#txtuserid").val();
		 var clientacid=$("#hidcmbacgroup").val();
		 var catid=$("#hidcatid").val(); 
		 var pstatus=$("#cmbpriority").val();
		 var cmbcat=$("#cmbcategory").val();
		 var salid=$("#txtsalid").val();
		if(proid==''){
			 $.messager.alert('Message','Choose a Process.','warning');
			 return 0;
		 }
if(proid==3 && pstatus=="")
		{
	 $.messager.alert('Message','Choose a Status.','warning');
	 return 0;
		}
if(proid==4 && cmbcat=="")
{
$.messager.alert('Message','Choose a Category.','warning');
return 0;
}
if(proid==5 && salid=="")
{
$.messager.alert('Message','Select a Salesman.','warning');
return 0;
}
if(remarks==''){
			 $.messager.alert('Message','Please Enter Remarks.','warning');   
			 return 0;
		 }
		 $.messager.confirm('Message', 'Do you want to save changes?', function(r){
		     	if(r==false)
		     	  {
		     		return false; 
		     	  }
		     	else{
		     		
		     		saveGridData(rdocno,date,remarks,proid,priorityid,branchid,userid,clientacid,catid,salid);	
		     	}
		});
	}
	
	function followupcheck(){
		 if(document.getElementById("chckfollowup").checked){
			 document.getElementById("hidchckfollowup").value = 1; 
			 $('#cmbprocess').attr("disabled",false);
			/*  $('#cmbpriority').attr("disable",false); */
			 $('#followupdate').jqxDateTimeInput({ disabled: false});
			 $('#fromdate').jqxDateTimeInput({ disabled: true});
			 $('#todate').jqxDateTimeInput({ disabled: true});
		 }
		 else{
			 document.getElementById("hidchckfollowup").value = 0;
			 $('#followupdate').jqxDateTimeInput({ disabled: true});
			 $('#fromdate').jqxDateTimeInput({ disabled: false});
			 $('#todate').jqxDateTimeInput({ disabled: false});
		 }
	 }
		
	function getsalesman(event){

		var x= event.keyCode;
	 	 if(x==114){
	 		 $('#salesmanwindow').jqxWindow('open');
	 		// changeContent('salesmansearch.jsp');  
	 		 salesmanSearchContent('salesmanMasterSearch.jsp?', $('#salesmanwindow'));
	    	 }
	 	 else{
	 		 
	 		 }
	 	 }
	function salesmanSearchContent(url) {
		 $.get(url).done(function (data) {
		$('#salesmanwindow').jqxWindow('setContent', data);
	           	}); 
	 	}
	function saveGridData(rdocno,date,remarks,proid,priorityid,branchid,userid,clientacid,catid,salid){

		var x=new XMLHttpRequest();
		x.onreadystatechange=function(){
		if (x.readyState==4 && x.status==200){
	     			
				var items=x.responseText;
				if(parseInt(items)=="1")  
				{	
				 $('#cmbprocess').val('');
				$('#date').val(new Date());
				$('#txtbrchid').val('');
				$('#txtremarks').val('');
				$('#txtrdocno').val('');
				$('#txtcldocno').val('');
				$('#txtuserid').val('');
				$('#txtsalid').val('');
				$('#cmbpriority').val(''); 
				$('#txtsalesman').val('');
				
				$('#cmbcategory').val('');
				$('#hidcmbcategory').val('');
				$('#hidcmbacgroup').val(''); 
				$("#hidcatid").val('');
				
				
				$.messager.alert('Message', '  Record Successfully Updated ');
				funreload(event); 
				disable();
				}
				else
				{
				$.messager.alert('Message', '  Not Updated  ');
				}
				}
		}
    x.open("GET","saveData.jsp?trdocno="+rdocno+"&fldate="+date+"&remark="+remarks+"&bibpid="+proid+"&leadstatus="+priorityid+"&brchid="+branchid+"&userid="+userid+"&clientacid="+clientacid+"&catid="+catid+"&salid="+salid,true);			
	x.send();
			
	}
	
	function funtxtenable(value)
	{
		
		if(value=="3"){
			$('#cmbpriority').attr("disabled",false);
			$('#cmbcategory').attr("disabled",true);
			$('#txtsalesman').attr("disabled",true);
		}
		if(value=="4"){
			 $('#cmbcategory').attr("disabled",false);
			 $('#cmbpriority').attr("disabled",true);
			 $('#txtsalesman').attr("disabled",true);
		}
		if(value=="5"){
			 $('#cmbcategory').attr("disabled",true);
			 $('#cmbpriority').attr("disabled",true);
			 $('#txtsalesman').attr("disabled",false);
		}
		
	}
	
	
	
	function funExportBtn(){
	    

		//JSONToCSVCon(amcrenewalexcel, 'AMC Renewal Followup', true);
		   }
	  function getsalesmanonload(){
			
			var x=new XMLHttpRequest();
			x.onreadystatechange=function(){
			if (x.readyState==4 && x.status==200)
				{
				 	var res= x.responseText;
					 var ressplt=res.split("::");
					 var salname=ressplt[0].trim();
					 var salid=ressplt[1].trim();
				 	if(salid>0){
				 		document.getElementById("txtsalesman").value=salname;
				 		document.getElementById("txtsalid").value=salid;
						  }
					}
			       else
				  {}
		     }
		      x.open("GET",'salesmanonload.jsp',true);
		     x.send();
		    
		   }
	  
	  
	  function getSalesman() {
			var x = new XMLHttpRequest();
			x.onreadystatechange = function() {
				if (x.readyState == 4 && x.status == 200) {
					var items = x.responseText;
				//alert(items);
					items = items.trim().split('####');
					var salIdItems  = items[0].split(",");
					var salItems = items[1].split(",");
					var salusrlink= items[2].split(",");
					var optionssal="" ;
					var userid='<%=session.getAttribute("USERID").toString()%>';
					var first=salIdItems[0].trim();
					var frstsalusrlink=salusrlink[0].trim();
					/* if(userid!=first){
						optionssal += '<option value="" selected>--Select--</option>';
					} */
					for (var i = 0; i < salItems.length; i++) {
						optionssal += '<option value="' + salIdItems[i].trim() + '">'
								      + salItems[i] + '</option>';
						
					}
					if(userid!=frstsalusrlink){
					optionssal += '<option value="a">All</option>';
					}
					$("select#cmbsalesman").html(optionssal);
					 if ($('#hidcmbsalesman').val() != null) {
						$('#cmbsalesman').val($('#hidcmbsalesman').val());
					} 
					 if(userid==frstsalusrlink){
							$('#cmbsalesman').val(first);
					}
					 else{
						 $('#cmbsalesman').val("a");
					 }
				} else {
					//alert("Error");
				}
			}
			x.open("GET",'salesmanonload.jsp', true);
			x.send();
		}
	  function getCategoryAccountGroup(a) {
			
			var x = new XMLHttpRequest();
			x.onreadystatechange = function() {
				if (x.readyState == 4 && x.status == 200) {
					var items = x.responseText.trim();
					var dat=items.split("###");
					
				    $('#hidcmbacgroup').val(dat[0]);
				    $('#hidcatid').val(dat[1]);
					/* if ($('#hidcmbacgroup').val() != "") {
						$('#cmbacgroup').val($('#hidcmbacgroup').val());
					} */
				} else {
				}
			}
			x.open("GET", "getCategoryAccountGroup.jsp?category="+a, true);
			x.send();
		} 
	  
	  function getCategory() {
			 
			var x = new XMLHttpRequest();
			x.onreadystatechange = function() {
				if (x.readyState == 4 && x.status == 200) {
					var items = x.responseText;
					items = items.split('####');
					var categoryItems = items[0].split(",");
					var categoryIdItems = items[1].split(",");
					var optionscategory = '<option value="">--Select--</option>';
					for (var i = 0; i < categoryItems.length; i++) {
						optionscategory += '<option value="' + categoryIdItems[i] + '">'
								+ categoryItems[i] + '</option>';
					}
					$("select#cmbcategory").html(optionscategory);
					
				} else {
				}
				//alert("=========="+$('#hidcmbcategory').val());
				if ($('#hidcmbcategory').val() != null) {
					$('#cmbcategory').val($('#hidcmbcategory').val());
				}
			}
			x.open("GET", "getCategory.jsp", true);
			x.send();
		}

		
</script>

<style>
/* ===== GLOBAL RESET ===== */
html, body {
    height: 100%;
    margin: 0;
    padding: 0;
    overflow: hidden; /* Prevents the whole page from double-scrolling */
    background-color: #f4f7f9;
    font-family: Tahoma, Arial, sans-serif; /* Safe native fonts */
}

#mainBG, .hidden-scrollbar {
    height: 100%;
}

table, td, th, input, select, textarea, button, span, div, label, p {
    font-family: inherit; /* Allows your app's native fonts to cascade properly */
}

/* ===== THE FIXED SIDEBAR ===== */
.fixed-sidebar-container {
    position: fixed; 
    top: 0;                   
    bottom: 0; 
    left: 0;
    width: 310px; 
    overflow-y: auto; 
    background: #fff;
    border-right: 1px solid #e1e8ed;
    box-shadow: 2px 0 8px rgba(0,0,0,.05);
    z-index: 10; /* POPUP FIX: Search windows will float over this */
}

.fixed-sidebar-container::-webkit-scrollbar {
    width: 6px;
}
.fixed-sidebar-container::-webkit-scrollbar-track {
    background: transparent;
}
.fixed-sidebar-container::-webkit-scrollbar-thumb {
    background-color: #cbd5e1;
    border-radius: 10px;
}

.sidebar-content-padding {
    padding: 15px;
    padding-bottom: 100px; 
}

/* ===== INDEPENDENT SCROLLABLE RIGHT COLUMN ===== */
.scrollable-column {
    position: absolute;
    top: 0;
    bottom: 0;
    left: 0;
    right: 0;
    overflow-y: auto;
}
.scrollable-column::-webkit-scrollbar {
    width: 8px;
}
.scrollable-column::-webkit-scrollbar-track {
    background: #f0f4f8;
}
.scrollable-column::-webkit-scrollbar-thumb {
    background-color: #cbd5e1;
    border-radius: 10px;
}

/* ===== CARDS & HEADERS ===== */
.filter-card {
    background: #f8fafc;
    border: 1px solid #e3e8ee;
    border-radius: 12px;
    padding: 15px 12px;
    margin-bottom: 15px;
}

.card-header {
    font-size: 13px; 
    font-weight: 700; 
    color: #334155; 
    margin-bottom: 10px; 
    border-bottom: 1px solid #e3e8ee;
    padding-bottom: 6px;
}

/* ===== TABLES & LABELS ===== */
/* Forces a tighter, balanced vertical gap between rows */
.release-filter-table td {
    padding-bottom: 8px !important; /* Dialed down from 15px */
    vertical-align: middle;
}

/* Removes the padding from the very last row */
.release-filter-table tr:last-child td {
    padding-bottom: 0 !important;
}

.release-filter-table .label-cell {
    text-align: right;
    padding-right: 12px;
    font-size: 12px; 
    color: #4e5e71;
    font-weight: 600;
    width: 100px; 
    white-space: nowrap; 
    line-height: 1.2;
}

/* ===== UNIFORM INPUTS ===== */
input[type="text"], select,
.release-filter-table input[type="text"],
.release-filter-table select {
    width: 100%;
    height: 28px; /* INCREASED from 24px so the text isn't squished */
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

.release-filter-table input[type="checkbox"] {
    width: auto;
    height: auto;
    margin: 0;
    vertical-align: middle;
    cursor: pointer;
}

textarea, .release-filter-table textarea {
    width: 100%;
    padding: 6px 8px;
    border: 1px solid #ccd6e0;
    border-radius: 4px;
    font-size: 12px;
    background-color: #ffffff;
    box-sizing: border-box;
    color: #333;
    resize: none;
}

/* ===== STRICT DISABLED & READONLY STYLING ===== */
input[readonly], select[readonly], textarea[readonly],
input:disabled, select:disabled, textarea:disabled,
input[disabled="true"], select[disabled="true"], textarea[disabled="true"] {
    background-color: #e2e8f0 !important; /* A darker, very obvious grey */
    color: #64748b !important; /* Faded text */
    cursor: not-allowed !important; /* Forces the red circle/slash 'locked' icon */
    border-color: #cbd5e1 !important;
    opacity: 1 !important; /* Prevents Safari/Chrome from washing out the color */
}

/* ===== SEARCH INFRASTRUCTURE (No Clear Button) ===== */
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

/* jqx date containers */
.release-filter-table div[id^="fromdate"],
.release-filter-table div[id^="todate"],
.release-filter-table div[id^="followupdate"],
.release-filter-table div[id^="date"] {
    width: 100%;
}

/* ===== BUTTONS ===== */
.btn-submit {
    width: 100%;
    height: 30px;
    padding: 0 12px;
    background: #2563eb;
    color: #fff;
    border: none;
    border-radius: 4px;
    font-size: 13px;
    font-weight: 600;
    cursor: pointer;
    line-height: 30px;
    margin-top: 5px;
}
.btn-submit:hover {
    background: #1d4ed8;
}
.release-actions {
    display: flex;
    justify-content: center;
    margin-top: 15px;
}
</style>
</head>
<body onload="getBranch();getProcess();disable();followupcheck();getSalesman();">
<div id="mainBG" class="homeContent" data-type="background"> 
<div class='hidden-scrollbar'>

<table width="100%" cellspacing="0" cellpadding="0" style="height: 100%;">
<tr>

<!-- Spacer Cell: Keeps the layout from collapsing -->
<td width="310" style="width: 310px; min-width: 310px; padding: 0;">
    
    <!-- THE FIXED SIDEBAR -->
    <div class="fixed-sidebar-container">
        <div class="sidebar-content-padding">
            
            <div class="filter-card">
                <jsp:include page="../../heading.jsp"></jsp:include>
            </div>

            <!-- Primary Filters Card -->
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
                        <td class="label-cell"></td>
                        <td>
                            <div style="display: flex; align-items: center; gap: 5px; margin-bottom: 2px;">
                                <input type="checkbox" id="chckfollowup" name="chckfollowup" value="" onchange="followupcheck();" onclick="$(this).attr('value', this.checked ? 1 : 0)" /> 
                                <label for="chckfollowup" style="font-size: 11.5px; font-weight: 600; color: #4e5e71; cursor: pointer;">Enable FollowUp</label>
                            </div>
                        </td>
                    </tr>
                    <tr>
                        <td class="label-cell">FollowUp Date</td>
                        <td><div id="followupdate" name="followupdate" value='<s:property value="followupdate"/>'></div></td>
                    </tr>
                    <tr>
                        <td class="label-cell">Salesman (Grp)</td>
                        <td>
                            <select id="cmbsalesman" name="cmbsalesman" value='<s:property value="cmbsalesman"/>'>
                                <option value="">--Select--</option>
                            </select>
                        </td>
                    </tr>
                </table>
            </div>

            <!-- Detail Filters Card -->
            <div class="filter-card">
                <table class="release-filter-table">
                    <tr>
                        <td class="label-cell">Process</td>
                        <td>
                            <select name="cmbprocess" id="cmbprocess" onchange="funtxtenable(value);" value='<s:property value="cmbprocess"/>'></select>
                        </td>
                    </tr>
                    <tr>
                        <td class="label-cell">Salesman</td>
                        <td>
                            <div class="search-input-wrapper">
                                <input type="text" name="txtsalesman" id="txtsalesman" placeholder="Double click to search" readonly="readonly" onKeyDown="getsalesman(event);" ondblclick="getsalesman(event);" value='<s:property value="txtsalesman"/>'>
                                <div class="search-icon"></div>
                            </div>
                        </td>
                    </tr>
                    <tr>
                        <td class="label-cell">Status</td>
                        <td>
                            <select name="cmbpriority" id="cmbpriority" value='<s:property value="cmbpriority"/>'>
                                <option value="">--Select--</option>
                                <option value="1">Cold</option>
                                <option value="2">Warm</option>
                                <option value="3">Hot</option>
                            </select>
                        </td>
                    </tr>
                    <tr>
                        <td class="label-cell">Category</td>
                        <td>
                            <select id="cmbcategory" name="cmbcategory" onchange="getCategoryAccountGroup(this.value);" value='<s:property value="cmbcategory"/>'>
                                <option value="">--Select--</option>
                            </select>
                        </td>
                    </tr>
                    <tr>
                        <td class="label-cell">Date</td>
                        <td><div id="date" name="date" value='<s:property value="date"/>'></div></td>
                    </tr>
                    <tr>
                        <td class="label-cell">Remarks</td>
                        <td><input type="text" id="txtremarks" name="txtremarks" value='<s:property value="txtremarks"/>'/></td>
                    </tr>
                </table>

                <div class="release-actions">
                    <button type="button" class="btn-submit" id="btnupdate" name="btnupdate" onclick="funUpdate(event);">Update</button>
                </div>
            </div>

            <!-- All Hidden Fields -->
            <input type="hidden" id="hidchckfollowup" name="hidchckfollowup" value='<s:property value="hidchckfollowup"/>'/>
            <input type="hidden" id="hidcmbsalesman" name="hidcmbsalesman" value='<s:property value="hidcmbsalesman"/>'/>
            <input type="hidden" id="hidcmbcategory" name="hidcmbcategory" value='<s:property value="hidcmbcategory"/>'/>
            <input type="hidden" id="hidcatid" name="hidcatid" value='<s:property value="hidcatid"/>'/>
            <input type="hidden" id="hidcmbacgroup" name="hidcmbacgroup" value='<s:property value="hidcmbacgroup"/>'/>
            <input type="hidden" id="txtdocno" name="txtdocno" value='<s:property value="txtdocno"/>'/>
            <input type="hidden" id="txtbranch" name="txtbranch" value='<s:property value="txtbranch"/>'/>
            <input type="hidden" id="txtsalid" name="txtsalid" value='<s:property value="txtsalid"/>'/>
            <input type="hidden" id="txtrdocno" name="txtrdocno" value='<s:property value="txtrdocno"/>'/>
            <input type="hidden" id="txtbrchid" name="txtbrchid" value='<s:property value="txtbrchid"/>'/>
            <input type="hidden" id="txtuserid" name="txtuserid" value='<s:property value="txtuserid"/>'/>

        </div>
    </div>

</td>

<!-- Main Grid Cell (Content Area) -->
<td style="height: 100%; vertical-align: top; position: relative; padding: 0; background: #fff;">
    <!-- Independent Right Side Scroller -->
    <div class="scrollable-column">
        <div style="padding: 15px;">
            <table width="100%">
                <tr>
                    <td>
                        <div id="leadFollowupDiv">
                            <jsp:include page="leadMngmtFollowupGrid.jsp"></jsp:include>
                        </div>
                        <br/>
                    </td>
                </tr>
                <tr>
                    <td>
                        <div id="detailDiv">
                            <jsp:include page="leadMngmtDetailGrid.jsp"></jsp:include>
                        </div>
                    </td>
                </tr>
            </table>
        </div>
    </div>
</td>

</tr>
</table>

<!-- Modal Containers -->
<div id="salesmanwindow">
    <div></div>
</div>

</div>
</div>
</body>
</html>