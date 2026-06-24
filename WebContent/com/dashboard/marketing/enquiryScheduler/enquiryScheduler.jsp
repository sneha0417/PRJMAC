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

/* Sidebar Custom Scrollbar UI Elements */
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

/* Cleaner Clear Control Object Component */
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
.release-filter-table div[id^="todate"],
.release-filter-table div[id^="adate"],
.release-filter-table div[id^="atime"] {
    width: 100%;
}

/* ===== REQUIRED VISUAL BLUE BUTTON SCALING DEFINITIONS ===== */
.btn-primary {
    flex: 1;
    height: 28px;
    background-color: #1e6bf2; /* Exact specific blue matching choice */
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

.btn-secondary {
    background-color: #4b5563;
}
.btn-secondary:hover {
    background-color: #374151;
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

    $('#grpinfowindow').jqxWindow({ width: '25%', height: '60%', maxHeight: '85%', maxWidth: '80%', title: 'Assign Group', position: { x: 250, y: 60 }, keyboardCloseKey: 27});
    $('#grpinfowindow').jqxWindow('close');
        
    $('#teaminfowindow').jqxWindow({ width: '30%', height: '60%', maxHeight: '85%', maxWidth: '80%', title: 'Assign Team', position: { x: 250, y: 60 }, keyboardCloseKey: 27});
    $('#teaminfowindow').jqxWindow('close');
          
    $('#assigninfowindow').jqxWindow({ width: '25%', height: '60%', maxHeight: '85%', maxWidth: '80%', title: 'Assign Method', position: { x: 250, y: 60 }, keyboardCloseKey: 27});
    $('#assigninfowindow').jqxWindow('close');
        
    $('#areainfowindow').jqxWindow({ width: '25%', height: '70%', maxHeight: '85%', maxWidth: '80%', title: ' Area Search', position: { x: 250, y: 60 }, keyboardCloseKey: 27});
    $('#areainfowindow').jqxWindow('close');
        
    $('#clientsearch1').jqxWindow({ width: '50%', height: '55%', maxHeight: '85%', maxWidth: '80%', title: 'Client Search', position: { x: 250, y: 120 }, keyboardCloseKey: 27});
    $('#clientsearch1').jqxWindow('close');
          
    // 24px UI Height enforcement criteria config matching page patterns
    $("#todate").jqxDateTimeInput({ width: '100%', height: '24px', formatString:"dd.MM.yyyy"});
    $("#adate").jqxDateTimeInput({ width: '100%', height: '24px', formatString:"dd.MM.yyyy", enableBrowserBoundsDetection:true});
    $("#atime").jqxDateTimeInput({ width: '100%', height: '24px', formatString:"HH:mm", showCalendarButton: false});
    
    var todates = new Date($('#todate').jqxDateTimeInput('getDate'));
    var onemounth = new Date(new Date(todates).setMonth(todates.getMonth()-1)); 
        
    $('#todate').jqxDateTimeInput('setDate', new Date());
    $('#adate').jqxDateTimeInput('setDate', new Date());
    $('#atime').jqxDateTimeInput('setDate', new Date());
     
    $('#txtclient').dblclick(function(){
        $('#clientsearch1').jqxWindow('open');
        clientSearchContent('clientINgridsearch.jsp?', $('#clientsearch1')); 
    });
     
    $('#txtgroup').dblclick(function(){
        $('#grpinfowindow').jqxWindow('open');
        grpSearchContent('servicegrpsearch.jsp');
    });
     
    $('#txtgrpmember').dblclick(function(){
        var assgnid = document.getElementById("groupid").value;
        $('#teaminfowindow').jqxWindow('open');
        teamSearchContent('servicegrptoearch.jsp?assgnid='+assgnid);
    });
     
    $('#txtassign').dblclick(function(){
        $('#assigninfowindow').jqxWindow('open');
        assignSearchContent('assignmodesearch.jsp');
    });
      
    $('#txtassignarea').dblclick(function(){
        $('#areainfowindow').jqxWindow('open');
        areaSearchContent('area.jsp');
    });

    $('#cmbprocess').attr("disabled",true);
    $('#assignfield').attr("disabled",true);
    $('#adate').jqxDateTimeInput({ disabled: true});
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
    JSONToCSVCon(enqlistexcel,'Survey Scheduler',true);
}
     
function getareas(event){
    var x = event.keyCode;
    if(x == 114){
        $('#areainfowindow').jqxWindow('open');
        areaSearchContent('area.jsp');
    }
}
             
function areaSearchContent(url) {
    $.get(url).done(function (data) {
        $('#areainfowindow').jqxWindow('setContent', data);
    }); 
}

function funreload() {
    var id = 1;
    if(id > 0){
        gridload(id);
    }
}
    
function gridload(id){
    var clientid = $('#clientid').val();
    var date = $('#todate').val();
    var barchval = document.getElementById("cmbbranch").value;
    var area = document.getElementById("txtareaid").value;
    
    $("#enqschedulegrid").jqxGrid('clear'); 
    $("#overlay, #PleaseWait").show();
    $("#enqschedulediv").load("enqScheduleDetails.jsp?barchval="+barchval+"&date="+date+"&clientid="+clientid+"&id="+id+"&area="+area);
}
     
function getgrpcode(event){
    var x = event.keyCode;
    if(x == 114){
        $('#grpinfowindow').jqxWindow('open');
        grpSearchContent('servicegrpsearch.jsp');
    }
}
         
function grpSearchContent(url) {
    $.get(url).done(function (data) {
        $('#grpinfowindow').jqxWindow('setContent', data);
    }); 
}
        
function getteam(event){
    var x = event.keyCode;
    if(x == 114){
        var assgnid = document.getElementById("groupid").value;
        $('#teaminfowindow').jqxWindow('open');
        teamSearchContent('servicegrptoearch.jsp?assgnid='+assgnid);
    }
}
         
function teamSearchContent(url) {
    $.get(url).done(function (data) {
        $('#teaminfowindow').jqxWindow('setContent', data);
    }); 
}    
    
function getassign(event){
    var x = event.keyCode;
    if(x == 114){
        $('#assigninfowindow').jqxWindow('open');
        assignSearchContent('assignmodesearch.jsp');
    }
}
         
function assignSearchContent(url) {
    $.get(url).done(function (data) {
        $('#assigninfowindow').jqxWindow('setContent', data);
    }); 
}
    
function save(){
    var groupid = document.getElementById("groupid").value;
    var grpmemberid = document.getElementById("grpmemberid").value;
    var grpempid = document.getElementById("grpempid").value;
    var assignid = document.getElementById("assignid").value;
    var trno = document.getElementById("trno").value;
    var schtrno = document.getElementById("schtrno").value;
    var brchid = document.getElementById("brhid1").value;
    var desc = document.getElementById("txtdesc").value;
    var process = document.getElementById("cmbprocess").value;
   
    var pdate = $('#adate').val();
    var ptime = $('#atime').val();

    if($('#rowindex').val() == ""){
        $.messager.alert('Message',"select a document");
        return 0;
    }
    if($('#cmbprocess').val() == ""){
        $.messager.alert('Message',"Select Process");
        return 0;
    }
    if($('#cmbprocess').val() == "ASN"){
        if($('#groupid').val() == ""){
            $.messager.alert('Message',"select Assign Group");
            return 0;
        }
        if($('#grpmemberid').val() == ""){
            $.messager.alert('Message',"select Group Member");
            return 0;
        }
        if($('#assignid').val() == ""){
            $.messager.alert('Message',"Select Assign Method");
            return 0;
        }
    }	

    var x = new XMLHttpRequest();
    x.onreadystatechange = function(){
        if (x.readyState == 4 && x.status == 200) {
            var items = x.responseText;
            items = items.split('###');
            var res = items[0];
            
            if(res > 0){
                $.messager.alert('Message',"Saved Successfully");
                document.getElementById("groupid").value="";
                document.getElementById("grpmemberid").value="";
                document.getElementById("grpempid").value="";
                document.getElementById("assignid").value="";
                document.getElementById("trno").value="";
                document.getElementById("schtrno").value="";
                document.getElementById("txtgroup").value="";
                document.getElementById("txtgrpmember").value="";
                document.getElementById("txtassign").value="";
                document.getElementById("txtdesc").value="";
                document.getElementById("cmbprocess").value="";
                $("#txtgroup").attr("placeholder", "press F3 for Search");
                $("#txtgrpmember").attr("placeholder", "press F3 for Search");
                $("#txtassign").attr("placeholder", "press F3 for Search");
              
                $('#adate').jqxDateTimeInput('setDate', new Date());
                $('#atime').jqxDateTimeInput('setDate', new Date());
                $("#enqschedulegrid").jqxGrid('clear');
                $("#siteGrid").jqxGrid('clear');
            } else {
                $.messager.alert('Message',"Not Updated");
            }
        }
    }
    x.open("GET","saveEnqschedule.jsp?groupid="+groupid+"&grpmemberid="+grpmemberid+"&grpempid="+grpempid+"&assignid="+assignid+"&trno="+trno+"&brchid="+brchid+"&desc="+desc+"&pdate="+pdate+"&ptime="+ptime+"&schtrno="+schtrno+"&process="+process,true);
    x.send();
}
       
function funClear(){
    $("#enqschedulegrid").jqxGrid('clear'); 
    
    document.getElementById("txtclient").value="";
    document.getElementById("clientid").value="0";
    $("#txtclient").attr("placeholder", "press F3 for Search");
    
    document.getElementById("txtassignarea").value="";
    document.getElementById("txtareaid").value="0";
    $("#txtassignarea").attr("placeholder", "press F3 for Search");
}

function funCmbChange() {
    var cmb = document.getElementById("cmbprocess").value;
    if(cmb == "SUR"){
        $('#assignfield').attr("disabled",true);
        $('#adate').jqxDateTimeInput({ disabled: true});
    }
    if(cmb == "ASN"){
        $('#assignfield').attr("disabled",false);
        $('#adate').jqxDateTimeInput({ disabled: false});
    }
}

function funPrint() {
    var doccno = $('#trno').val();
    var barchval = document.getElementById("cmbbranch").value;
    
    if(doccno == ''){
        $.messager.alert('Message','Please Select a Row.','warning');
        return 0;
    }
            
    if ($("#doccno").val() != "") {
        var url = document.URL;
        var reurl = url.split("enquiryScheduler.jsp");
        var win = window.open(reurl[0]+"printsurveyscheduler?branch="+barchval+"&docno="+doccno,"_blank","top=150,left=250,Width=1020,Height=500,location=no,scrollbars=no,toolbar=yes");
        win.focus();
    } else {
        $.messager.alert('Message','Please Select a Client.','warning');
        return;
    }
}
</script>
</head>

<body>
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
                        <td class="label-cell">Upto Date</td>
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
                        <td class="label-cell">Area</td>
                        <td>
                            <div class="search-input-wrapper">
                                <input type="text" name="txtassignarea" id="txtassignarea" value='<s:property value="txtassignarea"/>' readonly="readonly" placeholder="Double click to search" onKeyDown="getareas(event);" ondblclick="getareas(event);" />
                                <div class="search-icon"></div>
                            </div>
                            <input type="hidden" id="txtareaid" name="txtareaid" value='<s:property value="txtareaid"/>'>
                        </td>
                    </tr>

                    <tr>
                        <td class="label-cell">Process</td>
                        <td>
                            <select id="cmbprocess" name="cmbprocess" onchange="funCmbChange();" value='<s:property value="cmbprocess"/>'>
                                <option value="">--Select--</option>
                                <option value="SUR">Surveyed</option>
                                <option value="ASN">Assign</option>
                            </select>
                        </td>
                    </tr>
                </table>
            </div>

            <div id="assignfield" class="filter-card">
                <table class="release-filter-table">
                    <tr>
                        <td class="label-cell">Assign Group</td>
                        <td>
                            <div class="search-input-wrapper">
                                <input type="text" name="txtgroup" id="txtgroup" value='<s:property value="txtgroup"/>' readonly="readonly" placeholder="Double click to search" onKeyDown="getgrpcode(event);" ondblclick="getgrpcode(event);" />
                                <div class="search-icon"></div>
                            </div>
                            <input type="hidden" id="groupid" name="groupid" value='<s:property value="groupid"/>'>
                        </td>
                    </tr>

                    <tr>
                        <td class="label-cell">Group Member</td>
                        <td>
                            <div class="search-input-wrapper">
                                <input type="text" name="txtgrpmember" id="txtgrpmember" value='<s:property value="txtgrpmember"/>' readonly="readonly" placeholder="Double click to search" onKeyDown="getteam(event);" ondblclick="getteam(event);" />
                                <div class="search-icon"></div>
                            </div>
                            <input type="hidden" id="grpmemberid" name="grpmemberid" value='<s:property value="grpmemberid"/>'>
                            <input type="hidden" id="grpempid" name="grpempid" value='<s:property value="grpempid"/>'>
                        </td>
                    </tr>

                    <tr>
                        <td class="label-cell">Assign Method</td>
                        <td>
                            <div class="search-input-wrapper">
                                <input type="text" name="txtassign" id="txtassign" value='<s:property value="txtassign"/>' readonly="readonly" placeholder="Double click to search" onKeyDown="getassign(event);" ondblclick="getassign(event);" />
                                <div class="search-icon"></div>
                            </div>
                        </td>
                    </tr>

                    <tr>
                        <td class="label-cell">Planned Date</td>
                        <td><div id='adate' name='adate' value='<s:property value="adate"/>'></div></td>
                    </tr>

                    <tr>
                        <td class="label-cell">Planned Time</td>
                        <td><div id='atime' name='atime' value='<s:property value="atime"/>'></div></td>
                    </tr>

                    <tr>
                        <td class="label-cell">Description</td>
                        <td><input type="text" name="txtdesc" id="txtdesc" value='<s:property value="txtdesc"/>'></td>
                    </tr>
                </table>
            </div>

            <div class="release-actions">
                <button type="button" name="btnsave" class="btn-primary" onclick="save();">Save</button>
                <button type="button" name="btnprint" class="btn-primary btn-secondary" onclick="funPrint();">Print</button>
            </div>

            <input type="hidden" id="assignid" name="assignid" value='<s:property value="assignid"/>'>
            <input type="hidden" id="trno" name="trno" value='<s:property value="trno"/>'>
            <input type="hidden" id="brhid1" name="brhid1" value='<s:property value="brhid1"/>'>
            <input type="hidden" id="dtype" name="dtype" value='<s:property value="dtype"/>'>
            <input type="hidden" id="schtrno" name="schtrno" value='<s:property value="schtrno"/>'>
            <input type="hidden" id="rowindex" name="rowindex" value='<s:property value="rowindex"/>'>
        </div>
    </div>

    <div class="main-content-area">
        <div style="margin-bottom: 15px;">
            <div id="enqschedulediv"><jsp:include page="enqScheduleDetails.jsp"></jsp:include></div>
        </div>
        <div>
            <div id="sitediv"><jsp:include page="siteGrid.jsp"></jsp:include></div>
        </div>
    </div>

</div>

<div id="clientsearch1"><div></div></div> 
<div id="grpinfowindow"><div></div></div>
<div id="teaminfowindow"><div></div></div>
<div id="assigninfowindow"><div></div></div>
<div id="areainfowindow"><div></div></div>

</div>
</div>
</body>
</html>