<jsp:include page="../../../../includes.jsp"></jsp:include>    
<%@ taglib prefix="s" uri="/struts-tags" %>
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

/* Specific styling for Textarea */
textarea, .release-filter-table textarea {
    width: 100%;
    padding: 6px 8px;
    border: 1px solid #ccd6e0 !important;
    border-radius: 4px;
    font-size: 12px;
    background-color: #ffffff !important;
    box-sizing: border-box;
    color: #333;
    resize: none;
    outline: none;
}

/* Readonly fields styling setup */
input[readonly]:not([readonly="false"]), 
select[readonly]:not([readonly="false"]),
input:disabled, select:disabled, textarea:disabled,
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

/* Form Layout Container Blocks for JQX widgets */
.release-filter-table div[id^="date"] {
    width: 100%;
}

/* ===== REQUIRED VISUAL BLUE BUTTON SCALING DEFINITIONS ===== */
.btn-primary {
    height: 28px;
    background-color: #1e6bf2;
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
    width: 100%;
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

.btn-danger {
    background-color: #dc2626;
}

.btn-danger:hover {
    background-color: #b91c1c;
}

.action-grid {
    display: flex;
    flex-wrap: wrap;
    gap: 8px;
    justify-content: center;
    margin-top: 15px;
}

.action-grid button {
    flex: 1;
    min-width: 45%; 
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

/* Grid Cards */
.grid-card {
    background: #fff;
    border: 1px solid #e1e8ed;
    border-radius: 8px;
    padding: 15px;
    margin-bottom: 15px;
    box-shadow: 0 1px 3px rgba(0,0,0,0.02);
}
</style>

<script type="text/javascript">

	$(document).ready(function () {
         // Enforced 24px JQX Criteria
		 $("#date").jqxDateTimeInput({ width: '100%', height: '24px',formatString:"dd.MM.yyyy"});
		 
		 $('#accountDetailsWindow').jqxWindow({width: '51%', height: '58%',  maxHeight: '70%' ,maxWidth: '51%' , title: 'Accounts Search',position: { x: 300, y: 87 } , theme: 'energyblue', showCloseButton: true, keyboardCloseKey: 27});
		 $('#accountDetailsWindow').jqxWindow('close');
		 
		 $("body").prepend('<div id="overlay" class="ui-widget-overlay" style="z-index: 1; display: none;"></div>');
	     $("body").prepend("<div id='PleaseWait' style='display: none;position:absolute; z-index: 1;top:180px;right:550px;'><img src='../../../../icons/31load.gif'/></div>");
	     
	     $('#date').jqxDateTimeInput({disabled: true});$('#txtreason').attr("readonly",true);$('#btndelete').attr("disabled",true);
	     $("#appliedDetailsGrid").jqxGrid({ disabled: true}); 
	});
	
	function accountsSearchContent(url) {
	    $('#accountDetailsWindow').jqxWindow('open');
		$.get(url).done(function (data) {
		    $('#accountDetailsWindow').jqxWindow('setContent', data);
		    $('#accountDetailsWindow').jqxWindow('bringToFront');
	    }); 
	}
	
	function isNumber(evt) {
        var iKeyCode = (evt.which) ? evt.which : evt.keyCode
        if (iKeyCode != 46 && iKeyCode > 31 && (iKeyCode < 48 || iKeyCode > 57))
         {
          $.messager.alert('Message',' Enter Numbers Only ','warning');    
            return false;
         }
        return true;
    }
	
	function funreload(event){
		 var branchval = document.getElementById("cmbbranch").value;
		 var atype = $('#cmbtype').val();
		 var accountno = $('#txtdocno').val();
		 
		 $('#date').val(new Date());$('#txtreason').val('');$('#txttrno').val();
		 $('#txtoutamount').val('');$('#txtdtype').val('');$('#txtbranchid').val('');$('#applyinfo').val(' ');
  	     $("#appliedDetailsGrid").jqxGrid({ disabled: true});$("#appliedDetailsGrid").jqxGrid('clear'); 
  	     $('#date').jqxDateTimeInput({disabled: true});
  	     $('#txtreason').attr("readonly",true);$('#btndelete').attr("disabled",true);
         
  	     if(accountno==''){
			 $.messager.alert('Message','Account is Mandatory.','warning');
			 return 0;
		 }
  	   
		 $("#overlay, #PleaseWait").show();
		 
		 $("#appliedDiv").load("appliedGrid.jsp?branchval="+branchval+'&atype='+atype+'&accountno='+accountno);
	}
	
	function funDelete(event){
		var trno =  $('#txttrno').val();
		var accountno =  $('#txtdocno').val();
		var outamount =  $('#txtoutamount').val();
		var dtype =  $('#txtdtype').val();
		var branchid =  $('#txtbranchid').val();
		var date =  $('#date').val();
		var reason =  $('#txtreason').val();
		
		if(reason==''){
			 $.messager.alert('Message','Please Enter the Reason.','warning');
			 return 0;
		 }
		
		 $.messager.confirm('Message', 'Do you want to delete?', function(r){
		     	if(r==false)
		     	  {
		     		return false; 
		     	  }
		     	else{
		     		saveGridData(trno,accountno,outamount,dtype,branchid,date,reason);	
		     	}
		});
	}
	    
	function saveGridData(trno,accountno,outamount,dtype,branchid,date,reason){
		var x=new XMLHttpRequest();
		x.onreadystatechange=function(){
		if (x.readyState==4 && x.status==200){
				var items=x.responseText;
				var trno =  $('#txttrno').val(' ');
				var outamount =  $('#txtoutamount').val(' ');
				var dtype =  $('#txtdtype').val(' ');
				var branchid =  $('#txtbranchid').val(' ');
				var date =  $('#date').val(new Date());
				var reason =  $('#txtreason').val(' ');
				var applyinfo = $('#applyinfo').val(' ');
				
				$.messager.alert('Message', '  Record Successfully Deleted ', function(r){
			    });
				funreload(event); 
			}
		}
			
	x.open("GET","saveData.jsp?trno="+trno+"&accountno="+accountno+"&outamount="+outamount+"&dtype="+dtype+"&branchid="+branchid+"&date="+date+"&reason="+reason,true);
	x.send();
	}
	
	function clearAccountInfo(){
		$('#txtdocno').val('');$('#txtaccid').val('');$('#txtaccname').val('');
		$('#txttrno').val(' ');$('#txtoutamount').val(' ');$('#txtdtype').val(' ');
		$('#txtbranchid').val(' ');$('#date').val(new Date());$('#txtreason').val(' ');
		$('#applyinfo').val(' ');
		$("#appliedDetailsGrid").jqxGrid({ disabled: true});$("#appliedDetailsGrid").jqxGrid('clear'); 
		$("#appliedDelete").jqxGrid('clear');$('#date').jqxDateTimeInput({disabled: true});
  	    $('#txtreason').attr("readonly",true);$('#btndelete').attr("disabled",true);
  	    
  	    if (document.getElementById("txtaccid").value == "") {
	        $('#txtaccid').attr('placeholder', 'Press F3 to Search'); 
	    }
	}
	
	function getAccTypeFrom(event){
        var x= event.keyCode;
        if(x==114){
      		accountsSearchContent('accountsDetailsSearch.jsp');
        }
    }
	
	function funSearchdblclick(){
		$('#txtaccid').dblclick(function(){
			accountsSearchContent('accountsDetailsSearch.jsp');
		});
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
                        <td class="label-cell">Type</td>
                        <td>
                            <select id="cmbtype" name="cmbtype" onchange="clearAccountInfo();" value='<s:property value="cmbtype"/>'>
                                <option value="AR">AR</option>
                                <option value="AP">AP</option>
                            </select>
                        </td>
                    </tr>
                    <tr>
                        <td class="label-cell">Account</td>
                        <td>
                            <div class="search-input-wrapper">
                                <input type="text" id="txtaccid" name="txtaccid" readonly="readonly" placeholder="Double click to search" value='<s:property value="txtaccid"/>' ondblclick="funSearchdblclick();" onkeydown="getAccTypeFrom(event);" />
                                <div class="search-icon"></div>
                            </div>
                        </td>
                    </tr>
                    <tr>
                        <td class="label-cell"></td>
                        <td>
                            <input type="text" id="txtaccname" name="txtaccname" readonly="readonly" tabindex="-1" value='<s:property value="txtaccname"/>' />
                        </td>
                    </tr>
                </table>
            </div>

            <div class="filter-card">
                <table class="release-filter-table">
                    <tr>
                        <td colspan="2">
                            <textarea id="applyinfo" name="applyinfo" readonly="readonly" style="height: 80px;"><s:property value="applyinfo"></s:property></textarea>
                        </td>
                    </tr>
                    <tr>
                        <td class="label-cell">Date</td>
                        <td><div id="date" name="date" value='<s:property value="date"/>'></div></td>
                    </tr>
                    <tr>
                        <td class="label-cell">Reason</td>
                        <td><input type="text" id="txtreason" name="txtreason" value='<s:property value="txtreason"/>'/></td>
                    </tr>
                </table>

                <div class="action-grid">
                    <button type="button" class="btn-primary btn-danger" id="btndelete" name="btndelete" onclick="funDelete(event);">Delete</button>
                </div>
            </div>

            <input type="hidden" id="txtdocno" name="txtdocno" value='<s:property value="txtdocno"/>'/>
            <input type="hidden" id="txttrno" name="txttrno" value='<s:property value="txttrno"/>'/>
            <input type="hidden" id="txtoutamount" name="txtoutamount" value='<s:property value="txtoutamount"/>'/>
            <input type="hidden" id="txtdtype" name="txtdtype" value='<s:property value="txtdtype"/>'/>
            <input type="hidden" id="txtbranchid" name="txtbranchid" value='<s:property value="txtbranchid"/>'/>

        </div>
    </div>

    <div class="main-content-area">
        <div class="grid-card">
            <div id="appliedDiv">
                <jsp:include page="appliedGrid.jsp"></jsp:include>
            </div>
        </div>
        
        <div class="grid-card">
            <div id="detailDiv">
                <jsp:include page="appliedDetailGrid.jsp"></jsp:include>
            </div>
        </div>
    </div>

</div>

<div id="accountDetailsWindow">
    <div></div><div></div>
</div>

</div> 
</div>
</body>
</html>