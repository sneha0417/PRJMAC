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

/* Sidebar */
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
    width: 90px;
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
}

/* jqx date/time containers */
.release-filter-table div[id^="uptodate"],
.release-filter-table div[id^="followupdate"],
.release-filter-table div[id^="date"] {
    width: 100%;
}

/* Checkbox Alignment */
.checkbox-row {
    display: flex;
    align-items: center;
    justify-content: center;
    gap: 8px;
    font-size: 12px;
    color: #4e5e71;
    font-weight: 600;
    margin: 5px 0 10px 0;
}
.checkbox-row input[type="checkbox"] {
    margin: 0;
    cursor: pointer;
}

/* Buttons */
.btn-submit {
    width: 100%;
    height: 30px;
    background: #2563eb;
    color: #fff;
    border: none;
    border-radius: 4px;
    font-size: 13px;
    font-weight: 600;
    cursor: pointer;
    transition: background 0.2s, transform 0.1s;
    margin-top: 5px;
}

.btn-submit:hover:not(:disabled) {
    background: #1d4ed8;
}

.btn-submit:disabled {
    background: #9ca3af;
}

.btn-submit:active:not(:disabled) {
    transform: scale(0.98);
}

/* Main Content Area */
.main-content-area {
    flex: 1;
    height: 100vh;
    overflow: auto;
    background: #ffffff;
    padding: 15px;
    box-sizing: border-box;
    display: flex;
    flex-direction: column;
    gap: 15px;
}
</style>

<script type="text/javascript">

	$(document).ready(function () {
		 // Standardized height to 24px and width to 100%
		 $("#uptodate").jqxDateTimeInput({ width: '100%', height: '24px',formatString:"dd.MM.yyyy"});
		 $("#followupdate").jqxDateTimeInput({ width: '100%', height: '24px',formatString:"dd.MM.yyyy"});
		 $("#date").jqxDateTimeInput({ width: '100%', height: '24px',formatString:"dd.MM.yyyy"});
		 
		 $("body").prepend('<div id="overlay" class="ui-widget-overlay" style="z-index: 1; display: none;"></div>');
	     $("body").prepend("<div id='PleaseWait' style='display: none;position:absolute; z-index: 1;top:180px;right:550px;'><img src='../../../../icons/31load.gif'/></div>");
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
		
		 $("#followUpDetailsGrid").jqxGrid('clear');
		 $("#followUpDetailsGrid").jqxGrid("addrow", null, {}); 
		 $("#followUpDetailsGrid").jqxGrid({ disabled: true});
	}
	
	function funreload(event){
		 disable();
		 var branchval = document.getElementById("cmbbranch").value;
		 var uptodate = $('#uptodate').val();
		 var chkfollowup = $('#hidchckfollowup').val();
		 var followupdate = $('#followupdate').val();
			 
		 $("#overlay, #PleaseWait").show();
		 
		 $("#proformaInvFollowupDiv").load("proformaInvFollowupGrid.jsp?branchval="+branchval+'&uptodate='+uptodate+'&chkfollowup='+chkfollowup+'&followupdate='+followupdate);
	}
	
	function funUpdate(event){
		var pro= $('#cmbprocess').val().split(":");
		var bibid=pro[0].trim();
		var proname=pro[1].trim();
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
		     	if(r==false)
		     	  {
		     		return false; 
		     	  }
		     	else{
		     		saveGridData(bibid,proname,date,branchid,docno,rdtype,remarks);	
		     	}
		});
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
				    $('#contno').val('');
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
	
	function funExportBtn(){
		JSONToCSVCon(proformainvfolwuptexcel, 'Proforma Invoice Followup', true);
	}
	
</script>
</head>
<body onload="getBranch();getProcess();disable();followupcheck();">
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
                        <td class="label-cell">Up To</td> 
                        <td><div id="uptodate" name="uptodate" value='<s:property value="uptodate"/>'></div></td>
                    </tr> 
                </table>
                
                <div class="checkbox-row">
                    <input type="checkbox" id="chckfollowup" name="chckfollowup" value="" onchange="followupcheck();" onclick="$(this).attr('value', this.checked ? 1 : 0)" /> 
                    <label for="chckfollowup">Enable FollowUp</label>
                    <input type="hidden" id="hidchckfollowup" name="hidchckfollowup" value='<s:property value="hidchckfollowup"/>'/>
                </div>
                
                <table class="release-filter-table">
                    <tr>
                        <td class="label-cell">FollowUp</td>
                        <td><div id="followupdate" name="followupdate" value='<s:property value="followupdate"/>'></div></td>
                    </tr>
                    
                    <tr><td colspan="2" style="height: 10px;"></td></tr>
                    
                    <tr>
                        <td class="label-cell">Doc No.</td>
                        <td><input type="text" id="contno" name="contno" readonly="readonly" value='<s:property value="contno"/>'/></td>
                    </tr>
                    
                    <tr>
                        <td class="label-cell">Doc Type</td>
                        <td><input type="text" id="conttype" name="conttype" readonly="readonly" value='<s:property value="conttype"/>'/></td>
                    </tr>
                </table>
            </div>

            <div class="filter-card">
                <table class="release-filter-table">
                    <tr>
                        <td class="label-cell">Process</td>
                        <td><select name="cmbprocess" id="cmbprocess" value='<s:property value="cmbprocess"/>'></select></td>
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
                
                <div style="margin-top: 15px;">
                    <button type="button" id="btnupdate" name="btnupdate" class="btn-submit" onclick="funUpdate(event);">Update</button>
                </div>
            </div>

            <input type="hidden" id="txtdocno" name="txtdocno" value='<s:property value="txtdocno"/>'/>
            <input type="hidden" id="txtbranch" name="txtbranch" value='<s:property value="txtbranch"/>'/>
            <input type="hidden" id="txtcldocno" name="txtcldocno" value='<s:property value="txtcldocno"/>'/>
        </div>
    </div>

    <div class="main-content-area">
        <div class="filter-card" style="padding: 0; overflow: hidden; flex: 1; display: flex; flex-direction: column;">
            <div id="proformaInvFollowupDiv" style="flex: 1; min-height: 250px;">
                <jsp:include page="proformaInvFollowupGrid.jsp"></jsp:include>
            </div>
        </div>
        
        <div class="filter-card" style="padding: 0; overflow: hidden; flex: 1; display: flex; flex-direction: column;">
            <div id="detailDiv" style="flex: 1; min-height: 250px;">
                <jsp:include page="detailGrid.jsp"></jsp:include>
            </div>
        </div>
    </div>

</div>

</div> 
</body>
</html>