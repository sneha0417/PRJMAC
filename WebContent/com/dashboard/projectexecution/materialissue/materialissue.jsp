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
body, html {
    height: 100%;
    margin: 0;
    padding: 0;
    overflow: hidden; 
    font-family: 'Segoe UI', 'Roboto', 'Arial', sans-serif !important;
    background-color: #f4f7f9;
}

#mainBG, .hidden-scrollbar {
    height: 100%;
}

table, td, th, input, select, textarea, button, span, div, label {
    font-family: inherit !important;
}

.master-container {
    display: flex;
    width: 100%;
    height: 100vh;
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
    padding: 15px 20px 80px; 
}

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

/* Right Content Area */
.main-content-area {
    flex: 1;
    height: 100vh;
    overflow-y: auto;
    background: #f4f7f9;
    padding: 15px;
    box-sizing: border-box;
}
.main-content-area::-webkit-scrollbar {
    width: 8px;
}
.main-content-area::-webkit-scrollbar-track {
    background: #f0f4f8;
}
.main-content-area::-webkit-scrollbar-thumb {
    background-color: #cbd5e1;
    border-radius: 10px;
}

/* UI Cards Panels */
.filter-card {
    background: #f8fafc;
    border: 1px solid #e3e8ee;
    border-radius: 12px;
    padding: 15px;
    margin-bottom: 15px;
}
.grid-card {
    background: #fff;
    border: 1px solid #e1e8ed;
    border-radius: 8px;
    padding: 15px;
    margin-bottom: 15px;
    box-shadow: 0 1px 3px rgba(0,0,0,0.02);
}
.card-header {
    font-size: 12px; 
    font-weight: 600; 
    color: #4e5e71; 
    margin-bottom: 12px; 
    text-transform: uppercase; 
    letter-spacing: 0.5px;
    border-bottom: 1px solid #e3e8ee;
    padding-bottom: 8px;
}

/* Layout Form Filter Grids */
.release-filter-table {
    width: 100%;
    border-spacing: 0 10px; 
}

.release-filter-table .label-cell {
    text-align: right;
    padding-right: 12px;
    font-size: 11.5px; 
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

/* ===== REQUIRED VISUAL BLUE BUTTON SCALING DEFINITIONS ===== */
.btn-primary {
    width: 100%;
    height: 28px;
    background-color: #1e6bf2; /* Exact specific blue matching image */
    border: none;
    border-radius: 8px;        
    color: #ffffff;
    font-size: 12px;
    font-weight: 700;
    cursor: pointer;
    transition: background-color 0.2s ease, transform 0.1s ease;
    display: flex;
    align-items: center;
    justify-content: center;
    padding: 0 10px;
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
    flex-direction: column;
    gap: 10px;
    margin-top: 15px;
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
    
    $("#listdiv1").show();
    $("#listdiv2").hide();   
    $("#updatdata").attr('disabled', true );
    
    $('#txtclient').dblclick(function(){
        accountSearchContent('clientINgridsearch.jsp?');
    });
       
    $('#jobno').dblclick(function(){
        SearchContent('costunitsearch.jsp?');
    });
});

function funExportBtn(){
    if(document.getElementById("frmtype").value==1 || document.getElementById("frmtype").value=="1") {
        JSONToCSVCon(dataas1,' Material Issue Mater', true);
    } else {
        JSONToCSVCon(datamain2,' Material Issue Mater', true);
    }
    JSONToCSVCon(prddataexcel,' Material Issue Details', true);
}

function getjobno(event){
    var x = event.keyCode;
    if(x == 114){
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
    var x = event.keyCode;
    if(x == 114){
        accountSearchContent('clientINgridsearch.jsp?');    
    }
}  

function accountSearchContent(url) {
    $('#customerDetailsWindow').jqxWindow('open');
    $.get(url).done(function (data) {
        $('#customerDetailsWindow').jqxWindow('setContent', data);
    }); 
}  	

function funreload(event) {
    $("#updatdata").attr('disabled', true );
    var cldocno = document.getElementById("cldocno").value;
    var docnoss = document.getElementById("jobno").value;
    var barchval = document.getElementById("cmbbranch") ? document.getElementById("cmbbranch").value : "";
    var aa = "yes";
     
    $("#overlay, #PleaseWait").show(); 
    $("#prdgrid").jqxGrid('clear');
 
    if(document.getElementById("frmtype").value==1 || document.getElementById("frmtype").value=="1") {
        $("#listdiv2").load("estconfirmGrid.jsp?branchval="+barchval+"&aa="+aa+"&cldocno="+cldocno+"&docnoss="+docnoss);
    } else {
        $("#listdiv1").load("listGrid.jsp?barchval="+barchval+"&aa="+aa+"&cldocno="+cldocno+"&docnoss="+docnoss);
    }
}

function funCalculates() {
    // Preserved empty function
}
  
function hidebranch() {
    // Preserved empty function
}

function fundisable() {
    var x = new XMLHttpRequest();
    x.onreadystatechange = function(){
        if (x.readyState==4 && x.status==200) {
            var items = x.responseText.trim();
            if(parseInt(items) > 0) {
                $("#listdiv1").hide();
                $("#listdiv2").show();
                document.getElementById("frmtype").value="1";
            } else {
                $("#listdiv1").show();
                $("#listdiv2").hide();   
                document.getElementById("frmtype").value="0";
            }
        }
    }
    x.open("GET","checktype.jsp?",true);
    x.send();
} 
	
function funClearData(){
    document.getElementById("txtclient").value="";
    document.getElementById("txtclientdet").value="";
    document.getElementById("jobno").value="";
    document.getElementById("cldocno").value="";
    document.getElementById("costtr_no").value="";
}
	
function funupdates() {
    $.messager.confirm('Message', 'Do you want to save changes?', function(r){
        if(r == false) {
            return;
        } else {
            var aa = 0;
            var selectedrows = $("#prdgrid").jqxGrid('selectedrowindexes');	
            selectedrows = selectedrows.sort(function(a,b){return a - b});  
            
            for(var i=0 ; i < selectedrows.length ; i++){
                var issueqty = $("#prdgrid").jqxGrid('getcellvalue',selectedrows[i],'issueqty');
                if(parseFloat(issueqty) == 0 || parseFloat(issueqty) <= 0 || issueqty == "") {
                    aa = 1;
                    break;
                }
            }
                      
            if(aa == 1) {
                $.messager.alert('Message', ' To Be Issued Qty Is Mandatory ');
                return 0;
            }
               
            var listss = new Array();
            var selectedrows = $("#prdgrid").jqxGrid('selectedrowindexes');
            selectedrows = selectedrows.sort(function(a,b){return a - b});  
            for(var i=0 ; i < selectedrows.length ; i++){
                listss.push($("#prdgrid").jqxGrid('getcellvalue',selectedrows[i],'rowno')+"::"+$("#prdgrid").jqxGrid('getcellvalue',selectedrows[i],'issueqty')+"::"
                    +$("#prdgrid").jqxGrid('getcellvalue',selectedrows[i],'psrno')+"::"+$("#prdgrid").jqxGrid('getcellvalue',selectedrows[i],'erowno')+"::"+$("#prdgrid").jqxGrid('getcellvalue',selectedrows[i],'eresqty')+"::"+
                    $("#prdgrid").jqxGrid('getcellvalue',selectedrows[i],'rowno')); 
            }
            save(listss);
        }
    });
}

function save(listss){
    var x = new XMLHttpRequest();
    x.onreadystatechange = function(){
        if (x.readyState==4 && x.status==200) {
            var items = x.responseText;
            var itemval = items.trim();
            if(parseInt(itemval) == 1) {
                $.messager.alert('Message', ' Record successfully Updated ', function(r){});
                funreload(event);
            } else {
                $.messager.alert('Message', ' Not Updated ', function(r){});
            }  
        }
    }  
    x.open("GET","savedata.jsp?list="+listss+"&masterdocno="+document.getElementById("masterdocno").value);
    x.send();
}
</script>
</head>

<body onload="getBranch();fundisable();">
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
                        <td class="label-cell">Job No</td>
                        <td>
                            <div class="search-input-wrapper">
                                <input type="text" name="jobno" id="jobno" value='<s:property value="jobno"/>' readonly="readonly" placeholder="Press F3 To Search" onKeyDown="getjobno(event);">
                                <div class="search-icon"></div>
                            </div>
                        </td>
                    </tr>
                    <tr>
                        <td class="label-cell">Client</td>
                        <td>
                            <div class="search-input-wrapper">
                                <input type="text" name="txtclient" id="txtclient" value='<s:property value="txtclient"/>' readonly="readonly" placeholder="Press F3 To Search" onKeyDown="getaccountdetails(event);">
                                <div class="search-icon"></div>
                            </div>
                        </td>
                    </tr>
                    <tr>
                        <td class="label-cell">Details</td>
                        <td>
                            <input type="text" id="txtclientdet" name="txtclientdet" value='<s:property value="txtclientdet"/>' readonly="readonly">
                        </td>
                    </tr>
                </table>
                
                <div class="release-actions">
                    <button type="button" name="updatdata" id="updatdata" class="btn-primary" onclick="funupdates()">Issue</button>
                    <button type="button" name="btnclear" id="btnclear" class="btn-primary btn-secondary" onclick="funClearData()">Clear</button>
                </div>
            </div>

            <input type="hidden" id="costtr_no" name="costtr_no" value='<s:property value="costtr_no"/>'> 
            <input type="hidden" id="cldocno" name="cldocno" value='<s:property value="cldocno"/>'>
            <input type="hidden" id="masterdocno" name="masterdocno" value='<s:property value="masterdocno"/>'>
            <input type="hidden" id="frmtype" name="frmtype" value='<s:property value="frmtype"/>'>

        </div>
    </div>

    <div class="main-content-area">
        
        <div class="grid-card" id="listdiv1" style="display: none;">
            <div class="card-header">Material Issue Master List</div>
            <jsp:include page="listGrid.jsp"></jsp:include>
        </div>

        <div class="grid-card" id="listdiv2" style="display: none;">
            <div class="card-header">Estimation Confirmation</div>
            <jsp:include page="estconfirmGrid.jsp"></jsp:include>
        </div>

        <div class="grid-card">
            <div class="card-header">Sub List Information</div>
            <div id="sublistdiv">
                <jsp:include page="sublistGrid.jsp"></jsp:include>
            </div>
        </div>

    </div>

</div>

<div id="customerDetailsWindow"><div></div></div>
<div id="DetailsWindow"><div></div></div>

</div>
</div>
</body>
</html>