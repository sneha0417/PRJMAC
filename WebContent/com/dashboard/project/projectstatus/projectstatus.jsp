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
}

/* jqx date/time containers */
.release-filter-table div[id^="fromdate"],
.release-filter-table div[id^="todate"] {
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

/* Main Content Area */
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

	 // Enforced 100% width and 24px height to match new UI standard
	 $("#fromdate").jqxDateTimeInput({ width: '100%', height: '24px', formatString:"dd.MM.yyyy"});
	 $("#todate").jqxDateTimeInput({ width: '100%', height: '24px', formatString:"dd.MM.yyyy"});
	 
     var fromdates=new Date($('#fromdate').jqxDateTimeInput('getDate'));
	 var onemounth=new Date(new Date(fromdates).setMonth(fromdates.getMonth()-1)); 
	    
	 $('#clientsearch').jqxWindow({ width: '50%', height: '55%',  maxHeight: '85%' ,maxWidth: '80%' ,title: 'Client Search' , position: { x: 250, y: 120 }, keyboardCloseKey: 27});
	 $('#clientsearch').jqxWindow('close');  
	 $('#assigngrpwindow').jqxWindow({ width: '50%', height: '55%',  maxHeight: '85%' ,maxWidth: '80%' ,title: 'Assign Group Search' , position: { x: 250, y: 120 }, keyboardCloseKey: 27});
	 $('#assigngrpwindow').jqxWindow('close'); 
	 
     $('#fromdate').jqxDateTimeInput('setDate', new Date(onemounth));
	 $('#todate').on('change', function (event) {
		   var fromdates=new Date($('#fromdate').jqxDateTimeInput('getDate'));
		  // out date
		   var todates=new Date($('#todate').jqxDateTimeInput('getDate')); //del date
		 	 
		   if(fromdates>todates){
			   $.messager.alert('Message','To Date Less Than From Date  ','warning');   
		       return false;
		  }   
	 });
	 
	 $('#client_name').dblclick(function(){
		 $('#clientsearch').jqxWindow('open');
		 clientSearchContent('clientSearch.jsp?', $('#clientsearch'));
	 });
	 
	 $('#txtassigngroup').dblclick(function(){
		 $('#assigngrpwindow').jqxWindow('open');
		 assigngrpSearchContent('assignGrpSearch.jsp?', $('#assigngrpwindow'));
	 }); 
});

function assigngrpSearchContent(url) {
    $.get(url).done(function (data) {
        $('#assigngrpwindow').jqxWindow('setContent', data);
    }); 
}

function getassigngrp(event){
    var x= event.keyCode;
    if(x==114){
        $('#clientsearch').jqxWindow('open');
        clientSearchContent('clientSearch.jsp?', $('#clientsearch'));    
    }
}  

function clientSearchContent(url) {
    $.get(url).done(function (data) {
        $('#clientsearch').jqxWindow('setContent', data);
    }); 
} 

$('#txtassigngroup').dblclick(function(){
    if($('#mode').val()!= "view"){
        $('#assigngrpwindow').jqxWindow('open');
        assigngrpSearchContent('assignGrpSearch.jsp?', $('#assigngrpwindow'));
    }
});

function funExportBtn(){
    $("#loadgriddata").excelexportjs({
        containerid: "loadgriddata",   
        datatype: 'json',
        dataset: null,
        gridId: "jqxloaddataGrid",
        columns: getColumns("jqxloaddataGrid") ,   
        worksheetName:"Project Status"  
    });   
}

function funreload(event) {
    var fromdates=new Date($('#fromdate').jqxDateTimeInput('getDate'));
    var todates=new Date($('#todate').jqxDateTimeInput('getDate')); 
		 	 
    if(fromdates>todates){
        $.messager.alert('Message','To Date Less Than From Date  ','warning');   
        return false;
    }
	 	 
    var barchval = document.getElementById("cmbbranch").value;
    var fromdate= $("#fromdate").val();
    var todate= $("#todate").val();
    var rds;
	
    if (document.getElementById('radio_amc').checked) {
        rds=$("#radio_amc").val();
    } else{
        rds=$("#radio_sjob").val();
    }
    
    var clientid=$('#clientid').val();
    var asgngrpid=$('#assigngrpid').val();
    $("#Countgrid").load("Countgrid.jsp?barchval="+barchval+"&fromdate="+fromdate+"&todate="+todate+"&rds="+rds+"&clientid="+clientid+"&asgngrpid="+asgngrpid);
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
                        <td class="label-cell">Client</td>
                        <td><input type="text" name="client_name" id="client_name" placeholder="Press F3 for Search" onKeyDown="getclinfo(event);" value='<s:property value="client_name" />'></td>
                    </tr>
                    
                    <tr>
                        <td class="label-cell">Assign Group</td>
                        <td><input type="text" name="txtassigngroup" id="txtassigngroup" placeholder="Press F3 for Search" onKeyDown="getassigngrp(event);" value='<s:property value="txtassigngroup" />'></td>
                    </tr>
                    
                    <tr>
                        <td class="label-cell">Category</td>
                        <td>
                            <div class="radio-group">
                                <label><input type="radio" id="radio_amc" name="category" value="AMC" checked="checked"> AMC</label>
                                <label><input type="radio" id="radio_sjob" name="category" value="SJOB"> SJOB</label>
                            </div>
                        </td>
                    </tr>
                </table>
            </div>

            <div class="filter-card" style="padding: 10px;">
                <div id="Countgrid"><jsp:include page="Countgrid.jsp"></jsp:include></div>
            </div>

            <input type="hidden" id="clientid" name="clientid" value='<s:property value="clientid"/>'>
            <input type="hidden" id="assigngrpid" name="assigngrpid" value='<s:property value="assigngrpid"/>'>
            <input type="hidden" id="acno" name="acno" value='<s:property value="acno"/>'>
        </div>
    </div>

    <div class="main-content-area">
        <div id="loadgriddata">
            <jsp:include page="gridDetails.jsp"></jsp:include> 
        </div>
    </div>

</div>

<div id="clientsearch">
   <div></div>
</div>
<div id="assigngrpwindow">
   <div></div>
</div>

</div>
</div>
</body>
</html>