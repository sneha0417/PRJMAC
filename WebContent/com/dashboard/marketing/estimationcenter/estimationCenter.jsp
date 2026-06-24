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

/* Action Grouping for View Buttons */
.view-actions-container {
    display: flex;
    flex-wrap: wrap;
    gap: 8px;
    justify-content: center;
}
.view-actions-container button {
    flex: 1;
    min-width: 45%; 
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

/* Readonly fields styling setup */
input[readonly], select[readonly],
input:disabled, select:disabled,
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
.release-filter-table div[id^="todate"] {
    width: 100%;
}

/* ===== REQUIRED VISUAL BLUE BUTTON SCALING DEFINITIONS ===== */
.btn-primary {
    flex: 1;
    height: 28px;
    background-color: #1e6bf2; /* Exact specific blue matching image */
    border: none;
    border-radius: 8px;        /* Corner styling parameters */
    color: #ffffff;
    font-size: 12px;
    font-weight: 700;
    cursor: pointer;
    transition: background-color 0.2s ease, transform 0.1s ease;
    display: flex;
    align-items: center;
    justify-content: center;
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
    gap: 10px;
    justify-content: center;
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
    $("body").prepend('<div id="overlay" class="ui-widget-overlay" style="z-index: 1; display: none;"></div>');
    $("body").prepend("<div id='PleaseWait' style='display: none;position:absolute; z-index: 1;top:180px;right:550px;'><img src='../../../../icons/31load.gif'/></div>");

    $('#userinfowindow').jqxWindow({ width: '25%', height: '60%', maxHeight: '85%', maxWidth: '80%', title: 'User Search', position: { x: 250, y: 60 }, keyboardCloseKey: 27});
    $('#userinfowindow').jqxWindow('close');
            
    $('#clientsearch1').jqxWindow({ width: '50%', height: '55%', maxHeight: '85%', maxWidth: '80%', title: 'Client Search', position: { x: 250, y: 120 }, keyboardCloseKey: 27});
    $('#clientsearch1').jqxWindow('close');
          
    // Reference UI 24px Standard Dimensions
    $("#fromdate").jqxDateTimeInput({ width: '100%', height: '24px', formatString:"dd.MM.yyyy"});
    $("#todate").jqxDateTimeInput({ width: '100%', height: '24px', formatString:"dd.MM.yyyy"});
    
    var fromdates = new Date($('#fromdate').jqxDateTimeInput('getDate'));
    var onemounth = new Date(new Date(fromdates).setMonth(fromdates.getMonth()-1)); 
        
    $('#fromdate').jqxDateTimeInput('setDate', new Date(onemounth));
    
    $('#todate').on('change', function (event) {
        var fromdates = new Date($('#fromdate').jqxDateTimeInput('getDate'));
        var todates = new Date($('#todate').jqxDateTimeInput('getDate'));
        
        if(fromdates > todates){
            $.messager.alert('Message','To Date Less Than From Date','warning');   
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
    var x = event.keyCode;
    if(x == 114){
        $('#clientsearch1').jqxWindow('open');
        clientSearchContent('clientINgridsearch.jsp?', $('#clientsearch1'));    
    }
} 

function clientSearchContent(url) {
    $.get(url).done(function (data) {
        $('#clientsearch1').jqxWindow('setContent', data);
    }); 
}

function funExportBtn(){
    JSONToCSVCon(enqdata,'Estimation Center',true);  
}

function funreload() {
    var id = 1;
    if(id > 0){
        gridload(id);
    }
}
    
function gridload(id){
    var clientid = $('#clientid').val();
    var fromdate = $('#fromdate').val();
    var todate = $('#todate').val();
    var barchval = document.getElementById("cmbbranch").value;
    
    $("#estcentergrid").jqxGrid('clear'); 
    $("#overlay, #PleaseWait").show();
    $("#estcenterdiv").load("estimationCenterGrid.jsp?barchval="+barchval+"&fromdate="+fromdate+"&todate="+todate+"&clientid="+clientid+"&id="+id);
}
     
function getUser(event){
    var x = event.keyCode;
    if(x == 114){
        $('#userinfowindow').jqxWindow('open');
        userSearchContent('userSearch.jsp');
    }
}
         
function userSearchContent(url) {
    $.get(url).done(function (data) {
        $('#userinfowindow').jqxWindow('setContent', data);
    }); 
}
    
function save(){
    var reftrno = document.getElementById("reftrno").value;
    var brhid1 = document.getElementById("brhid1").value;
    var refdtype = document.getElementById("refdtype").value;
    var userid = document.getElementById("userid").value; 
    var amount = document.getElementById("txtamount").value;
    var remark = document.getElementById("txtremark").value;
   
    if(userid == ""){
        $.messager.alert('Message',"select A User");
        return 0;
    }
        
    var x = new XMLHttpRequest();
    x.onreadystatechange = function(){
        if (x.readyState == 4 && x.status == 200) {
            var items = x.responseText;
            items = items.split('###');
            var res = items[0];
            
            if(res > 0){
                $.messager.alert('Message',"Saved Successfully");
                document.getElementById("reftrno").value="";
                document.getElementById("brhid1").value="";
                document.getElementById("refdtype").value="";
                document.getElementById("userid").value="";
                document.getElementById("txtuser").value="";
                document.getElementById("txtamount").value="";
                document.getElementById("txtremark").value="";
                $("#txtuser").attr("placeholder", "press F3 for Search");
            } else {
                $.messager.alert('Message',"Not Updated");
            }
        }
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

function disablebtn() {
    $('#btnenquiry').attr("disabled",true);
    $('#btnsurvey').attr("disabled",true);
    $('#btnservicereport').attr("disabled",true);
    $('#txtuser').attr("disabled",true); 
    $('#btnsave').attr("disabled",true);
    $('#txtamount').attr("disabled",true);
    $('#txtremark').attr("disabled",true);
}

function btnsurvey() {
    var surdocno = document.getElementById("surveydocno").value;
    var path1 = "com/project/execution/surveyDetails/surveydet.jsp";
    var url = document.URL;
    var reurl = url.split("com");

    window.parent.formName.value = "Survey Details";
    window.parent.formCode.value = "SUR";
    var detName = "Survey Details";
    var path = path1+"?modes=view&surdocno="+surdocno;
    
    top.addTab( detName,reurl[0]+""+path);
}

function btnservicereport() {
    var reportdocno = document.getElementById("reportdocno").value;
    var url = document.URL;
    var reurl = url.split("com/");
    window.parent.formName.value = "Service Report";
    window.parent.formCode.value = "SRVE";
    var detName = "Service Report";
    var path1 = 'com/project/execution/serviceReport/serviceReport.jsp';
    var path = path1+"?modes=view&reportdocno="+reportdocno;
    
    top.addTab( detName,reurl[0]+""+path);
}

function btnenquiry() {
    var enqdocno = document.getElementById("enqdocno").value;
    var brhid1 = document.getElementById("brhid1").value;
    var path1 = "com/operations/marketing/enquirynew/enquiry.jsp";
    var url = document.URL;
    var reurl = url.split("com");

    window.parent.formName.value = "Enquiry";
    window.parent.formCode.value = "ENQ";
    var detName = "Enquiry";
    var path = path1+"?modes=view&enqdocno="+enqdocno+"&brhid="+brhid1;
    
    top.addTab( detName,reurl[0]+""+path);
}
</script>
</head>

<body onload="getBranch();disablebtn();">
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
                </table>
            </div>

            <div class="filter-card">
                <div style="font-size: 11px; font-weight: 600; color: #4e5e71; margin-bottom: 10px; text-transform: uppercase; letter-spacing: 0.5px;">View Tools</div>
                <div class="view-actions-container">
                    <button type="button" id="btnenquiry" name="btnenquiry" class="btn-primary btn-secondary" onclick="btnenquiry();">Enquiry</button>
                    <button type="button" id="btnsurvey" name="btnsurvey" class="btn-primary btn-secondary" onclick="btnsurvey();">Survey</button>
                    <button type="button" id="btnservicereport" name="btnservicereport" class="btn-primary btn-secondary" style="flex: 100%;" onclick="btnservicereport();">Service Report</button>
                </div>
            </div>

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

            <div class="release-actions">
                <button type="button" id="btnsave" name="btnsave" class="btn-primary" onclick="save();">Save Assignment</button>
            </div>

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

    <div class="main-content-area">
        <div id="estcenterdiv">
            <jsp:include page="estimationCenterGrid.jsp"></jsp:include> 
        </div>
    </div>

</div>

<div id="clientsearch1"><div></div></div> 
<div id="userinfowindow"><div></div></div>

</div>
</div>
</body>
</html>