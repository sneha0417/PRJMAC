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
    background: linear-gradient(to bottom, #768d87 5%, #6c7c7c 100%);
    color: #ffffff;
    font-size: 11px;
    font-weight: 600;
    cursor: pointer;
    box-shadow: inset 0px -1px 3px 0px #91b8b3;
    text-shadow: 0px -1px 0px #2b665e;
    transition: background 0.15s;
}
.myButtons:hover {
    background: linear-gradient(to bottom, #6c7c7c 5%, #768d87 100%);
     border-color: #2563eb;                
    transform: scale(1.08);                
    box-shadow: 0 6px 16px rgba(37, 99, 235, 0.25);
    z-index: 2; 
}
.myButtons:active {
    position: relative;
    top: 1px;
}

.mySaveButton {
    flex: 1;
    height: 28px;
    padding: 0 10px;
    border: 1px solid #2563eb;
    border-radius: 10px;
    background: #2563eb;
    color: #ffffff;
    font-family: Verdana;
    font-size: 11px;
    font-weight: bold;
    cursor: pointer;
    text-shadow: 0px -1px 0px #aade7c;
    transition: background 0.15s;
}
.mySaveButton:hover {
    background: ##005c97;
     border-color: #2563eb;                
    transform: scale(1.08);                
    box-shadow: 0 6px 16px rgba(37, 99, 235, 0.25);
    z-index: 2; 
}
.mySaveButton:active {
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
}
</style>

<script type="text/javascript">

	$(document).ready(function () {
		
		$('#employeeDetailsWindow').jqxWindow({width: '51%', height: '58%',  maxHeight: '70%' ,maxWidth: '51%' , title: 'Employee Search',position: { x: 300, y: 87 } , theme: 'energyblue', showCloseButton: true, keyboardCloseKey: 27});
		$('#employeeDetailsWindow').jqxWindow('close');
		
		$("body").prepend('<div id="overlay" class="ui-widget-overlay" style="z-index: 1; display: none;"></div>');
		$("body").prepend("<div id='PleaseWait' style='display: none;position:absolute; z-index: 1;top:180px;right:550px;'><img src='../../../../icons/31load.gif'/></div>");
	    
	    $('#txtemployeeid').dblclick(function(){
			employeeSearchContent("employeeDetailsSearch.jsp");
		});
	    
	});
	
	function employeeSearchContent(url) {
		$('#employeeDetailsWindow').jqxWindow('open');
		$.get(url).done(function (data) {
			$('#employeeDetailsWindow').jqxWindow('setContent', data);
			$('#employeeDetailsWindow').jqxWindow('bringToFront');
		}); 
	}
	
	function getPayrollCategory() {
		var x = new XMLHttpRequest();
		x.onreadystatechange = function() {
			if (x.readyState == 4 && x.status == 200) {
				var items = x.responseText;
				items = items.split('####');
				var payrollcategoryItems = items[0].split(",");
				var payrollcategoryIdItems = items[1].split(",");
				var optionspayrollcategory = '<option value="">--Select--</option>';
				for (var i = 0; i < payrollcategoryItems.length; i++) {
					optionspayrollcategory += '<option value="' + payrollcategoryIdItems[i] + '">'
							+ payrollcategoryItems[i] + '</option>';
				}
				$("select#cmbempcategory").html(optionspayrollcategory);
			} else {}
		}
		x.open("GET", "getPayrollCategory.jsp", true);
		x.send();
	}
	
	function getDepartment() {
		var x = new XMLHttpRequest();
		x.onreadystatechange = function() {
			if (x.readyState == 4 && x.status == 200) {
				var items = x.responseText;
				items = items.split('####');
				var departmentItems = items[0].split(",");
				var departmentIdItems = items[1].split(",");
				var optionsdepartments = '<option value="">--Select--</option>';
				for (var i = 0; i < departmentItems.length; i++) {
					optionsdepartments += '<option value="' + departmentIdItems[i] + '">'
							+ departmentItems[i] + '</option>';
				}
				$("select#cmbdepartment").html(optionsdepartments);
			} else {}
		}
		x.open("GET", "getDepartment.jsp", true);
		x.send();
	}
	
	function getEmployeeId(event){
		var x= event.keyCode;
		if(x==114){
			employeeSearchContent("employeeDetailsSearch.jsp");
		}
		else{}
	}

	function funClearInfo(){
		$('#cmbbranch').val('a');$('#txtemployeeid').val('');$('#txtemployeename').val('');$('#txtemployeedocno').val('');
		$('#txtemployeeids').val('');$('#cmbempcategory').val('');$('#cmbdepartment').val('');
		$('#msg').val('');$('#mode').val('');$('#gridlength').val('');
		$("#openingDetailsGridID").jqxGrid('clear');$("#openingDetailsGridID").jqxGrid('addrow', null, {});
		
		if (document.getElementById("txtemployeeid").value == "") {
			$('#txtemployeeid').attr('placeholder', 'Press F3 to Search'); 
			$('#txtemployeename').attr('placeholder', 'Employee Name');
		}
	}
	
	function funreload(event){
		var branchval = document.getElementById("cmbbranch").value;
		var category = $('#cmbempcategory').val();
		var department = $('#cmbdepartment').val();
		var employee = $('#txtemployeedocno').val();
		$('#txtemployeeids').val('');$('#msg').val('');$('#mode').val('');$('#gridlength').val('');
		var employeebranchchk=window.parent.employeebranchchk.value; 
		var branch=document.getElementById("cmbbranch").value;
		$("#overlay, #PleaseWait").show();
		var check=1;
		$("#openingBalanceDetailsDiv").load("openingBalanceGrid.jsp?category="+category+'&check='+check+'&department='+department+'&employee='+employee+'&branch='+branch+'&employeebranchchk='+employeebranchchk);
	} 
	
	function funNotify(){	
		var employeeids = $('#txtemployeeids').val();
		if(employeeids.trim()==''){
			$.messager.alert('Message','Change Opening For Some Employee(s) Before Saving.','warning');
			return;
		}
		
		$.messager.confirm('Confirm', 'Do you want to save changes?', function(r){
			if (r){
				var rows = $("#openingDetailsGridID").jqxGrid('getrows');
				var length=0;
				for(var i=0 ; i < rows.length ; i++){
					var chk=rows[i].tobesaved;
					if(typeof(chk) != "undefined" && typeof(chk) != "NaN" && chk != ""){
						newTextBox = $(document.createElement("input"))
							.attr("type", "dil")
							.attr("id", "test"+length)
							.attr("name", "test"+length)
							.attr("hidden", "true");
						length=length+1;
						newTextBox.val(rows[i].empdocno+"::"+rows[i].empacno+":: "+rows[i].terminationbenefits+":: "+rows[i].leavesalary+":: "+rows[i].travels);
						newTextBox.appendTo('form');
					}
				}
				$('#gridlength').val(length);
				document.getElementById("mode").value='A';
				$("#overlay, #PleaseWait").show();
				document.getElementById("frmDashboardOpening").submit();
			}
		});
		
		return 1;
	}
	
	function setValues(){
		if($('#msg').val()!=""){
			$.messager.alert('Message',$('#msg').val());
			funreload(event);
		}
	}
	
	function funExportBtn(){
		$("#openingBalanceDetailsDiv").excelexportjs({
			containerid: "openingBalanceDetailsDiv", 
			datatype: 'json', 
			dataset: null, 
			gridId: "openingDetailsGridID", 
			columns: getColumns("openingDetailsGridID"), 
			worksheetName:"OpeningBalance" 
		});
	} 
	
</script>
</head>
<body onload="getBranch();setValues();getPayrollCategory();getDepartment();">
<form id="frmDashboardOpening" action="saveDashboardOpening" method="post">
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

            <!-- Filters -->
            <div class="filter-card">
                <table class="release-filter-table">
                    <tr>
                        <td class="label-cell">Category</td>
                        <td>
                            <select id="cmbempcategory" name="cmbempcategory" value='<s:property value="cmbempcategory"/>'></select>
                            <input type="hidden" id="hidcmbempcategory" name="hidcmbempcategory" value='<s:property value="hidcmbempcategory"/>'/>
                        </td>
                    </tr>
                    <tr>
                        <td class="label-cell">Department</td>
                        <td>
                            <select id="cmbdepartment" name="cmbdepartment" value='<s:property value="cmbdepartment"/>'></select>
                            <input type="hidden" id="hidcmbdepartment" name="hidcmbdepartment" value='<s:property value="hidcmbdepartment"/>'/>
                        </td>
                    </tr>
                    <tr>
                        <td class="label-cell">Employee</td>
                        <td>
                            <input type="text" id="txtemployeeid" name="txtemployeeid" readonly="readonly" placeholder="Press F3 to Search" value='<s:property value="txtemployeeid"/>' onkeydown="getEmployeeId(event);"/>
                            <input type="hidden" id="txtemployeedocno" name="txtemployeedocno" value='<s:property value="txtemployeedocno"/>'/>
                        </td>
                    </tr>
                    <tr>
                        <td class="label-cell"></td>
                        <td>
                            <input type="text" id="txtemployeename" name="txtemployeename" readonly="readonly" placeholder="Employee Name" tabindex="-1" value='<s:property value="txtemployeename"/>'/>
                        </td>
                    </tr>
                </table>
            </div>

            <!-- Action Buttons -->
            <div class="filter-card" style="padding: 10px;">
                <div class="action-buttons">
                    <input type="button" class="myButtons" name="clear" id="clear" value="Clear" onclick="funClearInfo();">
                    <input type="button" class="mySaveButton" id="btnSaveOpening" name="btnSaveOpening" value="Save" onclick="funNotify();">
                </div>
            </div>

            <!-- Hidden inputs -->
            <input type="hidden" id="txtemployeeids" name="txtemployeeids" value='<s:property value="txtemployeeids"/>'/>
            <input type="hidden" id="gridlength" name="gridlength" value='<s:property value="gridlength"/>'/>
            <input type="hidden" name="mode" id="mode" value='<s:property value="mode"/>'>
            <input type="hidden" name="msg" id="msg" value='<s:property value="msg"/>'>

        </div>
    </div>

    <!-- ===== MAIN CONTENT ===== -->
    <div class="main-content-area">
        <div id="openingBalanceDetailsDiv"><jsp:include page="openingBalanceGrid.jsp"></jsp:include></div>
    </div>

</div>

<div id="employeeDetailsWindow">
    <div></div>
</div>

</div> 
</form>
</body>
</html>
