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

.filter-card {
    background: #f8fafc;
    border: 1px solid #e3e8ee;
    border-radius: 12px;
    padding: 12px;
    margin-bottom: 12px;
}

.filter-table {
    width: 100%;
    border-spacing: 0 10px;
}

.filter-table .label-cell {
    text-align: right;
    padding-right: 12px;
    font-size: 12px;
    color: #4e5e71;
    font-weight: 600;
    width: 90px;
}

input[type="text"], select,
.filter-table input[type="text"],
.filter-table select {
    width: 100%;
    height: 24px !important;             
    padding: 2px 8px !important;         
    border: 1px solid #ccd6e0 !important;
    border-radius: 4px !important;       
    font-size: 12px !important;          
    background-color: #ffffff;
    box-sizing: border-box;
    color: #333;
    outline: none;
}



.myButtonss, .myButtons, .myButton {
    width: 100%;
    height: 30px !important;            
    padding: 0 12px !important;
    background: #2563eb !important;
    color: #fff !important;
    border: none !important;
    border-radius: 4px !important;
    font-size: 13px !important;
    font-weight: 600 !important;
    cursor: pointer;
    line-height: 30px !important;
    white-space: nowrap;
    text-align: center;
    margin-top: 8px;
    transition: all 0.2s ease;
    box-shadow: none !important;
    text-shadow: none !important;
    display: block;
}

.myButtonss:hover, .myButtons:hover, .myButton:hover {
    background: #1d4ed8 !important;
}

.myButtonss {
    background: #64748b !important;
}

.myButtonss:hover {
    background: #475569 !important;
}

.myButtonss:active, .myButtons:active, .myButton:active {
    position: relative;
    top: 0px;
}

.branch1 {
    color: black;
    width: 100%;
    font-family: Tahoma;
    font-size: 10px;
}

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

	 $('#customerDetailsWindow').jqxWindow({width: '51%', height: '58%',  maxHeight: '70%' ,maxWidth: '51%' , title: 'Client Search',position: { x: 300, y: 87 } , theme: 'energyblue', showCloseButton: true, keyboardCloseKey: 27});
	 $('#customerDetailsWindow').jqxWindow('close'); 
		
	 $('#DetailsWindow').jqxWindow({width: '51%', height: '60%',  maxHeight: '70%' ,maxWidth: '51%' , title: ' Search',position: { x: 300, y: 87 } , theme: 'energyblue', showCloseButton: true, keyboardCloseKey: 27});
	 $('#DetailsWindow').jqxWindow('close'); 
		
	 $("#updatdata").attr('disabled', true );
	 $('#txtclient').dblclick(function(){
		 accountSearchContent('clientINgridsearch.jsp?');
	 });
	 
	 $('#jobno').dblclick(function(){
		 SearchContent('costunitsearch.jsp?');
	 });
});

function getjobno(event){
	 var x= event.keyCode;
	 if(x==114){
		 SearchContent('costunitsearch.jsp?');    
	 }
}   
	
function SearchContent(url) {
     $('#DetailsWindow').jqxWindow('open');
     $.get(url).done(function (data) {
         $('#DetailsWindow').jqxWindow('setContent', data);
	 }); 
} 	
	
function getaccountdetails(event){
	 var x= event.keyCode;
	 if(x==114){
	     accountSearchContent('clientINgridsearch.jsp?');    
	 }
}   

function accountSearchContent(url) {
     $('#customerDetailsWindow').jqxWindow('open');
     $.get(url).done(function (data) {
         $('#customerDetailsWindow').jqxWindow('setContent', data);
	 }); 
} 	

function funExportBtn(){}

function funreload(event)
{
	 $("#updatdata").attr('disabled', true );
	 var barchval = document.getElementById("cmbbranch").value;
   	 var cldocno= document.getElementById("cldocno").value;
 	 var docnoss= document.getElementById("jobno").value;
	 var aa="yes";
	  
	 $("#overlay, #PleaseWait").show(); 
	 $("#prdgrid").jqxGrid('clear');
 	 $("#listdiv").load("listGrid.jsp?barchval="+barchval+"&aa="+aa+"&cldocno="+cldocno+"&docnoss="+docnoss);
}
	
function funCalculates(){}
function hidebranch(){}
function fundisable(){}

function funClearData(){
	 document.getElementById("txtclient").value="";
	 document.getElementById("txtclientdet").value="";
	 document.getElementById("jobno").value="";
	 document.getElementById("cldocno").value="";
	 document.getElementById("costtr_no").value="";
}
	
function funupdates()
{
	$.messager.confirm('Message', 'Do you want to save changes?', function(r){
	   	if(r==false){}
	   	else {
			var listss = new Array();
			var selectedrows=$("#prdgrid").jqxGrid('selectedrowindexes');
			selectedrows = selectedrows.sort(function(a,b){return a - b});
			for(var i=0 ; i < selectedrows.length ; i++){
				listss.push($("#prdgrid").jqxGrid('getcellvalue',selectedrows[i],'rowno')+"::"+$("#prdgrid").jqxGrid('getcellvalue',selectedrows[i],'issueqty')+"::"+$("#prdgrid").jqxGrid('getcellvalue',selectedrows[i],'psrno')); 
			}
			save(listss);
        }
    });
}

function save(listss){
	var x=new XMLHttpRequest();
	x.onreadystatechange=function(){
		if (x.readyState==4 && x.status==200) {
			var items= x.responseText;
			var itemval=items.trim();
			if(parseInt(itemval)==1) {
				$.messager.alert('Message', '  Record successfully Updated ', function(r){});
				funreload(event);
			} else {
				$.messager.alert('Message', '  Not Updated ', function(r){});
			}  
		}
	}  
	x.open("GET","savedata.jsp?list="+listss+"&masterdocno="+document.getElementById("masterdocno").value);
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
            <jsp:include page="../../heading.jsp"></jsp:include>
        </div>

        <div class="sidebar-scroll-content">
            
            <div class="filter-card">
                <table class="filter-table">
                    <tr>
                        <td class="label-cell">Job No</td>
                        <td>
                            <input type="text" name="jobno" id="jobno" value='<s:property value="jobno"/>' readonly="readonly" placeholder="Press F3 To Search" onKeyDown="getjobno(event);">
                        </td>
                    </tr>
                    <tr>
                        <td class="label-cell">Client</td>
                        <td>
                            <input type="text" name="txtclient" id="txtclient" value='<s:property value="txtclient"/>' readonly="readonly" placeholder="Press F3 To Search" onKeyDown="getaccountdetails(event);">
                        </td>
                    </tr>
                    <tr>
                        <td class="label-cell"></td>
                        <td>
                            <input type="text" id="txtclientdet" name="txtclientdet" value='<s:property value="txtclientdet"/>' readonly="readonly">
                        </td>
                    </tr>
                </table>
            </div>

            <div class="filter-card">
                <input type="button" name="btnclear" id="btnclear" value="Clear" class="myButtonss" onclick="funClearData();">
                <input type="button" name="updatdata" id="updatdata" class="myButton" value="Approve" onclick="funupdates()">
            </div>

            <div id='paychaaaaa' style="width: 100%; height: 90px; margin-top: 10px;"></div>
            
            <input type="hidden" id="rsumm" name="stkled" onchange="fundisable();" value="rsumm">
            <input type="hidden" id="rdet" name="stkled" onchange="fundisable();" value="rdet">
            <input type="hidden" id="costtr_no" name="costtr_no" value='<s:property value="costtr_no"/>'> 
            <input type="hidden" id="cldocno" name="cldocno" value='<s:property value="cldocno"/>'>
            <input type="hidden" id="masterdocno" name="masterdocno" value='<s:property value="masterdocno"/>'>
            
        </div>
    </div>

    <div class="main-content-area">
        <div id="listdiv">
            <jsp:include page="listGrid.jsp"></jsp:include>
        </div>
        <div id="sublistdiv" style="margin-top: 20px;">
            <jsp:include page="sublistGrid.jsp"></jsp:include>
        </div>
    </div>

</div>

<div id="customerDetailsWindow">
   <div></div>
</div>  
<div id="DetailsWindow">
   <div></div>
</div>  

</div>
</div>
</body>
</html>