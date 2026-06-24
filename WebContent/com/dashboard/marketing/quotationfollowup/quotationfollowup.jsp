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

.release-filter-table input[type="checkbox"] {
    width: auto;
    height: auto;
    margin: 0;
    vertical-align: middle;
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

/* Cleaner Clear Control Component */
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

/* Form Layout Container Blocks for JQX widgets */
.release-filter-table div[id^="fromdate"],
.release-filter-table div[id^="todate"],
.release-filter-table div[id^="followupdate"],
.release-filter-table div[id^="date"] {
    width: 100%;
}

/* ===== REQUIRED VISUAL BLUE BUTTON SCALING DEFINITIONS ===== */
.btn-primary {
    height: 28px;
    width: 100%;
    background-color: #1e6bf2;
    border: none;
    border-radius: 8px;
    color: #ffffff;
    font-size: 13px;
    font-weight: 700;
    cursor: pointer;
    transition: background-color 0.2s ease, transform 0.1s ease;
    display: flex;
    align-items: center;
    justify-content: center;
    padding: 0 10px;
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
		
		 $("body").prepend('<div id="overlay" class="ui-widget-overlay" style="z-index: 1; display: none;"></div>');
	     $("body").prepend("<div id='PleaseWait' style='display: none;position:absolute; z-index: 1;top:180px;right:550px;'><img src='../../../../icons/31load.gif'/></div>");
	     $('#Salesagentinfowindow').jqxWindow({ width: '30%', height: '55%',  maxHeight: '75%' ,maxWidth: '50%' , title: 'SalesMan Search' ,position: { x: 200, y: 120 }, keyboardCloseKey: 27});
		 $('#Salesagentinfowindow').jqxWindow('close');
		     
         // Enforced 24px JQX Criteria
         $("#date").jqxDateTimeInput({ width: '100%', height: '24px',formatString:"dd.MM.yyyy"});
		 $("#followupdate").jqxDateTimeInput({ width: '100%', height: '24px',formatString:"dd.MM.yyyy"});
	     $("#fromdate").jqxDateTimeInput({ width: '100%', height: '24px',formatString:"dd.MM.yyyy"});
		 $("#todate").jqxDateTimeInput({ width: '100%', height: '24px',formatString:"dd.MM.yyyy"});

		 var fromdates=new Date($('#fromdate').jqxDateTimeInput('getDate'));
		 var onemounth=new Date(new Date(fromdates).setMonth(fromdates.getMonth()-1)); 
		    
	     $('#fromdate').jqxDateTimeInput('setDate', new Date(onemounth));
		 $('#todate').on('change', function (event) {
			   var fromdates=new Date($('#fromdate').jqxDateTimeInput('getDate'));
			 	 var todates=new Date($('#todate').jqxDateTimeInput('getDate')); //del date
			 	 
			   if(fromdates>todates){
				   $.messager.alert('Message','To Date Less Than From Date  ','warning');   
			       return false;
			  }   
		 });
		 
		 $('#txtsalman').dblclick(function(){
			  $('#Salesagentinfowindow').jqxWindow('open');
		      salesagentSearchContent('SearchSalesman.jsp?', $('#Salesagentinfowindow'));
		 });
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
					optionsbranch += '<option  value="' + srno[i].trim() + ':'+ process[i].trim() +'">'
					+ process[i] + '</option>';
				}
				$("select#cmbprocess").html(optionsbranch);
			} else {}
		}
		x.open("GET","getProcess.jsp", true);
		x.send();
	}
	
	function disable(){
		 $('#date').jqxDateTimeInput({ disabled: true});
		 $('#cmbprocess').attr("disabled",true);
		 $('#txtremarks').attr("readonly",true);
		 $('#btnupdate').attr("disabled",true);
	
		 $("#amcfollowupGrid").jqxGrid('clear');
		 $("#amcfollowupGrid").jqxGrid("addrow", null, {}); 
		 $("#amcfollowupGrid").jqxGrid({ disabled: true});
	}

	function followupcheck(){
		 if(document.getElementById("chckfollowup").checked){
			 document.getElementById("hidchckfollowup").value = 1;
			 $('#followupdate').jqxDateTimeInput({ disabled: false});
		 }
		 else{
			 document.getElementById("hidchckfollowup").value = 0;
			 $('#followupdate').jqxDateTimeInput({ disabled: true});
		 }
	}
	
	function funreload(event){
		disable();
		var fromdates=new Date($('#fromdate').jqxDateTimeInput('getDate'));
		var todates=new Date($('#todate').jqxDateTimeInput('getDate')); //del date
		 	 
		if(fromdates>todates){
			 $.messager.alert('Message','To Date Less Than From Date  ','warning');   
		     return false;
		}
		var fromdate= $("#fromdate").val();
		var todate= $("#todate").val();
		var branchval = document.getElementById("cmbbranch").value;
		var salid = document.getElementById("salid").value;
		var chkfollowup = $('#hidchckfollowup').val();
		var followupdate = $('#followupdate').val();
		 
		$("#overlay, #PleaseWait").show();
		$("#quotationfollowupDiv").load("quotationfollowupGrid.jsp?branchval="+branchval+"&froms="+fromdate+"&tos="+todate+'&chkfollowup='+chkfollowup+'&followupdate='+followupdate+'&salid='+salid);
	}
	
	function funUpdate(event){
		var pro= $('#cmbprocess').val().split(":");
		var bibid=pro[0];
		var proname=pro[1];
		var date =  $('#date').val();
		var branchid = $('#txtbranch').val();
		var remarks = $('#txtremarks').val();
		var docno = $('#txtdocno').val();
		var rdtype = $('#conttype').val();
		
		if(bibid==''){
			 $.messager.alert('Message','Choose a Process.','warning');
			 return 0;
		 }
		 
		 if(remarks==''){
			 $.messager.alert('Message','Please Enter Remarks.','warning');   
			 return 0;
		 }
		
		 $.messager.confirm('Message', 'Do you want to save changes?', function(r){
		     	if(r==false) {
		     		return false; 
		     	} else {
		     		saveGridData(bibid,proname,date,branchid,docno,rdtype,remarks);	
		     	}
		});
	}
	    
	function saveGridData(bibid,proname,date,branchid,docno,rdtype,remarks){
		var x=new XMLHttpRequest();
		x.onreadystatechange=function(){
		if (x.readyState==4 && x.status==200){
				var items=x.responseText;
				if(parseInt(items)=="1")
				{	
				$('#cmbprocess').val('');
				$('#date').val(new Date());
				$('#txtbranch').val('');
				$('#txtremarks').val('');
				$('#txtdocno').val('');
				$('#enqstat').val('');
				$('#info').val('');
				$('#conttype').val('');
				
				$.messager.alert('Message', '  Record Successfully Updated ');
				disable();
				}
				else
				{
				$.messager.alert('Message', '  Not Updated  ');
				}
			}
		}
	x.open("GET","saveData.jsp?bibid="+bibid+"&proname="+proname+"&date="+date+"&branchid="+branchid+"&docno="+docno+"&rdtype="+rdtype+"&remarks="+remarks,true);
	x.send();
	}
	
	function funtxtenable() {
		
	}
	
	function funExportBtn(){
		JSONToCSVCon(qotfollowupexcel, 'Quotation Followup', true);
		JSONToCSVCon(latestqotfollowupexcel, 'Quotation Followup With Remarks', true);
	}
	
	 function getsalesAgent(event){
     	 var x= event.keyCode;
     	 if(x==114){
     	   $('#Salesagentinfowindow').jqxWindow('open');
           salesagentSearchContent('SearchSalesman.jsp?', $('#Salesagentinfowindow')); 
         }
     }

    function salesagentSearchContent(url) {
        $.get(url).done(function (data) {
	        $('#Salesagentinfowindow').jqxWindow('setContent', data);
       	}); 
   }
  
  function funsalClear(){
	   $("#jqxloaddataGrid").jqxGrid('clear'); 
	   $("#jqxloaddataGrid").jqxGrid('addrow', null, {});
	   document.getElementById("txtsalman").value="";
	   document.getElementById("salid").value="0";
	   $("#txtsalman").attr("placeholder", "press F3 for Search");
  }

</script>
</head>

<body onload="getBranch();getProcess();disable();followupcheck();">
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
                    <tr>
                        <td class="label-cell">Sales Man</td>
                        <td>
                            <div style="display: flex; width: 100%; align-items: center; gap: 4px;">
                                <div class="search-input-wrapper" style="flex: 1;">
                                    <input type="text" name="txtsalman" id="txtsalman" value='<s:property value="txtsalman"/>' readonly="readonly" placeholder="Double click to search" onKeyDown="getsalesAgent(event);" ondblclick="getsalesAgent(event);" />
                                    <div class="search-icon"></div>
                                </div>
                                <button type="button" class="btn-clear-inline" id="clear" title="Clear" onclick="funsalClear()"> 
                                    <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" viewBox="0 0 24 24" fill="none" stroke="#64748b" stroke-width="2.5" stroke-linecap="round" stroke-linejoin="round"><line x1="18" y1="6" x2="6" y2="18"></line><line x1="6" y1="6" x2="18" y2="18"></line></svg>
                                </button>
                            </div>
                            <input type="hidden" id="salid" name="salid" value='<s:property value="salid"/>'>
                        </td>
                    </tr>
                    <tr>
                        <td class="label-cell"></td>
                        <td>
                            <input type="checkbox" id="chckfollowup" name="chckfollowup" value="" onchange="followupcheck();" onclick="$(this).attr('value', this.checked ? 1 : 0)" /> 
                            <span style="font-size: 11px; color: #4e5e71; margin-left: 2px;">Enable FollowUp</span>
                            <input type="hidden" id="hidchckfollowup" name="hidchckfollowup" value='<s:property value="hidchckfollowup"/>'/>
                        </td>
                    </tr>
                    <tr>
                        <td class="label-cell">FollowUp</td>
                        <td>
                            <div id="followupdate" name="followupdate" value='<s:property value="followupdate"/>'></div>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2" align="center">
                            <textarea id="info" name="info" readonly="readonly" style="height:50px;"><s:property value="info"></s:property></textarea>
                        </td>
                    </tr>
                    <tr>
                        <td class="label-cell">Process</td>
                        <td>
                            <select name="cmbprocess" id="cmbprocess" onChange="funtxtenable();" value='<s:property value="cmbprocess"/>'></select>
                        </td>
                    </tr>
                    <tr>
                        <td class="label-cell">Date</td>
                        <td>
                            <div id="date" name="date" value='<s:property value="date"/>'></div>
                        </td>
                    </tr>
                    <tr>
                        <td class="label-cell">Remarks</td>
                        <td>
                            <input type="text" id="txtremarks" name="txtremarks" value='<s:property value="txtremarks"/>'/>
                        </td>
                    </tr>
                </table>
            </div>

            <div class="filter-card" style="padding: 10px; border: none; background: transparent;">
                <button type="button" class="btn-primary" id="btnupdate" name="btnupdate" onclick="funUpdate(event);">Update</button>
            </div>

            <input type="hidden" id="txtdocno" name="txtdocno" value='<s:property value="txtdocno"/>'/>
            <input type="hidden" id="txtbranch" name="txtbranch" value='<s:property value="txtbranch"/>'/>
            <input type="hidden" id="txtenqstat" name="txtenqstat" value='<s:property value="txtenqstat"/>'/>
            <input type="hidden" id="conttype" name="conttype" value='<s:property value="conttype"/>'/>

        </div>
    </div>

    <div class="main-content-area">
        <div id="quotationfollowupDiv">
            <jsp:include page="quotationfollowupGrid.jsp"></jsp:include>
        </div>
        <br/>
        <div id="detailDiv">
            <jsp:include page="detailGrid.jsp"></jsp:include>
        </div>
    </div>

</div>

<div id="Salesagentinfowindow"><div></div></div>

</div>
</div>
</body>
</html>