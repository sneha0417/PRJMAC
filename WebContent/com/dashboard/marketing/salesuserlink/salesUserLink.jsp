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
<link href="../../../../css/dashboard.css" media="screen" rel="stylesheet" type="text/css" />  
<style type="text/css">
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
	display:inline-block;
	cursor:pointer;
	color:#ffffff;
	
	font-size:8pt;
	
	padding:3px 17px;
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
.myButtons:active {
	position:relative;
	top:1px;
}
</style>
<style>
/* ===== GLOBAL RESET & STRICT FONT ENFORCER ===== */
html, body, table, td, th, input, select, textarea, button, span, div, label {
    margin: 0;
    padding: 0;
    font-family: 'Segoe UI', 'Roboto', 'Arial', sans-serif !important;
}

body {
    background-color: #f4f7f9;
}

/* ===== WIDENED STICKY SIDEBAR ===== */
.sticky-sidebar-container {
    position: -webkit-sticky; 
    position: sticky;
    top: 0;                   
    height: 100vh;            
    overflow-y: auto;         
    width: 310px; 
    background: #fff;
    border-right: 1px solid #e1e8ed;
    box-shadow: 2px 0 8px rgba(0,0,0,.05);
    box-sizing: border-box;
}

.sticky-sidebar-container::-webkit-scrollbar {
    width: 6px;
}
.sticky-sidebar-container::-webkit-scrollbar-track {
    background: transparent;
}
.sticky-sidebar-container::-webkit-scrollbar-thumb {
    background-color: #cbd5e1;
    border-radius: 10px;
}

.sidebar-content-padding {
    padding: 15px;
    padding-bottom: 60px; 
}

/* Cards */
.filter-card {
    background: #f8fafc;
    border: 1px solid #e3e8ee;
    border-radius: 12px;
    padding: 15px 12px;
    margin-bottom: 15px;
}

/* Tables */
.release-filter-table {
    width: 100%;
    border-spacing: 0 12px; 
}

/* WIDENED LABELS TO PREVENT WRAPPING */
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

/* Fixes browser autofill yellow/pink colors */
input:-webkit-autofill {
    -webkit-box-shadow: 0 0 0 30px white inset !important;
}

.release-filter-table input[type="radio"] {
    width: auto;
    height: auto;
    margin: 0;
    vertical-align: middle;
    cursor: pointer;
}

textarea, .release-filter-table textarea {
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

/* Readonly fields get a subtle grey, not pink */
input[readonly], select[readonly], textarea[readonly],
input:disabled, select:disabled, textarea:disabled,
.release-filter-table input[readonly] {
    background-color: #f8fafc !important; 
    color: #555;
    cursor: default;
}

/* ===== DOUBLE-CLICK SEARCH INFRASTRUCTURE ===== */
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

/* ===== BUTTONS ===== */
.btn-submit {
    width: 100%;
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
}

.btn-submit:hover {
    background: #1d4ed8;
}

.btn-secondary {
    background: #64748b; /* A neutral gray for clear/remove */
}
.btn-secondary:hover {
    background: #475569;
}

.btn-danger {
    background: #dc2626; /* Red for remove */
}
.btn-danger:hover {
    background: #b91c1c;
}

.release-actions {
    display: flex;
    gap: 10px;
    justify-content: center;
    margin-top: 15px;
    flex-wrap: wrap; /* Allows the clear button to fall to the next line smoothly */
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
        else{}
        }
	
	function funreload(event){
		 $('#txtsalesmanid').val('');$('#txtsalesmaninfo').val(' ');     
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
			        
		     	if(r==false)
		     	  {
		     		return false; 
		     	  }
		     	else{
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
			        
		     	if(r==false)
		     	  {
		     		return false; 
		     	  }
		     	else{
		     		removeGridData(salesmanid,userdocno,rpttype);	
		     	}
		 });
	}
	
	function saveGridData(salesmanid,userdocno,rpttype) {
		var x=new XMLHttpRequest();
		x.onreadystatechange=function(){
		if (x.readyState==4 && x.status==200)
			{
				var items=x.responseText;
				
				$.messager.alert('Message', '  Record Successfully Linked ', function(r){
			  });
			  funClearInfo();
		      funreload(event); 
		  }
		}
			
	x.open("GET","saveData.jsp?salesmanid="+salesmanid+"&userdocno="+userdocno+"&rpttype="+rpttype,true);
	x.send();
	}
	
	function removeGridData(salesmanid,userdocno,rpttype) {
		var x=new XMLHttpRequest();
		x.onreadystatechange=function(){
		if (x.readyState==4 && x.status==200)
			{
				var items=x.responseText;
				
				$.messager.alert('Message', '  Record Successfully Removed ', function(r){
			  });
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
	
	function  funClearInfo() {
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
		
		if(document.getElementById("rdlinking").checked==true){
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
		} else if(document.getElementById("rddelete").checked==true){
			$('#txtsalesmanid').val('');
			$('#txtuserdocno').val('');
			$('#txtusername').val(''); 
			$('#txtsalesmaninfo').val(' ');
			$('#btnlinking').attr("disabled",true);
			$('#btnremovelinking').attr("disabled",true);
			document.getElementById("rdlinking").checked=false;
			document.getElementById("rddelete").checked=true;
			$("#salesUserLinkGridID").jqxGrid('clear');
			
			if (document.getElementById("txtusername").value == "") {
		        $('#txtusername').attr('placeholder', 'Press F3 to Search'); 
		    }
		}
	}

	
</script>

</head>
<body onload="getBranch();">
<div id="mainBG" class="homeContent" data-type="background"> 
<div class='hidden-scrollbar'>

<table width="100%" cellspacing="0" cellpadding="0">
<tr>

<td width="310" style="width: 310px; min-width: 310px; vertical-align: top; padding: 0;">
    
    <div class="sticky-sidebar-container">
        <div class="sidebar-content-padding">
            
            <div class="filter-card">
                <jsp:include page="../../heading.jsp"></jsp:include>
            </div>

            <div class="filter-card">
                <table class="release-filter-table">

                    <tr>
                        <td colspan="2" align="center">
                            <div style="display: flex; justify-content: center; gap: 20px; align-items: center; padding: 5px 0;">
                                <label for="rdlinking" style="display: flex; align-items: center; gap: 5px; font-size: 12px; color: #4e5e71; cursor: pointer; font-weight: 600;">
                                    <input type="radio" id="rdlinking" name="rdo" onchange="funClearRadioInfo();" value="rdlinking">
                                    Linking
                                </label>
                                <label for="rddelete" style="display: flex; align-items: center; gap: 5px; font-size: 12px; color: #4e5e71; cursor: pointer; font-weight: 600;">
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
                        <td colspan="2" align="center">
                            <textarea id="txtsalesmaninfo" name="txtsalesmaninfo" readonly="readonly" style="height:80px;"><s:property value="txtsalesmaninfo"></s:property></textarea>
                        </td>
                    </tr>

                </table>
            </div>

            <div class="release-actions">
                <button type="button" class="btn-submit" id="btnlinking" name="btnlinking" onclick="funLinking(event);" style="flex: 1; min-width: 100px;">Linking</button>
                <button type="button" class="btn-submit btn-danger" id="btnremovelinking" name="btnremovelinking" onclick="funRemoveLinking(event);" style="flex: 1; min-width: 100px;">Remove</button>
                <button type="button" class="btn-submit btn-secondary" id="clear" name="clear" onclick="funClearInfo();" style="width: 100%;">Clear</button>
            </div>

            <input type="hidden" name="txtsalesmanid" id="txtsalesmanid" value='<s:property value="txtsalesmanid"/>'>

        </div>
    </div>

</td>

<td style="vertical-align: top; padding: 15px; background: #fff;">
    <table width="100%">
        <tr>
            <td><div id="salesUserLinkDiv"><jsp:include page="salesUserLinkGrid.jsp"></jsp:include></div></td>
        </tr>
    </table>
</td>

</tr>
</table>

<div id="userDetailsWindow">
    <div></div>
</div>

</div>
</div>
</body>
</html>