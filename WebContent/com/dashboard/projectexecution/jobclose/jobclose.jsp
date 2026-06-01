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
    width: 80px;
}

/* ===== UNIFORM INPUTS & SELECTS ===== */
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
}

/* jqx date/time containers */
.release-filter-table div[id^="fromdate"],
.release-filter-table div[id^="todate"],
.release-filter-table div[id^="closedate"] {
    width: 100%;
}

/* Radio Buttons Group */
.radio-group {
    display: flex;
    align-items: center;
    gap: 15px;
    height: 24px;
}
.radio-group label {
    display: flex;
    align-items: center;
    gap: 5px;
    font-size: 12px;
    color: #333;
    margin: 0;
    cursor: pointer;
}
.radio-group input[type="radio"] {
    margin: 0;
    cursor: pointer;
}

/* Buttons */
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

.btn-submit:hover:not(:disabled) {
    background: #1d4ed8;
}

.btn-submit:disabled {
    background: #9ca3af;
}

.btn-submit:active:not(:disabled) {
    transform: scale(0.98);
}

.btn-secondary {
    background: #64748b;
}

.btn-secondary:hover:not(:disabled) {
    background: #475569;
}

.button-group {
    display: flex;
    gap: 10px;
    margin-top: 15px;
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
}
</style>

<script type="text/javascript">
$(document).ready(function () {
	 $("body").prepend('<div id="overlay" class="ui-widget-overlay" style="z-index: 1; display: none;"></div>');
	 $("body").prepend("<div id='PleaseWait' style='display: none;position:absolute; z-index: 1;top:180px;right:550px;'><img src='../../../../icons/31load.gif'/></div>");

	 // Enforced 100% width and 24px height to match new UI standard
	 $("#fromdate").jqxDateTimeInput({ width: '100%', height: '24px',formatString:"dd.MM.yyyy"});
	 $("#todate").jqxDateTimeInput({ width: '100%', height: '24px',formatString:"dd.MM.yyyy"});
	 $("#closedate").jqxDateTimeInput({ width: '100%', height: '24px',formatString:"dd.MM.yyyy"});
	 
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
});

function funExportBtn(){
	JSONToCSVCon(jobcloseexcel, 'Job Close', true);
}

function funreload(event) {
	 var fromdates=new Date($('#fromdate').jqxDateTimeInput('getDate'));
	 var todates=new Date($('#todate').jqxDateTimeInput('getDate')); 
	 	
	 if(fromdates>todates){
		 $.messager.alert('Message','To Date Less Than From Date  ','warning');   
	     return false;
	 }
	 	
	 var rds;
	 if (document.getElementById('radio_tobeclose').checked) {
		 rds=$("#radio_tobeclose").val();
	 } else{
		 rds=$("#radio_closedlist").val();
	 }
	 
	 var barchval = document.getElementById("cmbbranch").value;
	 var fromdate= $("#fromdate").val();
	 var todate= $("#todate").val();
	   
	 $("#overlay, #PleaseWait").show();
	 $("#loadgriddiv").load("gridDetails.jsp?barchval="+barchval+"&froms="+fromdate+"&tos="+todate+"&rds="+rds+"&check=1");
}

function  funClearData(){
	 $('#remarks').val('');
	 $('#info').val('');
	 $('#doc').val('');
	 $('#dtyp').val('');
	 $('#trno').val('');
	 $('#jqxjobclosegrid').jqxGrid('clear');
}	

function funUpdate(event){
	var rdocno = $('#doc').val();
	var rdtype = $('#dtyp').val();
	var remarks = $('#remarks').val();
	var txtareainfo= $('#info').val();
	var trnos = $('#trno').val();
	var closedate = $('#closedate').val();
	
	if(txtareainfo==''){
		 $.messager.alert('Message','Please Choose a Document.','warning');
		 return 0;
	}
	
    $.messager.confirm('Message', 'Do you want to Close the job?', function(r){
	   if(r==false) {
	   		return false; 
	   } else{
	   		saveGridData(rdocno,rdtype,remarks,trnos,closedate);
	   }
	});
}

function saveGridData(rdocno,rdtype,remarks,trnos,closedate){
	var x=new XMLHttpRequest();
	x.onreadystatechange=function(){
	    if (x.readyState==4 && x.status==200){
			var items=x.responseText.trim();
			if(parseInt(items)=="1") {
			    $.messager.alert('Message', ' '+$('#dtyp').val()+ '-'+$('#doc').val()+' Closed Successfully ');
			    $('#remarks').val('');
			    $('#info').val('');
			    $('#doc').val('');
			    $('#dtyp').val('');
			    $('#trno').val('');
			    $('#jqxjobclosegrid').jqxGrid('clear');
			} else {
				$.messager.alert('Message', '  Not Updated  ');
			}
	    }
	}
	x.open("GET","saveData.jsp?docno="+rdocno+"&dtype="+rdtype+"&remarks="+remarks+"&trnos="+trnos+"&closedate="+closedate,true);
	x.send();
}

function funRadio() {
	 var rad;
	 if (document.getElementById('radio_tobeclose').checked) {
		 rad=$("#radio_tobeclose").val();
		 $('#closedate').jqxDateTimeInput({ disabled: false});
		 $('#info').attr("disabled",false);
		 $('#remarks').attr("disabled",false);
		 $('#clear').attr("disabled",false);
		 $('#btnupdate').attr("disabled",false);
		 $("#jqxjobclosegrid").jqxGrid('clear');
	 } else{
		 rad=$("#radio_closedlist").val();
		 $('#info').val('');
		 $('#remarks').val('');
		 $('#closedate').jqxDateTimeInput({ disabled: true});
		 $('#info').attr("disabled",true);
		 $('#remarks').attr("disabled",true);
		 $('#clear').attr("disabled",true);
		 $('#btnupdate').attr("disabled",true);
		 $("#jqxjobclosegrid").jqxGrid('clear');
	 }
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
                        <td class="label-cell">Status</td>
                        <td>
                            <div class="radio-group">
                                <label><input type="radio" id="radio_tobeclose" name="category" value="TC" onclick="funRadio(this);" checked="checked"> Close</label>
                                <label><input type="radio" id="radio_closedlist" name="category" value="CL" onclick="funRadio(this);"> Closed List</label>
                            </div>
                        </td>
                    </tr>
                </table>
            </div>

            <div class="filter-card">
                <table class="release-filter-table">
                    <tr>
                        <td class="label-cell">Close On</td>
                        <td><div id='closedate' name='closedate' value='<s:property value="closedate"/>'></div></td>
                    </tr>
                    
                    <tr>
                        <td colspan="2">
                            <textarea id="info" name="info" readonly="readonly" style="height: 80px; margin-top: 5px;"><s:property value="info" ></s:property></textarea>
                        </td>
                    </tr>
                    
                    <tr>
                        <td class="label-cell" style="padding-top: 10px;">Remarks</td>
                        <td style="padding-top: 10px;"><input type="text" id="remarks" name="remarks" value='<s:property value="remarks"/>'></td>
                    </tr>
                </table>
                
                <div class="button-group">
                    <button type="button" class="btn-submit btn-secondary" name="clear" id="clear" onclick="funClearData();">Clear</button>
                    <button type="button" class="btn-submit" id="btnupdate" name="btnupdate" onclick="funUpdate(event);">Update</button>
                </div>
            </div>

            <input type="hidden" id="doc" name="doc" value='<s:property value="doc"/>'>
            <input type="hidden" id="dtyp" name="dtyp" value='<s:property value="dtyp"/>'>
            <input type="hidden" id="trno" name="trno" value='<s:property value="trno"/>'>
        </div>
    </div>

    <div class="main-content-area">
        <div id="loadgriddiv" class="filter-card" style="padding: 0; overflow: hidden; flex: 1;">
            <jsp:include page="gridDetails.jsp"></jsp:include> 
        </div>
    </div>

</div>

</div>
</body>
</html>