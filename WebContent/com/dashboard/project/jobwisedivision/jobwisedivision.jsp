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
    cursor: not-allowed;
}

/* jqx date/time containers */
.release-filter-table div[id^="fromdate"],
.release-filter-table div[id^="todate"] {
    width: 100%;
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
    transition: background 0.2s;
    margin-bottom: 8px;
}

.btn-submit:hover:not(:disabled) {
    background: #1d4ed8;
}

/* Secondary Button Custom Style Retained */
.myButtons {
	-moz-box-shadow:inset 0px -1px 3px 0px #91b8b3;
	-webkit-box-shadow:inset 0px -1px 3px 0px #91b8b3;
	box-shadow:inset 0px -1px 3px 0px #91b8b3;
	background:-webkit-gradient(linear, left top, left bottom, color-stop(0.05, #768d87), color-stop(1, #6c7c7c));
	background:-moz-linear-gradient(top, #768d87 5%, #6c7c7c 100%);
	background:-webkit-linear-gradient(top, #768d87 5%, #6c7c7c 100%);
	background:-o-linear-gradient(top, #768d87 5%, #6c7c7c 100%);
	background:-ms-linear-gradient(top, #768d87 5%, #6c7c7c 100%);
	background:linear-gradient(to bottom, #768d87 5%, #6c7c7c 100%);
	filter:progid:DXImageTransform.Microsoft.gradient(startColorstr='#768d87', endColorstr='#6c7c7c',GradientType=0);
	background-color:#768d87;
	border:1px solid #566963;
	display:block;
    width: 100%;
    height: 30px;
    border-radius: 4px;
	cursor:pointer;
	color:#ffffff;
	font-size: 13px;
    font-weight: 600;
	text-decoration:none;
	text-shadow:0px -1px 0px #2b665e;
}
.myButtons:hover {
	background:-webkit-gradient(linear, left top, left bottom, color-stop(0.05, #6c7c7c), color-stop(1, #768d87));
	background:-moz-linear-gradient(top, #6c7c7c 5%, #768d87 100%);
	background:-webkit-linear-gradient(top, #6c7c7c 5%, #768d87 100%);
	background:-o-linear-gradient(top, #6c7c7c 5%, #768d87 100%);
	background:-ms-linear-gradient(top, #6c7c7c 5%, #768d87 100%);
	background:linear-gradient(to bottom, #6c7c7c 5%, #768d87 100%);
	filter:progid:DXImageTransform.Microsoft.gradient(startColorstr='#6c7c7c', endColorstr='#768d87',GradientType=0);
	background-color:#6c7c7c;
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

	 $("body").prepend('<div id="overlay" class="ui-widget-overlay" style="z-index: 1; display: none;"></div>');
	 $("body").prepend("<div id='PleaseWait' style='display: none;position:absolute; z-index: 1;top:180px;right:550px;'><img src='../../../../icons/31load.gif'/></div>");

	 $('#txtclientname').dblclick(function(){
		 accountsSearchContent('clientAccountDetailsSearch.jsp');
	 });
	     
	 $('#accountDetailsWindow').jqxWindow({width: '51%', height: '58%',  maxHeight: '70%' ,maxWidth: '51%' , title: 'Accounts Search',position: { x: 300, y: 87 } , theme: 'energyblue', showCloseButton: true, keyboardCloseKey: 27});
	 $('#accountDetailsWindow').jqxWindow('close');
		 
     // Standardized height to 24px and width to 100%
     $("#fromdate").jqxDateTimeInput({ width: '100%', height: '24px',formatString:"dd.MM.yyyy"});
	 $("#todate").jqxDateTimeInput({ width: '100%', height: '24px',formatString:"dd.MM.yyyy"});
	 
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
	$("#loadgriddata").excelexportjs({
		containerid: "loadgriddata", 
		datatype: 'json', 
		dataset: null, 
		gridId: "jqxloaddataGrid", 
		columns: getColumns("jqxloaddataGrid") , 
		worksheetName:"Job Wise Division1"
	});
	$("#subgriddata").excelexportjs({
		containerid: "subgriddata", 
		datatype: 'json', 
		dataset: null, 
		gridId: "jqxsubdivGrid", 
		columns: getColumns("jqxsubdivGrid") ,        
		worksheetName:"Job Wise Division2"   
	});
}

function funreload(event){
	 var fromdates=new Date($('#fromdate').jqxDateTimeInput('getDate'));
	 var todates=new Date($('#todate').jqxDateTimeInput('getDate')); 
	 
     if(fromdates>todates){
		 $.messager.alert('Message','To Date Less Than From Date  ','warning');   
	     return false;
	 }
	 
     var barchval = document.getElementById("cmbbranch").value;
	 var fromdate= $("#fromdate").val();
	 var todate= $("#todate").val();
	 var rds=$('#ctype').val();
	 var clientid=$('#txtclientaccountdocno').val();   
	 
	 $("#overlay, #PleaseWait").show();
	 $("#loadgriddata").load("gridDetails.jsp?barchval="+barchval+"&froms="+fromdate+"&tos="+todate+"&rds="+rds+"&clientid="+clientid+"&id="+1);
}

function getClientAccount(event){
	var rds=$('#ctype').val();
	if(rds=='ALL'){
	}
    var x= event.keyCode;
    if(x==114){
  	  accountsSearchContent('clientAccountDetailsSearch.jsp');
    }
}

function accountsSearchContent(url) {
    $('#accountDetailsWindow').jqxWindow('open');
	$.get(url).done(function (data) {
	    $('#accountDetailsWindow').jqxWindow('setContent', data);
	    $('#accountDetailsWindow').jqxWindow('bringToFront');
    }); 
}

function funClearData(){
	 $('#txtclientname').val('');
	 $('#txtclientaccountdocno').val('');
	 $('#acno').val('');
	 $('#trno').val('');
	 $('#jqxloaddataGrid').jqxGrid('clear');
	 $('#jqxsubdivGrid').jqxGrid('clear');
	 $('#txtclientname').val('Press F3 To Search');
}

function funUpdate(){        
	var rows = $("#jqxsubdivGrid").jqxGrid('getrows');
	var selectedrows=$("#jqxsubdivGrid").jqxGrid('selectedrowindexes');
	selectedrows = selectedrows.sort(function(a,b){return a - b});

	if(selectedrows.length==0){
	    $("#overlay, #PleaseWait").hide();
	    $.messager.alert('Warning','Select documents.');
	    return false;
	}
			
	$.messager.confirm('Message', 'Do you want to save changes?', function(r){
	    if(r==false) {
	        return false; 
	    } else {
	        $("#overlay, #PleaseWait").show();
			var i=0;
			var temptrno="",temptrno1="";               
			var j=0;
			for (i = 0; i < selectedrows.length; i++) {   
			    if(i==0){
			        var srvdetmtrno= $('#jqxsubdivGrid').jqxGrid('getcellvalue', selectedrows[i], "doc_no")+"###"+$('#jqxsubdivGrid').jqxGrid('getcellvalue', selectedrows[i], "budget");
			        temptrno=srvdetmtrno;
			    } else {
			        var srvdetmtrno= $('#jqxsubdivGrid').jqxGrid('getcellvalue', selectedrows[i], "doc_no")+"###"+$('#jqxsubdivGrid').jqxGrid('getcellvalue', selectedrows[i], "budget");             
			        temptrno=temptrno+","+srvdetmtrno;        
			    }
			    temptrno1=temptrno+",";
			    j++; 
			}
			$('#trno').val(temptrno1);   
			subgriddata($('#trno').val());	          
		}
	});
}   

function subgriddata(trno){    
    var x=new XMLHttpRequest();
    x.onreadystatechange=function(){
        if (x.readyState==4 && x.status==200) {
            var items=x.responseText;
		    if(parseInt(items)>=1) {
		        $.messager.alert('Message', ' Successfully Saved ');
		        $("#jqxsubdivGrid").jqxGrid('clear');    
			    $('#trno').val("");   
			    funreload(event); 
		    } else {
		        $.messager.alert('Message', ' Not Saved ');  
		    }
		} 
    }  
	x.open("GET","subData.jsp?trno="+encodeURIComponent(trno)+"&docno="+$("#docno").val(),true);
	x.send();     
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
                        <td class="label-cell">Type</td>
                        <td>
                            <select id="ctype" name="ctype" onclick="funundesable();" value='<s:property value="ctype"/>'>
                                <option value="ALL">ALL</option>
                                <option value="AMC">AMC</option>
                                <option value="SJOB">SJOB</option>
                            </select>
                        </td>
                    </tr>
                    
                    <tr>
                        <td class="label-cell">Client</td>
                        <td><input type="text" id="txtclientname" name="txtclientname" readonly="readonly" placeholder="Press F3 to Search" value='<s:property value="txtclientname"/>' onkeydown="getClientAccount(event);"/></td>
                    </tr>
                </table>
                
                <div style="margin-top: 20px;">
                    <button class="btn-submit" type="button" id="btnupdate" name="btnupdate" onclick="funUpdate();">Update</button>
                    <button class="myButtons" type="button" name="clear" id="clear" onclick="funClearData();">Clear</button>
                </div>
            </div>

            <input type="hidden" id="txtclientaccountdocno" name="txtclientaccountdocno" value='<s:property value="txtclientaccountdocno"/>'/>
            <input type="hidden" id="trno" name="trno" value='<s:property value="trno"/>'>
            <input type="hidden" id="docno" name="docno" value='<s:property value="docno"/>'>   
        </div>
    </div>

    <div class="main-content-area">
        <div id="loadgriddata" class="filter-card" style="padding: 0; overflow: hidden; flex: 1;">
            <jsp:include page="gridDetails.jsp"></jsp:include> 
        </div>
        <div id="subgriddata" class="filter-card" style="padding: 0; overflow: hidden; flex: 1;">            
            <jsp:include page="subdivisionGrid.jsp"></jsp:include>     
        </div>
    </div>

</div>

<div id="accountDetailsWindow">
    <div></div>
</div>

</div>	
</div>
</body>
</html>