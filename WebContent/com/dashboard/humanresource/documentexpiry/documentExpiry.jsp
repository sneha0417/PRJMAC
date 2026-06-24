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
input:disabled {
    background-color: #f3f6f9 !important;
    color: #555;
}

/* jqx date/time containers */
.release-filter-table div[id="uptodate"],
.release-filter-table div[id="date"] {
    width: 100%;
}

/* Emp info textarea */
.empinfo-area {
    width: 100%;
    height: 72px;
    font: 10px Tahoma;
    resize: none;
    border: 1px solid #ccd6e0;
    border-radius: 4px;
    background-color: #f3f6f9;
    color: #555;
    padding: 4px 8px;
    box-sizing: border-box;
}

/* Action buttons row */
.action-buttons {
    display: flex;
    gap: 8px;
    margin-top: 4px;
}

.myButtons {
    flex: 1;
    height: 28px;
    padding: 0 10px;
    border: 1px solid #566963;
    border-radius: 10px;
background: #2563eb;
    color: #ffffff;
    font-size: 11px;
    font-weight: 600;
    cursor: pointer;
    box-shadow: inset 0px -1px 3px 0px #91b8b3;
    text-shadow: 0px -1px 0px #2b665e;
    transition: background 0.15s;
}
.myButtons:hover {
 background: ##005c97;
     border-color: #2563eb;                
    transform: scale(1.08);                
    box-shadow: 0 6px 16px rgba(37, 99, 235, 0.25);
    z-index: 2;}
.myButtons:active {
    position: relative;
    top: 1px;
}
.Buttons {
    flex: 1;
    height: 28px;
    padding: 0 10px;
    border: 1px solid #566963;
    border-radius: 10px;
    background: linear-gradient(to bottom, #768d87 5%, #6c7c7c 100%);
    color: #ffffff;
    font-size: 11px;
    font-weight: 600;
    cursor: pointer;
    box-shadow: inset 0px -1px 3px 0px #91b8b3;
    text-shadow: 0px -1px 0px #2b665e;
    transition: background 0.15s;
}
.Buttons:hover {
    background: linear-gradient(to bottom, #6c7c7c 5%, #768d87 100%);
     border-color: #2563eb;                
    transform: scale(1.08);                
    box-shadow: 0 6px 16px rgba(37, 99, 235, 0.25);
    z-index: 2; 
}
.Buttons:active {
    position: relative;
    top: 1px;
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
    gap: 12px;
}
</style>

<script type="text/javascript">

	$(document).ready(function () {
		
		$("#uptodate").jqxDateTimeInput({ width: '125px', height: '15px',formatString:"dd.MM.yyyy"});
		$("#date").jqxDateTimeInput({ width: '125px', height: '15px',formatString:"dd.MM.yyyy"});
		$("#expiryDate").jqxDateTimeInput({ width: '125px', height: '15px',formatString:"dd.MM.yyyy"});
		
		$("body").prepend('<div id="overlay" class="ui-widget-overlay" style="z-index: 1; display: none;"></div>');
		$("body").prepend("<div id='PleaseWait' style='display: none;position:absolute; z-index: 1;top:180px;right:550px;'><img src='../../../../icons/31load.gif'/></div>");
		
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
					optionsbranch += '<option value="' + srno[i].trim() + '">'
							+ process[i] + '</option>';
				}
				$("select#cmbprocess").html(optionsbranch);
			} else {}
		}
		x.open("GET","getProcess.jsp", true);
		x.send();
	}

	function funClearData(){
		$('#cmbbranch').val('a');$('#uptodate').val(new Date());$('#empinfo').val('');$('#cmbprocess').val('');$('#date').val(new Date());$('#txtremarks').val('');
		$('#expiryDate').val(new Date());$('#txtempdocno').val('');$('#txtempid').val('');$('#txtbranch').val('');$('#txtdocument').val('');$('#txtdocumentid').val('');disable();
		$("#documentsExpiry").jqxGrid('clear');$("#documentsExpiry").jqxGrid('addrow', null, {});$("#documentDetailsGrid").jqxGrid('clear');$("#documentDetailsGrid").jqxGrid('addrow', null, {});
	}
	
	function funExportBtn(){
		$("#documentExpiryDiv").excelexportjs({
			containerid: "documentExpiryDiv", 
			datatype: 'json', 
			dataset: null, 
			gridId: "documentsExpiry", 
			columns: getColumns("documentsExpiry"),   
			worksheetName:"DocumentsExpiry"
		});
	}  
	
	function funreload(event){
		var branchval = document.getElementById("cmbbranch").value;
		var uptodate = $('#uptodate').val();

		$('#cmbprocess').val('');$('#date').val(new Date());$('#expiryDate').val(new Date());$('#txtbranch').val('');$('#txtempdocno').val('');$('#txtremarks').val('');
		$('#txtempid').val('');$('#txtdocument').val('');$('#txtdocumentid').val('');$('#btnupdate').attr("disabled",true);$('#cmbprocess').attr("disabled",true);$('#date').jqxDateTimeInput({ disabled: true});
		$("#documentDetailsGrid").jqxGrid('clear');$("#documentDetailsGrid").jqxGrid('addrow', null, {});
		$("#overlay, #PleaseWait").show();
		
		$("#documentExpiryDiv").load("documentExpiryGrid.jsp?branchval="+branchval+'&uptodate='+uptodate+'&check=1');
	}

	function disable(){
		$('#date').jqxDateTimeInput({ disabled: true});
		$('#cmbprocess').attr("disabled",true);
		$('#txtremarks').attr("readonly",true);
		$('#btnupdate').attr("disabled",true);
	}
	
	function funUpdate(event){
		var process = $('#cmbprocess option:selected').text();
		var date =  $('#date').val();
		var branchid = $('#txtbranch').val();
		var empdocno = $('#txtempdocno').val();
		var expirydate = $('#expiryDate').val();
		var remarks = $('#txtremarks').val();
		var empid = $('#txtempid').val();
		var documentid = $('#txtdocumentid').val();
		var document = $('#txtdocument').val();
		
		if(process==''){
			$.messager.alert('Message','Choose a Process.','warning');
			return 0;
		}

		if(remarks==''){
			$.messager.alert('Message','Please Enter Remarks.','warning');   
			return 0;
		}
		
		$.messager.confirm('Message', 'Do you want to save changes?', function(r){
			if(r==false){
				return false; 
			}
			else{
				saveGridData(process,date,branchid,empdocno,expirydate,remarks,empid,document,documentid);	
			}
		});
	}
	
	function saveGridData(process,date,branchid,empdocno,expirydate,remarks,empid,document,documentid){
		
		var x=new XMLHttpRequest();
		x.onreadystatechange=function(){
			if (x.readyState==4 && x.status==200){
				var items=x.responseText;
				
				var process = $('#cmbprocess').val('');
				$('#date').val(new Date());
				var branchid = $('#txtbranch').val('');
				var empdocno = $('#txtempdocno').val('');
				$('#expiryDate').val(new Date());
				var remarks = $('#txtremarks').val('');
				var empid = $('#txtempid').val('');
				var document = $('#txtdocument').val('');
				var documentid = $('#txtdocumentid').val('');
				
				$.messager.alert('Message', '  Record Successfully Updated ', function(r){});
				funreload(event); 
				disable();
				$('#empinfo').val('');
			}
		}
		x.open("GET","saveData.jsp?process="+process+"&date="+date+"&branchid="+branchid+"&empdocno="+empdocno+"&expirydate="+expirydate+"&remarks="+remarks+"&empid="+empid+"&document="+document+"&documentid="+documentid,true);
		x.send();
	}
	
</script>
</head>
<body onload="getBranch();getProcess();disable();">
<div id="mainBG" class="homeContent" data-type="background"> 
<div class='hidden-scrollbar'>

<div class="master-container">

    <!-- ===== SIDEBAR ===== -->
    <div class="sidebar-filters">
        <div class="sidebar-fixed-top">
            <div class="filter-card" style="padding: 10px;">
                <jsp:include page="../../heading.jsp"></jsp:include>
            </div>
        </div>

        <div class="sidebar-scroll-content">

            <!-- Date filter -->
            <div class="filter-card">
                <table class="release-filter-table">
                    <tr>
                        <td class="label-cell">Up To</td>
                        <td><div id="uptodate" name="uptodate" value='<s:property value="uptodate"/>'></div></td>
                    </tr>
                </table>
            </div>

            <!-- Emp info + editable fields -->
            <div class="filter-card">
                <textarea id="empinfo" class="empinfo-area" name="empinfo" readonly="readonly"><s:property value="empinfo"></s:property></textarea>

                <table class="release-filter-table" style="margin-top: 8px;">
                    <tr>
                        <td class="label-cell">Process</td>
                        <td>
                            <select name="cmbprocess" id="cmbprocess" value='<s:property value="cmbprocess"/>'></select>
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
            </div>

            <!-- Action Buttons -->
            <div class="filter-card" style="padding: 10px;">
                <div class="action-buttons">
                    <input type="button" class="Buttons" name="clear" id="clear" value="Clear" onclick="funClearData();">
                    <button class="myButtons" type="button" id="btnupdate" name="btnupdate" onclick="funUpdate(event);">Update</button>
                </div>
            </div>

            <!-- Hidden inputs -->
            <div hidden="true"><div id='expiryDate' name='expiryDate' value='<s:property value="expiryDate"/>'></div></div>
            <input type="hidden" id="txtempdocno" name="txtempdocno" value='<s:property value="txtempdocno"/>'/>
            <input type="hidden" id="txtempid" name="txtempid" value='<s:property value="txtempid"/>'/>
            <input type="hidden" id="txtbranch" name="txtbranch" value='<s:property value="txtbranch"/>'/>
            <input type="hidden" id="txtdocument" name="txtdocument" value='<s:property value="txtdocument"/>'/>
            <input type="hidden" id="txtdocumentid" name="txtdocumentid" value='<s:property value="txtdocumentid"/>'/>

        </div>
    </div>

    <!-- ===== MAIN CONTENT ===== -->
    <div class="main-content-area">
        <div id="documentExpiryDiv"><jsp:include page="documentExpiryGrid.jsp"></jsp:include></div>
        <div id="detailDiv"><jsp:include page="detailGrid.jsp"></jsp:include></div>
    </div>

</div>

</div>
</div>
</body>
</html>
