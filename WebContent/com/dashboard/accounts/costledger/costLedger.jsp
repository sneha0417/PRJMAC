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

<style type="text/css">
/* ===== MASTER LAYOUT ===== */
body, html, #mainBG, .hidden-scrollbar {
    height: 100%;
    margin: 0;
    overflow: hidden; /* Prevents whole-page scrolling, delegates to specific panes */
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
    overflow-y: auto; /* Independent Sidebar Scrollbar */
    box-shadow: 2px 0 8px rgba(0,0,0,.05);
    z-index: 2;
}

.sidebar-fixed-top {
    padding: 15px 20px;
    border-bottom: 1px solid #f0f4f8;
}

.sidebar-scroll-content {
    flex: 1;
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

/* Original textbox style preserved for netamount */
.textbox {
    border: 0;
    height: 24px;
    width: 100%;
    border-radius: 4px;
    box-shadow: 1px 1px 0 0 #E0ECF8, 5px 5px 40px 2px #E0ECF8 inset;
    outline: 0;
    text-align: right;
    padding-right: 8px;
}

/* Readonly / disabled look - NO BAN ICON */
input[readonly],
input:disabled,
select:disabled {
    background-color: #f3f6f9 !important;
    color: #555;
    cursor: default !important;
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
    overflow-y: auto; /* Independent Main Content Scrollbar */
    background: #ffffff;
    padding: 15px;
    box-sizing: border-box;
}

.grid-container {
    margin-bottom: 20px;
}

.accname {
    color: black;
    background-color: #E0ECF8;
    display: inline-block;
    padding: 5px 10px;
    border-radius: 4px;
    margin-bottom: 10px;
}
</style>

<script type="text/javascript">

	$(document).ready(function () {
		 // Standardized to 100% width and 24px height
		 $("#fromdate").jqxDateTimeInput({ width: '100%', height: '24px',formatString:"dd.MM.yyyy"});
		 $("#todate").jqxDateTimeInput({ width: '100%', height: '24px',formatString:"dd.MM.yyyy"});
		 
		 $("body").prepend('<div id="overlay" class="ui-widget-overlay" style="z-index: 1; display: none;"></div>');
	     $("body").prepend("<div id='PleaseWait' style='display: none;position:absolute; z-index: 1;top:180px;right:550px;'><img src='../../../../icons/31load.gif'/></div>");
	     
		 $('#costCodeDetailsWindow').jqxWindow({width: '51%', height: '58%',  maxHeight: '70%' ,maxWidth: '51%' , title: 'Cost Search',position: { x: 300, y: 87 } , theme: 'energyblue', showCloseButton: true, keyboardCloseKey: 27});
		 $('#costCodeDetailsWindow').jqxWindow('close');
		 
		 var curfromdate= $('#fromdate').jqxDateTimeInput('getDate');
	     var oneyeardate=new Date(new Date(curfromdate).setMonth(curfromdate.getMonth()-1));
	     var oneyearbackdate=new Date(new Date(oneyeardate).setDate(oneyeardate.getDate()));
	     $('#fromdate').jqxDateTimeInput('setDate', new Date(oneyearbackdate));
		 
		 $('#hidchckuptodate').val(0);document.getElementById("rdsummary").checked=true;
		 
		 $('#txtcostcodeid').dblclick(function(){
			  if($('#cmbcosttype').val()==''){
   			 $.messager.alert('Message','Please Choose Cost Type.','warning');
   			 return 0;
   		  }
			  costCodeSearchContent('costCodeDetailsSearch.jsp');
			});
		 
	});
	
	function costCodeSearchContent(url) {
	    $('#costCodeDetailsWindow').jqxWindow('open');
		$.get(url).done(function (data) {
		$('#costCodeDetailsWindow').jqxWindow('setContent', data);
		$('#costCodeDetailsWindow').jqxWindow('bringToFront');
	}); 
	}
	
	function getCostType() {
		var x = new XMLHttpRequest();
		x.onreadystatechange = function() {
			if (x.readyState == 4 && x.status == 200) {
				var items = x.responseText;
				items = items.split('####');
				
				var srno  = items[0].split(",");
				var process = items[1].split(",");
				var optionsbranch = '<option value="" selected>-- Select -- </option>';
				for (var i = 0; i < process.length; i++) {
					optionsbranch += '<option value="' + srno[i].trim() + '">'
							+ process[i] + '</option>';
				}
				$("select#cmbcosttype").html(optionsbranch);
				
			} else {}
		}
		x.open("GET","getCostType.jsp", true);
		x.send();
	}
	
	function funExportBtn(){
		JSONToCSVCon(dataExcel, 'CostLedger', true);
	} 
	
	function getCostCode(event){
        var x= event.keyCode;
        if(x==114){
		    if($('#cmbcosttype').val()==''){
   			 $.messager.alert('Message','Please Choose Cost Type.','warning');
   			 return 0;
   		 }
		    costCodeSearchContent('costCodeDetailsSearch.jsp');
        }
        else{}
        }
	
	
	function clearCostCodeInfo(){
		$('#txtcostcode').val('');$('#txtcostcodeid').val('');$('#txtcostcodename').val('');
		
		if (document.getElementById("txtcostcodeid").value == "") {
	        $('#txtcostcodeid').attr('placeholder', 'Press F3 to Search'); 
	    }
		
		$("#costLedgerSummaryGridID").jqxGrid('clear');$("#costLedgerDetailGridID").jqxGrid('clear');
		$("#costLedgerSummaryGridID").jqxGrid("addrow", null, {});$("#costLedgerDetailGridID").jqxGrid("addrow", null, {});
	}
	
	function funreload(event){
		
		 var branchval = document.getElementById("cmbbranch").value;
		 var fromdate = $('#fromdate').val();
		 var todate = $('#todate').val();
		 var costtype = $('#cmbcosttype').val();
		 var costcode = $('#txtcostcode').val();
		 var check = 1;
		 
		if(costtype==''){
			 $.messager.alert('Message','Please Choose Cost Type.','warning');
			 return 0;
		 }
		 
		 if(costcode==''){
			 $.messager.alert('Message','Cost Code is Mandatory.','warning');
			 return 0;
		 }
		 
		 $("#overlay, #PleaseWait").show();
		 
		 document.getElementById("lblaccountname").innerText=$("#cmbcosttype option:selected").text().trim()+" - "+$('#txtcostcodename').val();
		 if(document.getElementById("rddetailed").checked==true){
		 	$("#costLedgerDetailedDiv").load("costLedgerDetailGrid.jsp?rpttype=2&branchval="+branchval+'&fromdate='+fromdate+'&todate='+todate+'&costtype='+costtype+'&costcode='+costcode+'&check='+check);
		 } else {
			$("#costLedgerSummaryDiv").load("costLedgerSummaryGrid.jsp?rpttype=1&branchval="+branchval+'&fromdate='+fromdate+'&todate='+todate+'&costtype='+costtype+'&costcode='+costcode+'&check='+check);
		 }
		 
		}
	
	function checkuptodate(){
		 if(document.getElementById("chckuptodate").checked){
			 document.getElementById("hidchckuptodate").value = 1;
			 $('#fromdate').jqxDateTimeInput({disabled: true});
			 document.getElementById("rddetailed").checked=true;
			 $("#costLedgerSummaryGridID").jqxGrid('clear');$("#costLedgerDetailGridID").jqxGrid('clear');
			 $("#costLedgerSummaryGridID").jqxGrid("addrow", null, {});$("#costLedgerDetailGridID").jqxGrid("addrow", null, {});
			 $("#costLedgerSummaryDiv").prop("hidden", true);$("#costLedgerDetailedDiv").prop("hidden", false);             
			 document.getElementById("lblaccountname").innerText="";
		 }
		 else{
			 document.getElementById("hidchckuptodate").value = 0;
			 $('#fromdate').jqxDateTimeInput({disabled: false});
			 document.getElementById("rdsummary").checked=true;
			 $("#costLedgerSummaryGridID").jqxGrid('clear');$("#costLedgerDetailGridID").jqxGrid('clear');
			 $("#costLedgerSummaryGridID").jqxGrid("addrow", null, {});$("#costLedgerDetailGridID").jqxGrid("addrow", null, {});
			 $("#costLedgerSummaryDiv").prop("hidden", false);$("#costLedgerDetailedDiv").prop("hidden", true);
			 document.getElementById("lblaccountname").innerText="";
		 }
	 }
	
	function funCheck(a){
		  if(document.getElementById("chckuptodate").checked != false){
		 	  $('#hidchckuptodate').val(1);$('#fromdate').jqxDateTimeInput({disabled: true});
		 	  document.getElementById("rddetailed").checked=true;
		 	  $("#costLedgerSummaryDiv").prop("hidden", true);$("#costLedgerDetailedDiv").prop("hidden", false); 
		 	 $("#costLedgerSummaryGridID").jqxGrid('clear');$("#costLedgerDetailGridID").jqxGrid('clear');
		 	$("#costLedgerSummaryGridID").jqxGrid("addrow", null, {});$("#costLedgerDetailGridID").jqxGrid("addrow", null, {});
		 	 document.getElementById("lblaccountname").innerText="";
		  }
		  else{
			  $('#hidchckuptodate').val(0);$('#fromdate').jqxDateTimeInput({disabled: false});
			  document.getElementById("rdsummary").checked=true;
			  $("#costLedgerSummaryDiv").prop("hidden", false);$("#costLedgerDetailedDiv").prop("hidden", true); 
			  $("#costLedgerSummaryGridID").jqxGrid('clear');$("#costLedgerDetailGridID").jqxGrid('clear');
			  $("#costLedgerSummaryGridID").jqxGrid("addrow", null, {});$("#costLedgerDetailGridID").jqxGrid("addrow", null, {});
			  document.getElementById("lblaccountname").innerText="";
		  }
	  }
	
	function radioClick(){
		 if(document.getElementById("rdsummary").checked==true) {
			 $('#hidchckuptodate').val(0);$('#fromdate').jqxDateTimeInput({disabled: false});
			  document.getElementById("chckuptodate").checked=false;
			  $("#costLedgerSummaryDiv").prop("hidden", false);$("#costLedgerDetailedDiv").prop("hidden", true);
			  $("#costLedgerSummaryGridID").jqxGrid('clear');$("#costLedgerDetailGridID").jqxGrid('clear');
			  $("#costLedgerSummaryGridID").jqxGrid("addrow", null, {});$("#costLedgerDetailGridID").jqxGrid("addrow", null, {});
			  document.getElementById("lblaccountname").innerText="";
		 } else if(document.getElementById("rddetailed").checked==true) {
			 $('#hidchckuptodate').val(1);$('#fromdate').jqxDateTimeInput({disabled: true});
			 document.getElementById("chckuptodate").checked=true;
			 $("#costLedgerSummaryDiv").prop("hidden", true);$("#costLedgerDetailedDiv").prop("hidden", false);
			 $("#costLedgerSummaryGridID").jqxGrid('clear');$("#costLedgerDetailGridID").jqxGrid('clear');
			 $("#costLedgerSummaryGridID").jqxGrid("addrow", null, {});$("#costLedgerDetailGridID").jqxGrid("addrow", null, {});
			 document.getElementById("lblaccountname").innerText="";
		 }
	}
	
	
</script>
</head>
<body onload="getBranch();getCostType();">
<div id="mainBG" class="homeContent" data-type="background"> 
<form id="frmCostLedger" action="saveCostLedger" method="post" autocomplete="off">
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
                        <td colspan="2">
                            <div style="display: flex; align-items: center; gap: 5px; margin-bottom: 5px;">
                                <input type="checkbox" id="chckuptodate" name="chckuptodate" value="" onclick="funCheck();" onchange="checkuptodate();" style="width: auto; height: auto;" />
                                <label style="font-size: 12px; font-weight: 600; color: #4e5e71;">Up To Date</label>
                                <input type="hidden" id="hidchckuptodate" name="hidchckuptodate" value='<s:property value="hidchckuptodate"/>'/>
                            </div>
                        </td>
                    </tr>
                    <tr>
                        <td class="label-cell">Period</td>
                        <td><div id="fromdate" name="fromdate" value='<s:property value="fromdate"/>'></div></td>
                    </tr>
                    <tr>
                        <td class="label-cell">To</td>
                        <td><div id="todate" name="todate" value='<s:property value="todate"/>'></div></td>
                    </tr>
                    <tr>
                        <td class="label-cell">Cost Type</td>
                        <td><select id="cmbcosttype" name="cmbcosttype" onchange="clearCostCodeInfo();" value='<s:property value="cmbcosttype"/>'></select></td>
                    </tr>
                    <tr>
                        <td class="label-cell">Cost Code</td>
                        <td><input type="text" id="txtcostcodeid" name="txtcostcodeid" readonly placeholder="Press F3 to Search" value='<s:property value="txtcostcodeid"/>' onkeydown="getCostCode(event);"/></td>
                    </tr>
                    <tr>
                        <td class="label-cell"></td>
                        <td><input type="text" id="txtcostcodename" name="txtcostcodename" readonly value='<s:property value="txtcostcodename"/>' tabindex="-1"/></td>
                    </tr>
                </table>
            </div>
            
            <div class="filter-card">
                <div style="font-size: 12px; font-weight: 600; color: #4e5e71; margin-bottom: 8px;">Report Type</div>
                <div style="display: flex; gap: 15px;">
                    <div style="display: flex; align-items: center; gap: 5px;">
                        <input type="radio" id="rdsummary" name="rdo" onclick="radioClick();" value="rdsummary" style="width: auto; height: auto;">
                        <label for="rdsummary" style="font-size: 12px;">Summary</label>
                    </div>
                    <div style="display: flex; align-items: center; gap: 5px;">
                        <input type="radio" id="rddetailed" name="rdo" onclick="radioClick();" value="rddetailed" style="width: auto; height: auto;">
                        <label for="rddetailed" style="font-size: 12px;">Detailed</label>
                    </div>
                </div>
            </div>

            <div style="display: none;">
                <input type="hidden" id="txtcostcode" name="txtcostcode" value='<s:property value="txtcostcode"/>'/>
            </div>
            
        </div>
    </div>

    <div class="main-content-area">
        <label class="accname" name="lblaccountname" id="lblaccountname"></label>
        
        <div class="grid-container">
            <div id="costLedgerSummaryDiv"><jsp:include page="costLedgerSummaryGrid.jsp"></jsp:include></div>
            <div id="costLedgerDetailedDiv" hidden="true"><jsp:include page="costLedgerDetailGrid.jsp"></jsp:include></div>
        </div>
        
        <div style="margin-top: 10px;">
            <table width="100%">
                <tr>
                    <td align="right" style="font-family: Myriad Pro; font-size: 12px; font-weight: bold; width: 90%;">Net Amount :&nbsp;</td>
                    <td align="left" style="width: 10%;"><input type="text" class="textbox" id="txtnetamount" name="txtnetamount" value='<s:property value="txtnetamount"/>'/></td>
                </tr>
            </table>
        </div>
    </div>

</div>
</div>
</form>

<div id="costCodeDetailsWindow">
	<div></div><div></div>
</div>
</div> 
</body>
</html>