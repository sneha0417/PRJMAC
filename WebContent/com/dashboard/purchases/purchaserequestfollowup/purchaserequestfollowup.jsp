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

/* Readonly / disabled look - NO BAN ICON */
input[readonly],
input:disabled,
select:disabled,
textarea[readonly],
textarea:disabled {
    background-color: #f3f6f9 !important;
    color: #555;
    cursor: default !important; /* Forces normal cursor instead of not-allowed */
}

/* jqx date/time containers */
.release-filter-table div[id^="date"],
.release-filter-table div[id^="fromdate"],
.release-filter-table div[id^="todate"] {
    width: 100%;
}

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
}
.btn-submit:hover:not(:disabled) { background: #0056b3; /* Darker Blue on Hover */ }
.btn-submit:disabled { background: #9ca3af; cursor: default !important; }
.btn-submit:active:not(:disabled) { transform: scale(0.98); }

.button-group {
    display: flex;
    flex-direction: column;
    gap: 10px;
    margin-top: 15px;
    justify-content: center;
}

/* Main Content Area (RIGHT SIDE) */
.main-content-area {
    flex: 1;
    height: 100vh;
    overflow-y: auto; /* Independent Main Content Scrollbar */
    background: #ffffff;
    padding: 15px;
    box-sizing: border-box;
}

.grid-container {
    margin-bottom: 20px;
}
</style>

<script type="text/javascript">

$(document).ready(function () {
	
	 $("body").prepend('<div id="overlay" class="ui-widget-overlay" style="z-index: 1; display: none;"></div>');
	 $("body").prepend("<div id='PleaseWait' style='display: none;position:absolute; z-index: 1;top:180px;right:550px;'><img src='../../../../icons/31load.gif'/></div>");

	 $('#Searchwindow').jqxWindow({ width: '50%', height: '62%',  maxHeight: '75%' ,maxWidth: '50%' , title: 'Search' ,position: { x: 150, y: 60 }, keyboardCloseKey: 27});
	 $('#Searchwindow').jqxWindow('close');
 
	 // Standardized to 100% width and 24px height
	 $("#date").jqxDateTimeInput({ width: '100%', height: '24px',formatString:"dd.MM.yyyy"});
	 
	 $('#docnosss').dblclick(function(){
	 	 $('#Searchwindow').jqxWindow('open');
	 	 SearchContent('mainsearch.jsp?');
	 });  
	  
});
 
function  funcleardata()
{
	document.getElementById("reqdocno").value="";
	document.getElementById("docnosss").value="";
    $('#docnosss').attr('placeholder', 'Press F3 TO Search'); 
}
	  
function getdetails(event){
	 var x= event.keyCode;
	
	 if(x==114){
	  $('#Searchwindow').jqxWindow('open');
	
	  SearchContent('mainsearch.jsp?');    }
	 else{
		 }
		 
	 }  
	  function SearchContent(url) {

        $.get(url).done(function (data) {

      $('#Searchwindow').jqxWindow('setContent', data);

	}); 
  	}
 
function funExportBtn(){
	JSONToCSVCon(datasex,'Purchase Request Followup Mater', true);
	JSONToCSVCon(datas11ex,'Purchase Request Followup Details', true);
	 }

 
 
function funreload(event)
{
	disitems(0);
	
	 var barchval = document.getElementById("cmbbranch").value;
		   
	 var fromdate="";
	 var todate="";
	 
	 var statusselect="";
	 
	 var reqdocno=$("#reqdocno").val();
	  $("#ordersubgrid").jqxGrid('clear');
	  $("#duedetailsgrid").jqxGrid('clear');
	   $("#overlay, #PleaseWait").show();
	  $("#listdiv").load("mainGrid.jsp?barchval="+barchval+"&fromdate="+fromdate+"&todate="+todate+"&statusselect="+statusselect+"&reqdocno="+reqdocno);
	
	}

 
function getinfo() {
	  var x = new XMLHttpRequest();
	x.onreadystatechange = function() {
		if (x.readyState == 4 && x.status == 200) {
			var items = x.responseText;
		//alert(items);
			items = items.split('####');
			
			var srno  = items[0].split(",");
			var process = items[1].split(",");
			var optionsbranch = '';
			for (var i = 0; i < process.length; i++) {
				optionsbranch += '<option value="' + srno[i].trim() + '">'
						+ process[i] + '</option>';
			}
			$("select#cmbinfo").html(optionsbranch);
			
		} else {
			//alert("Error");
		}
	}
	x.open("GET","getinfo.jsp", true);
	x.send(); 
}
 
 
function funupdate()
{
	var docno = document.getElementById("masterdocno").value;
	  
	 var branchids = document.getElementById("brhid").value;
	 var remarks = document.getElementById("remarks").value;
	 var cmbinfo = document.getElementById("cmbinfo").value;
      
	 var folldate =$('#date').val();
 
	 
	 
	
	var x=new XMLHttpRequest();
	x.onreadystatechange=function(){
	if (x.readyState==4 && x.status==200)
		{
		
 	 		
			var items=x.responseText;
			if(parseInt(items)>0)
				 {
				 
				  $.messager.alert('Message', ' Successfully Updated');
				  funreload(event);
				
				  
				  disitems(0);
				  
				 }
			 else
				 {
				 $.messager.alert('Message', ' Not Updated '); 
				 }
			 
			  
			
			 
			
			}
	}
		
x.open("GET","savedata.jsp?docno="+docno+"&branchids="+branchids+"&remarks="+remarks+"&cmbinfo="+cmbinfo+"&folldate="+folldate,true);

x.send();
		
}

function disitems(val)
{
	
	 
			if(val=="1")
				{
				
				 $('#cmbinfo').attr("disabled",false);
				 
				 $('#remarks').attr("disabled",false);
				 $('#remarks').attr("readonly",false);
				 $('#Update').attr("disabled",false);
			   
				 document.getElementById("remarks").value="";
	 
				 
				 $('#date').val(new Date());
				 $('#date').jqxDateTimeInput({ disabled: false});
				 
				}
		 
			
			else
			{
	 
				 $('#cmbinfo').attr("disabled",true);
				 
				 $('#remarks').attr("disabled",true);
				 $('#remarks').attr("readonly",true);
				 $('#Update').attr("disabled",true);
			   
				 document.getElementById("remarks").value="";
 
				 
				 $('#date').val(new Date());
				 $('#date').jqxDateTimeInput({ disabled: true});
				 
			
			}
		
			
	
}
 

</script>
</head>
<body onload="getBranch();getinfo();disitems(0);">
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
                        <td class="label-cell">Doc No</td>
                        <td>
                            <input type="text" name="docnosss" id="docnosss" value='<s:property value="docnosss"/>' readonly="readonly" placeholder="Press F3 To Search" onKeyDown="getdetails(event);" >
                        </td>
                    </tr>
                </table>
                <div class="button-group">
                    <button type="button" class="btn-submit" name="clear" id="clear" onclick="funcleardata()">Clear</button>
                </div>
            </div>

            <div class="filter-card">
                <table class="release-filter-table">
                    <tr>
                        <td class="label-cell">Process</td>
                        <td>
                            <select name="cmbinfo" id="cmbinfo" value='<s:property value="cmbinfo"/>'></select>
                        </td>
                    </tr>
                    <tr>
                        <td class="label-cell">Date</td>
                        <td>
                            <div id='date' name='date' value='<s:property value="date"/>'></div> 
                        </td>
                    </tr>
                    <tr>
                        <td class="label-cell">Remarks</td>
                        <td>
                            <input type="text" id="remarks" name="remarks" value='<s:property value="remarks"/>'> 
                        </td>
                    </tr>
                </table>
                <div class="button-group">
                    <button type="button" name="Update" id="Update" class="btn-submit" onclick="funupdate()">Update</button>
                </div>
            </div>

            <div style="display: none;">
                <input type="hidden" id="acno" name="acno" value='<s:property value="acno"/>'>
                <input type="hidden" id="brhid" name="brhid" value='<s:property value="brhid"/>'>
                <input type="hidden" id="reftype" name="reftype" value='<s:property value="reftype"/>'>
                <input type="hidden" id="reqdocno" name="reqdocno" value='<s:property value="reqdocno"/>'>
                <input type="hidden" id="masterdocno" name="masterdocno" value='<s:property value="masterdocno"/>'>
            </div>
            
        </div>
    </div>

    <div class="main-content-area">
        <div class="grid-container">
            <div id="listdiv"><jsp:include page="mainGrid.jsp"></jsp:include></div>
        </div>
        <div class="grid-container">
            <div id="listdiv1"><jsp:include page="subGrid.jsp"></jsp:include></div>
        </div>
        <div class="grid-container">
            <div id="detaildiv"><jsp:include page="detailgrid.jsp"></jsp:include></div>
        </div>
    </div>

</div>

<div id="locationwindow"><div></div></div>
<div id="Searchwindow"><div></div></div> 

</div>
</body>
</html>