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
<script type="text/javascript" src="<%=contextPath%>/js/ajaxfileupload.js"></script>
<script type="text/javascript" src="<%=contextPath%>/js/resample.js"></script>

<style type="text/css">
/* ===== MASTER LAYOUT ===== */
body, html, #mainBG, .hidden-scrollbar {
    height: 100%;
    margin: 0;
    overflow: hidden; /* Prevents whole-page scrolling, delegates to specific panes */
}

.master-container {
    display: flex;
    width: 100%;
    height: 100vh;
    font-family: 'Segoe UI', 'Roboto', 'Arial', sans-serif;
    background-color: #f4f7f9;
}

/* Sidebar (LEFT SIDE ONLY) */
.sidebar-filters {
    width: 350px;
    flex: 0 0 350px;
    background: #fff;
    border-right: 1px solid #e1e8ed;
    display: flex;
    flex-direction: column;
    height: 100%;
    overflow-y: auto; /* Independent Sidebar Scrollbar */
    box-shadow: 2px 0 8px rgba(0,0,0,.05);
    z-index: 2;
}

.sidebar-fixed-top {
    padding: 15px 20px;
    border-bottom: 1px solid #f0f4f8;
}

.sidebar-scroll-content {
    flex: 1;
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
    width: 80px;
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

input[readonly],
input:disabled,
select:disabled {
    background-color: #f3f6f9 !important;
    color: #555;
    cursor: default !important;
}

/* jqx date/time containers */
.release-filter-table div[id^="fromdate"],
.release-filter-table div[id^="todate"] {
    width: 100%;
}

/* ===== STATUS BLINKING TEXT ===== */
.status {
	color: #FD8725;
	font-family: 'comic sans ms', cursive, sans-serif;
	font-size: 20px;
	font-weight: bold;
    text-align: center;
    display: block;
}
#lblclientstatus {
  -moz-animation: blink 1s infinite alternate;
  -webkit-animation: blink 1s infinite alternate;
  animation: blink 1s infinite alternate;
}
@-moz-keyframes blink { from { opacity: 1; } to { opacity: 0; } }
@-webkit-keyframes blink { from { opacity: 1; } to { opacity: 0; } }
@keyframes blink { from { opacity: 1; } to { opacity: 0; } }

/* ===== BLUE BUTTONS ===== */
.btn-submit {
    flex: 1;
    height: 30px;
    background: #007bff; /* Primary Blue */
    color: #fff;
    border: none;
    border-radius: 4px;
    font-size: 13px;
    font-weight: 600;
    cursor: pointer;
    transition: background 0.2s, transform 0.1s;
    width: 100%;
    text-align: center;
}
.btn-submit:hover:not(:disabled) { background: #0056b3; }
.btn-submit:disabled { background: #9ca3af; cursor: default !important; opacity: 0.7; }
.btn-submit:active:not(:disabled) { transform: scale(0.98); }

.button-group {
    display: flex;
    flex-direction: column;
    gap: 10px;
    margin-top: 15px;
    width: 100%;
}

/* Checkbox wrapper */
.checkbox-wrap {
    display: flex;
    align-items: center;
    justify-content: center;
    gap: 8px;
    margin-bottom: 10px;
}
.checkbox-wrap label {
    font-size: 12px;
    font-weight: 600;
    color: #4e5e71;
    margin: 0;
}
.checkbox-wrap input[type="checkbox"] {
    margin: 0;
    cursor: pointer;
}

/* Main Content Area (RIGHT SIDE) */
.main-content-area {
    flex: 1;
    height: 100vh;
    overflow-y: auto; 
    background: #ffffff;
    padding: 15px;
    box-sizing: border-box;
    display: flex;
    flex-direction: column;
}

.content-header-bar {
    background-color: #f0f4f8;
    padding: 10px 15px;
    border-radius: 8px;
    margin-bottom: 15px;
    display: flex;
    align-items: center;
    border: 1px solid #e1e8ed;
}

.content-header-bar .account-label {
    font-size: 14px;
    font-weight: 600;
    color: #333;
    margin-right: 10px;
}

.content-header-bar .accname {
    font-family: 'comic sans ms', cursive, sans-serif;
    font-size: 14px;
    color: #0056b3;
    font-weight: bold;
}

.grid-container {
    flex: 1;
    margin-bottom: 20px;
}

.totals-footer {
    display: flex;
    justify-content: flex-end;
    gap: 20px;
    align-items: center;
    margin-top: auto;
    padding-top: 15px;
    border-top: 1px solid #e1e8ed;
}

.totals-footer .total-label {
    font-family: 'Segoe UI', 'Roboto', 'Arial', sans-serif;
    font-size: 13px;
    font-weight: bold;
    color: #333;
}

.textbox {
    border: 1px solid #ccd6e0;
    height: 24px;
    width: 120px;
    border-radius: 4px;
    background-color: #f8fafc;
    text-align: right;
    padding-right: 8px;
    font-size: 13px;
    font-weight: bold;
    color: #333;
}
</style>

<script type="text/javascript">

	$(document).ready(function () {
		var name='<%=request.getParameter("name")==null?"":request.getParameter("name")%>';
		
         // Standardized to 100% width and 24px height
		 $("#fromdate").jqxDateTimeInput({ width: '100%', height: '24px',formatString:"dd.MM.yyyy"});
		 $("#todate").jqxDateTimeInput({ width: '100%', height: '24px',formatString:"dd.MM.yyyy"});
		 
		 $("body").prepend('<div id="overlay" class="ui-widget-overlay" style="z-index: 1; display: none;"></div>');
	     $("body").prepend("<div id='PleaseWait' style='display: none;position:absolute; z-index: 1;top:180px;right:550px;'><img src='../../../../icons/31load.gif'/></div>");
	     
		 $('#accountDetailsWindow').jqxWindow({width: '51%', height: '58%',  maxHeight: '70%' ,maxWidth: '51%' , title: 'Accounts Search',position: { x: 300, y: 87 } , theme: 'energyblue', showCloseButton: true, keyboardCloseKey: 27});
		 $('#accountDetailsWindow').jqxWindow('close');
		 
		 var year = window.parent.txtaccountperiodfrom.value;
		 var newDate = year.split('-');
		 year = newDate[1] + "-" + newDate[0] + "-" + newDate[2];
		 $('#fromdate').jqxDateTimeInput('setDate', new Date(year));
		 
		 $('#txtaccid').dblclick(function(){
			  accountsSearchContent('accountsDetailsSearch.jsp');
	     });
		 document.getElementById("chckopnprint").checked=true;$('#hidchckopnprint').val(1);opnprintcheck();
	});
	
	function accountsSearchContent(url) {
	    $('#accountDetailsWindow').jqxWindow('open');
		$.get(url).done(function (data) {
		$('#accountDetailsWindow').jqxWindow('setContent', data);
		$('#accountDetailsWindow').jqxWindow('bringToFront');
	}); 
	}
	
	function funExportBtn(){ 
		var accname=$('#txtaccid').val()+" - "+$('#txtaccname').val(); 
		if(($('#lbldetailname').text()=='Accounts Statement AP')){  
			JSONToCSVCon(dataExcelExport,'AccountsStatementAP              '+' '+accname, true);    
        }else if(($('#lbldetailname').text()=='Accounts Statement AR')){
			JSONToCSVCon(dataExcelExport,'AccountsStatementAR              '+' '+accname, true);
        }else if(($('#lbldetailname').text()=='Accounts Statement GL')){             
			JSONToCSVCon(dataExcelExport,'AccountsStatementGL              '+' '+accname, true);
        }else if(($('#lbldetailname').text()=='Accounts Statement HR')){
			JSONToCSVCon(dataExcelExport,'AccountsStatementHR              '+' '+accname, true);
        }
	} 
	
	function getAccTypeFrom(event){
        var x= event.keyCode;
        if(x==114){
      		accountsSearchContent('accountsDetailsSearch.jsp');
        }
        else{}
        }
	
	function getAccountingPeriod(date){
  		var x = new XMLHttpRequest();
  		x.onreadystatechange = function() {
  			if (x.readyState == 4 && x.status == 200) {
  				var items = x.responseText;
  			    $('#txtaccountperiodfrom').val(items);
  		}
  		}
  		x.open("GET", "getAccountingPeriod.jsp?fromDate="+date, true);
  		x.send();
 }
	
	function getAccountFromPeriod(){
		
		 var date = $('#fromdate').val();
		 getAccountingPeriod(date);
			  
	 		if($('#txtaccountperiodfrom').val()<0){
			  $.messager.alert('Message','Not in Account-Period.','warning');
			  return;
		   }
		
	}
	
	function funreload(event){
		
		if($('#txtaccountperiodfrom').val()<0){
			  $.messager.alert('Message','Not in Account-Period.','warning');
			  return;
		   }
		
		 var branchval = document.getElementById("cmbbranch").value;
		 var fromdate = $('#fromdate').val();
		 var todate = $('#todate').val();
		 var accdocno = $('#txtdocno').val();
		 
		 if(accdocno==''){
			 $.messager.alert('Message','Account is Mandatory.','warning');
			 return 0;
		 }
		
		 $("#overlay, #PleaseWait").show();
		 
		 document.getElementById("lblaccountname").innerText=$('#txtaccname').val(); 
		 $("#accountsStatementDiv").load("accountsStatementTypeGrid.jsp?branchval="+branchval+'&fromdate='+fromdate+'&todate='+todate+'&accdocno='+accdocno+'&check=1');
		}
	
	function funPrintAccountStatement(){
    	if ($("#txtdocno").val()!="") {
	        var url=document.URL;
	        var reurl=url.split("accountsStatementType.jsp");
	        $("#txtdocno").prop("disabled", false);
	        var win= window.open(reurl[0]+"../../../../com/dashboard/accounts/accountsstatement/printAccountsStatement?acno="+document.getElementById("txtdocno").value+'&netamount='+document.getElementById("txtnetamount").value+'&branch='+document.getElementById("cmbbranch").value+'&fromDate='+document.getElementById("fromdate").value+'&toDate='+$('#todate').val()+'&chckopn='+$('#hidchckopnprint').val()+'&email=Nil&print=1',"_blank","top=150,left=250,Width=1020,Height=500,location=no,scrollbars=no,toolbar=yes");
	        win.focus();
	     }
	    else {
			$.messager.alert('Message','Account is Mandatory.','warning');
			return;
		}
    }
	function funPrintRAwise(){
    	if ($("#txtdocno").val()!="") {
	        var url=document.URL;
	        var reurl=url.split("accountsStatementType.jsp");
	        $("#txtdocno").prop("disabled", false);
	        var win= window.open(reurl[0]+"../../../../com/dashboard/accounts/accountsstatement/printRAWise?acno="+document.getElementById("txtdocno").value+'&netamount='+document.getElementById("txtnetamount").value+'&branch='+document.getElementById("cmbbranch").value+'&fromDate='+document.getElementById("fromdate").value+'&toDate='+$('#todate').val()+'&chckopn='+$('#hidchckopnprint').val()+'&email=Nil&print=1',"_blank","top=150,left=250,Width=1020,Height=500,location=no,scrollbars=no,toolbar=yes");
	        win.focus();
	     }
	    else {
			$.messager.alert('Message','Account is Mandatory.','warning');
			return;
		}
    }
	function funSendingEmail() {  
		
	    var email = document.getElementById("txtaccemail").value;
	    var res;var part1;var part2;var dotsplt;
	    if(email.indexOf("@")>=0) {
		    res = email.split('@');
		    part1=res[0];
		    part2=res[1];
		    dotsplt=part2.split('.');
	    }
	    
	   if ($("#txtdocno").val().trim()=="" || typeof($("#txtdocno").val().trim())=="undefined" || typeof($("#txtdocno").val().trim())=="NaN") {
		    $('#txtaccid').val('');$('#txtaccname').val('');$('#txtdocno').val('');$('#txtaccemail').val('');
			
			if (document.getElementById("txtaccid").value == "") {
		        $('#txtaccid').attr('placeholder', 'Press F3 to Search'); 
		    }
			$.messager.alert('Message','Account is Mandatory.','warning');
			return;
	  } else  if(email.trim()=="" || typeof(email.trim())=="undefined" || typeof(email.trim())=="NaN") {
		    $.messager.alert('Message','Email is not Configured Properly.','warning');
			return;
	  } else if(email.indexOf("@")<0) {
		    $.messager.alert('Message','Email is not Configured Properly.','warning');
			return;
	  } else if(email.split('@').length!=2) {
		    $.messager.alert('Message','Email is not Configured Properly.','warning');
			return;
	  } else if(part1.length==0) {
		    $.messager.alert('Message','Email is not Configured Properly.','warning');
			return;
	  } else if(part1.split(" ").length>2) {
		    $.messager.alert('Message','Email is not Configured Properly.','warning');
			return;
      } else if(part2.split(".").length<2) {
    	    $.messager.alert('Message','Email is not Configured Properly.','warning');
			return;
      } else if(dotsplt[0].length==0 ) {
    	    $.messager.alert('Message','Email is not Configured Properly.','warning');
			return;
      } else if(dotsplt[1].length<2 ||dotsplt[1].length>4) {
    	    $.messager.alert('Message','Email is not Configured Properly.','warning');
			return;
      } else {
 		
		    $("#overlay, #PleaseWait").show();
		   
	 		$.ajaxFileUpload ({  
	    	    	
	    	    	  url: 'printAccountsStatement.action?acno='+document.getElementById("txtdocno").value+'&netamount='+document.getElementById("txtnetamount").value+'&branch='+document.getElementById("cmbbranch").value+'&fromDate='+document.getElementById("fromdate").value+'&toDate='+$('#todate').val()+'&email='+$('#txtaccemail').val()+'&print=0chckopn&chckopn=1',  
	    	          secureuri:false,//false  
	    	          fileElementId:'file', //id  <input type="file" id="file" name="file" />  
	    	          dataType: 'string',// json  
	    	          success: function (data, status) {  
	
	    	             if(status=='success'){
							$("#overlay, #PleaseWait").hide();
							$.messager.alert('Message','E-Mail Send Successfully');
	    	              }
	    	             if(status=='error'){
	    	            	 $("#overlay, #PleaseWait").hide();
	    	            	 $.messager.alert('Message','E-Mail Sending failed');
	    	             }
	    	             
	    	              $("#testImg").attr("src",data.message);
	    	              if(typeof(data.error) != 'undefined')  
	    	              {  
	    	                  if(data.error != '')  
	    	                  {  
	    	                      alert(data.error);  
	    	                  }else  
	    	                  {  
	    	                      alert(data.message);  
	    	                  }  
	    	              }  
	    	          },  
	    	           error: function (data, status, e)
	    	          {  
	    	              alert(e);  
	    	          }  
	    	      }) 
	    	     return false;
 		
		  } 
      }
	  
	  function getClientStatus(){
  		var x = new XMLHttpRequest();
  		x.onreadystatechange = function() {
  			if (x.readyState == 4 && x.status == 200) {
  				var items = x.responseText;
  				items = items.split('####');
  			    $('#lblclientstatus').html(items[0]);
  		}
  		}
  		x.open("GET", "getClientStatus.jsp?accountno="+$("#txtdocno").val().trim(), true);
  		x.send();
 	}
	
	  function opnprintcheck(){
			 if(document.getElementById("chckopnprint").checked){
				 document.getElementById("hidchckopnprint").value = 1;
			 }
			 else{
				 document.getElementById("hidchckopnprint").value = 0;
			 }
		 }
	  
	  function funPrintARProjectWise(){
	    	if ($("#txtdocno").val()!="") {
		        var url=document.URL;
		        var reurl=url.split("accountsStatementType.jsp");
		        $("#txtdocno").prop("disabled", false);
		        var win= window.open(reurl[0]+"../../../../com/dashboard/accounts/accountsstatement/printARProjectWise?acno="+document.getElementById("txtdocno").value+'&netamount='+document.getElementById("txtnetamount").value+'&branch='+document.getElementById("cmbbranch").value+'&fromDate='+document.getElementById("fromdate").value+'&toDate='+$('#todate').val()+'&chckopn='+$('#hidchckopnprint').val()+'&email=Nil&print=1',"_blank","top=150,left=250,Width=1020,Height=500,location=no,scrollbars=no,toolbar=yes");
		        win.focus();
		     }
		    else {
				$.messager.alert('Message','Account is Mandatory.','warning');
				return;
			}
	    }
	  function getProjectWisePrintAllowed(){
	  		var x = new XMLHttpRequest();
	  		x.onreadystatechange = function() {
	  			if (x.readyState == 4 && x.status == 200) {
	  				var items = x.responseText;
	  				if(parseInt(items)==1){
	  				$('#btnPrintAccountStmt').show();
	  				} else {
	  					$('#btnPrintAccountStmt').hide();
	  				}
	  		}
	  		}
	  		x.open("GET", "getProjectWisePrintAllowed.jsp", true);
	  		x.send();
	 	}
	  function getRAwiseprint(){
		  var dname=document.getElementById("lbldetailname").innerText;
		  var x = new XMLHttpRequest();
		  x.onreadystatechange = function(){
			  if(x.readyState ==4 && x.status == 200){
				  var items = x.responseText;
				  if(items==1 && dname=="Accounts Statement AR"){
					  $('#btnRAPrintAccount').show();
				  }else{
					  $('#btnRAPrintAccount').hide();
					  
				  }
					  
				  }
			  }
		  x.open("GET","getrawise.jsp",true);
		  x.send();
	  }
	  
	
</script>
</head>
<body onload="getBranch();getProjectWisePrintAllowed();getRAwiseprint();">
<form id="frmAccountStatementType" action="saveAccountStatementType" method="post" autocomplete="off">
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
                        <td class="label-cell">Period</td>
                        <td><div id="fromdate" name="fromdate" onchange="getAccountFromPeriod();" value='<s:property value="fromdate"/>'></div></td>
                    </tr> 
                    <tr>
                        <td class="label-cell">To</td>
                        <td><div id="todate" name="todate" value='<s:property value="todate"/>'></div></td>
                    </tr>  
                    <tr>
                        <td class="label-cell">Account</td> 
                        <td><input type="text" id="txtaccid" name="txtaccid" readonly="readonly" placeholder="Press F3 to Search" value='<s:property value="txtaccid"/>' onkeydown="getAccTypeFrom(event);"/></td>
                    </tr> 
                    <tr>
                        <td class="label-cell"></td>
                        <td><input type="text" id="txtaccname" name="txtaccname" readonly="readonly" value='<s:property value="txtaccname"/>' tabindex="-1"/></td>
                    </tr>
                </table>
            </div>

            <div class="filter-card" style="display: flex; justify-content: center; align-items: center; min-height: 40px;">
                <label class="status" id="lblclientstatus" name="lblclientstatus"><s:property value="lblclientstatus"/></label>
            </div>

            <div class="filter-card">
                <div class="checkbox-wrap">
                    <input type="checkbox" id="chckopnprint" name="chckopnprint" value="" onchange="opnprintcheck();" onclick="$(this).attr('value', this.checked ? 1 : 0)" />
                    <label for="chckopnprint">OPN</label>
                </div>
                
                <div class="button-group">
                    <button type="button" class="btn-submit" id="btnPrintAccount" name="btnPrintAccount" onclick="funPrintAccountStatement(event);">Account Statement</button>
                    <button type="button" class="btn-submit btn-secondary" id="btnRAPrintAccount" name="btnRAPrintAccount" onclick="funPrintRAwise(event);" style="display:none;">RA wise Print</button>
                    <button type="button" class="btn-submit btn-secondary" id="btnPrintAccountStmt" name="btnPrintAccountStmt" onclick="funPrintARProjectWise(event);" style="display:none;">Project Wise Print</button>
                </div>
            </div>
            
            <div style="display: none;">
                <input type="hidden" id="txtdocno" name="txtdocno" value='<s:property value="txtdocno"/>'/>
                <input type="hidden" id="txtaccemail" name="txtaccemail" value='<s:property value="txtaccemail"/>'/>
                <input type="hidden" id="hidchckopnprint" name="hidchckopnprint" value='<s:property value="hidchckopnprint"/>'/>
                <input type="hidden" id="txtaccountperiodfrom" name="txtaccountperiodfrom" value='<s:property value="txtaccountperiodfrom"/>'/>
            </div>

        </div>
    </div>

    <div class="main-content-area">
        
        <div class="content-header-bar">
            <span class="account-label">Account:</span>
            <span class="accname" name="lblaccountname" id="lblaccountname"></span>
        </div>

        <div class="grid-container">
            <div id="accountsStatementDiv"><jsp:include page="accountsStatementTypeGrid.jsp"></jsp:include></div>
        </div>
        
        <div class="totals-footer">
            <div style="display: flex; align-items: center; gap: 8px;">
                <span class="total-label">Net Amount:</span>
                <input type="text" class="textbox" id="txtnetamount" name="txtnetamount" value='<s:property value="txtnetamount"/>'/>
            </div>
        </div>

    </div>

</div>

<div id="accountDetailsWindow">
	<div></div><div></div>
</div>

</div> 
</form>
</body>
</html>