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
    overflow: hidden;
}

.master-container {
    display: flex;
    width: 100%;
    height: 100vh;
    font-family: 'Segoe UI', 'Roboto', 'Arial', sans-serif;
    background-color: #f4f7f9;
}

/* Sidebar */
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
    width: 90px;
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

/* Readonly / disabled look */
input[readonly],
input:disabled,
select:disabled {
    background-color: #f3f6f9 !important;
    color: #555;
    cursor: not-allowed;
}

/* jqx date/time containers */
.release-filter-table div[id^="date"],
.release-filter-table div[id^="uptodate"],
.release-filter-table div[id^="followupdate"] {
    width: 100%;
}

/* Checkbox Alignment */
.checkbox-row {
    display: flex;
    align-items: center;
    gap: 8px;
    font-size: 12px;
    color: #4e5e71;
    font-weight: 600;
}
.checkbox-row input[type="checkbox"] {
    margin: 0;
    cursor: pointer;
}

/* Buttons */
.btn-submit {
    width: 100%;
    height: 30px;
    background: #2563eb;
    color: #fff;
    border: none;
    border-radius: 4px;
    font-size: 13px;
    font-weight: 600;
    cursor: pointer;
    transition: background 0.2s;
    margin-bottom: 8px;
}

.btn-submit:hover:not(:disabled) {
    background: #1d4ed8;
}

.btn-submit:disabled {
    background: #9ca3af;
    cursor: not-allowed;
}

/* Main Content Area */
.main-content-area {
    flex: 1;
    height: 100vh;
    overflow: auto;
    background: #ffffff;
    padding: 15px;
    box-sizing: border-box;
    display: flex;
    flex-direction: column;
    gap: 15px;
}
</style>

<script type="text/javascript">

	$(document).ready(function () {
		
		 $('#btncontract').attr("disabled",true);
		 
		 // Standardized height to 24px and width to 100%
		 $("#date").jqxDateTimeInput({ width: '100%', height: '24px',formatString:"dd.MM.yyyy"});
		 $("#uptodate").jqxDateTimeInput({ width: '100%', height: '24px',formatString:"dd.MM.yyyy"});
		 $("#followupdate").jqxDateTimeInput({ width: '100%', height: '24px',formatString:"dd.MM.yyyy"});
		 
		 $("body").prepend('<div id="overlay" class="ui-widget-overlay" style="z-index: 1; display: none;"></div>');
	     $("body").prepend("<div id='PleaseWait' style='display: none;position:absolute; z-index: 1;top:180px;right:550px;'><img src='../../../../icons/31load.gif'/></div>");

	     $('#amcwindow').jqxWindow({ width: '25%', height: '60%',  maxHeight: '62%' ,maxWidth: '60%' , title: 'AMC No. Search'  , theme: 'energyblue', position: { x: 250, y: 120 }, keyboardCloseKey: 27});
		 $('#amcwindow').jqxWindow('close');
	     
	     var fromdates=new Date($('#uptodate').jqxDateTimeInput('getDate'));
		 var onemounth=new Date(new Date(fromdates).setMonth(fromdates.getMonth()+1)); 
		    
	     $('#uptodate').jqxDateTimeInput('setDate', new Date(onemounth));
		   
		 $('#amcno').dblclick(function(){
			 var docno = $('#contno').val();
			 var cldocno = $('#txtcldocno').val();
		  	    
			 $('#amcwindow').jqxWindow('open');
			 amcsearchContent('amcsearch.jsp?doc='+docno+"&cldoc="+cldocno, $('#amcwindow')); 
		 });

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
					optionsbranch += '<option  value="' + srno[i].trim() + ':'+ process[i].trim() +'">'
					+ process[i] + '</option>';
				}
				$("select#cmbprocess").html(optionsbranch);
				
			} else {}
		}
		x.open("GET","getProcess.jsp", true);
		x.send();
	}
	
	function disable(){
		 $('#date').jqxDateTimeInput({ disabled: true});
		 $('#cmbprocess').attr("disabled",true);
		 $('#txtremarks').attr("readonly",true);
		 $('#btnupdate').attr("disabled",true);
		 $('#amcno').attr("disabled",true);
		 $("#amcfollowupGrid").jqxGrid('clear');
		 $("#amcfollowupGrid").jqxGrid("addrow", null, {}); 
		 $("#amcfollowupGrid").jqxGrid({ disabled: true});
	}
	
	function funreload(event){
		 disable();
		 var uptodate = $('#uptodate').val();
		 var branchval = document.getElementById("cmbbranch").value;
		 var chkfollowup = $('#hidchckfollowup').val();
		 var followupdate = $('#followupdate').val();
		 $("#overlay, #PleaseWait").show();
		 
		 $("#amcRenewalFollowupDiv").load("amcrenewalfollowupGrid.jsp?branchval="+branchval+"&uptodate="+uptodate+'&chkfollowup='+chkfollowup+'&followupdate='+followupdate);
	}
	
	function funUpdate(event){
		var pro= $('#cmbprocess').val().split(":");
		var bibid=pro[0].trim();
		var proname=pro[1].trim();
		var date =  $('#date').val();
		var branchid = $('#txtbranch').val();
		var remarks = $('#txtremarks').val();
		var trno = $('#txtdocno').val();
		var rdtype = $('#conttype').val();
		var client = $('#txtclient').val();
		var cntctperson = $('#txtcperson').val();
		var cntctpersonid = $('#txtcpersonid').val();
		var cldocno = $('#txtcldocno').val();
		var amcno = $('#amcno').val();
		
		if(bibid==''){
			 $.messager.alert('Message','Choose a Process.','warning');
			 return 0;
		 }

		if(proname==("Renewed") && amcno==''){
			 $.messager.alert('Message','Please Choose AMC No.','warning');   
			 return 0;
		} 
		 
		if(remarks==''){
			 $.messager.alert('Message','Please Enter Remarks.','warning');   
			 return 0;
		}
		 
		if(proname==("Create Enquiry")){
		     var docno=document.getElementById("amcno").value;   
		     var path1="com/operations/marketing/enquirynew/enquiry.jsp";
		     var name="Enquiry";  
		     var url=document.URL;
		     var reurl=url.split("com");  

		     window.parent.formName.value="Enquiry";
		     window.parent.formCode.value="ENQ";
		     var detName="Enquiry";
             var mode="A";
             var desc="renewal for amcno="+amcno;
		     var path= path1+"?mod="+mode+"&client="+client.replace("/\s/g","%20").replace('#','%23').replace('&','%26')+"&cldocno="+cldocno+"&cperson="+cntctperson
		     +"&dtype="+rdtype+"&proname="+proname+"&desc="+desc+"&cpersonid="+cntctpersonid+"&trno="+trno;  

		     top.addTab( detName,reurl[0]+""+path);   
		}
		
		if(proname!=("Create Enquiry")){
		     $.messager.confirm('Message', 'Do you want to save changes?', function(r){
		     	if(r==false){  
		     		return false; 
		     	} else {
		     		saveGridData(bibid,proname,date,branchid,trno,rdtype,remarks,amcno);	
		     	}
		    });
		}
	}
	
	function funCreateContract(event){
		 var docno=document.getElementById("amcno").value;   
	     var path1="com/project/execution/serviceContract/servicecontract.jsp";
	     var name="Service Contract";  
	     var url=document.URL;
	     var reurl=url.split("com");  

	     window.parent.formName.value="Service Contract";
	     window.parent.formCode.value="AMC";
	     var detName="Service Contract";
         var mode="A";
         var desc="renewal for amcno="+amcno;
	     var path= path1+"?modes="+mode+"&client="+$('#txtclient').val().replace("/\s/g","%20").replace('#','%23').replace('&','%26')+"&cldocno="+$('#txtcldocno').val()+"&cperson="+$('#txtcperson').val()
	     +"&mob="+$('#txtmob').val()+"&tel="+$('#txttel').val()+"&mail="+$('#txtmail').val()+"&cpersonid="+$('#txtcpersonid').val()+"&address="+$('#txtaddress').val().replace("/\s/g","%20").replace('#','%23').replace('&','%26')+"&amcno="+$('#txtdocno').val()+"&salname="+$('#txtsalname').val()+"&salid="+$('#txtsalid').val();   
	     top.addTab( detName,reurl[0]+""+path); 
	}
	
	function followupcheck(){
		 if(document.getElementById("chckfollowup").checked){
			 document.getElementById("hidchckfollowup").value = 1;
			 $('#followupdate').jqxDateTimeInput({ disabled: false});
		 }
		 else{
			 document.getElementById("hidchckfollowup").value = 0;
			 $('#followupdate').jqxDateTimeInput({ disabled: true});
		 }
	}
		
	function saveGridData(bibid,proname,date,branchid,docno,rdtype,remarks,amcno){
		var x=new XMLHttpRequest();
		x.onreadystatechange=function(){
		    if (x.readyState==4 && x.status==200){
				var items=x.responseText;
				if(parseInt(items)=="1"){	
				    $('#cmbprocess').val('');
				    $('#date').val(new Date());
				    $('#txtbranch').val('');
				    $('#txtremarks').val('');
				    $('#txtdocno').val('');
				    $('#txtcldocno').val('');
				    $('#contno').val('');
				    $('#conttype').val('');
				    $('#amcno').val('');
				
				    $.messager.alert('Message', '  Record Successfully Updated ');
				    disable();
				} else {
				    $.messager.alert('Message', '  Not Updated  ');
				}
			}
		}
		x.open("GET","saveData.jsp?bibid="+bibid+"&proname="+proname+"&date="+date+"&branchid="+branchid+"&docno="+docno+"&rdtype="+rdtype+"&remarks="+remarks+"&amcno="+amcno,true);
		x.send();
	}
	
	function funtxtenable(){
		$('#amcno').val('');
		$('#amcno').attr("disabled",true);
		var pro= $('#cmbprocess').val().split(":");
		var bibid=pro[0];
		var proname=pro[1].trim();
		
		if(proname==("Renewed")){
			if ($('#amcno').val() == '') {
	  	        $('#amcno').attr('placeholder', 'Press F3 To Search'); 
	  	    }
			$('#amcno').attr("disabled",false);
		}
	}
	
	function funExportBtn(){
		 $("#amcRenewalFollowupDiv").excelexportjs({
				containerid: "amcRenewalFollowupDiv",   
				datatype: 'json',
				dataset: null,
				gridId: "jqxloaddataGrid",
				columns: getColumns("jqxloaddataGrid") ,   
				worksheetName:"AMC Renewal Followup"       
		});
	}
	
	function getamcinfo(event){
		 var x= event.keyCode;
		 if(x==114){
	 		$('#amcwindow').jqxWindow('open');
			amcsearchContent('amcsearch.jsp?doc='+docno+"&cldoc="+cldocno, $('#amcwindow'));    
         }
	} 

	function amcsearchContent(url) {
		$.get(url).done(function (data) {
			$('#amcwindow').jqxWindow('open');
			$('#amcwindow').jqxWindow('setContent', data);
	    }); 
	} 	
</script>
</head>
<body onload="getBranch();getProcess();disable();followupcheck();">
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
                        <td class="label-cell">Up To</td> 
                        <td><div id="uptodate" name="uptodate" value='<s:property value="uptodate"/>'></div></td>
                    </tr>
                    
                    <tr>
                        <td></td>
                        <td>
                            <div class="checkbox-row">
                                <input type="checkbox" id="chckfollowup" name="chckfollowup" value="" onchange="followupcheck();" onclick="$(this).attr('value', this.checked ? 1 : 0)" /> 
                                <label for="chckfollowup">Enable FollowUp</label>
                                <input type="hidden" id="hidchckfollowup" name="hidchckfollowup" value='<s:property value="hidchckfollowup"/>'/>
                            </div>
                        </td>
                    </tr>
                    
                    <tr>
                        <td class="label-cell">FollowUp</td>
                        <td><div id="followupdate" name="followupdate" value='<s:property value="followupdate"/>'></div></td>
                    </tr>
                    
                    <tr><td colspan="2" style="height: 10px;"></td></tr>
                    
                    <tr>
                        <td class="label-cell">Doc No.</td>
                        <td><input type="text" id="contno" name="contno" readonly="readonly" value='<s:property value="contno"/>'/></td>
                    </tr>
                    
                    <tr>
                        <td class="label-cell">Doc Type</td>
                        <td><input type="text" id="conttype" name="conttype" readonly="readonly" value='<s:property value="conttype"/>'/></td>
                    </tr>
                    
                    <tr><td colspan="2" style="height: 10px;"></td></tr> 
                    
                    <tr>
                        <td class="label-cell">Process</td>
                        <td>
                            <select name="cmbprocess" id="cmbprocess" onChange="funtxtenable();" value='<s:property value="cmbprocess"/>'></select>
                        </td>
                    </tr>
                    
                    <tr>
                        <td class="label-cell">Date</td>
                        <td><div id="date" name="date" value='<s:property value="date"/>'></div></td>
                    </tr>
                    
                    <tr>
                        <td class="label-cell">New AMC No.</td>
                        <td><input type="text" name="amcno" id="amcno" placeholder="Press F3 To Search" readonly="readonly" onKeyDown="getamcinfo(event);" onclick="this.placeholder=''" value='<s:property value="amcno"/>'></td>
                    </tr>

                    <tr>
                        <td class="label-cell">Remarks</td>
                        <td><input type="text" id="txtremarks" name="txtremarks" value='<s:property value="txtremarks"/>'/></td>
                    </tr>
                </table>
                
                <div style="margin-top: 20px;">
                    <button class="btn-submit" type="button" id="btnupdate" name="btnupdate" onclick="funUpdate(event);">Update</button>
                    <button class="btn-submit" type="button" id="btncontract" name="btncontract" onclick="funCreateContract(event);">Create Contract</button>
                </div>
            </div>

            <input type="hidden" id="txtdocno" name="txtdocno" value='<s:property value="txtdocno"/>'/>
            <input type="hidden" id="txtbranch" name="txtbranch" value='<s:property value="txtbranch"/>'/>
            <input type="hidden" id="txtcldocno" name="txtcldocno" value='<s:property value="txtcldocno"/>'/>
            <input type="hidden" id="txtclient" name="txtclient" value='<s:property value="txtclient"/>'/>
            <input type="hidden" id="txtcperson" name="txtcperson" value='<s:property value="txtcperson"/>'/>
            <input type="hidden" id="txtcpersonid" name="txtcpersonid" value='<s:property value="txtcpersonid"/>'/>
            <input type="hidden" id="txtmob" name="txtmob" value='<s:property value="txtmob"/>'/>
            <input type="hidden" id="txttel" name="txttel" value='<s:property value="txttel"/>'/>
            <input type="hidden" id="txtmail" name="txtmail" value='<s:property value="txtmail"/>'/>
            <input type="hidden" id="txtsalname" name="txtsalname" value='<s:property value="txtsalname"/>'/>
            <input type="hidden" id="txtsalid" name="txtsalid" value='<s:property value="txtsalid"/>'/>
            <input type="hidden" id="txtaddress" name="txtaddress" value='<s:property value="txtaddress"/>'/>
        </div>
    </div>

    <div class="main-content-area">
        <div id="amcRenewalFollowupDiv" class="filter-card" style="padding: 0; overflow: hidden;">
            <jsp:include page="amcrenewalfollowupGrid.jsp"></jsp:include>
        </div>
        <div id="detailDiv" class="filter-card" style="padding: 0; overflow: hidden; flex: 1;">
            <jsp:include page="detailGrid.jsp"></jsp:include>
        </div>
    </div>

</div>

<div id="amcwindow">
   <div></div>
</div>

</div> 
</body>
</html>