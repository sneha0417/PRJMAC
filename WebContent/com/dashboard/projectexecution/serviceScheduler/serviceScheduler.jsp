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

/* Readonly / disabled look */
input[readonly],
input:disabled {
    background-color: #f3f6f9 !important;
    color: #555;
    /* REMOVED: cursor: not-allowed; to match legacy behavior */
}

/* jqx date/time containers */
.release-filter-table div[id^="todate"],
.release-filter-table div[id^="adate"],
.release-filter-table div[id^="atime"] {
    width: 100%;
}

/* Input with icon button alignment */
.input-with-button {
    display: flex;
    gap: 6px;
    align-items: center;
}

.icon-btn {
    width: 24px;
    height: 24px;
    padding: 2px;
    background: #ffffff;
    border: 1px solid #ccd6e0;
    border-radius: 4px;
    cursor: pointer;
    display: flex;
    align-items: center;
    justify-content: center;
}
.icon-btn img {
    width: 14px;
    height: 14px;
}
.icon-btn:hover {
    background: #f1f5f9;
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
    margin: 5px 0;
}
.checkbox-row input[type="checkbox"] {
    margin: 0;
    cursor: pointer;
}

/* Info Label */
.info-label {
    font-family: 'comic sans ms', sans-serif;
    font-weight: bold;
    color: blue;
    font-size: 11px;
    display: block;
    text-align: center;
    margin-top: 5px;
    min-height: 15px;
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
}

.btn-submit:hover {
    background: #1d4ed8;
}

.btn-submit:active {
    transform: scale(0.98);
}

.btn-secondary {
    background: #64748b;
}

.btn-secondary:hover {
    background: #475569;
}

.button-group {
    display: flex;
    gap: 8px;
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
    gap: 15px;
}
</style>

<script type="text/javascript">
$(document).ready(function () {
	 pChange();
	 $("body").prepend('<div id="overlay" class="ui-widget-overlay" style="z-index: 1; display: none;"></div>');
	 $("body").prepend("<div id='PleaseWait' style='display: none;position:absolute; z-index: 1;top:180px;right:550px;'><img src='../../../../icons/31load.gif'/></div>");

	 $('#grpinfowindow').jqxWindow({ width: '25%', height: '60%',  maxHeight: '85%' ,maxWidth: '80%' ,title: 'Assign Group' , position: { x: 250, y: 60 }, keyboardCloseKey: 27});
	 $('#grpinfowindow').jqxWindow('close');
			
	 $('#teaminfowindow').jqxWindow({ width: '30%', height: '60%',  maxHeight: '85%' ,maxWidth: '80%' ,title: 'Assign Team' , position: { x: 250, y: 60 }, keyboardCloseKey: 27});
	 $('#teaminfowindow').jqxWindow('close');
			  
	 $('#assigninfowindow').jqxWindow({ width: '25%', height: '60%',  maxHeight: '85%' ,maxWidth: '80%' ,title: 'Assign Method' , position: { x: 250, y: 60 }, keyboardCloseKey: 27});
	 $('#assigninfowindow').jqxWindow('close');
			
	 $('#siteinfowindow').jqxWindow({ width: '25%', height: '65%',  maxHeight: '85%' ,maxWidth: '80%' ,title: 'Site Search' , position: { x: 250, y: 60 }, keyboardCloseKey: 27});
	 $('#siteinfowindow').jqxWindow('close');
			  
	 $('#areainfowindow').jqxWindow({ width: '25%', height: '70%',  maxHeight: '85%' ,maxWidth: '80%' ,title: ' Area Search' , position: { x: 250, y: 60 }, keyboardCloseKey: 27});
	 $('#areainfowindow').jqxWindow('close');
			
	 $('#clientsearch1').jqxWindow({ width: '50%', height: '55%',  maxHeight: '85%' ,maxWidth: '80%' ,title: 'Client Search' , position: { x: 250, y: 120 }, keyboardCloseKey: 27});
	 $('#clientsearch1').jqxWindow('close');
		  
	 // Enforced 100% width and 24px height to match new UI standard
	 $("#todate").jqxDateTimeInput({ width: '100%', height: '24px',formatString:"dd.MM.yyyy"});
	 $("#adate").jqxDateTimeInput({ width: '100%', height: '24px',formatString:"dd.MM.yyyy",enableBrowserBoundsDetection:true});
	 $("#atime").jqxDateTimeInput({ width: '100%', height: '24px',formatString:"HH:mm",showCalendarButton: false});
	
	 var todates=new Date($('#todate').jqxDateTimeInput('getDate'));
	 var onemounth=new Date(new Date(todates).setMonth(todates.getMonth()-1)); 
	    
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
     
     $('#txtsite').dblclick(function(){
    	 $('#siteinfowindow').jqxWindow('open');
	     siteSearchContent('servicesitesearch.jsp');
	 });
     
     $('#txtgrpmember').dblclick(function(){
    	 var assgnid=document.getElementById("groupid").value;
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
});

function getclinfo(event){
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

function funExportBtn(){
    $("#serschedulediv").excelexportjs({
		containerid: "serschedulediv",   
		datatype: 'json',
		dataset: null,
		gridId: "jqxloaddataGrid",
		columns: getColumns("jqxloaddataGrid") ,   
		worksheetName:"Service Scheduler"        
	});
}
     
function getsite(event){
    var x= event.keyCode;
    if(x==114){
        $('#siteinfowindow').jqxWindow('open');
        siteSearchContent('servicesitesearch.jsp');
    }
}
   
function siteSearchContent(url) {
	 $.get(url).done(function (data) {
	     $('#siteinfowindow').jqxWindow('setContent', data);
     }); 
}

function getareas(event){
    var x= event.keyCode;
    if(x==114){
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
	var clientid=$('#clientid').val();
	var date=$('#todate').val();
	var barchval = document.getElementById("cmbbranch").value;
    var dtype="0";
    var id=1;
    var isprior=document.getElementById("isprior").value;
   
    if(id>0){
    	countload(id);
    }
}
	
function pChange(){
	if(document.getElementById("priority").checked){
		document.getElementById("isprior").value=1;
	} else{
		document.getElementById("isprior").value=0;
	}
}

function countload(id){
	var clientid=$('#clientid').val();
	var date=$('#todate').val();
	var barchval = document.getElementById("cmbbranch").value;
	var isprior=document.getElementById("isprior").value;
	var site=document.getElementById("txtsite").value;
	var area=document.getElementById("txtareaid").value;
	var bttnview=document.getElementById("bttnview").value;
	
	$("#jqxloaddataGrid").jqxGrid('clear'); 
	$("#jqxSerCount").jqxGrid('clear');
    site=site.replace(/ /g, "%20");
	$("#serCountgrid").load("serCountgrid.jsp?barchval="+barchval+"&date="+date+"&clientid="+clientid+"&id="+id+"&isprior="+isprior+"&site="+site+"&area="+area+"&bttnview="+bttnview);
}
	
function getgrpcode(event){
	var x= event.keyCode;
	if(x==114){
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
	var x= event.keyCode;
	if(x==114){
		var assgnid=document.getElementById("groupid").value;
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
    var x= event.keyCode;
    if(x==114){
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
	var groupid=document.getElementById("groupid").value;
    var grpmemberid=document.getElementById("grpmemberid").value;
    var grpempid=document.getElementById("grpempid").value;
    var assignid=document.getElementById("assignid").value;
    var trno=document.getElementById("trno").value;
    var srno=document.getElementById("srno").value;
    var clientid=document.getElementById("clientid").value;
    var dtype=document.getElementById("dtype").value;
    var brchid=document.getElementById("cmbbranch").value;
    var desc=document.getElementById("txtdesc").value;
    var rowindex=document.getElementById("rowindex").value;
    var pdate=$('#adate').val();
	var ptime=$('#atime').val();
	
    if($('#rowindex').val()== "") {
	    $.messager.alert('Message',"select a document");
		return 0;
	}
    if($('#groupid').val()== "") {
        $.messager.alert('Message',"select Assign Group");
	    return 0;
	}
	if($('#grpmemberid').val()== "") {
		$.messager.alert('Message',"select Group Member");
	    return 0;
	}
	if($('#assignid').val()== "") {
		$.messager.alert('Message',"Select Assign Method");
	    return 0;
	}
		
	var x=new XMLHttpRequest();
	x.onreadystatechange=function(){
		if (x.readyState==4 && x.status==200) {
			var items= x.responseText;
			items=items.split('###');
			var res=items[0];
			 	
			if(res>0){
				$.messager.alert('Message',"Saved Successfully");
				var clientid=$('#clientid').val();
		        var date=$('#todate').val();
		        var barchval = document.getElementById("cmbbranch").value;
			    var dtype=document.getElementById("dtype").value;
			    var rowindex=document.getElementById("rowindex").value;
			    
                $('#jqxloaddataGrid').jqxGrid('setcellvalue', rowindex, "gridrow",1);
			    document.getElementById("groupid").value="";
			    document.getElementById("grpmemberid").value="";
			    document.getElementById("grpempid").value="";
			    document.getElementById("assignid").value="";
			    document.getElementById("trno").value="";
			    document.getElementById("srno").value="";
			    document.getElementById("dtype").value="";
			    document.getElementById("txtgroup").value="";
			    document.getElementById("txtgrpmember").value="";
			    document.getElementById("txtassign").value="";
			    document.getElementById("txtdesc").value="";
			    $("#txtgroup").attr("placeholder", "press F3 for Search");
			    $("#txtgrpmember").attr("placeholder", "press F3 for Search");
			    $("#txtassign").attr("placeholder", "press F3 for Search");
			    $('#adate').jqxDateTimeInput('setDate', new Date());
			    $('#atime').jqxDateTimeInput('setDate', new Date());
			         
			    var isprior=document.getElementById("isprior").value;
			    var id=1;
			    $("#serCountgrid").load("serCountgrid.jsp?barchval="+barchval+"&date="+date+"&clientid="+clientid+"&id="+id+"&isprior="+isprior);
			} else {
			 	$.messager.alert('Message',"Not Updated");
			}
		}
	}
	x.open("GET","saveSchedule.jsp?groupid="+groupid+"&grpmemberid="+grpmemberid+"&grpempid="+grpempid+"&assignid="+assignid+"&trno="+trno+"&srno="+srno+"&clientid="+clientid+"&dtype="+dtype+"&brchid="+brchid+"&desc="+desc+"&pdate="+pdate+"&ptime="+ptime,true);
	x.send();
}

function serviceview(){
	var x=new XMLHttpRequest();
	x.onreadystatechange=function(){
		if (x.readyState==4 && x.status==200) {
			var items= x.responseText;
			items=items.split('###');
			var res=items[0];
			if(res>0){             
			 	document.getElementById("bttnview").value="1";
			} else {
			 	document.getElementById("bttnview").value="0";
			}
		}
	}
	x.open("GET","viewSchedule.jsp?",true);
	x.send();
}
	   
function funClear(){
	$("#jqxloaddataGrid").jqxGrid('clear'); 
	$("#jqxSerCount").jqxGrid('clear');
	$("#jqxloaddataGrid").jqxGrid('addrow', null, {});
			
    document.getElementById("txtclient").value="";
    document.getElementById("clientid").value="0";
    $("#txtclient").attr("placeholder", "press F3 for Search");
		   
    document.getElementById("txtsite").value="";
    document.getElementById("siteid").value="0";
    $("#txtsite").attr("placeholder", "press F3 for Search");
		   
    document.getElementById("txtassignarea").value="";
    document.getElementById("txtareaid").value="0";
    $("#txtassignarea").attr("placeholder", "press F3 for Search");
}
		
function funPrint() {
	var doccno=$('#doccno').val();
	var clientid=$('#clientid').val();
	var date=$('#todate').val();
	var barchval = document.getElementById("cmbbranch").value;
	var isprior=document.getElementById("isprior").value;
	var site=document.getElementById("txtsite").value;
	var area=document.getElementById("txtareaid").value;
	
    if(doccno==''){
		$.messager.alert('Message','Please Select a Row.','warning');
		return 0;
	}
		   			
	if ($("#doccno").val()!="") {
		var url=document.URL;
		var reurl=url.split("serviceScheduler.jsp");
		var win= window.open(reurl[0]+"printservicescheduler?branch="+barchval+"&docno="+document.getElementById("doccno").value+'&dtype='+$("#dtype").val()+'&srno='+$("#srno").val(),"_blank","top=150,left=250,Width=1020,Height=500,location=no,scrollbars=no,toolbar=yes");
		win.focus();
	} else {
		$.messager.alert('Message','Please Select a Client.','warning');
		return;
	}
}

function printcheck(){
	var x=new XMLHttpRequest();
	x.onreadystatechange=function(){
		if (x.readyState==4 && x.status==200) {
			var items= x.responseText.trim();
			document.getElementById("confvalue").value=items;
		}
	}
	x.open("GET","viewprint.jsp",true);
	x.send();
}

function funPrintbutton() {
	var doccno=$('#doccno').val();
	var dtype=document.getElementById("dtyp").value;
	var barchval = document.getElementById("cmbbranch").value;
			
	if(doccno==''){
		$.messager.alert('Message','Please Select a Row.','warning');
		return 0;
	}
		   			
	if ($("#doccno").val()!="" && dtype=="AMC") {
		var url=document.URL;
		var reurl=url.split("serviceScheduler.jsp");
		var win= window.open(reurl[0]+"printserviceschedulerAMC?branch="+barchval+"&docno="+document.getElementById("doccno").value+'&dtype='+$("#dtype").val()+'&srno='+$("#srno").val(),"_blank","top=150,left=250,Width=1020,Height=500,location=no,scrollbars=no,toolbar=yes");
		win.focus();
	}
	else if($("#doccno").val()!="" && dtype=="SJOB"){
		var url=document.URL;
		var reurl=url.split("serviceScheduler.jsp");
		var win= window.open(reurl[0]+"printserviceschedulerSjob?branch="+barchval+"&docno="+document.getElementById("doccno").value+'&dtype='+$("#dtype").val()+'&srno='+$("#srno").val(),"_blank","top=150,left=250,Width=1020,Height=500,location=no,scrollbars=no,toolbar=yes");
		win.focus();
	}
	else {
		$.messager.alert('Message','Please Select a Client.','warning');
		return;
	}
}

function configCheck() {
	var confvalue=document.getElementById("confvalue").value;
	if(confvalue==1){
		funPrintbutton();
	} else {
		funPrint();
	}
}
</script>
</head>
<body onload="getBranch();serviceview();printcheck();" >
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
                        <td class="label-cell">Upto Date</td>
                        <td><div id='todate' name='todate' value='<s:property value="todate"/>'></div></td>
                    </tr>
                    
                    <tr>
                        <td class="label-cell">Client</td>
                        <td>
                            <div class="input-with-button">
                                <input type="text" name="txtclient" id="txtclient" value='<s:property value="txtclient"/>' onKeyDown="getclinfo(event);" readonly placeholder="Press F3 to Search" style="flex: 1;">
                                <button type="button" class="icon-btn" id="clear" title="clear" onclick="funClear()"> 
                                    <img alt="clear" src="<%=contextPath%>/icons/clear.png">
                                </button>
                            </div>
                        </td>
                    </tr>

                    <tr>
                        <td class="label-cell">Site</td>
                        <td><input type="text" name="txtsite" id="txtsite" value='<s:property value="txtsite"/>' onKeyDown="getsite(event);" readonly placeholder="Press F3 to Search"></td>
                    </tr>

                    <tr>
                        <td class="label-cell">Area</td>
                        <td><input type="text" name="txtassignarea" id="txtassignarea" value='<s:property value="txtassignarea"/>' onKeyDown="getareas(event);" readonly placeholder="Press F3 to Search"></td>
                    </tr>
                </table>

                <div class="checkbox-row">
                    <label for="priority">Priority</label>
                    <input type="checkbox" name="priority" id="priority" onchange="pChange();">
                </div>

                <input type="hidden" id="clientid" name="clientid" value='<s:property value="clientid"/>'>
                <input type="hidden" id="siteid" name="siteid" value='<s:property value="siteid"/>'>
                <input type="hidden" id="txtareaid" name="txtareaid" value='<s:property value="txtareaid"/>'>
            </div>

            <div class="filter-card" style="padding: 10px;">
                <div id="serCountgrid"><jsp:include page="serCountgrid.jsp"></jsp:include></div>
                <label id="test" class="info-label"></label>
            </div>

            <div class="filter-card">
                <table class="release-filter-table">
                    <tr>
                        <td class="label-cell">Assign Group</td>
                        <td>
                            <input type="text" name="txtgroup" id="txtgroup" value='<s:property value="txtgroup"/>' onKeyDown="getgrpcode(event);" readonly placeholder="Press F3 to Search">
                            <input type="hidden" id="groupid" name="groupid" value='<s:property value="groupid"/>'>
                        </td>
                    </tr>
                    
                    <tr>
                        <td class="label-cell">Group Member</td>
                        <td>
                            <input type="text" name="txtgrpmember" id="txtgrpmember" value='<s:property value="txtgrpmember"/>' onKeyDown="getteam(event);" readonly placeholder="Press F3 to Search">
                            <input type="hidden" id="grpmemberid" name="grpmemberid" value='<s:property value="grpmemberid"/>'>
                            <input type="hidden" id="grpempid" name="grpempid" value='<s:property value="grpempid"/>'>
                        </td>
                    </tr>
                    
                    <tr>
                        <td class="label-cell">Assign Method</td>
                        <td><input type="text" name="txtassign" id="txtassign" value='<s:property value="txtassign"/>' onKeyDown="getassign(event);" readonly placeholder="Press F3 to Search"></td>
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

                <div class="button-group">
                    <button type="button" name="btnsave" class="btn-submit" onclick="save();">Save</button>
                    <button type="button" name="btnprint" class="btn-submit btn-secondary" onclick="configCheck();">Print</button>
                </div>
                
                <input type="hidden" id="assignid" name="assignid" value='<s:property value="assignid"/>'>
                <input type="hidden" id="trno" name="trno" value='<s:property value="trno"/>'>
                <input type="hidden" id="bttnview" name="bttnview" value='<s:property value="bttnview"/>'>
                <input type="hidden" id="srno" name="srno" value='<s:property value="srno"/>'>
                <input type="hidden" id="dtype" name="dtype" value='<s:property value="dtype"/>'>
                <input type="hidden" id="doccno" name="doccno" value='<s:property value="doccno"/>'>
                <input type="hidden" id="isprior" name="isprior" value='<s:property value="isprior"/>'>
                <input type="hidden" id="rowindex" name="rowindex" value='<s:property value="rowindex"/>'>
                <input type="hidden" id="confvalue" name="confvalue" value='<s:property value="confvalue"/>'>
                <input type="hidden" id="dtyp" name="dtyp">
            </div>
        </div>
    </div>

    <div class="main-content-area">
        <div id="serschedulediv" class="filter-card" style="padding: 0; overflow: hidden; flex: 1; min-height: 500px;">
            <jsp:include page="serScheduleDetails.jsp"></jsp:include> 
        </div>
    </div>

</div>

<div id="clientsearch1"><div></div></div> 
<div id="grpinfowindow"><div></div></div>
<div id="teaminfowindow"><div></div></div>
<div id="assigninfowindow"><div></div></div>
<div id="siteinfowindow"><div></div></div>
<div id="areainfowindow"><div></div></div>

</div>
</body>
</html>