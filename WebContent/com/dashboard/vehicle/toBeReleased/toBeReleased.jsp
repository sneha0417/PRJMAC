
 <jsp:include page="../../../../includes.jsp"></jsp:include>
<%@ taglib prefix="s" uri="/struts-tags" %>
 <% String contextPath=request.getContextPath();%> 

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>GatewayERP(i)</title>
<%-- <script type="text/javascript" src="../../js/dashboard.js"></script> --%> 
<link href="../../../../css/dashboard.css" media="screen" rel="stylesheet" type="text/css" />  
<script type="text/javascript">
$(document).ready(function () {
	
	document.getElementById("dashfleetwarning").style.display="none";
	document.getElementById("dashbtnrelease").disabled=true;
	document.getElementById("dashreleasefuel").disabled=true;
	document.getElementById("btnvehicle").disabled=true;
	document.getElementById("btnattach").disabled=true;
	 $("#dashreleasedate").jqxDateTimeInput({ width: '125px', height: '15px',formatString:"dd.MM.yyyy"});
	 $("#dashreleasetime").jqxDateTimeInput({ width: '20%', height: '17px', formatString: 'HH:mm', showCalendarButton: false ,value: new Date()});
	/*  $('#vehiclewindow').jqxWindow({ autoOpen: false,width: '80%', height: '70%',  maxHeight: '70%' ,maxWidth: '80%' , title: 'Vehicle Details' ,position: { x: 250, y: 60 }, keyboardCloseKey: 27, showCloseButton: true,closeButtonAction:'hide'});
	   $('#vehiclewindow').jqxWindow('close'); */
	 /*   $('#clientWindow').jqxWindow({ autoOpen: false,width: '78%', height: '85%',  maxHeight: '85%' ,maxWidth: '78%' , title: 'Client Details' , theme: 'energyblue', position: { x: 280, y: 10 }, keyboardCloseKey: 27, showCloseButton: true,closeButtonAction:'hide'});
	   $('#clientWindow').jqxWindow('close'); */
	   $('#vehiclewindow').jqxWindow({width: '80%', height: '70%',  maxHeight: '80%' ,maxWidth: '90%' , title: 'Vehicle Details',position: { x: 250, y: 60} , theme: 'energyblue', showCloseButton: true,closeButtonAction:'hide'});
	   $('#vehiclewindow').jqxWindow('close');
	 
	   $('#clientAttachWindow').jqxWindow({autoOpen: false,width: '51%', height: '58%',  maxHeight: '70%' ,maxWidth: '51%' , title: 'Attach',position: { x: 300, y: 87 } , theme: 'energyblue', showCloseButton: true});
	   $('#clientAttachWindow').jqxWindow('close');
	   $('input[type=text]').val('');
	   $('select').find('option').prop("selected", false);
	 $.jqx._jqxDateTimeInput.getDateTime(new Date());
getBrch();	
getTestLocation(); 
});
function funExportBtn(){
	 //$("#toBeReleasedGrid").jqxGrid('exportdata', 'xls', 'ToBeReleased');

   
	   if(parseInt(window.parent.chkexportdata.value)=="1")
	    {
	    JSONToCSVCon(datarelease, 'ToBeReleased', true);
	    }
	   else
	    {
		   $("#toBeReleasedGrid").jqxGrid('exportdata', 'xls', 'ToBeReleased');
	    }
	   
	   



}
function getTestLocation(){
	var x=new XMLHttpRequest();
	x.onreadystatechange=function(){
		if (x.readyState==4 && x.status==200)
			{
			 	items= x.responseText;
					//alert(items);
			 	items=items.split('***');
		        var locationItems=items[0].split(",");
		        var locationidItems=items[1].split(",");
		        	var optionslocation = '<option value="">--Select--</option>';
		       for ( var i = 0; i < locationItems.length; i++) {
		    	   optionslocation += '<option value="' + locationidItems[i] + '">' + locationItems[i] + '</option>';
		        }
		       $("select#dashcmbrlsloc").html(optionslocation);
			   //	$('#accno').val($('#accnohidden').val()) ;
			   	if ($('#dashhidcmbrlsloc').val() != null) {
			$('#dashcmbrlsloc').val($('#dashhidcmbrlsloc').val());
		}
			}
		else
			{
			}
	}
	x.open("GET","getTestLocation.jsp",true);
	x.send();
//document.write(document.getElementById("authname").value);

}
function getBrch() {
	var x = new XMLHttpRequest();
	var items, brchItems, currItems;
	x.onreadystatechange = function() {
		if (x.readyState == 4 && x.status == 200) {
			items = x.responseText;
			items = items.split('####');
			brchIdItems = items[0].split(",");
			brchItems = items[1].split(",");
			var optionsbrch = '<option value="">--Select--</option>';
			for (var i = 0; i < brchItems.length; i++) {
				optionsbrch += '<option value="' + brchIdItems[i] + '">'
						+ brchItems[i] + '</option>';
			}
			
			$("select#dashcmbrlsbranch").html(optionsbrch);
			if ($('#dashhidcmbrlsbranch').val() != null) {
				$('#dashcmbrlsbranch').val($('#dashhidcmbrlsbranch').val());
			}
		} else {
		}
	}
	x.open("GET", "getBranch.jsp", true);
	x.send();
}
function getLocation(value)
{
	//alert(here);
	var x=new XMLHttpRequest();
	x.onreadystatechange=function(){
		if (x.readyState==4 && x.status==200)
			{
			 	items= x.responseText;
					//alert(items);
			 	items=items.split('***');
		        var locationItems=items[0].split(",");
		        var locationidItems=items[1].split(",");
		        	var optionslocation = '<option value="">--Select--</option>';
		       for ( var i = 0; i < locationItems.length; i++) {
		    	   optionslocation += '<option value="' + locationidItems[i] + '">' + locationItems[i] + '</option>';
		        }
		       $("select#dashcmbrlsloc").html(optionslocation);
			   //	$('#accno').val($('#accnohidden').val()) ;
			   	if ($('#dashhidcmbrlsloc').val() != null) {
			$('#dashcmbrlsloc').val($('#dashhidcmbrlsloc').val());
		}
			}
		else
			{
			}
	}
	x.open("GET","getLocation.jsp?id="+value,true);
	x.send();
//document.write(document.getElementById("authname").value);

}
function funReleaseClick(){
	/* alert("Inside"); */
	document.getElementById("mode").value='R';
	var testfleet=document.getElementById("dashreleasefleet").value;
	var testbranch=document.getElementById("dashcmbrlsbranch").value;
	var testloc=document.getElementById("dashcmbrlsloc").value;
	var testkm=document.getElementById("dashreleasekm").value;
	var testfuel=document.getElementById("dashreleasefuel").value;
	var testdate= $('#dashreleasedate').jqxDateTimeInput('getDate');
	var testtime= $('#dashreleasetime').jqxDateTimeInput('getDate');
	var teststatus=document.getElementById("dashcmbrentalstatus").value;
	if((testfleet=='')||(testbranch=='')||(testloc=='')||(testkm=='')||(testfuel=='')){
		document.getElementById("dashfleetwarning").style.display="block";
		return false;
	}
	else{
		document.getElementById("dashfleetwarning").style.display="none";
		 
		 if(document.getElementById("dashreleasefleet").value<=0){
			 return false;
		 }
			document.getElementById("dashreleasefuel").disabled=false;
		 document.getElementById("frmReleaseDashBoard").submit();
		//funVehRelease(testfleet,testbranch,testloc,testkm,testfuel,testdate,testtime,teststatus);
		
		
	}
	document.getElementById("dashreleasefuel").disabled=true;
}

function setValues(){
	/* if($('#dashhidreleasetime').val()){
		$("#dashreleasetime").jqxDateTimeInput('val', $('#dashhidreleasetime').val());
	}
	/*  if (($('#hidcmbrentalstatus').val() != null)||($('#hidcmbrentalstatus').val() != "")) {
		$('#cmbrentalstatus').val($('#hidcmbrentalstatus').val());
	} 
	//alert("AAA"+$('#hidcmbrentalstatus').val()+"BBB");
	 /* if($('#dashhidreleasedate').val()){
			$("#dashreleasedate").jqxDateTimeInput('val', $('#hidreleasedate').val());
		} 
	 if ($('#dashhidreleasefuel').val() != null) {
			$('#dashreleasefuel').val($('#dashhidreleasefuel').val());
		}
	 if ($('#dashhidcmbrlsbranch').val() != null) {
			$('#dashcmbrlsbranch').val($('#dashhidcmbrlsbranch').val());
		} 
	 if ($('#dashhidcmbrlsloc').val() != null) {
			$('#dashcmbrlsloc').val($('#dashhidcmbrlsloc').val());
		}  */
	
	 if(($('#msg').val()!="")){
		   $.messager.alert('Message',$('#msg').val());
		  }
	/*  if(document.getElementById("cmbbranch").value==''){
			document.getElementById("msg").value="Invalid Branch";
			 $.messager.alert('Message',$('#msg').val());
			 return false;
		} */
	
	  var brchval = document.getElementById("cmbbranch").value;
	    $("#releasediv").load("toBeReleasedGrid.jsp?brchval="+brchval);

}
function funreload(event)
{
	
  var brchval = document.getElementById("cmbbranch").value;
 // var exdate = $('#insuexpdate').val();
 
   $("#releasediv").load("toBeReleasedGrid.jsp?brchval="+brchval);
 
 
 }

function getVehicle(){
	if(document.getElementById("dashreleasefleet").value==""){
		 $.messager.alert('Message',"Please Select Fleet");
		 return false;
	}
	$('#vehiclewindow').jqxWindow('setContent', '');
	$('#vehiclewindow').jqxWindow('open');	
	 vehicleSearchContent("<%=contextPath%>/com/controlcentre/masters/vehicle/saveVehicle1.action?mode=view&fleetno="+document.getElementById("dashreleasefleet").value);
}
function vehicleSearchContent(url) {
	//$('#vehiclewindow').jqxWindow('open');	
	$('#vehiclewindow').jqxWindow('focus');	
	$.get(url).done(function (data) {
$('#vehiclewindow').jqxWindow('setContent', data);
}); 
}
function getAttach(){
	if(document.getElementById("dashreleasefleet").value==""){
		 $.messager.alert('Message',"Please Select Fleet");
		 return false;
	}
	changeClientAttachContent("<%=contextPath%>/com/common/attachGrid.jsp?formCode=VEH&docno="+document.getElementById("docno").value);  

}
function changeClientAttachContent(url) {
	   $.get(url).done(function (data) {
	        $('#clientAttachWindow').jqxWindow('open');
	     $('#clientAttachWindow').jqxWindow('setContent',data);
	     $('#clientAttachWindow').jqxWindow('bringToFront');
	  }); 
	  }
</script>
<style>
/* ===== GLOBAL RESET & STRICT FONT ENFORCER ===== */
html, body {
    height: 100%;
    margin: 0;
    padding: 0;
    overflow: hidden; /* Prevents the whole page from scrolling */
    font-family: 'Segoe UI', 'Roboto', 'Arial', sans-serif !important;
    background-color: #f4f7f9;
}

#mainBG, .hidden-scrollbar {
    height: 100%;
}

table, td, th, input, select, textarea, button, span, div, label {
    font-family: inherit !important;
}

/* ===== THE NUCLEAR FIX: FIXED SIDEBAR ===== */
.fixed-sidebar-container {
    position: fixed; 
    top: 0;                   
    bottom: 0; /* Locks to the exact bottom of the browser */
    left: 0;
    width: 310px; 
    overflow-y: auto; /* Guarantees an independent scrollbar */
    background: #fff;
    border-right: 1px solid #e1e8ed;
    box-shadow: 2px 0 8px rgba(0,0,0,.05);
    z-index: 9999; 
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
    padding-bottom: 120px; /* Massive safe padding so buttons are NEVER cut off */
}

/* ===== INDEPENDENT SCROLLABLE RIGHT COLUMN ===== */
.scrollable-column {
    position: absolute;
    top: 0;
    bottom: 0;
    left: 0;
    right: 0;
    overflow-y: auto;
    padding: 15px;
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

/* ===== TABLES & LABELS ===== */
.release-filter-table {
    width: 100%;
    border-spacing: 0 12px; 
}

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

input:-webkit-autofill {
    -webkit-box-shadow: 0 0 0 30px white inset !important;
}

/* Disabled & Readonly styling */
input[readonly], select[readonly], textarea[readonly],
input:disabled, select:disabled, textarea:disabled,
.release-filter-table input[readonly] {
    background-color: #f8fafc !important; 
    color: #555;
    cursor: default;
}

/* Warning Message */
#dashfleetwarning {
    color: #dc2626;
    font-size: 11px;
    font-weight: 700;
    text-align: center;
    margin-top: 10px;
    padding: 5px;
    background: #fef2f2;
    border-radius: 4px;
    border: 1px solid #fecaca;
}

/* jqx widget containers */
.release-filter-table div[id^="dashrelease"] {
    width: 100%;
}

/* ===== BUTTONS ===== */
.btn-submit {
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
    text-align: center;
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
.btn-success {
    background: #059669;
}
.btn-success:hover {
    background: #047857;
}
.release-actions {
    display: flex;
    flex-wrap: wrap;
    gap: 8px;
    justify-content: center;
    margin-top: 15px;
}
.release-actions .btn-submit {
    flex: 1;
    min-width: 45%;
}
.release-actions .btn-full {
    flex: 100%;
}
</style>
</head>
<body onload="getBranch();setValues();">
<form id="frmReleaseDashBoard" action="saveReleaseDashBoard" method="post" autocomplete="off">
<div id="mainBG" class="homeContent" data-type="background"> 
<div class='hidden-scrollbar'>

<table width="100%" style="height: 100%;" cellspacing="0" cellpadding="0">
<tr>

<td style="width: 310px; min-width: 310px; height: 100%; vertical-align: top; position: relative; padding: 0; background: #fff; border-right: 1px solid #e1e8ed; box-shadow: 2px 0 8px rgba(0,0,0,.05); z-index: 10;">
    
    <div class="fixed-sidebar-container">
        <div class="sidebar-content-padding">
            
            <div class="filter-card">
                <jsp:include page="../../heading.jsp"></jsp:include>
            </div>

            <div class="filter-card">
                <table class="release-filter-table">

                    <tr>
                        <td class="label-cell">Fleet No</td>
                        <td><input type="text" name="dashreleasefleet" id="dashreleasefleet" value='<s:property value="dashreleasefleet"/>'></td>
                    </tr>

                    <tr>
                        <td class="label-cell">Branch</td>
                        <td>
                            <select name="dashcmbrlsbranch" id="dashcmbrlsbranch" value='<s:property value="dashcmbrlsbranch"/>' onChange="getLocation(this.value);">
                                <option value="">--Select--</option>
                            </select>
                            <input type="hidden" name="dashhidcmbrlsbranch" id="dashhidcmbrlsbranch" value='<s:property value="dashhidcmbrlsbranch"/>'>
                        </td>
                    </tr>

                    <tr>
                        <td class="label-cell">Location</td>
                        <td>
                            <select name="dashcmbrlsloc" id="dashcmbrlsloc" value='<s:property value="dashcmbrlsloc"/>'>
                                <option value="">--Select--</option>
                            </select>
                            <input type="hidden" name="dashhidcmbrlsloc" id="dashhidcmbrlsloc" value='<s:property value="dashhidcmbrlsloc"/>'>
                        </td>
                    </tr>

                    <tr>
                        <td class="label-cell">Rental Status</td>
                        <td>
                            <select name="dashcmbrentalstatus" id="dashcmbrentalstatus" value='<s:property value="dashcmbrentalstatus"/>'>
                                <option value="R" selected>Rental</option>
                                <option value="L">Lease</option>
                                <option value="LM">Limousine</option>
                                <option value="A">All</option>
                            </select>
                            <input type="hidden" name="dashhidcmbrentalstatus" id="dashhidcmbrentalstatus" value='<s:property value="dashhidcmbrentalstatus"/>'>
                        </td>
                    </tr>

                    <tr>
                        <td class="label-cell">Date</td>
                        <td><div id="dashreleasedate" name="dashreleasedate" value='<s:property value="dashreleasedate"/>'></div></td>
                    </tr>

                    <tr>
                        <td class="label-cell">Time</td>
                        <td><div id="dashreleasetime" name="dashreleasetime" value='<s:property value="dashreleasetime"/>'></div></td>
                    </tr>

                    <tr>
                        <td class="label-cell">KM</td>
                        <td><input type="text" name="dashreleasekm" id="dashreleasekm" value='<s:property value="dashreleasekm"/>' tabindex="-1" readonly></td>
                    </tr>

                    <tr>
                        <td class="label-cell">Fuel</td>
                        <td>
                            <select name="dashreleasefuel" id="dashreleasefuel" value='<s:property value="dashreleasefuel"/>'>
                                <option value="">--Select--</option>
                                <option value="0.000" selected>Level 0/8</option>
                                <option value="0.125">Level 1/8</option>
                                <option value="0.250">Level 2/8</option>
                                <option value="0.375">Level 3/8</option>
                                <option value="0.500">Level 4/8</option>
                                <option value="0.625">Level 5/8</option>
                                <option value="0.750">Level 6/8</option>
                                <option value="0.875">Level 7/8</option>
                                <option value="1.000">Level 8/8</option>
                            </select>
                        </td>
                    </tr>

                    <tr>
                        <td class="label-cell">Op. Status</td>
                        <td><input type="text" name="dashopstatus" id="dashopstatus" value='IN' tabindex="-1" disabled="true"></td>
                    </tr>

                    <tr>
                        <td class="label-cell">Ast status</td>
                        <td><input type="text" name="dashaststatus" id="dashaststatus" value='<s:property value="dashaststatus"/>' tabindex="-1" readonly></td>
                    </tr>

                </table>

                <div id="dashfleetwarning">All fields are Mandatory</div>

                <div class="release-actions">
                    <button type="button" name="btnvehicle" id="btnvehicle" class="btn-submit btn-secondary" onclick="getVehicle();">Vehicle</button>
                    <button type="button" name="btnattach" id="btnattach" class="btn-submit btn-secondary" onclick="getAttach();">Attach</button>
                    <button type="button" name="dashbtnrelease" id="dashbtnrelease" class="btn-submit btn-success btn-full" onClick="funReleaseClick();">Release</button>
                </div>

                <input type="hidden" name="hidclient" id="hidclient" >
                <input type="hidden" name="mode" id="mode" value='<s:property value="mode"/>' > 
                <input type="hidden" name="docno" id="docno" value='<s:property value="docno"/>' >

            </div>
        </div>
    </div>
</td>

<td style="height: 100%; vertical-align: top; position: relative; padding: 0; background: #fff;">
    <div class="scrollable-column">
        <table width="100%">
            <tr>
                <td>
                    <div id="releasediv">
                        <jsp:include page="toBeReleasedGrid.jsp"></jsp:include>
                    </div>
                </td>
            </tr>
        </table>
    </div>
</td>

</tr>
</table>

<div id="vehiclewindow"><div></div></div>
<div id="clientAttachWindow"><div></div></div>

</div>
</div>
</form>
</body>
</html>