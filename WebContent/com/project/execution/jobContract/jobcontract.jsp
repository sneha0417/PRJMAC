<%@ taglib prefix="s" uri="/struts-tags" %>
<!doctype html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>GatewayERP(i)</title>
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

form label.error {
    color: red;
    font-weight: bold;
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

/* Custom UI Buttons */
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
.modern-ui .myButton:disabled { background: #cccccc; cursor: not-allowed; box-shadow: none; }

/* Grid Wrappers */
.modern-ui .grid-container {
    border: 1px solid #c5d3e0;
    border-radius: 4px;
    background: #fff;
    overflow: hidden;
}

/* Scrollbar Logic */
.hidden-scrollbar {
    overflow: auto;
    height: calc(100vh - 120px);
    padding-right: 5px;
}
.hidden-scrollbar::-webkit-scrollbar { width: 6px; }
.hidden-scrollbar::-webkit-scrollbar-thumb { background: #c5d3e0; border-radius: 3px; }

/* Checkbox Wrappers */
.chk-wrapper {
    display: flex;
    align-items: center;
    gap: 5px;
    font-size: 12px;
    font-weight: bold;
    color: #444;
    height: 24px;
}

.flex-row-container {
    display: flex;
    align-items: stretch;
    gap: 15px;
    margin-bottom: 15px;
}
.col-50 { flex: 1; width: 50%; display: flex; flex-direction: column; }
</style>

<%
String modes =request.getParameter("modes")==null?"0":request.getParameter("modes").toString();
String mastertrno =request.getParameter("masterdocno")==null?"0":request.getParameter("masterdocno").toString();
String isassign =request.getParameter("isassign")==null?"0":request.getParameter("isassign").toString();
String brch1 =request.getParameter("brch")==null?"0":request.getParameter("brch").toString();
%>

<jsp:include page="../../../../includes.jsp"></jsp:include>
<script type="text/javascript">
var modes='<%=modes%>';
var mastertrno='<%=mastertrno%>';
var brhidview='<%=brch1%>';
$(document).ready(function() {
    
    // Modernized Date Inputs
    var dateConfig = { width : '125px', height : 24, formatString : "dd.MM.yyyy", theme: 'energyblue' };
    $("#date").jqxDateTimeInput(dateConfig);
    $("#stdate").jqxDateTimeInput(dateConfig);
    $("#enddate").jqxDateTimeInput(dateConfig);
    $("#wstdate").jqxDateTimeInput(dateConfig);
    $("#wenddate").jqxDateTimeInput(dateConfig);
    $("#finsdate").jqxDateTimeInput(dateConfig);
    $("#serdate").jqxDateTimeInput(dateConfig);
    
    // Force alignment
    setTimeout(function () {
        $("#date, #stdate, #enddate, #wstdate, #wenddate, #finsdate, #serdate").find("input").css({
            "margin-top": "0px",
            "line-height": "24px",
            "font-size": "12px", 
            "font-family": "Arial, sans-serif", 
            "padding": "0 6px", 
            "box-sizing":"border-box"
        });
        $("#date, #stdate, #enddate, #wstdate, #wenddate, #finsdate, #serdate").find(".jqx-action-button").css({
            "top": "0px",
            "height": "24px"
        });
    }, 0);

	  $('#clientsearch1').jqxWindow({ width: '50%', height: '55%',  maxHeight: '85%' ,maxWidth: '80%' ,title: 'Client Search' , position: { x: 250, y: 120 }, keyboardCloseKey: 27});
	  $('#clientsearch1').jqxWindow('close');
	  $('#cpinfowindow').jqxWindow({ width: '35%', height: '62%',  maxHeight: '85%' ,maxWidth: '80%' ,title: 'Contact Person Search' , position: { x: 250, y: 60 }, keyboardCloseKey: 27});
	  $('#cpinfowindow').jqxWindow('close');
	  $('#areainfowindow').jqxWindow({ width: '25%', height: '70%',  maxHeight: '85%' ,maxWidth: '80%' ,title: ' Area Search' , position: { x: 250, y: 60 }, keyboardCloseKey: 27});
	  $('#areainfowindow').jqxWindow('close');
	  $('#siteinfowindow').jqxWindow({ width: '25%', height: '70%',  maxHeight: '85%' ,maxWidth: '80%' ,title: 'Site Search' , position: { x: 250, y: 60 }, keyboardCloseKey: 27});
	  $('#siteinfowindow').jqxWindow('close');
	  $('#grpinfowindow').jqxWindow({ width: '25%', height: '70%',  maxHeight: '85%' ,maxWidth: '80%' ,title: 'Assign Group' , position: { x: 250, y: 60 }, keyboardCloseKey: 27});
	  $('#grpinfowindow').jqxWindow('close');
	  $('#teaminfowindow').jqxWindow({ width: '30%', height: '70%',  maxHeight: '85%' ,maxWidth: '80%' ,title: 'Assign Team' , position: { x: 250, y: 60 }, keyboardCloseKey: 27});
	  $('#teaminfowindow').jqxWindow('close');
	  $('#sertypefowindow').jqxWindow({ width: '30%', height: '65%',  maxHeight: '85%' ,maxWidth: '80%' ,title: 'Service Type' , position: { x: 250, y: 60 }, keyboardCloseKey: 27});
	  $('#sertypefowindow').jqxWindow('close');
	  $('#schserchinfowindow').jqxWindow({ width: '80%', height: '60%',  maxHeight: '90%' ,maxWidth: '90%' ,title: 'Schedule Search' , position: { x: 150, y: 50 }, keyboardCloseKey: 27});
	  $('#schserchinfowindow').jqxWindow('close');
	  $('#serviceteamwindow').jqxWindow({ width: '25%', height: '70%',  maxHeight: '85%' ,maxWidth: '80%' ,title: ' Service Team Search' , position: { x: 250, y: 60 }, keyboardCloseKey: 27});
	  $('#serviceteamwindow').jqxWindow('close');
	  refChange();
	  
	  $('#txtclient').dblclick(function(){
		   
		  	if($('#mode').val()!= "view")
		  		{
		  	 $('#clientsearch1').jqxWindow('open');
			 clientSearchContent('clientINgridsearch.jsp?', $('#clientsearch1'));
		  		}
		 });
	  
	  $('#rrefno').dblclick(function(){
		   
		  	if($('#mode').val()!= "view")
		  		{
		  	 changeContent('enqMastersearch.jsp');  
		  		}
		 });
	  
	  
	  $('#txtcontact').dblclick(function(){
		   
		  	if($('#mode').val()!= "view")
		  		{
		  		var clientid=document.getElementById("clientid").value;
		 		
		 		if(clientid==""){
		 			document.getElementById("errormsg").innerText=" Select Client";
		 			return 0;
		 		}
		 		
		 		 var type=1;
		 		 var rowBoundIndex=0;
	 	 	  $('#cpinfowindow').jqxWindow('open');
	 	  	   cpSearchContent('contactpersonsearch.jsp?clientdocno='+clientid+'&rowindex='+rowBoundIndex+'&type='+type); 
		  		}
		 });
	  
	  
	  $('#finsdate').on('change', function (event) 
	  			{  
	  	
	  	if($('#finsdate').jqxDateTimeInput('getDate')!=null){
	  		var date=new Date($('#finsdate').jqxDateTimeInput('getDate'));
	  		var status=checkInstdate(date);//Checking Future date.Written on 11-07-2016	
	  		if(status){
	  			document.getElementById("errormsg").innerText="";
	  			return true;
	  		}
	  		else{
	  			$('#finsdate').jqxDateTimeInput('focus');
	  			return false;
	  		}
	  	}
	  	});
		  
		  $('#serdate').on('change', function (event) 
		  			{  
		  	
		  	if($('#serdate').jqxDateTimeInput('getDate')!=null){
		  		var date=new Date($('#serdate').jqxDateTimeInput('getDate'));
		  		var status=checkScheddate(date);//Checking Future date.Written on 11-07-2016	
		  		if(status){
		  			document.getElementById("errormsg").innerText="";
		  			return true;
		  		}
		  		else{
		  			$('#serdate').jqxDateTimeInput('focus');
		  			return false;
		  		}
		  	}
		  	});
	  
	  
	  
});


function getEnquiry(event){
	 
	var clientid=document.getElementById("clientid").value;
	
	if(clientid>0){
		
		document.getElementById("errormsg").innerText="";
		
	}
	else{
		document.getElementById("errormsg").innerText="Select a client";
		
		return 0;
	} 

	var x= event.keyCode;
 	 if(x==114){
	   
 		 changeContent('enqMastersearch.jsp');  
	
 	 }
 	 else{
 		 }
 	 }
 	 

function getareas(rowBoundIndex){
	 
	  $('#areainfowindow').jqxWindow('open');

 // $('#accountWindow').jqxWindow('focus');
        areaSearchContent('area.jsp?rowBoundIndex='+rowBoundIndex);
      	 }
      	 
function areaSearchContent(url) {
//alert(url);
	 $.get(url).done(function (data) {
		 //alert(data);
$('#areainfowindow').jqxWindow('setContent', data);

            	}); 
  	}
  	
  	
function checkInstdate(date){
	 var date1=new Date(date);
	 date1.setHours(0,0,0,0);
	 var stdate=new Date($('#stdate').jqxDateTimeInput('getDate'));
	 var enddate=new Date($('#enddate').jqxDateTimeInput('getDate'));
	 enddate.setHours(0,0,0,0);
	 
	 if(date1<stdate){
		 
		 document.getElementById("errormsg").innerText="";
		 document.getElementById("errormsg").innerText="First Inst Date Should not less than Start Date";
	     //$('#finsdate').jqxDateTimeInput('setDate', new Date());
	     
		 return false;
	 }
	 else if(date1>enddate){
		 
		 document.getElementById("errormsg").innerText="";
		 document.getElementById("errormsg").innerText="First Inst Date Should not greater than End Date";
	     //$('#finsdate').jqxDateTimeInput('setDate', new Date());
	     
		 return false;
	 }
	 
	 else{
		 document.getElementById("errormsg").innerText="";
		 return true;
	 }
}

function checkScheddate(date){
	 var date1=new Date(date);
	 date1.setHours(0,0,0,0);
	 var stdate=new Date($('#stdate').jqxDateTimeInput('getDate'));
	 stdate.setHours(0,0,0,0);
	 var enddate=new Date($('#enddate').jqxDateTimeInput('getDate'));
	 enddate.setHours(0,0,0,0);
	 
	 if(date1<stdate){
		 
		 document.getElementById("errormsg").innerText="";
		 document.getElementById("errormsg").innerText="Service Date Should not less than Start Date";
		 //$('#serdate').jqxDateTimeInput('setDate', new Date());
		 return false;
	 }
else if(date1>enddate){
		 
		 document.getElementById("errormsg").innerText="";
		 document.getElementById("errormsg").innerText="Service Date Should not greater than End Date";
	     //$('#finsdate').jqxDateTimeInput('setDate', new Date());
	     
		 return false;
	 }
	 else{
		 document.getElementById("errormsg").innerText="";
		 return true;
	 }
}
  	
  	
function getsite(rowBoundIndex){
	 
	  $('#siteinfowindow').jqxWindow('open');
	  var type=1;
// $('#accountWindow').jqxWindow('focus');
      siteSearchContent('servicesitesearch.jsp?rowBoundIndex='+rowBoundIndex+'&type='+type);
   	 }
   	 
function siteSearchContent(url) {
//alert(url);
	 $.get(url).done(function (data) {
		 //alert(data);
$('#siteinfowindow').jqxWindow('setContent', data);
$('#siteinfowindow').jqxWindow('bringToFront');

            	}); 
	}
  	
  	
  	
function getgrpcode(rowBoundIndex){
	 
	  $('#grpinfowindow').jqxWindow('open');

// $('#accountWindow').jqxWindow('focus');
      grpSearchContent('servicegrpsearch.jsp?rowBoundIndex='+rowBoundIndex);
   	 }
   	 
function grpSearchContent(url) {
//alert(url);
	 $.get(url).done(function (data) {
		 //alert(data);
$('#grpinfowindow').jqxWindow('setContent', data);

            	}); 
	}
	
function getteam(rowBoundIndex,assgnid){
	 
	  $('#teaminfowindow').jqxWindow('open');

//$('#accountWindow').jqxWindow('focus');
    teamSearchContent('servicegrptoearch.jsp?rowBoundIndex='+rowBoundIndex+'&assgnid='+assgnid);
 	 }
 	 
function teamSearchContent(url) {
//alert(url);
	 $.get(url).done(function (data) {
		 //alert(data);
$('#teaminfowindow').jqxWindow('setContent', data);

        	}); 
	}
	
	
function getserType(rowBoundIndex,sert){
	 
	  $('#sertypefowindow').jqxWindow('open');

//$('#accountWindow').jqxWindow('focus');
 serTypeSearchContent('servicetypesearch.jsp?rowBoundIndex='+rowBoundIndex+'&sert='+sert);
	 }
	 
function serTypeSearchContent(url) {
//alert(url);
	 $.get(url).done(function (data) {
		 //alert(data);
$('#sertypefowindow').jqxWindow('setContent', data);
$('#sertypefowindow').jqxWindow('bringToFront');
      	}); 
	}

function getserviceteam(rowBoundIndex){
	 
	  $('#serviceteamwindow').jqxWindow('open');

//$('#accountWindow').jqxWindow('focus');
    serviceteamContent('serviceteam.jsp?rowBoundIndex='+rowBoundIndex);
 	 }
 	 
function serviceteamContent(url) {
//alert(url);
	 $.get(url).done(function (data) {
		 //alert(data);
$('#serviceteamwindow').jqxWindow('setContent', data);

        	}); 
	}

function getclinfo(event){
	 var x= event.keyCode;
	 if(x==114){
	  $('#clientsearch1').jqxWindow('open');
	 clientSearchContent('clientINgridsearch.jsp?', $('#clientsearch1'));    }
	 else{
		 }
	 } 
      function clientSearchContent(url) {
            
                $.get(url).done(function (data) {
   
	           $('#clientsearch1').jqxWindow('setContent', data);

     	}); 
          	}
      
      
      function getcontact(event,rowindex){
     	 	
    		var clientid=document.getElementById("clientid").value;
    		
    		if(clientid==""){
    			document.getElementById("errormsg").innerText=" Select Client";
    			return 0;
    		}
    		var x= event.keyCode;
    		 if(x==114){
    			 var type=1;
    	 	  $('#cpinfowindow').jqxWindow('open');
    	  	   cpSearchContent('contactpersonsearch.jsp?clientdocno='+clientid+'&rowindex='+rowindex+'&type='+type); 
    	  	         	 }
    		 else{
    			 }
    		 }
    	          	 
    	function cpSearchContent(url) {
    		 //alert(url);
    	 	 $.get(url).done(function (data) {
    				 //alert(data);
    		$('#cpinfowindow').jqxWindow('setContent', data);

    	               	}); 
    	     	}


function funFocus()
{
	//document.getElementById("txtenquiry").focus();
		
}

function funReadOnly(){
	
	 $('#frmjobcontract input').attr('readonly', true);
	 $('#frmjobcontract input').attr('disabled', true);
	 $('#frmjobcontract select').attr('disabled', true);
	 $('#date').jqxDateTimeInput({ disabled: true});
	 $('#stdate').jqxDateTimeInput({ disabled: true});
	 $('#enddate').jqxDateTimeInput({ disabled: true});
	 $('#wstdate').jqxDateTimeInput({ disabled: true});
	 $('#wenddate').jqxDateTimeInput({ disabled: true});
	 $('#finsdate').jqxDateTimeInput({ disabled: true});
	 $('#serdate').jqxDateTimeInput({ disabled: true});
	  $("#serviceGrid").jqxGrid({ disabled: true});
	 $("#servscGrid").jqxGrid({ disabled: true});
	 $("#paymentGrid").jqxGrid({ disabled: true});
	 $("#siteGrid").jqxGrid({ disabled: true});
	 $('#btnvaluechange').hide();
	 $('#btnsearch').hide();
	 $('#chkinv').hide();
	 $('#chklblinv').hide();
	 $('#txtprogperiod').attr('readonly', true);
	  $('#txtprogper').attr('readonly', true);
	 if(modes=="view")
		{
		
		document.getElementById("formdet").innerText=window.parent.formName.value+" ("+window.parent.formCode.value.trim()+")";
		document.getElementById("formdetail").value=window.parent.formName.value;
		document.getElementById("formdetailcode").value=window.parent.formCode.value.trim();
		
		 $('#docno').attr('disabled', false);
		 $('#mode').attr('disabled', false);
		 $('#hidbrhid').attr('disabled', false);
		
		document.getElementById("docno").value=mastertrno;
		document.getElementById("mode").value=modes;
		window.parent.branchid.value=brhidview;
		setapprbrch(brhidview);
		 var names = [];
		$("form").each(function() {
		  //alert(this.id);
		   names.push(this.id);
		}); 
		var form=names[0];
		   document.forms[form].submit(); 
		
		   $('#docno').attr('disabled', false);
			 $('#mode').attr('disabled', false);
			 $('#hidbrhid').attr('disabled', false);
		}
}

function funRemoveReadOnly(){
	
	 $('#frmjobcontract input').attr('disabled', false);
	 $('#frmjobcontract input').attr('readonly', false);
	 $('#frmjobcontract select').attr('disabled', false);
	 funsercheck();
	 $('#chkinv').hide();
	 $('#chklblinv').hide();
	 $('#temp1').attr('disabled', true);
	 $('#temp2').attr('disabled', true);
	 $('#rrefno').attr('disabled', true);
	 $('#txtclient').attr('readonly', true);
	 $('#txtclientdet').attr('readonly', true);
	 $('#txtmob1').attr('readonly', true);
	 $('#txtmob2').attr('readonly', true);
	 $('#txtemail').attr('readonly', true);
	 $('#rrefno').attr('readonly', true);
	 $('#txtcontact').attr('readonly', true);
	 $('#docno').attr('readonly', true);
	 $('#isproformainv').val(0);
	 $("#editval").val(0);
	 $('#date').jqxDateTimeInput({ disabled: false});
	 $('#stdate').jqxDateTimeInput({ disabled: false});
	 $('#enddate').jqxDateTimeInput({ disabled: false});
	 $('#wstdate').jqxDateTimeInput({ disabled: false});
	 $('#wenddate').jqxDateTimeInput({ disabled: false});
	 $('#finsdate').jqxDateTimeInput({ disabled: false});
	 $('#serdate').jqxDateTimeInput({ disabled: false});
	 $("#serviceGrid").jqxGrid({ disabled: false});
	 $("#servscGrid").jqxGrid({ disabled: false});
	 $("#paymentGrid").jqxGrid({ disabled: false});
	 $("#siteGrid").jqxGrid({ disabled: false});
	 funcmbprog();
	 refChange();
	 var islegaldoc=$("#islegaldoc").val();
		if(islegaldoc>0){
			document.getElementById("chklegaldoc").checked=true;
			legChange();
		}
		if($("#mode").val()=="A"){
			$('#date').jqxDateTimeInput('setDate', new Date());
			
			 $('#stdate').jqxDateTimeInput('setDate', new Date());
			 $('#enddate').jqxDateTimeInput('setDate', new Date());
			 
			 $('#finsdate').jqxDateTimeInput('setDate', new Date());
			 $('#serdate').jqxDateTimeInput('setDate', new Date());
			 
			 $('#wstdate').jqxDateTimeInput('setDate', new Date());
			 $('#wenddate').jqxDateTimeInput('setDate', new Date());
			 
			
			$("#installments").val(0);
			$("#paydueafter").val(0);
			$("#srvcinterval").val(0);
			$("#serdueafter").val(0);
			$("#txttaxper").val(0);
			funRoundAmt(0,"txtcntrval");
			$("#salesincentive").val(0);
			$("#incentive").val(0);
			$("#serviceGrid").jqxGrid('clear');
			$("#serviceGrid").jqxGrid('addrow', null, {});
			$("#servscGrid").jqxGrid('clear');
			$("#servscGrid").jqxGrid('addrow', null, {});
			$("#paymentGrid").jqxGrid('clear');
			$("#paymentGrid").jqxGrid('addrow', null, {});
			$("#siteGrid").jqxGrid('clear');
			$("#siteGrid").jqxGrid('addrow', null, {});
		}
		else if($("#mode").val()=="E"){
			funsercheck();
			 $('#btnvaluechange').show();
			 $("#serviceGrid").jqxGrid({ disabled: true});
			 $("#servscGrid").jqxGrid({ disabled: true});
			 $("#paymentGrid").jqxGrid({ disabled: true});
			 $("#siteGrid").jqxGrid({ disabled: true});
			 var chkserv=$("#chkserv").val();
			 if(chkserv>0){
					$('#chkserv').attr('disabled', true);
			
				}
		}
	
}

function funwarningopen(){
	
	
	if($("#mode").val()=="E"){
	
	   $.messager.confirm('Confirm', 'Transaction Will Affect Already Inserted Values.', function(r){
	       if (r){
	        
	           $("#serviceGrid").jqxGrid({ disabled: false});
				 $("#servscGrid").jqxGrid({ disabled: false});
				 $("#paymentGrid").jqxGrid({ disabled: false});
				 $("#siteGrid").jqxGrid({ disabled: false});
				 $("#editval").val(1);
	       }
	       else{
	           
	           $("#serviceGrid").jqxGrid({ disabled: true});
				 $("#servscGrid").jqxGrid({ disabled: true});
				 $("#paymentGrid").jqxGrid({ disabled: true});
				 $("#siteGrid").jqxGrid({ disabled: true});
				 $("#editval").val(0);
				 
	       }
	      });
	   
	}
	   
	   }

function funpay(){
	
	var startdate=$("#finsdate").val();
	var enddate=$("#enddate").val();
	var amount=$("#txtcntrval").val();
	var instno=$("#installments").val();
	var cmbpaytype=$("#cmbpaytype").val();
	var paydueafter=$("#paydueafter").val();
	document.getElementById("cvalchnge").value=0;
	if($("#mode").val()=="E"){
		$("#editval").val(1);
	}
	
	if($('#finsdate').jqxDateTimeInput('getDate')!=null){
		
 		var date=new Date($('#finsdate').jqxDateTimeInput('getDate'));
 		var status=checkInstdate(date);//Checking Future date.Written on 11-07-2016	
 		
 		if(status){
 			document.getElementById("errormsg").innerText="";
 			 $("#paydiv").load("paymentGrid.jsp?startdate="+startdate+"&enddate="+enddate+"&amount="+amount+"&instno="+instno+"&cmbpaytype="+cmbpaytype+"&paydueafter="+paydueafter+"&gridload=1");
 		}
 		
 	}
	
	 //$("#paydiv").load("paymentGrid.jsp?startdate="+startdate+"&enddate="+enddate+"&amount="+amount+"&instno="+instno+"&cmbpaytype="+cmbpaytype+"&paydueafter="+paydueafter+"&gridload=1"); 
}


function funscheduler(){
	var startdate=$("#serdate").val();
	var enddate=$("#enddate").val();
	var amount=0;
	var instno=$("#srvcinterval").val();
	var cmbpaytype=$("#cmbsrvctype").val();
	var serdueafter=$("#serdueafter").val();
	
	if($('#serdate').jqxDateTimeInput('getDate')!=null){
 		var date=new Date($('#serdate').jqxDateTimeInput('getDate'));
 		var status=checkScheddate(date);//Checking Future date.Written on 11-07-2016	
 		
 		if(status){
 			$("#schediv").load("serviceScheduleGrid.jsp?startdate="+startdate+"&enddate="+enddate+"&amount="+amount+"&instno="+instno+"&cmbpaytype="+cmbpaytype+"&serdueafter="+serdueafter+"&gridload=1");
 		}
 		
 	}
	
	 //$("#schediv").load("serviceScheduleGrid.jsp?startdate="+startdate+"&enddate="+enddate+"&amount="+amount+"&instno="+instno+"&cmbpaytype="+cmbpaytype+"&serdueafter="+serdueafter+"&gridload=1");
}



function funNotify(){
	
	if($('#cmbprog').val()==2)
	{
		if($('#txtprogperiod').val()=="" || $('#txtprogper').val()=="" || $('#txtprogperiod').val()==0 || $('#txtprogper').val()==0){  
	document.getElementById("errormsg").innerText="Progressive With Retention , Period And Percentage Mandatory ";
	return 0;
		}
	}
	
	if($('#clientid').val()== "")
	{
	document.getElementById("errormsg").innerText="select Client";
	return 0;
	}
	$('#chkserv').attr('disabled', false);
	/* if($('#cpersonid').val()== "")
	{
	document.getElementById("errormsg").innerText="select Contact Person";
	return 0;
	} */
	
	if($('#txtcntrval').val()== "")
	{
	document.getElementById("errormsg").innerText="Enter contract value";
	return 0;
	}
	
	   var rowspay = $("#paymentGrid").jqxGrid('getrows');
	   var gridamount=0.00,lastamount=0.00;
	   for(var n=0 ; n < rowspay.length ; n++){
	   var chk=rowspay[n].amount;
	   var chk1=rowspay[n].runtotal;
		   if(typeof(chk) != "undefined" && typeof(chk) != "NaN" && chk != ""){
			gridamount=(parseFloat(gridamount)+parseFloat(rowspay[n].amount));   
		   }
		   if(typeof(chk1) != "undefined" && typeof(chk1) != "NaN" && chk1 != ""){
			   lastamount=parseFloat(rowspay[n].runtotal);        
		   }
	   }
	   contractval=document.getElementById("txtcntrval").value;
	   console.log(parseFloat(contractval).toFixed(2)+"==="+parseFloat(gridamount).toFixed(2)+"==="+lastamount);      
	   if($('#cmbprog').val()==""){      
		 if(parseFloat(contractval).toFixed(2) != parseFloat(lastamount).toFixed(2)){   
		    document.getElementById("errormsg").innerText="Payment Details Total and Contract value should be same";
		    return 0;
		   }
      }
	 var rows1 = $("#paymentGrid").jqxGrid('getrows');
     var rows2 = $("#serviceGrid").jqxGrid('getrows');
	 var rows3 = $("#siteGrid").jqxGrid('getrows');
	 var rows4 = $("#servscGrid").jqxGrid('getrows');
	 var cvalchnge=$("#cvalchnge").val();
	 var msgid=0;
	 /* if(cvalchnge>0){
		 document.getElementById("errormsg").innerText="Contract value Changed,Payment data should be changed";
			return 0;
	 } */
	 $('#paymentlen').val(rows1.length);
	 $('#servicelen').val(rows2.length);
	 $('#sitelen').val(rows3.length);
	 $('#serviceSchedulelen').val(rows4.length);
	
	 for(var i=0 ; i < rows3.length ; i++){
			
		    newTextBox = $(document.createElement("input"))
		       .attr("type", "dil")
		       .attr("id", "site"+i)
		       .attr("name", "site"+i)
		       .attr("hidden", "true"); 
if($('#siteGrid').jqxGrid('iscolumnvisible', 'serviceteam'))
			 {
		    if((rows3[i].site!="undefined" && rows3[i].site!=null && rows3[i].site!="" ))
	    	{
	    	if(rows3[i].steamid=="undefined" || rows3[i].steamid==null || rows3[i].steamid=="")
	    		{
	    	msgid++;
	    	break;
	    		}
	    	}
}
		   newTextBox.val(rows3[i].site+" :: "+rows3[i].areaid+" :: "+rows3[i].siteadd+" :: "+rows3[i].contid+" :: "+rows3[i].rowno+" :: "+rows3[i].steamid+" :: ");
		   newTextBox.appendTo('form');
		  
				}	 
if($('#siteGrid').jqxGrid('iscolumnvisible', 'serviceteam'))
			 {
	 
	 if(msgid>0)
	 {
	 document.getElementById("errormsg").innerText="Service Team Is Mandatory In Site Details";
		return 0;
	 }
	 }
	   for(var i=0 ; i < rows1.length ; i++){
			
		   var dueafterser="";
		   
		    newTextBox = $(document.createElement("input"))
		       .attr("type", "dil")
		       .attr("id", "pay"+i)
		       .attr("name", "pay"+i)
		       .attr("hidden", "true"); 
		    
		    if (rows1[i].terms =="LEGAL DOCUMENT") {
		    	dueafterser=99;
			}
		    if (rows1[i].terms =="SERVICE") {
		    	dueafterser=rows1[i].service;
			}
		    if (rows1[i].terms =="PROFORMA INVOICE") {
		    	dueafterser=98;
		    	document.getElementById("isproformainv").value=1;
			}
		 
		   newTextBox.val(rows1[i].duedate+" :: "+rows1[i].amount+" :: "+rows1[i].runtotal+" :: "+rows1[i].desc1+" :: "+rows1[i].terms+" :: "+dueafterser+" :: "+rows1[i].service+" :: "+rows1[i].rowno+" :: ");
		
		   newTextBox.appendTo('form');
		  
				}
	   
	  
		
	   for(var i=0 ; i < rows2.length ; i++){
			
		    newTextBox = $(document.createElement("input"))
		       .attr("type", "dil")
		       .attr("id", "service"+i)
		       .attr("name", "service"+i)
		       .attr("hidden", "true"); 
		    
		   
		    
		   newTextBox.val(rows2[i].stypeid+" :: "+rows2[i].item+" :: "+rows2[i].qty+" :: "+rows2[i].amount+" :: "+rows2[i].total+" :: "+rows2[i].desc1+" :: "+rows2[i].trno+" :: "+rows2[i].srno+" :: ");
		
		   newTextBox.appendTo('form');
		  
				}
			
     for(var i=0 ; i < rows4.length ; i++){
		   
		   var dis=0;
		   var valu=0;
		   var chkserv=document.getElementById("chkserv").value;
			 
			  newTextBox = $(document.createElement("input"))
		       .attr("type", "dil")
		       .attr("id", "sersc"+i)
		       .attr("name", "sersc"+i)
		       .attr("hidden", "true");
			  
			  
			  if (rows4[i].priority == true) {
					dis=1;
				}
			  
			  
			  var d=new Date(rows4[i].pltime);
			  var tempstarttime=d.getHours()+":"+(d.getMinutes()<10?'0':'') + d.getMinutes();
			  
			  
			  if(chkserv==0){
				  
		      newTextBox.val(rows4[i].pldate+" :: "+tempstarttime+" :: "+dis+" :: "+rows4[i].trno+" :: ");
		   
			  }
			  
			  else if(chkserv==1){
				  
				  newTextBox.val(rows4[i].pldate+" :: "+tempstarttime+" :: "+dis+" :: "+rows4[i].serviceid+"::"+rows4[i].siteid+"::"+rows4[i].value+"::"+rows4[i].trno+" :: ");
			  } 
		   
		   newTextBox.appendTo('form');
		  
				}
		
	
		return 1;
} 

function refChange(){
	 var reftype=$('#cmbreftype').val();

	 if(reftype=='DIR'){
		  
		  $('#rrefno').attr('disabled', true);
	 }
	 else{
		  
		  $('#rrefno').attr('disabled', false);
	 }
	 
	}
	
function legChange(){
	 if(document.getElementById("chklegaldoc").checked){
		 
		 document.getElementById("islegaldoc").value=1;
		 $('#temp1').attr('disabled', false);
		 $('#temp2').attr('disabled', false);
		 $('#temp2').attr('readonly', true);
	 }
	 else{
		 document.getElementById("islegaldoc").value=0;
		 $('#temp1').attr('disabled', true);
		 $('#temp2').attr('disabled', true);
	 }
	 
	}
	function setValues(){
		var chkincltax=$("#chkincltax").val();
		if(chkincltax>0){
			document.getElementById("chkincltax").checked=true;
		}   
		var docno=$("#masterdoc_no").val();
		var islegaldoc=$("#islegaldoc").val();
		var chkserv=$("#chkserv").val();
		if(islegaldoc>0){
			document.getElementById("chklegaldoc").checked=true;
			legChange();
		}
		if(chkserv>0){
			document.getElementById("chkserv").checked=true;
			$('#chkserv').attr('disabled', true);
			var chkinv=$("#chkinv").val();
			if(chkinv>0){
				document.getElementById("chkinv").checked=true;
			}
			
			funsercheck();
		}
		if($('#msg').val()!=""){
			   $.messager.alert('Message',$('#msg').val());
			  }
		
		if($('#hidcmbsrvctype').val()!="")
		  {  
		  $('#cmbsrvctype').val($('#hidcmbsrvctype').val());
		  }
		
		if($('#hidcmbpaytype').val()!="")
		  {  
		  $('#cmbpaytype').val($('#hidcmbpaytype').val());
		  }
		
		if($('#hidcmbreftype').val()!="")
		  {  
		  $('#cmbreftype').val($('#hidcmbreftype').val());
		  }
		if($('#hidcmbprog').val()!="")
		  {  
		  $('#cmbprog').val($('#hidcmbprog').val());
		 // funcmbprog();
		  }
		if(docno>0){
			refChange();
			 $("#schediv").load("serviceScheduleGrid.jsp?docno="+docno);
			 $("#sitediv").load("siteGrid.jsp?docno="+docno);
			 $("#paydiv").load("paymentGrid.jsp?docno="+docno);
			 $("#serdiv").load("serviceGrid.jsp?docno="+docno);
		}
		
		 funSetlabel();funchkforedit();
	}
	function funchkforedit()
    {
		var x = new XMLHttpRequest();
		x.onreadystatechange = function() {
			if (x.readyState == 4 && x.status == 200) {
				var items = x.responseText.trim();	
				if(parseInt(items)>0)
				{
					$("#btnEdit").attr('disabled', true );
					$("#btnDelete").attr('disabled', true ); 
					
				}
				else
				{
				}
			} else {
			}
		}
		x.open("GET", "linkchk.jsp?docno="+document.getElementById("masterdoc_no").value, true);
		x.send();
	}
	function funSearchLoad(){
		 changeContent('Mastersearch.jsp'); 
	} 
	function cvalChnge(){
		if($("#mode").val()=="E"){
			
			document.getElementById("cvalchnge").value=1;
			$("#editval").val(1);
			document.getElementById("errormsg").innerText="Contract value Changed,Payment details should be changed";
			 
			
		}
	}
	
	
	function funPrintBtn() {
		
		if (($("#mode").val() == "view") && $("#docno").val()!="") {

			 $("#docno").prop("disabled", false);
			 $("#masterdoc_no").prop("disabled", false);
			 $("#formdetailcode").prop("disabled", false);
			 
			var docno=$('#docno').val();
	 		var trno=$('#masterdoc_no').val();
	 		var dtype=$('#formdetailcode').val();
	 		var brhid=<%= session.getAttribute("BRANCHID").toString()%>
	 		var url=document.URL;
	 		var reurl=url.split("com/"); 
	     
	 		var win= window.open(reurl[0]+"printJobContract?docno="+docno+"&brhid="+brhid+"&trno="+trno+"&dtype="+dtype+"&header=1","_blank","top=250,left=310,Width=800,Height=800,location=no,scrollbars=no,toolbar=yes");
	 		
	   
	     }
	    else {
			$.messager.alert('Message','Select a Document....!','warning');
			return;
		}
}
	 function getsjobtype() {
			var x = new XMLHttpRequest();
			x.onreadystatechange = function() {
				if (x.readyState == 4 && x.status == 200) {
					var items = x.responseText;
					items = items.split('####');
					
					var srno  = items[0].split(",");
					var process = items[1].split(",");
					var optionsbranch = '<option value="" selected>-- Select -- </option>';
					for (var i = 0; i < process.length; i++) {
						optionsbranch += '<option  value="' + srno[i].trim()+'">'
						+ process[i] + '</option>';
					}
					$("select#cmbprocess").html(optionsbranch);
					
					 if ($('#hidcmbprocess').val()>0) {
							$('#cmbprocess').val($('#hidcmbprocess').val());
							} 
				} else {}
			}
			x.open("GET","getsjobtype.jsp", true);
			x.send();
		}
	 function schSearchContent(url) {
				 $.get(url).done(function (data) {
			$('#schserchinfowindow').jqxWindow('setContent', data);
			            	}); 
			 	}
	 function schSearch(){
		  
		  
		  
		  $('#schserchinfowindow').jqxWindow('open');
		  schSearchContent('scheduleSearch.jsp');
	  }
	  
	  function funsercheck(){
		  
		 var chkserv=document.getElementById("chkserv").value;
		  if(chkserv==1){
		  $('#btnsearch').show();
		  $('#chkinv').show();
		  $('#chklblinv').show();
		  $('#srvcinterval').attr('disabled', true);
		  $('#serdueafter').attr('disabled', true);
		  $('#cmbsrvctype').attr('disabled', true);
		  $('#btnSchAdd').hide();
		  $('#servscGrid').jqxGrid('showcolumn','site');
		  $('#servscGrid').jqxGrid('showcolumn','service');
		  $('#servscGrid').jqxGrid('showcolumn','value');
		  $('#servscGrid').jqxGrid('showcolumn','site');
		  $('#servscGrid').jqxGrid('showcolumn','days');
		  
		  }
		  else{
			  $('#chkinv').hide();
			  $('#chklblinv').hide();
			  
			  $('#btnSchAdd').show();
			  $('#srvcinterval').attr('disabled', false);
			  $('#serdueafter').attr('disabled', false);
			  $('#cmbsrvctype').attr('disabled', false);
			  $('#btnsearch').hide();
			  $('#servscGrid').jqxGrid('hidecolumn','service');
			  $('#servscGrid').jqxGrid('hidecolumn','value');
			  $('#servscGrid').jqxGrid('hidecolumn','days');
		  }
		  
	  }
	  function funcmbprog()
		{
			var cmbprog=document.getElementById("cmbprog").value;
			
		 if(cmbprog==2)
			{
			 $('#txtprogperiod').attr('readonly', false);
			  $('#txtprogper').attr('readonly', false);
			}
		 else{
			 $('#txtprogperiod').val(0);
			  $('#txtprogper').val(0);
			 $('#txtprogperiod').attr('readonly', true);
			  $('#txtprogper').attr('readonly', true);
		 }
		}
function chkprogressive()
		    {
		     
			   var x=new XMLHttpRequest();
			   x.onreadystatechange=function(){
			   if (x.readyState==4 && x.status==200)
			    {
			      var items= x.responseText.trim();
			     
			      if(parseInt(items)>0)
			       {
			        
			        
			        $('#prog').show();
			       
			        
			        }
			          else
			      {
			          $('#prog').hide();
			         
			        
			      
			      }
			      
			       }}
			   x.open("GET","checkprogressive.jsp?",true);
				x.send();
			 
			      
			       
		    	
		    }   
		  
</script>
</head>

<body onLoad="setValues();funcmbprog();getsjobtype();chkprogressive();">
    <div id="mainBG" class="homeContent" data-type="background"> 
    
      <form id="frmjobcontract" action="saveJobcontract" method="post" autocomplete="off">
        <jsp:include page="../../../../header.jsp" />
        
        <div class="modern-ui hidden-scrollbar">

            <div class="middle-panel">
                <span class="middle-panel-title">General Info</span>
                <div class="field-row">
                    <label class="lbl-right" style="width:80px;">Date</label>
                    <div style="width: 125px;">
                        <div id="date" name="date" value='<s:property value="date" />'></div>
                    </div>
                    
                    <label class="lbl-right" style="width:80px;">Ref No</label>
                    <input type="text" name="txtrefno" id="txtrefno" style="width:150px;" value='<s:property value="txtrefno" />'>
                    
                    <label class="lbl-right" style="width:100px; margin-left:auto;">Doc No</label>
                    <input type="text" name="docno" id="docno" style="width:120px;" tabindex="-1" readonly value='<s:property value="docno" />'>
                </div>
            </div>

            <div class="flex-row-container">
                <div class="col-50">
                    <div class="middle-panel" style="flex:1;">
                        <span class="middle-panel-title">Client Details</span>
                        
                        <div class="field-row">
                            <label class="lbl-right" style="width:100px;">Client</label>
                            <input type="text" name="txtclient" id="txtclient" style="width:150px;" placeholder="Press F3" onKeyDown="getclinfo(event);" value='<s:property value="txtclient" />'>
                            
                            <label class="lbl-right" style="width:100px;">Client Details</label>
                            <input type="text" name="txtclientdet" id="txtclientdet" style="flex:1;" tabindex="-1" readonly value='<s:property value="txtclientdet" />'>
                        </div>
                        
                        <div class="field-row">
                            <label class="lbl-right" style="width:100px;">Tele.</label>
                            <input type="text" name="txtmob1" id="txtmob1" style="width:150px;" value='<s:property value="txtmob1" />'>
                            
                            <label class="lbl-right" style="width:100px;">Mobile</label>
                            <input type="text" name="txtmob2" id="txtmob2" style="width:150px;" value='<s:property value="txtmob2" />'>
                        </div>
                        
                        <div class="field-row">
                            <label class="lbl-right" style="width:100px;">Sales Man</label>
                            <input type="text" name="txtsalman" id="txtsalman" style="width:150px;" value='<s:property value="txtsalman" />'>
                            
                            <label class="lbl-right" style="width:100px;">Mail</label>
                            <input type="text" name="txtemail" id="txtemail" style="flex:1;" value='<s:property value="txtemail" />'>
                        </div>
                        
                        <div class="field-row">
                            <label class="lbl-right" style="width:100px;">Contact Person</label>
                            <input type="text" name="txtcontact" id="txtcontact" style="width:150px;" placeholder="Press F3" onKeyDown="getcontact(event,0);" value='<s:property value="txtcontact" />'>
                        </div>
                    </div>
                </div>
                
                <div class="col-50">
                    <div class="middle-panel" style="flex:1;">
                        <span class="middle-panel-title">Contract Info</span>
                        
                        <div class="field-row">
                            <label class="lbl-right" style="width:100px;">Ref Type</label>
                            <select id="cmbreftype" name="cmbreftype" style="width:120px;" onchange="refChange();" value='<s:property value="cmbreftype"/>'>
                                <option value="DIR">DIR</option>
                                <option value="SQOT">SQOT</option>
                                <option value="ENQ">ENQ</option>
                            </select>
                            
                            <input type="text" id="rrefno" name="rrefno" style="width:120px;" placeholder="Press F3" onKeyDown="getEnquiry(event);" value='<s:property value="rrefno"/>'/>
                            
                            <label class="lbl-right" style="width:50px;">Type</label>
                            <select name="cmbprocess" id="cmbprocess" style="flex:1;" onchange="funtxtenable(value);" value='<s:property value="cmbprocess"/>'></select>
                            <input type="hidden" name="hidcmbprocess" id="hidcmbprocess" value='<s:property value="hidcmbprocess"/>' /> 
                        </div>
                        
                        <div class="field-row">
                            <label class="lbl-right" style="width:100px;">Budget</label>
                            <input type="text" id="txtbudget" name="txtbudget" style="width:120px; text-align: right;" value='<s:property value="txtbudget"/>'/>
                            
                            <label class="lbl-right" style="width:100px;">Contract Value</label>
                            <input type="text" id="txtcntrval" name="txtcntrval" style="width:120px; text-align: right;" onKeyUp="cvalChnge();" onchange="funwarningopen();" onblur="funRoundAmt(this.value,this.id);" value='<s:property value="txtcntrval"/>'/>
                        </div>
                        
                        <div class="field-row">
                            <label class="lbl-right" style="width:100px;">Tax Per</label>
                            <input type="text" id="txttaxper" name="txttaxper" style="width:120px; text-align:right;" value='<s:property value="txttaxper"/>'/>
                            
                            <label class="lbl-right" style="width:100px;">Incentive</label>
                            <input type="text" name="incentive" id="incentive" style="width:120px; text-align:right;" value='<s:property value="incentive"/>'>
                        </div>
                        
                        <div class="field-row">
                            <label class="lbl-right" style="width:100px;">Sales Incentive</label>
                            <input type="text" name="salesincentive" id="salesincentive" style="width:120px; text-align:right;" value='<s:property value="salesincentive"/>'>
                            
                            <div class="chk-wrapper" style="margin-left:auto;">
                                <label for="chkincltax" style="margin:0; cursor:pointer;">Incl Tax</label>
                                <input type="checkbox" name="chkincltax" id="chkincltax" style="margin:0;" value='<s:property value="chkincltax" />' onclick="$(this).attr('value', this.checked ? 1 : 0);">
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <div class="middle-panel">
                <span class="middle-panel-title">Dates & Legal Information</span>
                
                <div class="field-row">
                    <label class="lbl-right" style="width:100px;">St.Date</label>
                    <div style="width: 125px;">
                        <div id="stdate" name="stdate" value='<s:property value="stdate" />'></div>
                    </div>
                    
                    <label class="lbl-right" style="width:100px;">End Date</label>
                    <div style="width: 125px;">
                        <div id="enddate" name="enddate" value='<s:property value="enddate" />'></div>
                    </div>
                    
                    <label class="lbl-right" style="width:150px;">Warranty Period From</label>
                    <div style="width: 125px;">
                        <div id="wstdate" name="wstdate" value='<s:property value="wstdate" />'></div>
                    </div>
                    
                    <label class="lbl-right" style="width:30px;">To</label>
                    <div style="width: 125px;">
                        <div id="wenddate" name="wenddate" value='<s:property value="wenddate" />'></div>
                    </div>
                </div>
                
                <div class="field-row">
                    <div class="chk-wrapper" style="width:100px; justify-content: flex-end; padding-right:5px;">
                        <input type="checkbox" name="chklegaldoc" id="chklegaldoc" onchange="legChange();" style="margin:0;">
                        <label for="chklegaldoc" style="margin:0; cursor:pointer;">Legal Fee</label>
                    </div>
                    
                    <input type="text" id="temp1" name="temp1" style="width:125px;" value='<s:property value="temp1"/>'/>     
                    <input type="text" id="temp2" name="temp2" style="width:125px;" value='<s:property value="temp2"/>' />
                    
                    <button class="myButton" style="margin-left:15px;" type="button" id="btnvaluechange" name="btnvaluechange" onclick="funwarningopen();">Value Change</button>
                </div>
            </div>

            <div class="middle-panel">
                <span class="middle-panel-title">Site Details</span>
                <div id="sitediv" class="grid-container">
                    <jsp:include page="siteGrid.jsp"></jsp:include>
                </div>
            </div>

            <div class="middle-panel">
                <span class="middle-panel-title">Payment Details</span>
                
                <div class="field-row">
                    <label class="lbl-right" style="width:100px;">Installments</label>
                    <input type="text" name="installments" id="installments" style="width:100px;" value='<s:property value="installments"/>'>
                    
                    <label class="lbl-right" style="width:100px;">Due After</label>
                    <input type="text" name="paydueafter" id="paydueafter" style="width:100px;" value='<s:property value="paydueafter"/>'>
                    
                    <label class="lbl-right" style="width:100px;">Frequency</label>
                    <select name="cmbpaytype" id="cmbpaytype" style="width:120px;">
                        <option value="1">DAYS</option>
                        <option value="2">MONTHS</option>
                        <option value="3">YEAR</option>
                    </select>
                    
                    <label class="lbl-right" style="width:100px;">First Inst.On</label>
                    <div style="width: 125px;">
                        <div id="finsdate" name="finsdate" value='<s:property value="finsdate" />'></div>
                    </div>
                    
                    <button class="myButton" type="button" id="btnAdd" name="btnAdd" onclick="funpay();" style="margin-left:15px;">Fill</button>
                </div>
                
                <div class="field-row" id="prog" style="display:none;">
                    <label class="lbl-right" style="width:100px;">Terms</label>
                    <select id="cmbprog" name="cmbprog" style="width:200px;" onchange="funcmbprog();" value='<s:property value="cmbprog"/>'>
                        <option value="">--Select--</option>
                        <option value="1">PROGRESSIVE</option>
                        <option value="2">PROGRESSIVE WITH RETENTION</option>
                    </select>
                    
                    <label class="lbl-right" style="width:120px;">Period(in months)</label>
                    <input type="text" id="txtprogperiod" name="txtprogperiod" style="width:100px;" value='<s:property value="txtprogperiod"/>'/>
                    
                    <label class="lbl-right" style="width:100px;">Percentage</label>
                    <input type="text" id="txtprogper" name="txtprogper" style="width:100px;" value='<s:property value="txtprogper"/>'/>
                </div>
                
                <div id="paydiv" class="grid-container">
                    <jsp:include page="paymentGrid.jsp"></jsp:include>
                </div>
            </div>
            
            <div class="middle-panel">
                <span class="middle-panel-title">Service Details</span>
                <div class="field-row">
                    <label class="lbl-right" style="width:120px;">Special Instruction</label>
                    <input type="text" id="txtsplinstruct" name="txtsplinstruct" style="flex:1;" value='<s:property value="txtsplinstruct"/>'/>
                </div>
                
                <div id="serdiv" class="grid-container">
                    <jsp:include page="serviceGrid.jsp"></jsp:include>
                </div>
            </div>
            
            <div class="middle-panel">
                <span class="middle-panel-title">Service Scheduler</span>
                
                <div class="field-row">
                    <div class="chk-wrapper">
                        <label for="chkserv" style="margin:0; cursor:pointer;">Service</label>
                        <input type="checkbox" name="chkserv" id="chkserv" style="margin:0;" value='<s:property value="chkserv" />' onclick="$(this).attr('value', this.checked ? 1 : 0);funsercheck();">
                    </div>
                    
                    <div class="chk-wrapper" style="margin-left: 10px;">
                        <label id="chklblinv" for="chkinv" style="margin:0; cursor:pointer;">To Be Invoiced</label>
                        <input type="checkbox" name="chkinv" id="chkinv" style="margin:0;" value='<s:property value="chkinv" />' onclick="$(this).attr('value', this.checked ? 1 : 0);">
                    </div>
                    
                    <button class="myButton" type="button" id="btnsearch" name="btnsearch" onclick="schSearch();" style="margin-left:10px;">Search</button>
                    
                    <label class="lbl-right" style="width:60px;">Interval</label>
                    <input type="text" name="srvcinterval" id="srvcinterval" style="width:80px;" value='<s:property value="srvcinterval"/>'>
                    
                    <label class="lbl-right" style="width:80px;">Due After</label>
                    <input type="text" name="serdueafter" id="serdueafter" style="width:80px;" value='<s:property value="serdueafter"/>'>
                    
                    <label class="lbl-right" style="width:80px;">Frequency</label>
                    <select name="cmbsrvctype" id="cmbsrvctype" style="width:100px;">
                        <option value="1">DAYS</option>
                        <option value="2">MONTHS</option>
                        <option value="3">YEAR</option>
                    </select>
                    
                    <label class="lbl-right" style="width:120px;">Service Start On</label>
                    <div style="width: 125px;">
                        <div id="serdate" name="serdate" value='<s:property value="serdate" />'></div>
                    </div>
                    
                    <button class="myButton" type="button" id="btnSchAdd" name="btnSchAdd" onclick="funscheduler();" style="margin-left:auto;">Fill</button>
                </div>
                
                <div id="schediv" class="grid-container">
                    <jsp:include page="serviceScheduleGrid.jsp"></jsp:include>
                </div>
            </div>
            
            <div style="display:none;">
                <input type="hidden" id="mode" name="mode" value='<s:property value="mode"/>'/>
                <input type="hidden" id="msg" name="msg" value='<s:property value="msg"/>'/>
                <input type="hidden" id="deleted" name="deleted" value='<s:property value="deleted"/>'/>
                <input type="hidden" id="islegaldoc" name="islegaldoc" value='<s:property value="islegaldoc"/>'/>
                <input type="hidden" id="masterdoc_no" name="masterdoc_no" value='<s:property value="masterdoc_no"/>'/>
                <input type="hidden" id="refmasterdoc_no" name="refmasterdoc_no" value='<s:property value="refmasterdoc_no"/>'/>
                <input type="hidden" id="cpersonid" name="cpersonid" value='<s:property value="cpersonid"/>'/>
                <input type="hidden" id="clientid" name="clientid" value='<s:property value="clientid"/>'/>
                <input type="hidden" id="salid" name="salid" value='<s:property value="salid"/>'/>
                <input type="hidden" id="hidcmbpaytype" name="hidcmbpaytype" value='<s:property value="hidcmbpaytype"/>'/>
                <input type="hidden" id="hidcmbsrvctype" name="hidcmbsrvctype" value='<s:property value="hidcmbsrvctype"/>'/>
                <input type="hidden" id="hidcmbreftype" name="hidcmbreftype" value='<s:property value="hidcmbreftype"/>'/>
                <input type="hidden" id="hidcmbprog" name="hidcmbprog" value='<s:property value="hidcmbprog"/>'/>
                <input type="hidden" id="isproformainv" name="isproformainv" value='<s:property value="isproformainv"/>'/>
                <input type="hidden" id="serviceSchedulelen" name="serviceSchedulelen" value='<s:property value="serviceSchedulelen"/>'/>
                <input type="hidden" id="servicelen" name="servicelen" value='<s:property value="servicelen"/>'/>
                <input type="hidden" id="paymentlen" name="paymentlen" value='<s:property value="paymentlen"/>'/>
                <input type="hidden" id="sitelen" name="sitelen" value='<s:property value="sitelen"/>'/>
                <input type="hidden" id="editval" name="editval" value='<s:property value="editval"/>'/>
                <input type="hidden" id="cvalchnge" name="cvalchnge" value='<s:property value="cvalchnge"/>'/>
                <input type="hidden" id="hidcontredit" name="hidcontredit" value='<s:property value="hidcontredit"/>'/>
                <input type="hidden" id="hidbrhid" name="hidbrhid" value='<s:property value="hidbrhid"/>'/>
            </div>

        </div>

        <div id="clientsearch1"><div></div></div>
        <div id="areainfowindow"><div></div></div>
        <div id="grpinfowindow"><div></div></div>
        <div id="teaminfowindow"><div></div></div>
        <div id="sertypefowindow"><div></div></div>
        <div id="cpinfowindow"><div></div></div>
        <div id="siteinfowindow"><div></div></div>
        <div id="schserchinfowindow"><div></div></div>
        <div id="serviceteamwindow"><div></div></div>
        
    </form>
    </div>     
</body>
</html>