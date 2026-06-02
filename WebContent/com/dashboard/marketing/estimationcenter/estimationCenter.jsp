
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
<%-- <script type="text/javascript" src="../../js/dashboard.js"></script> --%> 

<style type="text/css">
 
.myButtons {
	-moz-box-shadow:inset 0px -1px 3px 0px #91b8b3;
	-webkit-box-shadow:inset 0px -1px 3px 0px #91b8b3;
	box-shadow:inset 0px -1px 3px 0px #91b8b3;
	background:-webkit-gradient(linear, left top, left bottom, color-stop(0.05, #768d87), color-stop(1, #6c7c7c));
	background:-moz-linear-gradient(top, #768d87 5%, #6c7c7c 100%);
	background:-webkit-linear-gradient(top, #768d87 5%, #6c7c7c 100%);
	background:-o-linear-gradient(top, #768d87 5%, #6c7c7c 100%);
	background:-ms-linear-gradient(top, #768d87 5%, #6c7c7c 100%);
	background:linear-gradient(to bottom, #768d87 5%, #6c7c7c 100%);
	filter:progid:DXImageTransform.Microsoft.gradient(startColorstr='#768d87', endColorstr='#6c7c7c',GradientType=0);
	background-color:#768d87;
	border:1px solid #566963;
	display:inline-block;
	cursor:pointer;
	color:#ffffff;
	
	font-size:8pt;
	
	padding:3px 17px;
	text-decoration:none;
	text-shadow:0px -1px 0px #2b665e;
}
.myButtons:hover {
	background:-webkit-gradient(linear, left top, left bottom, color-stop(0.05, #6c7c7c), color-stop(1, #768d87));
	background:-moz-linear-gradient(top, #6c7c7c 5%, #768d87 100%);
	background:-webkit-linear-gradient(top, #6c7c7c 5%, #768d87 100%);
	background:-o-linear-gradient(top, #6c7c7c 5%, #768d87 100%);
	background:-ms-linear-gradient(top, #6c7c7c 5%, #768d87 100%);
	background:linear-gradient(to bottom, #6c7c7c 5%, #768d87 100%);
	filter:progid:DXImageTransform.Microsoft.gradient(startColorstr='#6c7c7c', endColorstr='#768d87',GradientType=0);
	background-color:#6c7c7c;
}
.myButtons:active {
	position:relative;
	top:1px;
}

.bicon {
    background-color: #ECF8E0;
	width: 1em;
	height: 1em;
	border: none;
}

</style>
<style>
/* ===== GLOBAL RESET & STRICT FONT ENFORCER ===== */
html, body, table, td, th, input, select, textarea, button, span, div, label {
    margin: 0;
    padding: 0;
    font-family: 'Segoe UI', 'Roboto', 'Arial', sans-serif !important;
}

body {
    background-color: #f4f7f9;
}

/* ===== WIDENED STICKY SIDEBAR ===== */
.sticky-sidebar-container {
    position: -webkit-sticky; 
    position: sticky;
    top: 0;                   
    height: 100vh;            
    overflow-y: auto;         
    width: 310px; 
    background: #fff;
    border-right: 1px solid #e1e8ed;
    box-shadow: 2px 0 8px rgba(0,0,0,.05);
    box-sizing: border-box;
}

.sticky-sidebar-container::-webkit-scrollbar {
    width: 6px;
}
.sticky-sidebar-container::-webkit-scrollbar-track {
    background: transparent;
}
.sticky-sidebar-container::-webkit-scrollbar-thumb {
    background-color: #cbd5e1;
    border-radius: 10px;
}

.sidebar-content-padding {
    padding: 15px;
    padding-bottom: 60px; 
}

/* Cards */
.filter-card {
    background: #f8fafc;
    border: 1px solid #e3e8ee;
    border-radius: 12px;
    padding: 15px 12px;
    margin-bottom: 15px;
}

/* Specific styling for the View Action Card */
.view-actions-container {
    display: flex;
    flex-wrap: wrap;
    gap: 8px;
    justify-content: center;
}
.view-actions-container .btn-submit {
    flex: 1;
    min-width: 45%; /* Makes buttons sit nicely side-by-side or stack */
}
.view-actions-container .btn-full {
    flex: 100%;
}

/* Tables */
.release-filter-table {
    width: 100%;
    border-spacing: 0 12px; 
}

/* WIDENED LABELS TO PREVENT WRAPPING */
.release-filter-table .label-cell {
    text-align: right;
    padding-right: 12px;
    font-size: 11.5px; 
    color: #4e5e71;
    font-weight: 600;
    width: 110px; 
    white-space: nowrap; 
    line-height: 1.2;
}

/* ===== UNIFORM INPUTS & PINK-COLOR KILLER ===== */
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

/* Fixes browser autofill yellow/pink colors */
input:-webkit-autofill {
    -webkit-box-shadow: 0 0 0 30px white inset !important;
}

textarea, .release-filter-table textarea {
    width: 100%;
    padding: 4px 8px;
    border: 1px solid #ccd6e0;
    border-radius: 4px;
    font-size: 12px;
    background-color: #ffffff;
    box-sizing: border-box;
    color: #333;
    font-family: inherit;
    resize: none;
}

/* Readonly fields get a subtle grey, not pink */
input[readonly], select[readonly], textarea[readonly],
input:disabled, select:disabled, textarea:disabled,
.release-filter-table input[readonly] {
    background-color: #f8fafc !important; 
    color: #555;
    cursor: default;
}

/* ===== DOUBLE-CLICK SEARCH INFRASTRUCTURE ===== */
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

/* Sleek, Native SVG Clear Button */
.btn-clear-inline {
    background: transparent;
    border: none;
    cursor: pointer;
    padding: 2px 2px 2px 6px; 
    display: flex;
    align-items: center;
    justify-content: center;
}
.btn-clear-inline svg {
    opacity: 0.6;
    transition: opacity 0.2s;
}
.btn-clear-inline:hover svg {
    opacity: 1;
    stroke: #dc2626; 
}

/* jqx date/time containers */
.release-filter-table div[id^="fromdate"],
.release-filter-table div[id^="todate"] {
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
}

.btn-submit:hover {
    background: #1d4ed8;
}

.btn-secondary {
    background: #64748b;
}
.btn-secondary:hover {
    background: #475569;
}

.release-actions {
    display: flex;
    gap: 10px;
    justify-content: center;
    margin-top: 20px;
}
</style>
<script type="text/javascript">

$(document).ready(function () {
	
	
	 
	  $("body").prepend('<div id="overlay" class="ui-widget-overlay" style="z-index: 1; display: none;"></div>');
	     $("body").prepend("<div id='PleaseWait' style='display: none;position:absolute; z-index: 1;top:180px;right:550px;'><img src='../../../../icons/31load.gif'/></div>");

	      
			$('#userinfowindow').jqxWindow({ width: '25%', height: '60%',  maxHeight: '85%' ,maxWidth: '80%' ,title: 'User Search' , position: { x: 250, y: 60 }, keyboardCloseKey: 27});
			$('#userinfowindow').jqxWindow('close');
			
	     $('#clientsearch1').jqxWindow({ width: '50%', height: '55%',  maxHeight: '85%' ,maxWidth: '80%' ,title: 'Client Search' , position: { x: 250, y: 120 }, keyboardCloseKey: 27});
		  $('#clientsearch1').jqxWindow('close');
		  
		     
		     $("#fromdate").jqxDateTimeInput({ width: '125px', height: '15px',formatString:"dd.MM.yyyy"});
			 $("#todate").jqxDateTimeInput({ width: '125px', height: '15px',formatString:"dd.MM.yyyy"});
			 var fromdates=new Date($('#fromdate').jqxDateTimeInput('getDate'));
			 var onemounth=new Date(new Date(fromdates).setMonth(fromdates.getMonth()-1)); 
			    
		     $('#fromdate').jqxDateTimeInput('setDate', new Date(onemounth));
			 $('#todate').on('change', function (event) {
					
				   var fromdates=new Date($('#fromdate').jqxDateTimeInput('getDate'));
				 
				 	 
				   if(fromdates<todates){
					   
					   $.messager.alert('Message','To Date Less Than From Date  ','warning');   
					 
				   return false;
				  }   
			 });
	 
	 
     $('#txtclient').dblclick(function(){
		   
    	 $('#clientsearch1').jqxWindow('open');
    	 clientSearchContent('clientINgridsearch.jsp?', $('#clientsearch1')); 
		   		
		 });
	 
     $('#txtuser').dblclick(function(){
		   
    	 $('#userinfowindow').jqxWindow('open');
    	 userSearchContent('userSearch.jsp');
		   		
		 });
     
        
     	  
});


function getclinfo(event){
	 var x= event.keyCode;
	 if(x==114){
	  $('#clientsearch1').jqxWindow('open');
	 clientSearchContent('clientINgridsearch.jsp?', $('#clientsearch1'));    }
	 else{
		 }
	 } 
     function clientSearchContent(url) {
           
               $.get(url).done(function (data) {
  
	           $('#clientsearch1').jqxWindow('setContent', data);

    	}); 
         	}

     function funExportBtn(){
    	   //$("#jqxprojectwiseGrid").jqxGrid('exportdata', 'xls', 'ProjectWise Balance Report');
    	   JSONToCSVCon(enqdata,'Estimation Center',true);  
    }
    

function funreload()
{

     var id=1;
  
    if(id>0){
    	
    	gridload(id);
    }
     
	}
	
		

	 function gridload(id){
		 
		 var clientid=$('#clientid').val();
		 var fromdate=$('#fromdate').val();
		 var todate=$('#todate').val();
		 var barchval = document.getElementById("cmbbranch").value;
	
		 
		 $("#estcentergrid").jqxGrid('clear'); 
			
		 $("#overlay, #PleaseWait").show();
			 $("#estcenterdiv").load("estimationCenterGrid.jsp?barchval="+barchval+"&fromdate="+fromdate+"&todate="+todate+"&clientid="+clientid+"&id="+id);
		
		 
	 }
	 
	 
		
	
      function getUser(){
    	  
    	  var x= event.keyCode;
    	  
 		 if(x==114){
		  $('#userinfowindow').jqxWindow('open');
		  
		  userSearchContent('userSearch.jsp');
		  
	 	 }
 		 else{
 			 }
 		 }
	 	 
	function userSearchContent(url) {
		 $.get(url).done(function (data) {
			 
	$('#userinfowindow').jqxWindow('setContent', data);

	        	}); 
		}
	
	
function save(){

	var reftrno=document.getElementById("reftrno").value;
    var brhid1=document.getElementById("brhid1").value;
    var refdtype=document.getElementById("refdtype").value;
    var userid=document.getElementById("userid").value; 
    var amount=document.getElementById("txtamount").value;
    var remark=document.getElementById("txtremark").value;
   
	 if(userid=="")
		{
	    	$.messager.alert('Message',"select A User");
		
		return 0;
		}
		
		var x=new XMLHttpRequest();
		x.onreadystatechange=function(){
		if (x.readyState==4 && x.status==200)
			{
			 	var items= x.responseText;
			 	 items=items.split('###');
			 	 var res=items[0];
			 	if(res>0){
					   $.messager.alert('Message',"Saved Successfully");
					     
					   document.getElementById("reftrno").value="";
					   document.getElementById("brhid1").value="";
					   document.getElementById("refdtype").value="";
					   document.getElementById("userid").value="";
					   document.getElementById("txtuser").value="";
					   document.getElementById("txtamount").value="";
					   document.getElementById("txtremark").value="";
			             $("#txtuser").attr("placeholder", "press F3 for Search");
			           
			         
					  }
			 	else{
			 		$.messager.alert('Message',"Not Updated");
			 	}
			 	 
				}
		       else
			  {}
	     }      
	      x.open("GET","saveData.jsp?reftrno="+reftrno+"&brhid1="+brhid1+"&refdtype="+refdtype+"&userid="+userid+"&remark="+remark+"&amount="+amount,true);
	     x.send();
	    
	   }
	   
	   function funClear(){
			$("#estcentergrid").jqxGrid('clear'); 
			
			
		   document.getElementById("txtclient").value="";
		   document.getElementById("clientid").value="0";
		   $("#txtclient").attr("placeholder", "press F3 for Search");
		   
		 
		   
	   }
	function disablebtn()
	{
		 $('#btnenquiry').attr("disabled",true);
		 $('#btnsurvey').attr("disabled",true);
		 $('#btnservicereport').attr("disabled",true);
		 $('#txtuser').attr("disabled",true); 
		 $('#btnsave').attr("disabled",true);
		 $('#txtamount').attr("disabled",true);
		 $('#txtremark').attr("disabled",true);
	}
	function btnsurvey()
	{
		var surdocno=document.getElementById("surveydocno").value;
	
		var path1="com/project/execution/surveyDetails/surveydet.jsp";
		 var name="Survey Details";
			 var url=document.URL;
			var reurl=url.split("com");

		  window.parent.formName.value="Survey Details";
		  window.parent.formCode.value="SUR";
		  var detName="Survey Details";
		  
		  var path= path1+"?modes=view&surdocno="+surdocno;
		 
		   top.addTab( detName,reurl[0]+""+path);
	}
	function btnservicereport()
	{
		var reportdocno=document.getElementById("reportdocno").value;
		
		var url=document.URL;
		var reurl=url.split("com/");
		window.parent.formName.value="Service Report";
		window.parent.formCode.value="SRVE";
		var detName= "Service Report";
		 var path1='com/project/execution/serviceReport/serviceReport.jsp';
		  
		  var path= path1+"?modes=view&reportdocno="+reportdocno;
		 
		   top.addTab( detName,reurl[0]+""+path);
	}
	function btnenquiry()
	{
		var enqdocno=document.getElementById("enqdocno").value;
		var brhid1=document.getElementById("brhid1").value;
		 var path1="com/operations/marketing/enquirynew/enquiry.jsp";
			 var name="Enquiry";
			 var url=document.URL;
			var reurl=url.split("com");

		  window.parent.formName.value="Enquiry";
		  window.parent.formCode.value="ENQ";
		  var detName="Enquiry";
		  
		  var path= path1+"?modes=view&enqdocno="+enqdocno+"&brhid="+brhid1;
		 
		   top.addTab( detName,reurl[0]+""+path);
	}
</script>
</head>
<body onload="getBranch();disablebtn();">
<div id="mainBG" class="homeContent" data-type="background"> 
<div class='hidden-scrollbar'>

<table width="100%" cellspacing="0" cellpadding="0">
<tr>

<!-- Widened Sidebar Cell -->
<td width="310" style="width: 310px; min-width: 310px; vertical-align: top; padding: 0;">
    
    <div class="sticky-sidebar-container">
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
                        <td class="label-cell">Client</td>
                        <td>
                            <div style="display: flex; width: 100%; align-items: center; gap: 4px;">
                                <div class="search-input-wrapper" style="flex: 1;">
                                    <input type="text" name="txtclient" id="txtclient" value='<s:property value="txtclient"/>' readonly="readonly" placeholder="Double click to search" onKeyDown="getclinfo(event);" ondblclick="getclinfo(event);" />
                                    <div class="search-icon"></div>
                                </div>
                                <button type="button" class="btn-clear-inline" id="clear" title="Clear" onclick="funClear()"> 
                                    <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" viewBox="0 0 24 24" fill="none" stroke="#64748b" stroke-width="2.5" stroke-linecap="round" stroke-linejoin="round"><line x1="18" y1="6" x2="6" y2="18"></line><line x1="6" y1="6" x2="18" y2="18"></line></svg>
                                </button>
                            </div>
                            <input type="hidden" id="clientid" name="clientid" value='<s:property value="clientid"/>'>
                        </td>
                    </tr>

                    <tr>
                        <td colspan="2" align="center">
                            <label id="test" class="branch" style="font-weight: bold; color: #2563eb; font-size: 11px; display: block; min-height: 14px; margin: 4px 0;"></label>
                        </td>
                    </tr>

                </table>
            </div>

            <!-- View Actions Card -->
            <div class="filter-card">
                <div style="font-size: 11px; font-weight: 600; color: #4e5e71; margin-bottom: 10px; text-transform: uppercase; letter-spacing: 0.5px;">View</div>
                <div class="view-actions-container">
                    <button type="button" id="btnenquiry" name="btnenquiry" class="btn-submit btn-secondary" onclick="btnenquiry();">Enquiry</button>
                    <button type="button" id="btnsurvey" name="btnsurvey" class="btn-submit btn-secondary" onclick="btnsurvey();">Survey</button>
                    <button type="button" id="btnservicereport" name="btnservicereport" class="btn-submit btn-secondary btn-full" onclick="btnservicereport();">Service Report</button>
                </div>
            </div>

            <!-- Assignment/Details Card -->
            <div class="filter-card">
                <table class="release-filter-table">

                    <tr>
                        <td class="label-cell">Assign User</td>
                        <td>
                            <div class="search-input-wrapper">
                                <input type="text" name="txtuser" id="txtuser" value='<s:property value="txtuser"/>' readonly="readonly" placeholder="Double click to search" onKeyDown="getUser(event);" ondblclick="getUser(event);" />
                                <div class="search-icon"></div>
                            </div>
                            <input type="hidden" id="userid" name="userid" value='<s:property value="userid"/>'>
                        </td>
                    </tr>

                    <tr>
                        <td class="label-cell">Amount</td>
                        <td><input type="text" name="txtamount" id="txtamount" value='<s:property value="txtamount"/>'></td>
                    </tr>

                    <tr>
                        <td class="label-cell">Remarks</td>
                        <td><input type="text" name="txtremark" id="txtremark" value='<s:property value="txtremark"/>'></td>
                    </tr>

                </table>
            </div>

            <!-- Primary Action -->
            <div class="release-actions">
                <button type="button" id="btnsave" name="btnsave" class="btn-submit" onclick="save();">Save</button>
            </div>

            <!-- Hidden Fields -->
            <input type="hidden" id="trno" name="trno" value='<s:property value="trno"/>'>
            <input type="hidden" id="dtype" name="dtype" value='<s:property value="dtype"/>'>
            <input type="hidden" id="reportdocno" name="reportdocno" value='<s:property value="reportdocno"/>'>
            <input type="hidden" id="surveydocno" name="surveydocno" value='<s:property value="surveydocno"/>'>
            <input type="hidden" id="enqdocno" name="enqdocno" value='<s:property value="enqdocno"/>'>
            <input type="hidden" id="reftrno" name="reftrno" value='<s:property value="reftrno"/>'>
            <input type="hidden" id="brhid1" name="brhid1" value='<s:property value="brhid1"/>'>
            <input type="hidden" id="refdtype" name="refdtype" value='<s:property value="refdtype"/>'>

        </div>
    </div>

</td>

<!-- Grid Cell -->
<td style="vertical-align: top; padding: 15px; background: #fff;">
    <table width="100%">
        <tr>
            <td>
                <div id="estcenterdiv">
                    <jsp:include page="estimationCenterGrid.jsp"></jsp:include> 
                </div>
            </td>
        </tr>
    </table>
</td>

</tr>
</table>

<!-- Window/Modal Containers -->
<div id="clientsearch1">
   <div></div>
</div> 
<div id="userinfowindow">
   <div></div>
</div>

</div>
</div>
</body>
</html>