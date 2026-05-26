<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html>
<html>
<% String contextPath=request.getContextPath();%>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta charset="UTF-8">
<title>GatewayERP(i)</title>
<jsp:include page="../../../../includes.jsp"></jsp:include>

<style>
/* =========================================================
   SCOPED UI: Modern Layout
========================================================= */
body {
    background: linear-gradient(135deg, #f5f7fa 0%, #c3cfe2 100%);
    font-family: 'Segoe UI', 'Roboto', 'Arial', sans-serif;
    color: #222;
    margin: 0;
    padding: 24px 0;
    box-sizing: border-box;
    overflow-y: auto !important;
}

#mainBG {
    background: #fff;
    border-radius: 16px;
    padding: 15px;
    max-width: 100%;
    margin: 0 auto;
    box-shadow: 0 4px 24px rgba(0,0,0,0.06);
}

.modern-ui {
    font-family: Arial, sans-serif; 
    color: #333;
    font-size: 12px; 
    padding: 5px 15px;
    box-sizing: border-box;
    width: 100%;
}

/* Master Input Heights - Forced to 24px */
.modern-ui input[type="text"],
.modern-ui select { 
    height: 24px !important; 
    border: 1px solid #b8c6d8; 
    border-radius: 3px; 
    padding: 2px 6px;
    font-size: 12px;
    box-sizing: border-box; 
    background-color: #fff; 
    color: #333;
    width: 100%;
}

.modern-ui input[type="text"]:focus,
.modern-ui select:focus { 
    border-color: #007bff; 
    outline: none;
}

.modern-ui input[readonly],
.modern-ui input:disabled,
.modern-ui select:disabled { 
    background-color: #f8f9fa; 
    color: #6b7280;
}

/* Layout Utilities */
.modern-ui .field-row { 
    display: flex;
    align-items: center; 
    gap: 8px;
    margin-bottom: 10px; 
    flex-wrap: wrap;
}

.modern-ui .lbl-right { 
    text-align: right; 
    color: #444;
    font-size: 12px; 
    font-weight: bold;
    white-space: nowrap; 
    padding-right: 5px;
}

/* Middle Section Panels */
.modern-ui .middle-panel {
    border: 1px solid #c5d3e0; 
    padding: 20px 10px 10px 10px; 
    background: #ffffff; 
    position: relative; 
    border-radius: 4px; 
    margin-bottom: 15px;
    margin-top: 12px;
}

.modern-ui .middle-panel-title { 
    position: absolute; 
    top: -12px;
    left: 10px; 
    background: #ffffff; 
    padding: 0 8px; 
    color: #0056b3;
    font-weight: bold; 
    font-size: 14px; 
    border-left: 3px solid #0056b3;
    z-index: 2; 
    line-height: normal; 
}

/* Custom UI Buttons matching 24px height */
.modern-ui .myButton {
    height: 24px !important;
    line-height: 22px !important;
    padding: 0 12px;
    font-family: Arial, sans-serif;
    font-size: 11px;
    font-weight: bold;
    border-radius: 3px;
    cursor: pointer;
    text-shadow: none;
    transition: all 0.2s;
    box-shadow: 0 1px 2px rgba(0,0,0,0.1);
    border: none;
    background: linear-gradient(135deg, #0b45a2 0%, #2563eb 100%);
    color: #ffffff;
    white-space: nowrap;
}
.modern-ui .myButton:hover { background: linear-gradient(135deg, #083a8a 0%, #1d4ed8 100%); }

/* Grid Wrappers */
.modern-ui .grid-container {
    border: 1px solid #c5d3e0;
    border-radius: 4px;
    background: #fff;
    overflow: hidden;
}

/* Scrollbar Logic */
.hidden-scrollbar {
    overflow-y: auto;
    height: calc(100vh - 150px);
    padding-right: 5px;
}
.hidden-scrollbar::-webkit-scrollbar { width: 6px; }
.hidden-scrollbar::-webkit-scrollbar-thumb { background: #c5d3e0; border-radius: 3px; }

/* Flexbox Column Helpers */
.flex-row-container {
    display: flex;
    align-items: flex-start;
    gap: 15px;
    margin-bottom: 15px;
}
.col-65 { flex: 0 0 65%; width: 65%; }
.col-35 { flex: 0 0 calc(35% - 15px); width: calc(35% - 15px); }

/* Specific balance styling */
.balance-text {
    font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
    font-size: 13px;
    font-weight: bold;
    color: #d9534f;
    text-align: right;
    background: #fdf2f2;
}
</style>
<%
String modes =request.getParameter("modes")==null?"0":request.getParameter("modes").toString();

System.out.println("====masterdocno===="+request.getParameter("mastertrno"));

String mastertrno =request.getParameter("mastertrno")==null?"0":request.getParameter("mastertrno").toString();
String isassign =request.getParameter("isassign")==null?"0":request.getParameter("isassign").toString();
%>

<script type="text/javascript">
var modes='<%=modes%>';
var mastertrno='<%=mastertrno%>';
	$(document).ready(function() {
		
         // FIXED: Width settings to accurately match their containers
		 $("#callRegisterDate").jqxDateTimeInput({ width: '125px', height: 24, formatString:"dd.MM.yyyy", theme: 'energyblue'});
		 $("#contractDate").jqxDateTimeInput({ width: '120px', height: 24, formatString:"dd.MM.yyyy"});
		 $("#contractTime").jqxDateTimeInput({ width: '100%', height: 24, formatString:'HH:mm', showCalendarButton: false});
		
         /* Force internal alignment AFTER render */
         setTimeout(function () {
             $("#callRegisterDate, #contractDate, #contractTime").find("input").css({
                 "margin-top": "0px",
                 "line-height": "24px",
                 "font-size": "12px", 
                 "font-family": "Arial, sans-serif", 
                 "padding": "0 6px", 
                 "box-sizing":"border-box"
             });
             $("#callRegisterDate, #contractDate, #contractTime").find(".jqx-action-button").css({
                 "top": "0px",
                 "height": "24px"
             });
         }, 0);

		 /* Searching Window */
     	 $('#clientDetailsWindow').jqxWindow({width: '51%', height: '58%',  maxHeight: '70%' ,maxWidth: '51%' , title: 'Client Search',position: { x: 300, y: 87 } , theme: 'energyblue', showCloseButton: true, keyboardCloseKey: 27});
  		 $('#clientDetailsWindow').jqxWindow('close');
  		 
  		 $('#contractDetailsWindow').jqxWindow({width: '30%', height: '53%',  maxHeight: '70%' ,maxWidth: '30%' , title: 'Contract Search',position: { x: 300, y: 87 } , theme: 'energyblue', showCloseButton: true, keyboardCloseKey: 27});
 		 $('#contractDetailsWindow').jqxWindow('close');
  		 
 		 $('#siteDetailsWindow').jqxWindow({width: '25%', height: '53%',  maxHeight: '70%' ,maxWidth: '25%' , title: 'Site Search',position: { x: 300, y: 87 } , theme: 'energyblue', showCloseButton: true, keyboardCloseKey: 27});
 		 $('#siteDetailsWindow').jqxWindow('close');
 		 
 		 $('#callRegisterServiceGridWindow').jqxWindow({width: '30%', height: '53%',  maxHeight: '70%' ,maxWidth: '30%' , title: 'Service Search',position: { x: 300, y: 87 } , theme: 'energyblue', showCloseButton: true, keyboardCloseKey: 27});
		 $('#callRegisterServiceGridWindow').jqxWindow('close');
		 
		 $('#callRegisterGridWindow').jqxWindow({width: '30%', height: '53%',  maxHeight: '70%' ,maxWidth: '30%' , title: 'Complaints Search',position: { x: 300, y: 87 } , theme: 'energyblue', showCloseButton: true, keyboardCloseKey: 27});
		 $('#callRegisterGridWindow').jqxWindow('close');
		
         $('#calledbyWindow').jqxWindow({width: '25%', height: '53%',  maxHeight: '70%' ,maxWidth: '25%' , title: 'Called By Search',position: { x: 300, y: 87 } , theme: 'energyblue', showCloseButton: true, keyboardCloseKey: 27});
 		 $('#calledbyWindow').jqxWindow('close'); 

  		 $('#txtclientname').dblclick(function(){
  			clientSearchContent("clientDetailsSearch.jsp");
		  });
  		 
  		 $('#txtcontractno').dblclick(function(){
  			if($("#txtclientdocno").val()==''){
				 $.messager.alert('Message','Choose Client & Search.','warning');
				 if($("#txtclientdocno").val()==''){
				 	$('#txtclientname').attr('placeholder', 'Press F3 to Search');
				 }
				 return 0;
			}
  			if($("#cmbcontracttype").val()==''){
				 $.messager.alert('Message','Choose Contract Type & Search.','warning');
				 if($("#txtcontractno").val()==''){
				 	$('#txtcontractno').attr('placeholder', 'Press F3 to Search');
				 }
				 return 0;
			}
  			contractSearchContent("contractDetailsSearch.jsp");
		  });
  		
  		 $('#txtsite').dblclick(function(){
		    if($("#txtcontractno").val()==''){
				 $.messager.alert('Message','Contract No. is Mandatory.','warning');
				 if($("#txtsite").val()==''){
				 	$('#txtsite').attr('placeholder', 'Press F3 to Search');
				 }
				 return 0;
			}
  			siteSearchContent("siteDetailsSearch.jsp");
		  });

        $('#txtcontactperson').dblclick(function(){
			  if($("#txtclientdocno").val()==''){
					 $.messager.alert('Message','Choose Client & Search.','warning');
					 if($("#txtclientdocno").val()==''){
					 	$('#txtclientname').attr('placeholder', 'Press F3 to Search');
					 }
					 return 0;
				}
			
	  			calledbySearchContent("calledbyDetailsSearchGrid.jsp?cldocno="+document.getElementById("txtclientdocno").value);
			  });
  		 
	});
	
	function clientSearchContent(url) {
	 	$('#clientDetailsWindow').jqxWindow('open');
		$.get(url).done(function (data) {
		$('#clientDetailsWindow').jqxWindow('setContent', data);
		$('#clientDetailsWindow').jqxWindow('bringToFront');
	}); 
	}
	
	function contractSearchContent(url) {
	 	$('#contractDetailsWindow').jqxWindow('open');
		$.get(url).done(function (data) {
		$('#contractDetailsWindow').jqxWindow('setContent', data);
		$('#contractDetailsWindow').jqxWindow('bringToFront');
	}); 
	}
	
	function siteSearchContent(url) {
	 	$('#siteDetailsWindow').jqxWindow('open');
		$.get(url).done(function (data) {
		$('#siteDetailsWindow').jqxWindow('setContent', data);
		$('#siteDetailsWindow').jqxWindow('bringToFront');
	}); 
	}
	function calledbySearchContent(url) {
	 	$('#calledbyWindow').jqxWindow('open');
		$.get(url).done(function (data) {
			
		$('#calledbyWindow').jqxWindow('setContent', data);
		$('#calledbyWindow').jqxWindow('bringToFront');
	}); 
	}
	function serviceSearchContent(url) {
	 	$('#callRegisterServiceGridWindow').jqxWindow('open');
		$.get(url).done(function (data) {
		$('#callRegisterServiceGridWindow').jqxWindow('setContent', data);
		$('#callRegisterServiceGridWindow').jqxWindow('bringToFront');
	}); 
	}
	
	function complaintSearchContent(url) {
	 	$('#callRegisterGridWindow').jqxWindow('open');
		$.get(url).done(function (data) {
		$('#callRegisterGridWindow').jqxWindow('setContent', data);
		$('#callRegisterGridWindow').jqxWindow('bringToFront');
	}); 
	}
	
	function getAccountBalance(a,b){
  		var x = new XMLHttpRequest();
  		x.onreadystatechange = function() {
  			if (x.readyState == 4 && x.status == 200) {
  				var items = x.responseText;
  				items = items.split('####');
  			    $('#txtaccountbalance').val(items[0]);
  		}
  		};
  		x.open("GET", "getAccountBalance.jsp?accountno="+a+'&cldocno='+b, true);
  		x.send();
 	}
	
	function getClientInfo(event){
        var x= event.keyCode;
        if(x==114){
        	clientSearchContent("clientDetailsSearch.jsp");
        }
        else{}
      }
	 
	 function getContractDetails(event){
        var x= event.keyCode;
        if(x==114){
        	if($("#txtclientdocno").val()==''){
				 $.messager.alert('Message','Choose Client & Search.','warning');
				 if($("#txtclientdocno").val()==''){
				 	$('#txtclientname').attr('placeholder', 'Press F3 to Search');
				 }
				 return 0;
			}
        	if($("#cmbcontracttype").val()==''){
				 $.messager.alert('Message','Choose Contract Type & Search.','warning');
				 if($("#txtcontractno").val()==''){
				 	$('#txtcontractno').attr('placeholder', 'Press F3 to Search');
				 }
				 return 0;
			}
        	contractSearchContent("contractDetailsSearch.jsp");
        }
        else{}
     }
	 
	 function getSiteDetails(event){
        var x= event.keyCode;
        if(x==114){
		    if($("#txtcontractno").val()==''){
				 $.messager.alert('Message','Contract No. is Mandatory.','warning');
				 if($("#txtsite").val()==''){
				 	$('#txtsite').attr('placeholder', 'Press F3 to Search');
				 }
				 return 0;
			}
        	siteSearchContent("siteDetailsSearch.jsp");
        }
        else{}
     }
	
function getCalledbyDetails(event){
	        var x= event.keyCode;
	        if(x==114){
	        	if($("#txtclientdocno").val()==''){
					 $.messager.alert('Message','Choose Client & Search.','warning');
					 if($("#txtclientdocno").val()==''){
					 	$('#txtclientname').attr('placeholder', 'Press F3 to Search');
					 }
					 return 0;
				}
	        	
	        	calledbySearchContent("calledbyDetailsSearchGrid.jsp?cldocno="+document.getElementById("txtclientdocno").value);
	        }
	        else{}
	     }

	 function funReadOnly(){
			$('#frmCallRegister input').attr('readonly', true );
			$('#frmCallRegister select').attr('disabled', true);
			$('#callRegisterDate').jqxDateTimeInput({disabled: true});
			$('#contractDate').jqxDateTimeInput({disabled: true});
			$('#contractTime').jqxDateTimeInput({disabled: true});
			$("#contractDetailsGridID").jqxGrid({ disabled: true});
			$("#callRegisterGridID").jqxGrid({ disabled: true});
			$("#callRegisterPendingGridID").jqxGrid({ disabled: true});
			
			if(modes=="view")
			{
			
			document.getElementById("formdet").innerText=window.parent.formName.value+" ("+window.parent.formCode.value.trim()+")";
			document.getElementById("formdetail").value=window.parent.formName.value;
			document.getElementById("formdetailcode").value=window.parent.formCode.value.trim();
			
			 $('#docno').attr('disabled', false);
			 $('#mode').attr('disabled', false);
			
			document.getElementById("docno").value=mastertrno;
			document.getElementById("mode").value=modes;
			
			 var names = [];
			$("form").each(function() {
			   names.push(this.id);
			}); 
			var form=names[0];
			   document.forms[form].submit(); 
			
			   $('#docno').attr('disabled', false);
				 $('#mode').attr('disabled', false);
			   
			}
			
	 }
	 
	 function funRemoveReadOnly(){
			$('#frmCallRegister input').attr('readonly', false );
			$('#frmCallRegister select').attr('disabled', false);
			$('#callRegisterDate').jqxDateTimeInput({disabled: false});
			$('#contractDate').jqxDateTimeInput({disabled: false});
			$('#contractTime').jqxDateTimeInput({disabled: false});
			$("#contractDetailsGridID").jqxGrid({ disabled: false});
			$("#callRegisterGridID").jqxGrid({ disabled: false});
			$("#callRegisterPendingGridID").jqxGrid({ disabled: false});
			
			if ($("#mode").val() == "E") {
				$('#frmCallRegister input').attr('readonly', false );
   			    $('#frmCallRegister select').attr('disabled', false);
   			    $("#callRegisterGridID").jqxGrid('addrow', null, {});
			  }
			
			if ($("#mode").val() == "A") {
				$('#callRegisterDate').val(new Date());
				$('#contractDate').val(new Date());
				$('#contractTime').val(new Date(<%=new java.util.Date().getTime()%>));
				$("#contractDetailsGridID").jqxGrid('clear');
				$("#contractDetailsGridID").jqxGrid('addrow', null, {});
				$("#callRegisterGridID").jqxGrid('clear');
				$("#callRegisterGridID").jqxGrid('addrow', null, {});
				$("#callRegisterPendingGridID").jqxGrid('clear');
				$("#callRegisterPendingGridID").jqxGrid('addrow', null, {});
			}
			
			$('#docno').attr('readonly', true);
			$('#txtclientname').attr('readonly', true );
			$('#txtclientdetails').attr('readonly', true );
			$('#txtclienttele').attr('readonly', true );
			$('#txtclientmobile').attr('readonly', true );
			$('#txtclientmail').attr('readonly', true );
			$('#txtcontractno').attr('readonly', true );
			$('#txtcontractdetails').attr('readonly', true );
			$('#txtsite').attr('readonly', true );
			
	 }
	 
	 function funSearchLoad(){
		  changeContent('cregMainSearch.jsp'); 
	 }
		
	 function funChkButton() {
			/* funReset(); */
		}
	 
	 function funFocus(){
	    	$('#callRegisterDate').jqxDateTimeInput('focus'); 	    		
	    }
	 
	  $(function(){
	        $('#frmCallRegister').validate({
	                rules: {
	                txtdescription:{maxlength:500}
	                 },
	                 messages: {
	                 txtdescription: {maxlength:"    Max 500 chars"}
	                 }
	        });}); 
	   
	  function funNotify(){	
			
			client=document.getElementById("txtclientdocno").value;
			 if(client==""){
				 document.getElementById("errormsg").innerText="Client is Mandatory.";
				 return 0;
			 }
			 
			 contracttype=document.getElementById("cmbcontracttype").value;
			 if(contracttype==""){
				 document.getElementById("errormsg").innerText="Contract Type is Mandatory.";
				 return 0;
			 }
			 
			 contractno=document.getElementById("txtcontracttrno").value;
			 if(contractno==""){
				 document.getElementById("errormsg").innerText="Contract No. is Mandatory.";
				 return 0;
			 }
			 
			 site=document.getElementById("txtsiteid").value;
			 if(site==""){
				 document.getElementById("errormsg").innerText="Site is Mandatory.";
				 return 0;
			 }
			 
			 document.getElementById("errormsg").innerText="";
			 
	        	/* Complaints Grid  Saving*/
				 var rows = $("#callRegisterGridID").jqxGrid('getrows');
				 var length=0;
					 for(var i=0 ; i < rows.length ; i++){
						var chk=rows[i].description;
						if(typeof(chk) != "undefined" && typeof(chk) != "NaN" && chk != ""){
							
							var chks=rows[i].complaintid;
							if(typeof(chks) == "undefined" || typeof(chks) == "NaN" || chks == ""){
								 document.getElementById("errormsg").innerText="Complaint is Mandatory for Service "+rows[i].stype+".";
								 return 0;
							}
							document.getElementById("errormsg").innerText="";
							 
							newTextBox = $(document.createElement("input"))
						    .attr("type", "dil")
						    .attr("id", "test"+length)
						    .attr("name", "test"+length)
							.attr("hidden", "true");
							length=length+1;
							
				    newTextBox.val(rows[i].sertypeid+":: "+rows[i].item+":: "+rows[i].complaintid+":: "+rows[i].description);
					newTextBox.appendTo('form');
					 }
					}
		 		 $('#gridlength').val(length);
	 		   /* Complaints Grid  Saving Ends*/	 
	 		   
	    	return 1;
		} 
	  
	  
	  function setValues(){
		  
		  document.getElementById("cmbcontracttype").value=document.getElementById("hidcmbcontracttype").value;
		  
		  if($('#hidcallRegisterDate').val()!=""){
				 $("#callRegisterDate").jqxDateTimeInput('val', $('#hidcallRegisterDate').val());
			  } 
		  
		  if($('#hidcontractDate').val()!=""){
				 $("#contractDate").jqxDateTimeInput('val', $('#hidcontractDate').val());
			  } 
		  
		  if($('#hidcontractTime').val()!=""){
				 $("#contractTime").jqxDateTimeInput('val', $('#hidcontractTime').val());
			  } 

		  if($('#msg').val()!=""){
			   $.messager.alert('Message',$('#msg').val());
			  }
		  
		  document.getElementById("formdet").innerText=$('#formdetail').val()+" ("+$('#formdetailcode').val().trim()+")";
		  funSetlabel();
		  
		  var indexVal = $('#docno').val();
		  if(indexVal>0){
	         $("#callRegisterDiv").load("callRegisterGrid.jsp?docno="+$('#txtcallregistertrno').val());
	         $("#contractDetailsDiv").load("contractDetailsGrid.jsp?docno="+indexVal+"&cldocno="+$('#txtclientdocno').val());
	         $("#callRegisterPendingDiv").load("callRegisterPendingGrid.jsp?docno="+$('#txtcallregistertrno').val()+"&contractno="+$('#txtcontracttrno').val());
	         getAccountBalance($('#txtclientacno').val(),$('#txtclientdocno').val());
		  }
			
		}
	  
	  function funPrintBtn() {
				
			if (($("#mode").val() == "view") && $("#docno").val()!="") {
				 
				var brhid=<%= session.getAttribute("BRANCHID").toString()%>
				var trno=$("#txtcallregistertrno").val();
				 var url=document.URL;
			     var reurl=url.split("saveCallRegister");
			     $("#docno").prop("disabled", false);
				
			     var win= window.open(reurl[0]+"printCallRegister?docno="+document.getElementById("docno").value+"&brhid="+brhid+"&trno="+trno+"&header=1","_blank","top=250,left=310,Width=800,Height=800,location=no,scrollbars=yes,toolbar=yes");
					win.focus();
			     
		     }
		    else {
				$.messager.alert('Message','Select a Document....!','warning');
				return;
			}
	    }
	  
	  
	  function refChange(){
		  
			document.getElementById("txtcontractno").value="0";
			document.getElementById("txtcontracttrno").value="0";
			document.getElementById("txtcontractdetails").value="";
			document.getElementById("txtsite").value="";
			document.getElementById("txtsiteid").value="0";
			document.getElementById("txtdescription").value=" ";
			 
			}
	  
</script>
</head>
<body onload="setValues();">
<div id="mainBG" class="homeContent" data-type="background">
<form id="frmCallRegister" action="saveCallRegister" method="post" autocomplete="off">
<jsp:include page="../../../../header.jsp"></jsp:include>

<div class="modern-ui hidden-scrollbar">

    <div class="middle-panel">
        <span class="middle-panel-title">General Info</span>
        
        <div class="field-row">
            <label class="lbl-right" style="width:80px;">Date</label>
            <div style="width: 125px;">
                <div id="callRegisterDate" name="callRegisterDate" value='<s:property value="callRegisterDate"/>'></div>
                <input type="hidden" id="hidcallRegisterDate" name="hidcallRegisterDate" value='<s:property value="hidcallRegisterDate"/>'/>
            </div>
            
            <label class="lbl-right" style="width:80px;">Ref. No.</label>
            <input type="text" id="txtrefno" name="txtrefno" style="width:120px;" value='<s:property value="txtrefno"/>'/>
            
            <label class="lbl-right" style="width:80px; margin-left:auto;">Doc No.</label>
            <input type="text" id="docno" name="txtcallregisterdocno" style="width:120px;" value='<s:property value="txtcallregisterdocno"/>' tabindex="-1" readonly/>
            <input type="hidden" id="txtcallregistertrno" name="txtcallregistertrno" value='<s:property value="txtcallregistertrno"/>'/>
        </div>
    </div>

    <div class="flex-row-container">
        
        <div class="col-65">
            <div class="middle-panel">
                <span class="middle-panel-title">Client Details</span>
                
                <div class="field-row">
                    <label class="lbl-right" style="width:80px;">Client</label>
                    <input type="text" id="txtclientname" name="txtclientname" style="width:150px;" placeholder="Press F3" value='<s:property value="txtclientname"/>' onkeydown="getClientInfo(event);"/>
                    <input type="hidden" id="txtclientdocno" name="txtclientdocno" value='<s:property value="txtclientdocno"/>'/>
                    <input type="hidden" id="txtclientacno" name="txtclientacno" value='<s:property value="txtclientacno"/>'/>
                    
                    <label class="lbl-right" style="width:90px;">Client Details</label>
                    <input type="text" id="txtclientdetails" name="txtclientdetails" style="flex:1;" value='<s:property value="txtclientdetails"/>' tabindex="-1" readonly/>
                </div>
                
                <div class="field-row">
                    <label class="lbl-right" style="width:80px;">Tele.</label>
                    <input type="text" id="txtclienttele" name="txtclienttele" style="width:150px;" value='<s:property value="txtclienttele"/>' tabindex="-1" readonly/>
                    
                    <label class="lbl-right" style="width:90px;">Mobile</label>
                    <input type="text" id="txtclientmobile" name="txtclientmobile" style="width:120px;" value='<s:property value="txtclientmobile"/>' tabindex="-1" readonly/>
                    
                    <label class="lbl-right" style="width:40px;">Mail</label>
                    <input type="text" id="txtclientmail" name="txtclientmail" style="flex:1;" value='<s:property value="txtclientmail"/>' tabindex="-1" readonly/>
                </div>
                
                <div class="field-row">
                    <label class="lbl-right" style="width:80px;">Called By</label>
                    <input type="text" id="txtcontactperson" name="txtcontactperson" style="width:150px;" placeholder="Press F3" value='<s:property value="txtcontactperson"/>' onkeydown="getCalledbyDetails(event);"/>
                    
                    <label class="lbl-right" style="width:90px;">Tele.</label>
                    <input type="text" id="txtcontactpersontele" name="txtcontactpersontele" style="width:120px;" value='<s:property value="txtcontactpersontele"/>'/>
                    
                    <label class="lbl-right" style="width:40px;">Mobile</label>
                    <input type="text" id="txtcontactpersonmob" name="txtcontactpersonmob" style="flex:1;" value='<s:property value="txtcontactpersonmob"/>'/>
                </div>
                
                <div class="field-row">
                    <label class="lbl-right" style="width:80px;">Mail</label>
                    <input type="text" id="txtcontactpersonmail" name="txtcontactpersonmail" style="width:150px;" value='<s:property value="txtcontactpersonmail"/>'/>
                    
                    <label class="lbl-right" style="width:90px;">Date</label>
                    <div style="width: 120px;">
                        <div id="contractDate" name="contractDate" value='<s:property value="contractDate"/>'></div>
                        <input type="hidden" id="hidcontractDate" name="hidcontractDate" value='<s:property value="hidcontractDate"/>'/>
                    </div>
                    
                    <label class="lbl-right" style="width:40px;">Time</label>
                    <div style="flex: 1; min-width: 80px;">
                        <div id="contractTime" name="contractTime" value='<s:property value="contractTime"/>'></div>
                        <input type="hidden" id="hidcontractTime" name="hidcontractTime" value='<s:property value="hidcontractTime"/>'/>
                    </div>
                </div>
            </div>

            <div class="middle-panel">
                <span class="middle-panel-title">Contract Details</span>
                
                <div class="field-row">
                    <label class="lbl-right" style="width:80px;">Type</label>
                    <select id="cmbcontracttype" name="cmbcontracttype" style="width:150px;" onchange="refChange();" value='<s:property value="cmbcontracttype"/>'>
                        <option value=''>-- Select --</option>
                        <option value='AMC'>AMC</option>
                        <option value='SJOB'>SJOB</option>
                    </select>
                    <input type="hidden" id="hidcmbcontracttype" name="hidcmbcontracttype" value='<s:property value="hidcmbcontracttype"/>'/>
                    
                    <label class="lbl-right" style="width:90px;">Contract No.</label>
                    <input type="text" id="txtcontractno" name="txtcontractno" style="width:120px;" placeholder="Press F3" value='<s:property value="txtcontractno"/>' onkeydown="getContractDetails(event);"/>
                    <input type="hidden" id="txtcontracttrno" name="txtcontracttrno" value='<s:property value="txtcontracttrno"/>'/>
                    
                    <input type="text" id="txtcontractdetails" name="txtcontractdetails" style="flex:1; margin-left: 8px;" value='<s:property value="txtcontractdetails"/>' tabindex="-1" readonly/>
                </div>
                
                <div class="field-row">
                    <label class="lbl-right" style="width:80px;">Site</label>
                    <input type="text" id="txtsite" name="txtsite" style="width:150px;" placeholder="Press F3" value='<s:property value="txtsite"/>' onkeydown="getSiteDetails(event);"/>
                    <input type="hidden" id="txtsiteid" name="txtsiteid" value='<s:property value="txtsiteid"/>'/>
                    
                    <label class="lbl-right" style="width:90px;">Description</label>
                    <input type="text" id="txtdescription" name="txtdescription" style="flex:1;" value='<s:property value="txtdescription"/>'/>
                </div>
            </div>
        </div>
        
        <div class="col-35">
            <div class="middle-panel">
                <span class="middle-panel-title">Account Details</span>
                <div class="field-row" style="justify-content: space-between;">
                    <label style="font-weight:bold; color:#555;">Account Balance :</label>
                    <input type="text" id="txtaccountbalance" class="balance-text" name="txtaccountbalance" style="width:120px;" value='<s:property value="txtaccountbalance"/>' readonly tabindex="-1"/>
                </div>
            </div>
            
            <div class="middle-panel" style="flex: 1; display: flex; flex-direction: column;">
                <span class="middle-panel-title">Active Contract/Job Details</span>
                <div id="contractDetailsDiv" class="grid-container" style="flex: 1; min-height: 200px;">
                    <jsp:include page="contractDetailsGrid.jsp"></jsp:include>
                </div>
            </div>
        </div>
        
    </div>

    <div class="flex-row-container">
        <div class="col-65">
            <div class="middle-panel">
                <span class="middle-panel-title">Complaints</span>
                <div id="callRegisterDiv" class="grid-container">
                    <jsp:include page="callRegisterGrid.jsp"></jsp:include>
                </div>
            </div>
        </div>
        
        <div class="col-35">
            <div class="middle-panel">
                <span class="middle-panel-title">Pending Complaints</span>
                <div id="callRegisterPendingDiv" class="grid-container">
                    <jsp:include page="callRegisterPendingGrid.jsp"></jsp:include>
                </div>
            </div>
        </div>
    </div>

    <div style="display:none;">
        <input type="hidden" id="mode" name="mode"/>
        <input type="hidden" id="deleted" name="deleted" value='<s:property value="deleted"/>'/>
        <input type="hidden" id="msg" name="msg" value='<s:property value="msg"/>'/>
        <input type="hidden" id="gridlength" name="gridlength" value='<s:property value="gridlength"/>'/>
    </div>

</div>
</form>

<div id="clientDetailsWindow"><div></div></div>
<div id="contractDetailsWindow"><div></div></div>
<div id="siteDetailsWindow"><div></div></div>
<div id="callRegisterServiceGridWindow"><div></div></div>
<div id="callRegisterGridWindow"><div></div></div>	
<div id="calledbyWindow"><div></div></div>	

</div>
</body>
</html>