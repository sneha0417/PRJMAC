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

/* Cards */
.filter-card {
    background: #f8fafc;
    border: 1px solid #e3e8ee;
    border-radius: 12px;
    padding: 15px;
    margin-bottom: 12px;
}

/* Form Tables */
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

/* ===== ENFORCED UNIFORM 24px INPUTS ===== */
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

textarea {
    width: 100%;
    padding: 6px 8px;
    border: 1px solid #ccd6e0;
    border-radius: 4px;
    font-size: 12px;
    background-color: #ffffff;
    box-sizing: border-box;
    color: #333;
    font-family: inherit;
    resize: none;
}

/* Fixes browser autofill */
input:-webkit-autofill {
    -webkit-box-shadow: 0 0 0 30px white inset !important;
}

/* Readonly fields styling setup */
input[readonly], select[readonly], textarea[readonly],
input:disabled, select:disabled, textarea:disabled {
    background-color: #f3f6f9 !important; 
    color: #555;
    cursor: default;
}

/* Custom Radios */
.radio-group {
    display: flex;
    justify-content: center;
    gap: 20px;
    align-items: center;
    padding: 5px 0;
}

.radio-group label {
    display: flex;
    align-items: center;
    gap: 5px;
    font-size: 12px;
    color: #4e5e71;
    cursor: pointer;
    font-weight: 600;
    margin: 0;
}

.radio-group input[type="radio"] {
    margin: 0;
    cursor: pointer;
}

/* Double-Click Search Box */
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

/* ===== IMAGE REFERENCE VIBRANT BLUE BUTTON ===== */
.btn-primary {
    flex: 1;
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

.btn-primary:hover { background-color: #1656c7; }
.btn-primary:active { transform: scale(0.98); }
.btn-primary:disabled { background-color: #9abaf5; cursor: not-allowed; transform: none; }

.btn-danger { background-color: #dc2626; }
.btn-danger:hover { background-color: #b91c1c; }
.btn-danger:disabled { background-color: #fca5a5; }

.btn-secondary { background-color: #64748b; }
.btn-secondary:hover { background-color: #475569; }

.release-actions {
    display: flex;
    gap: 8px;
    justify-content: center;
    margin-top: 15px;
    flex-wrap: wrap;
}

/* Right Content Area */
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
    $('#userDetailsWindow').jqxWindow({width: '51%', height: '58%',  maxHeight: '70%' ,maxWidth: '51%' , title: 'Users Search',position: { x: 300, y: 87 } , theme: 'energyblue', showCloseButton: true, keyboardCloseKey: 27});
    $('#userDetailsWindow').jqxWindow('close');
     
    $("body").prepend('<div id="overlay" class="ui-widget-overlay" style="z-index: 1; display: none;"></div>');
    $("body").prepend("<div id='PleaseWait' style='display: none;position:absolute; z-index: 1;top:180px;right:550px;'><img src='../../../../icons/31load.gif'/></div>");
     
    $('#txtusername').dblclick(function(){
        userDetailsSearchContent('userDetailsSearch.jsp');
    });
     
    document.getElementById("rdlinking").checked=true;
    $('#btnlinking').attr("disabled",true);
    $('#btnremovelinking').attr("disabled",true);
});

function userDetailsSearchContent(url) {
    $('#userDetailsWindow').jqxWindow('open');
    $.get(url).done(function (data) {
        $('#userDetailsWindow').jqxWindow('setContent', data);
        $('#userDetailsWindow').jqxWindow('bringToFront');
    }); 
}

function getUserDetails(event){
    var x= event.keyCode;
    if(x==114){
        userDetailsSearchContent('userDetailsSearch.jsp');
    }
}

function funreload(event){
    $('#txtsalesmanid').val('');
    $('#txtsalesmaninfo').val(' ');     
    $('#btnlinking').attr("disabled",true);
    $('#btnremovelinking').attr("disabled",true);
    $("#overlay, #PleaseWait").show();
    
    if(document.getElementById("rdlinking").checked==true){
        $("#salesUserLinkDiv").load("salesUserLinkGrid.jsp?rpttype=1&check=1");
    } else if(document.getElementById("rddelete").checked==true){
        $("#salesUserLinkDiv").load("salesUserLinkGrid.jsp?rpttype=2&check=1");
    }
}

function funLinking(event){
    var userdocno = $('#txtuserdocno').val();
    var salesmanid = $('#txtsalesmanid').val();
    var rpttype="0";
    if(document.getElementById("rdlinking").checked==true){
        rpttype="1";
    }
    
    if(userdocno==''){
        $.messager.alert('Message','Choose a User.','warning');
        return 0;
    }
        
    $.messager.confirm('Message', 'Do you want to link Salesman with User?', function(r){
        if(r==false) {
            return false; 
        } else {
            saveGridData(salesmanid,userdocno,rpttype);	
        }
    });
}

function funRemoveLinking(event){
    var userdocno = $('#txtuserdocno').val();
    var salesmanid = $('#txtsalesmanid').val();
    var rpttype="0";
    if(document.getElementById("rddelete").checked==true){
        rpttype="2";
    }
        
    $.messager.confirm('Message', 'Do you want to remove link ?', function(r){
        if(r==false) {
            return false; 
        } else {
            removeGridData(salesmanid,userdocno,rpttype);	
        }
    });
}

function saveGridData(salesmanid,userdocno,rpttype) {
    var x = new XMLHttpRequest();
    x.onreadystatechange = function(){
        if (x.readyState==4 && x.status==200) {
            var items = x.responseText;
            $.messager.alert('Message', '  Record Successfully Linked ', function(r){});
            funClearInfo();
            funreload(event); 
        }
    }
    x.open("GET","saveData.jsp?salesmanid="+salesmanid+"&userdocno="+userdocno+"&rpttype="+rpttype,true);
    x.send();
}

function removeGridData(salesmanid,userdocno,rpttype) {
    var x = new XMLHttpRequest();
    x.onreadystatechange = function(){
        if (x.readyState==4 && x.status==200) {
            var items = x.responseText;
            $.messager.alert('Message', '  Record Successfully Removed ', function(r){});
            funClearInfo();
            funreload(event); 
        }
    }
    x.open("GET","saveData.jsp?salesmanid="+salesmanid+"&userdocno="+userdocno+"&rpttype="+rpttype,true);
    x.send();
}

function funExportBtn(){
    JSONToCSVCon(data, 'SalesUserLink', true);
}

function funClearInfo() {
    $('#txtsalesmanid').val('');
    $('#txtuserdocno').val('');
    $('#txtusername').val(''); 
    $('#txtsalesmaninfo').val(' ');
    $('#btnlinking').attr("disabled",true);
    $('#btnremovelinking').attr("disabled",true);
    document.getElementById("rdlinking").checked=true;
    document.getElementById("rddelete").checked=false;
    $("#salesUserLinkGridID").jqxGrid('clear');
    
    if (document.getElementById("txtusername").value == "") {
        $('#txtusername').attr('placeholder', 'Press F3 to Search'); 
    }
}

function funClearRadioInfo() {
    $('#txtsalesmanid').val('');
    $('#txtuserdocno').val('');
    $('#txtusername').val(''); 
    $('#txtsalesmaninfo').val(' ');
    $('#btnlinking').attr("disabled",true);
    $('#btnremovelinking').attr("disabled",true);
    $("#salesUserLinkGridID").jqxGrid('clear');
    
    if(document.getElementById("rdlinking").checked==true){
        document.getElementById("rddelete").checked=false;
    } else if(document.getElementById("rddelete").checked==true){
        document.getElementById("rdlinking").checked=false;
    }
    
    if (document.getElementById("txtusername").value == "") {
        $('#txtusername').attr('placeholder', 'Press F3 to Search'); 
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
            <div class="filter-card" style="padding: 10px; margin-bottom: 0;">
                <jsp:include page="../../heading.jsp"></jsp:include>
            </div>
        </div>

        <div class="sidebar-scroll-content">
            <div class="filter-card">
                <table class="release-filter-table">
                    <tr>
                        <td colspan="2">
                            <div class="radio-group">
                                <label>
                                    <input type="radio" id="rdlinking" name="rdo" onchange="funClearRadioInfo();" value="rdlinking">
                                    Linking
                                </label>
                                <label>
                                    <input type="radio" id="rddelete" name="rdo" onchange="funClearRadioInfo();" value="rddelete">
                                    Remove Linking
                                </label>
                            </div>
                        </td>
                    </tr>

                    <tr>
                        <td class="label-cell">User</td>
                        <td>
                            <div class="search-input-wrapper">
                                <input type="text" id="txtusername" name="txtusername" readonly="readonly" placeholder="Double click to search" value='<s:property value="txtusername"/>' onkeydown="getUserDetails(event);" ondblclick="getUserDetails(event);" />
                                <div class="search-icon"></div>
                            </div>
                            <input type="hidden" id="txtuserdocno" name="txtuserdocno" value='<s:property value="txtuserdocno"/>'/>
                        </td>
                    </tr>

                    <tr>
                        <td colspan="2">
                            <textarea id="txtsalesmaninfo" name="txtsalesmaninfo" readonly="readonly" style="height: 80px; margin-top: 5px;"><s:property value="txtsalesmaninfo"></s:property></textarea>
                        </td>
                    </tr>
                </table>
            </div>

            <div class="release-actions">
                <button type="button" class="btn-primary" id="btnlinking" name="btnlinking" onclick="funLinking(event);">Linking</button>
                <button type="button" class="btn-primary btn-danger" id="btnremovelinking" name="btnremovelinking" onclick="funRemoveLinking(event);">Remove</button>
            </div>
            
            <div class="release-actions" style="margin-top: 8px;">
                <button type="button" class="btn-primary btn-secondary" id="clear" name="clear" onclick="funClearInfo();" style="width: 100%;">Clear Filters</button>
            </div>

            <input type="hidden" name="txtsalesmanid" id="txtsalesmanid" value='<s:property value="txtsalesmanid"/>'>
        </div>
    </div>

    <div class="main-content-area">
        <div id="salesUserLinkDiv">
            <jsp:include page="salesUserLinkGrid.jsp"></jsp:include>
        </div>
    </div>

</div>

<div id="userDetailsWindow">
    <div></div>
</div>

</div>
</div>
</body>
</html>