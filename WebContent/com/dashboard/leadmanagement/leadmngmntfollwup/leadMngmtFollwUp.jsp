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

/* Specific styling for Textarea & Checkbox */
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

.release-filter-table input[type="checkbox"] {
    width: auto;
    height: auto;
    margin: 0;
    vertical-align: middle;
    cursor: pointer;
}

.checkbox-center-row {
    display: flex; 
    align-items: center; 
    gap: 6px; 
    margin-bottom: 4px;
}

.checkbox-center-row label {
    font-size: 11.5px;
    font-weight: 600;
    color: #4e5e71;
    cursor: pointer;
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
.release-filter-table div[id^="fromdate"],
.release-filter-table div[id^="todate"],
.release-filter-table div[id^="followupdate"],
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
		 $("#followupdate").jqxDateTimeInput({ width: '100%', height: '24px',formatString:"dd.MM.yyyy"});
		 $("#fromdate").jqxDateTimeInput({ width: '100%', height: '24px',formatString:"dd.MM.yyyy"});
		 $("#todate").jqxDateTimeInput({ width: '100%', height: '24px',formatString:"dd.MM.yyyy"});
			
		 var fromdates=new Date($('#fromdate').jqxDateTimeInput('getDate'));
		 var onemounth=new Date(new Date(fromdates).setMonth(fromdates.getMonth()-1)); 
			  
		 $('#fromdate').jqxDateTimeInput('setDate', new Date(onemounth));
		 $('#todate').on('change', function (event) {
			   var fromdates=new Date($('#fromdate').jqxDateTimeInput('getDate'));
			   var todates=new Date($('#todate').jqxDateTimeInput('getDate')); //del date
			   if(fromdates>todates){
				   $.messager.alert('Message','To Date Less Than From Date  ','warning');   
			       return false;
			  }
		 });
		   
		 $("body").prepend('<div id="overlay" class="ui-widget-overlay" style="z-index: 1; display: none;"></div>');
	     $("body").prepend("<div id='PleaseWait' style='display: none;position:absolute; z-index: 1;top:180px;right:550px;'><img src='../../../../icons/31load.gif'/></div>");

	     $('#salesmanwindow').jqxWindow({ width: '25%', height: '60%',  maxHeight: '62%' ,maxWidth: '60%' , title: 'Salesman Search'  , theme: 'energyblue', position: { x: 250, y: 120 }, keyboardCloseKey: 27});
		 $('#salesmanwindow').jqxWindow('close');
	     
		 $('#txtsalesman').dblclick(function(){
		  	 $('#salesmanwindow').jqxWindow('open');
		  	 salesmanSearchContent('salesmanMasterSearch.jsp?', $('#salesmanwindow'));
	     });
	 
		 getCategory();
	});
	
	function getProcess() {
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
				
			} else {}
		}
		x.open("GET","getProcess.jsp", true);
		x.send();
	}
	
	function disable(){
		 $('#cmbcategory').attr("disabled",true);
		 $('#date').jqxDateTimeInput({ disabled: true});
		 $('#cmbprocess').attr("disabled",true);
		 $('#cmbpriority').attr("disabled",true); 
		 $('#txtremarks').attr("readonly",true);
		 $('#btnupdate').attr("disabled",true);
		 $('#txtsalesman').attr("disabled",true);
		 $("#amcfollowupGrid").jqxGrid('clear');
		 $("#amcfollowupGrid").jqxGrid("addrow", null, {}); 
		 $("#amcfollowupGrid").jqxGrid({ disabled: true}); 
	}
	
	function funreload(event){
		disable();
		 var fromdate = $('#fromdate').val();
		 var todate = $('#todate').val();
		 var branchval = document.getElementById("cmbbranch").value;
		 var chkfollowup = $('#hidchckfollowup').val();
		 var followupdate = $('#followupdate').val();
		 var salesmanid=$('#cmbsalesman').val()
		 $("#overlay, #PleaseWait").show();  
		 $("#leadFollowupDiv").load("leadMngmtFollowupGrid.jsp?branchval="+branchval+"&followupdate="+followupdate+'&fromdate='+fromdate+'&todate='+todate+"&chkfollowup="+chkfollowup+"&check=1"+"&salesmanid="+salesmanid);
	}
	
	function funUpdate(event){     
		 var rdocno=$('#txtrdocno').val();
		 var date =  $('#date').val();
		 var remarks = $('#txtremarks').val();
	     var proid=$('#cmbprocess').val();
	     var priorityid=$("#cmbpriority").val();  
		 var branchid =$("#txtbrchid").val(); 
		 var userid=$("#txtuserid").val();
		 var clientacid=$("#hidcmbacgroup").val();
		 var catid=$("#hidcatid").val(); 
		 var pstatus=$("#cmbpriority").val();
		 var cmbcat=$("#cmbcategory").val();
		 var salid=$("#txtsalid").val();
		 if(proid==''){
			 $.messager.alert('Message','Choose a Process.','warning');
			 return 0;
		 }
        if(proid==3 && pstatus=="") {
	         $.messager.alert('Message','Choose a Status.','warning');
	         return 0;
		}
        if(proid==4 && cmbcat=="") {
            $.messager.alert('Message','Choose a Category.','warning');
            return 0;
        }
        if(proid==5 && salid=="") {
            $.messager.alert('Message','Select a Salesman.','warning');
            return 0;
        }
        if(remarks==''){
			 $.messager.alert('Message','Please Enter Remarks.','warning');   
			 return 0;
		 }
		 $.messager.confirm('Message', 'Do you want to save changes?', function(r){
		     	if(r==false) {
		     		return false; 
		     	} else{
		     		saveGridData(rdocno,date,remarks,proid,priorityid,branchid,userid,clientacid,catid,salid);	
		     	}
		});
	}
	
	function followupcheck(){
		 if(document.getElementById("chckfollowup").checked){
			 document.getElementById("hidchckfollowup").value = 1; 
			 $('#cmbprocess').attr("disabled",false);
			 $('#followupdate').jqxDateTimeInput({ disabled: false});
			 $('#fromdate').jqxDateTimeInput({ disabled: true});
			 $('#todate').jqxDateTimeInput({ disabled: true});
		 }
		 else{
			 document.getElementById("hidchckfollowup").value = 0;
			 $('#followupdate').jqxDateTimeInput({ disabled: true});
			 $('#fromdate').jqxDateTimeInput({ disabled: false});
			 $('#todate').jqxDateTimeInput({ disabled: false});
		 }
	 }
		
	function getsalesman(event){
		var x= event.keyCode;
	 	if(x==114){
	 		 $('#salesmanwindow').jqxWindow('open');
	 		 salesmanSearchContent('salesmanMasterSearch.jsp?', $('#salesmanwindow'));
	    }
	}

	function salesmanSearchContent(url) {
		 $.get(url).done(function (data) {
		    $('#salesmanwindow').jqxWindow('setContent', data);
	    }); 
	}

	function saveGridData(rdocno,date,remarks,proid,priorityid,branchid,userid,clientacid,catid,salid){
		var x=new XMLHttpRequest();
		x.onreadystatechange=function(){
		if (x.readyState==4 && x.status==200){
				var items=x.responseText;
				if(parseInt(items)=="1") {	
				 $('#cmbprocess').val('');
				 $('#date').val(new Date());
				 $('#txtbrchid').val('');
				 $('#txtremarks').val('');
				 $('#txtrdocno').val('');
				 $('#txtcldocno').val('');
				 $('#txtuserid').val('');
				 $('#txtsalid').val('');
				 $('#cmbpriority').val(''); 
				 $('#txtsalesman').val('');
				 $('#cmbcategory').val('');
				 $('#hidcmbcategory').val('');
				 $('#hidcmbacgroup').val(''); 
				 $("#hidcatid").val('');
				
				 $.messager.alert('Message', '  Record Successfully Updated ');
				 funreload(event); 
				 disable();
				}
				else {
				 $.messager.alert('Message', '  Not Updated  ');
				}
			}
		}
        x.open("GET","saveData.jsp?trdocno="+rdocno+"&fldate="+date+"&remark="+remarks+"&bibpid="+proid+"&leadstatus="+priorityid+"&brchid="+branchid+"&userid="+userid+"&clientacid="+clientacid+"&catid="+catid+"&salid="+salid,true);			
	    x.send();
	}
	
	function funtxtenable(value) {
		if(value=="3"){
			$('#cmbpriority').attr("disabled",false);
			$('#cmbcategory').attr("disabled",true);
			$('#txtsalesman').attr("disabled",true);
		}
		if(value=="4"){
			 $('#cmbcategory').attr("disabled",false);
			 $('#cmbpriority').attr("disabled",true);
			 $('#txtsalesman').attr("disabled",true);
		}
		if(value=="5"){
			 $('#cmbcategory').attr("disabled",true);
			 $('#cmbpriority').attr("disabled",true);
			 $('#txtsalesman').attr("disabled",false);
		}
	}
	
	function funExportBtn(){
	}

	  function getsalesmanonload(){
			var x=new XMLHttpRequest();
			x.onreadystatechange=function(){
			if (x.readyState==4 && x.status==200) {
				 	var res= x.responseText;
					var ressplt=res.split("::");
					var salname=ressplt[0].trim();
					var salid=ressplt[1].trim();
				 	if(salid>0){
				 		document.getElementById("txtsalesman").value=salname;
				 		document.getElementById("txtsalid").value=salid;
					}
			    }
		     }
		     x.open("GET",'salesmanonload.jsp',true);
		     x.send();
	   }
	  
	  function getSalesman() {
			var x = new XMLHttpRequest();
			x.onreadystatechange = function() {
				if (x.readyState == 4 && x.status == 200) {
					var items = x.responseText;
					items = items.trim().split('####');
					var salIdItems  = items[0].split(",");
					var salItems = items[1].split(",");
					var salusrlink= items[2].split(",");
					var optionssal="" ;
					var userid='<%=session.getAttribute("USERID").toString()%>';
					var first=salIdItems[0].trim();
					var frstsalusrlink=salusrlink[0].trim();

					for (var i = 0; i < salItems.length; i++) {
						optionssal += '<option value="' + salIdItems[i].trim() + '">'
								      + salItems[i] + '</option>';
						
					}
					if(userid!=frstsalusrlink){
					    optionssal += '<option value="a">All</option>';
					}
					$("select#cmbsalesman").html(optionssal);
					 if ($('#hidcmbsalesman').val() != null) {
						$('#cmbsalesman').val($('#hidcmbsalesman').val());
					} 
					 if(userid==frstsalusrlink){
							$('#cmbsalesman').val(first);
					}
					 else{
						 $('#cmbsalesman').val("a");
					 }
				}
			}
			x.open("GET",'salesmanonload.jsp', true);
			x.send();
		}

	  function getCategoryAccountGroup(a) {
			var x = new XMLHttpRequest();
			x.onreadystatechange = function() {
				if (x.readyState == 4 && x.status == 200) {
					var items = x.responseText.trim();
					var dat=items.split("###");
				    $('#hidcmbacgroup').val(dat[0]);
				    $('#hidcatid').val(dat[1]);
				}
			}
			x.open("GET", "getCategoryAccountGroup.jsp?category="+a, true);
			x.send();
		} 
	  
	  function getCategory() {
			var x = new XMLHttpRequest();
			x.onreadystatechange = function() {
				if (x.readyState == 4 && x.status == 200) {
					var items = x.responseText;
					items = items.split('####');
					var categoryItems = items[0].split(",");
					var categoryIdItems = items[1].split(",");
					var optionscategory = '<option value="">--Select--</option>';
					for (var i = 0; i < categoryItems.length; i++) {
						optionscategory += '<option value="' + categoryIdItems[i] + '">'
								+ categoryItems[i] + '</option>';
					}
					$("select#cmbcategory").html(optionscategory);
				}
				if ($('#hidcmbcategory').val() != null) {
					$('#cmbcategory').val($('#hidcmbcategory').val());
				}
			}
			x.open("GET", "getCategory.jsp", true);
			x.send();
		}

</script>
</head>

<body onload="getBranch();getProcess();disable();followupcheck();getSalesman();">
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
                        <td class="label-cell">From</td>
                        <td><div id='fromdate' name='fromdate' value='<s:property value="fromdate"/>'></div></td>
                    </tr>
                    <tr>
                        <td class="label-cell">To</td>
                        <td><div id='todate' name='todate' value='<s:property value="todate"/>'></div></td>
                    </tr>
                    <tr>
                        <td class="label-cell"></td>
                        <td>
                            <div class="checkbox-center-row">
                                <input type="checkbox" id="chckfollowup" name="chckfollowup" value="" onchange="followupcheck();" onclick="$(this).attr('value', this.checked ? 1 : 0)" /> 
                                <label for="chckfollowup">Enable FollowUp</label>
                            </div>
                        </td>
                    </tr>
                    <tr>
                        <td class="label-cell">FollowUp Date</td>
                        <td><div id="followupdate" name="followupdate" value='<s:property value="followupdate"/>'></div></td>
                    </tr>
                    <tr>
                        <td class="label-cell">Salesman (Grp)</td>
                        <td>
                            <select id="cmbsalesman" name="cmbsalesman" value='<s:property value="cmbsalesman"/>'>
                                <option value="">--Select--</option>
                            </select>
                        </td>
                    </tr>
                </table>
            </div>

            <div class="filter-card">
                <table class="release-filter-table">
                    <tr>
                        <td class="label-cell">Process</td>
                        <td>
                            <select name="cmbprocess" id="cmbprocess" onchange="funtxtenable(value);" value='<s:property value="cmbprocess"/>'></select>
                        </td>
                    </tr>
                    <tr>
                        <td class="label-cell">Salesman</td>
                        <td>
                            <div class="search-input-wrapper">
                                <input type="text" name="txtsalesman" id="txtsalesman" placeholder="Double click to search" readonly="readonly" onKeyDown="getsalesman(event);" ondblclick="getsalesman(event);" value='<s:property value="txtsalesman"/>'>
                                <div class="search-icon"></div>
                            </div>
                        </td>
                    </tr>
                    <tr>
                        <td class="label-cell">Status</td>
                        <td>
                            <select name="cmbpriority" id="cmbpriority" value='<s:property value="cmbpriority"/>'>
                                <option value="">--Select--</option>
                                <option value="1">Cold</option>
                                <option value="2">Warm</option>
                                <option value="3">Hot</option>
                            </select>
                        </td>
                    </tr>
                    <tr>
                        <td class="label-cell">Category</td>
                        <td>
                            <select id="cmbcategory" name="cmbcategory" onchange="getCategoryAccountGroup(this.value);" value='<s:property value="cmbcategory"/>'>
                                <option value="">--Select--</option>
                            </select>
                        </td>
                    </tr>
                    <tr>
                        <td class="label-cell">Date</td>
                        <td><div id="date" name="date" value='<s:property value="date"/>'></div></td>
                    </tr>
                    <tr>
                        <td class="label-cell">Remarks</td>
                        <td><input type="text" id="txtremarks" name="txtremarks" value='<s:property value="txtremarks"/>'/></td>
                    </tr>
                </table>

                <div class="action-grid">
                    <button type="button" class="btn-primary" id="btnupdate" name="btnupdate" onclick="funUpdate(event);">Update</button>
                </div>
            </div>

            <input type="hidden" id="hidchckfollowup" name="hidchckfollowup" value='<s:property value="hidchckfollowup"/>'/>
            <input type="hidden" id="hidcmbsalesman" name="hidcmbsalesman" value='<s:property value="hidcmbsalesman"/>'/>
            <input type="hidden" id="hidcmbcategory" name="hidcmbcategory" value='<s:property value="hidcmbcategory"/>'/>
            <input type="hidden" id="hidcatid" name="hidcatid" value='<s:property value="hidcatid"/>'/>
            <input type="hidden" id="hidcmbacgroup" name="hidcmbacgroup" value='<s:property value="hidcmbacgroup"/>'/>
            <input type="hidden" id="txtdocno" name="txtdocno" value='<s:property value="txtdocno"/>'/>
            <input type="hidden" id="txtbranch" name="txtbranch" value='<s:property value="txtbranch"/>'/>
            <input type="hidden" id="txtsalid" name="txtsalid" value='<s:property value="txtsalid"/>'/>
            <input type="hidden" id="txtrdocno" name="txtrdocno" value='<s:property value="txtrdocno"/>'/>
            <input type="hidden" id="txtbrchid" name="txtbrchid" value='<s:property value="txtbrchid"/>'/>
            <input type="hidden" id="txtuserid" name="txtuserid" value='<s:property value="txtuserid"/>'/>

        </div>
    </div>

    <div class="main-content-area">
        <div class="grid-card">
            <div id="leadFollowupDiv">
                <jsp:include page="leadMngmtFollowupGrid.jsp"></jsp:include>
            </div>
        </div>
        
        <div class="grid-card">
            <div id="detailDiv">
                <jsp:include page="leadMngmtDetailGrid.jsp"></jsp:include>
            </div>
        </div>
    </div>

</div>

<div id="salesmanwindow">
    <div></div>
</div>

</div>
</div>
</body>
</html>