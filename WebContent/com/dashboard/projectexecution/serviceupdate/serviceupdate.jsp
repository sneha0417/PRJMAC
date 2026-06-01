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
    width: 340px;
    flex: 0 0 340px;
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
    width: 95px;
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
.release-filter-table div[id^="fromdate"],
.release-filter-table div[id^="todate"] {
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
    justify-content: flex-start;
    gap: 8px;
    font-size: 12px;
    color: #4e5e71;
    font-weight: 600;
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
    flex: 1;
    height: 30px;
    background: #2563eb;
    color: #fff;
    border: none;
    border-radius: 4px;
    font-size: 12px;
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

.btn-success {
    background: #10b981;
}

.btn-success:hover:not(:disabled) {
    background: #059669;
}

.button-group {
    display: flex;
    gap: 6px;
    margin-top: 15px;
    justify-content: center;
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
	 pChange();
	 $("body").prepend('<div id="overlay" class="ui-widget-overlay" style="z-index: 1; display: none;"></div>');
	 $("body").prepend("<div id='PleaseWait' style='display: none;position:absolute; z-index: 1;top:180px;right:550px;'><img src='../../../../icons/31load.gif'/></div>");

	 $('#grpinfowindow').jqxWindow({ width: '25%', height: '60%',  maxHeight: '85%' ,maxWidth: '80%' ,title: 'Assign Group' , position: { x: 250, y: 60 }, keyboardCloseKey: 27});
	 $('#grpinfowindow').jqxWindow('close');
			
	 $('#teaminfowindow').jqxWindow({ width: '30%', height: '60%',  maxHeight: '85%' ,maxWidth: '80%' ,title: 'Assign Team' , position: { x: 250, y: 60 }, keyboardCloseKey: 27});
	 $('#teaminfowindow').jqxWindow('close');
			
	 $('#areainfowindow').jqxWindow({ width: '25%', height: '70%',  maxHeight: '85%' ,maxWidth: '80%' ,title: ' Area Search' , position: { x: 250, y: 60 }, keyboardCloseKey: 27});
	 $('#areainfowindow').jqxWindow('close');
			
	 $('#clientsearch1').jqxWindow({ width: '50%', height: '55%',  maxHeight: '85%' ,maxWidth: '80%' ,title: 'Client Search' , position: { x: 250, y: 120 }, keyboardCloseKey: 27});
	 $('#clientsearch1').jqxWindow('close');
		  
	 // Enforced 100% width and 24px height to match new UI standard
	 $("#fromdate").jqxDateTimeInput({ width: '100%', height: '24px',formatString:"dd.MM.yyyy"});
	 $("#todate").jqxDateTimeInput({ width: '100%', height: '24px',formatString:"dd.MM.yyyy"});
	
	 var todates=new Date($('#todate').jqxDateTimeInput('getDate'));
	 var onemounth=new Date(new Date(todates).setMonth(todates.getMonth()-1)); 
	    
     $('#todate').jqxDateTimeInput('setDate', new Date());
    
     $('#txtclient').dblclick(function(){
    	 $('#clientsearch1').jqxWindow('open');
    	 clientSearchContent('clientINgridsearch.jsp?', $('#clientsearch1')); 
	 });
	
     $('#txtgrpmember').dblclick(function(){
    	 var id=2;
    	 var assgnid = "";
    	 if(id==1){
			 assgnid=document.getElementById("sergroupid").value;
    	 }
		 $('#teaminfowindow').jqxWindow('open');
	     teamSearchContent('servicegrptoearch.jsp?assgnid='+assgnid+'&id='+id);
	 });
     
     $('#txtsergroup').dblclick(function(){
    	 var id=1;
    	 $('#grpinfowindow').jqxWindow('open');
    	 grpSearchContent('servicegrpsearch.jsp?id='+id);
	 });
     
     $('#txtsergrpemp').dblclick(function(){
    	 var id=1;
    	 var assgnid = "";
    	 if(id==1){
			 assgnid=document.getElementById("sergroupid").value;
    	 }
		 $('#teaminfowindow').jqxWindow('open');
	     teamSearchContent('servicegrptoearch.jsp?assgnid='+assgnid+'&id='+id);
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

function funExportBtn(){   
	 $("#serschedulediv").excelexportjs({   
		containerid: "serschedulediv",    
		datatype: 'json', 
		dataset: null, 
		gridId: "jqxloaddataGrid", 
		columns: getColumns("jqxloaddataGrid") ,     
		worksheetName: "Service Update"
	});     
}

function funreload() {
    var id=1;
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
	var chkfromdate = $('#hidchckfromdate').val();
	var fromdate = $('#fromdate').val();
	var barchval = document.getElementById("cmbbranch").value;
	var isprior=document.getElementById("isprior").value;
	var bttnview=document.getElementById("bttnview").value;
	var grp=document.getElementById("sergroupid").value;
	var emp=document.getElementById("grpserempid").value;
	var mem=document.getElementById("grpsermemberid").value;
	var area=document.getElementById("txtareaid").value;
	
    $("#jqxloaddataGrid").jqxGrid('clear'); 
	$("#jqxSerCount").jqxGrid('clear');
			
	$("#serCountgrid").load("serCountgrid.jsp?barchval="+barchval+"&date="+date+"&clientid="+clientid+"&id="+id+"&isprior="+isprior+"&grp="+grp+"&emp="+emp+"&mem="+mem+"&area="+area+'&chkfromdate='+chkfromdate+'&fromdate='+fromdate+"&bttnview="+bttnview);
}
	
function getgrpcode(event,id){
	var x= event.keyCode;
	if(x==114){
		$('#grpinfowindow').jqxWindow('open');
	    grpSearchContent('servicegrpsearch.jsp?id='+id);
	}
}
   
function grpSearchContent(url) {
	$.get(url).done(function (data) {
	    $('#grpinfowindow').jqxWindow('setContent', data);
    }); 
}
		
function getteam(event,id){
	var x= event.keyCode;
	if(x==114){
		var assgnid;
		if(id==1){
			assgnid=document.getElementById("sergroupid").value;
        }
		$('#teaminfowindow').jqxWindow('open');
	    teamSearchContent('servicegrptoearch.jsp?assgnid='+assgnid+'&id='+id);
	}
}
	
function teamSearchContent(url) {
	$.get(url).done(function (data) {
	    $('#teaminfowindow').jqxWindow('setContent', data);
    }); 
}	

function funClear(){
	$("#jqxloaddataGrid").jqxGrid('clear'); 
	$("#jqxSerCount").jqxGrid('clear');
	disablebtn();
    document.getElementById("txtclient").value="";
    document.getElementById("clientid").value="0";
		   
    document.getElementById("txtsergroup").value="";
    document.getElementById("sergroupid").value="0";
		   
    document.getElementById("txtsergrpemp").value="";
    document.getElementById("grpsermemberid").value="0";
    document.getElementById("grpserempid").value="0";
		   
    document.getElementById("txtassignarea").value="";
    document.getElementById("txtareaid").value="0";
		   
    $("#txtclient").attr("placeholder", "press F3 for Search");
    $("#txtsergroup").attr("placeholder", "press F3 for Search");
    $("#txtsergrpemp").attr("placeholder", "press F3 for Search");
    $("#txtassignarea").attr("placeholder", "press F3 for Search");
    document.getElementById("txtper").value="";
    document.getElementById("rect").value="";
    document.getElementById("txtdesc").value="";
    document.getElementById("test").innerText="";
}
	   
function funPrintBtn() {
}
	
function fromdatecheck(){
	if(document.getElementById("chckfromdate").checked){
		document.getElementById("hidchckfromdate").value = 1;
		$('#fromdate').jqxDateTimeInput({ disabled: false});
	} else{
		document.getElementById("hidchckfromdate").value = 0;
		$('#fromdate').jqxDateTimeInput({ disabled: true});
	}
}
		
function disablebtn() {
	funselect();
	$('#btnsave').attr("disabled",true);
	$('#btnattach').attr("disabled",true);
	$('#btnconfirm').attr("disabled",true);
}
			
function attach(){
	var fcode="SRVE";
	var fname="Sevice Report";
	var myWindow= window.open("<%=contextPath%>/com/common/Attachmaster.jsp?formCode="+fcode+"&docno="+document.getElementById("srdocno").value+"&brchid="+document.getElementById("srbrhid").value+"&frmname="+fname,"_blank","top=180,left=310,Width=800,Height=430,location=no,scrollbars=no,toolbar=no,resizable=no,meanubar=no,titlebar=no");
	myWindow.focus();
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
			} else{
			 	document.getElementById("bttnview").value="0";
			}
		}
	}
	x.open("GET","checkview.jsp?",true);
	x.send();
}

function save(event){   
	var btnaction = event.target.id;
	var msg="Save";
	if(btnaction=="btnconfirm") {
		msg="Confirm";
	}
	var txtsrtrno=$('#txtsrtrno').val();
	var txtsrdocno =  $('#txtsrdocno').val();
	var txtxper=$('#txtper').val();
	var rect =  $('#rect').val();
	var txtdesc = $('#txtdesc').val();
	var rectval=0;
	if(txtxper==''){
		 $.messager.alert('Message','Please Enter Percentage','warning');
		 return 0;
	}
		
	if(rect>0){
		if(txtdesc==''){
			$.messager.alert('Message','Please Enter Description','warning');   
			return 0;
		}
		rectval=1; 
	}
		
	var txtcustomerdocno=document.getElementById("txtcustomerdocno").value;
	var txtcustomeracno=document.getElementById("txtcustomeracno").value;
	var cmbcontracttype=document.getElementById("cmbcontracttype").value;
	var txtcontracttrno=document.getElementById("txtcontracttrno").value;
			
	var txtsiteid=document.getElementById("txtsiteid").value;
	var txtareaid=document.getElementById("txtareaid").value;
	var txtscheduleno=document.getElementById("txtscheduleno").value;
	var servicetype=document.getElementById("servicetype").value;
	
    $.messager.confirm('Confirm', 'Do you want to '+msg+' ? ', function(r){
	 	if (r){
	 		saveGridData(txtcustomerdocno,txtcustomeracno,cmbcontracttype,txtcontracttrno,txtsiteid,txtareaid,txtscheduleno,servicetype,txtxper,txtdesc,rectval,txtsrtrno,txtsrdocno,btnaction,msg);
		}
	});
}
	
function saveGridData(txtcustomerdocno,txtcustomeracno,cmbcontracttype,txtcontracttrno,txtsiteid,txtareaid,txtscheduleno,servicetype,txtxper,txtdesc,rectval,txtsrtrno,txtsrdocno,btnaction,msg){
	var msg12="Saved";
	if(msg=="Confirm"){
		msg12="Confirmed";
	}
	var x=new XMLHttpRequest();
	x.onreadystatechange=function(){
		if (x.readyState==4 && x.status==200){
			var items=x.responseText;
			if(parseInt(items)==1)  {	
				var rowindex=document.getElementById("rowindex").value;
		        $('#jqxloaddataGrid').jqxGrid('setcellvalue', rowindex, "gridrow",1);
		        $('#jqxloaddataGrid').jqxGrid('setcellvalue', rowindex, "workper",parseFloat($('#txtper').val()));
				disablebtn();
				$.messager.alert('Message', msg12+' Successfully ');
			}
			else {
				$.messager.alert('Message', ' Not '+msg12);
			}
		}
	}
    x.open("GET","saveData.jsp?txtcustomerdocno="+txtcustomerdocno+"&txtcustomeracno="+txtcustomeracno+"&cmbcontracttype="+cmbcontracttype
		   +"&txtcontracttrno="+txtcontracttrno+"&txtsiteid="+txtsiteid+"&txtareaid="+txtareaid+"&txtscheduleno="+txtscheduleno
		   +"&servicetype="+servicetype+"&txtxper="+txtxper+"&txtdesc="+txtdesc+"&rectval="+rectval+"&txtsrtrno="+txtsrtrno+"&txtsrdocno="+txtsrdocno+"&btnaction="+btnaction,true);		
	x.send();
}
					
function funselect(){
	var rect =  $('#rect').val();
	if(rect=="1") {
		$('#txtdesc').attr("disabled",false);
	}
	else{
		document.getElementById("txtdesc").value ="";
		$('#txtdesc').attr("disabled",true);
	}
}
</script>
</head>
<body onload="getBranch();disablebtn();fromdatecheck();serviceview();">
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
                        <td class="label-cell">
                            <div class="checkbox-row" style="justify-content: flex-end; margin: 0;">
                                <input type="checkbox" id="chckfromdate" name="chckfromdate" value="" onchange="fromdatecheck();" onclick="$(this).attr('value', this.checked ? 1 : 0)" /> 
                                <input type="hidden" id="hidchckfromdate" name="hidchckfromdate" value='<s:property value="hidchckfromdate"/>'/>
                                <label for="chckfromdate" style="margin-left: 5px;">From</label>
                            </div>
                        </td>
                        <td><div id="fromdate" name="fromdate" value='<s:property value="fromdate"/>'></div></td>
                    </tr>
                    
                    <tr>
                        <td class="label-cell">Upto</td>
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
                                <input type="hidden" id="clientid" name="clientid" value='<s:property value="clientid"/>'>
                            </div>
                        </td>
                    </tr>
                    
                    <tr>
                        <td class="label-cell">Assign Group</td>
                        <td>
                            <input type="text" name="txtsergroup" id="txtsergroup" value='<s:property value="txtsergroup"/>' onKeyDown="getgrpcode(event,1);" readonly placeholder="Press F3 to Search">
                            <input type="hidden" id="sergroupid" name="sergroupid" value='<s:property value="sergroupid"/>'>
                        </td>
                    </tr>
                    
                    <tr>
                        <td class="label-cell">Group Member</td>
                        <td>
                            <input type="text" name="txtsergrpemp" id="txtsergrpemp" value='<s:property value="txtsergrpemp"/>' onKeyDown="getteam(event,1);" readonly placeholder="Press F3 to Search">
                            <input type="hidden" id="grpsermemberid" name="grpsermemberid" value='<s:property value="grpsermemberid"/>'>
                            <input type="hidden" id="grpserempid" name="grpserempid" value='<s:property value="grpserempid"/>'>
                        </td>
                    </tr>
                    
                    <tr>
                        <td class="label-cell">Area</td>
                        <td>
                            <input type="text" name="txtassignarea" id="txtassignarea" value='<s:property value="txtassignarea"/>' onKeyDown="getareas(event);" readonly placeholder="Press F3 to Search">
                            <input type="hidden" id="txtareaid" name="txtareaid" value='<s:property value="txtareaid"/>'>
                        </td>
                    </tr>
                </table>
                
                <div class="checkbox-row" style="justify-content: center; margin-top: 10px;">
                    <label for="priority">Priority</label>
                    <input type="checkbox" name="priority" id="priority" onchange="pChange();">
                    
                    <button type="button" class="icon-btn" id="btnPrint" hidden="true" title="Print current Document" onclick="funPrintBtn()" style="margin-left: 10px;">  
                        <img alt="printDocument" src="<%=contextPath%>/icons/print_new.png">
                    </button>
                </div>
            </div>

            <div class="filter-card" style="padding: 10px;">
                <div id="serCountgrid"><jsp:include page="serCountgrid.jsp"></jsp:include></div>
                <label id="test" class="info-label"></label>
            </div>

            <div class="filter-card">
                <table class="release-filter-table">
                    <tr>
                        <td class="label-cell">Percentage</td>
                        <td><input type="text" name="txtper" id="txtper" value='<s:property value="txtper"/>'></td>
                    </tr>
                    
                    <tr>
                        <td class="label-cell">Rectification</td>
                        <td>
                            <select id="rect" name="rect" onChange="funselect();">
                                <option value="" selected>--SELECT--</option>
                                <option value="1">YES</option>
                                <option value="0">NO</option>
                            </select>
                        </td>
                    </tr>
                    
                    <tr>
                        <td class="label-cell">Description</td>
                        <td><input type="text" name="txtdesc" id="txtdesc" value='<s:property value="txtdesc"/>'></td>
                    </tr>
                </table>

                <div class="button-group">
                    <button type="button" name="btnsave" id="btnsave" class="btn-submit" onclick="save(event);">Save</button>
                    <button type="button" name="btnattach" id="btnattach" class="btn-submit btn-secondary" onclick="attach();">Attach</button>
                    <button type="button" name="btnconfirm" id="btnconfirm" class="btn-submit btn-success" onclick="save(event);">Confirm</button>
                </div>
                
                <input type="hidden" id="assignid" name="assignid" value='<s:property value="assignid"/>'>
                <input type="hidden" id="trno" name="trno" value='<s:property value="trno"/>'>
                <input type="hidden" id="srno" name="srno" value='<s:property value="srno"/>'>
                <input type="hidden" id="dtype" name="dtype" value='<s:property value="dtype"/>'>
                <input type="hidden" id="isprior" name="isprior" value='<s:property value="isprior"/>'>
                <input type="hidden" id="rowindex" name="rowindex" value='<s:property value="rowindex"/>'>
                <input type="hidden" id="srdocno" name="srdocno" value='<s:property value="srdocno"/>'>
                <input type="hidden" id="srbrhid" name="srbrhid" value='<s:property value="srbrhid"/>'>
                <input type="hidden" id="txtcustomerdocno" name="txtcustomerdocno" value='<s:property value="txtcustomerdocno"/>'>
                <input type="hidden" id="txtcustomeracno" name="txtcustomeracno" value='<s:property value="txtcustomeracno"/>'>
                <input type="hidden" id="cmbcontracttype" name="cmbcontracttype" value='<s:property value="cmbcontracttype"/>'>
                <input type="hidden" id="txtcontracttrno" name="txtcontracttrno" value='<s:property value="txtcontracttrno"/>'>
                <input type="hidden" id="txtsiteid" name="txtsiteid" value='<s:property value="txtsiteid"/>'>
                <input type="hidden" id="txtareaid" name="txtareaid" value='<s:property value="txtareaid"/>'>
                <input type="hidden" id="txtscheduleno" name="txtscheduleno" value='<s:property value="txtscheduleno"/>'>
                <input type="hidden" id="servicetype" name="servicetype" value='<s:property value="servicetype"/>'>
                <input type="hidden" id="txtsrtrno" name="txtsrtrno" value='<s:property value="txtsrtrno"/>'>
                <input type="hidden" id="txtsrdocno" name="txtsrdocno" value='<s:property value="txtsrdocno"/>'>
                <input type="hidden" id="bttnview" name="bttnview" value='<s:property value="bttnview"/>'>
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
<div id="areainfowindow"><div></div></div>

</div>
</body>
</html>