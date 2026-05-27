 <%@ taglib prefix="s" uri="/struts-tags" %>
 <% String contextPath=request.getContextPath();%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link href="<%=contextPath%>/css/body.css" media="screen" rel="stylesheet" type="text/css" />
<title>GatewayERP(i)</title>

	<script type="text/javascript">
	$(document).ready(function () {
	 $("#txtdoj").jqxDateTimeInput({ width: '110px', height: '15px',formatString:"dd.MM.yyyy",value:null});
	 
	 getEmpDesignation();getEmpDepartment();
	}); 

	function getEmpDesignation() {
		var x = new XMLHttpRequest();
		x.onreadystatechange = function() {
			if (x.readyState == 4 && x.status == 200) {
				var items = x.responseText;
				items = items.split('####');
				var designationItems = items[0].split(",");
				var designationIdItems = items[1].split(",");
				var optionsdesignation = '<option value="">--Select--</option>';
				for (var i = 0; i < designationItems.length; i++) {
					optionsdesignation += '<option value="' + designationIdItems[i] + '">'
							+ designationItems[i] + '</option>';
				}
				$("select#employeedesignation").html(optionsdesignation);
			} else {}
		}
		x.open("GET", "getDesignation.jsp", true);
		x.send();
	}
  
  	function getEmpDepartment() {
		var x = new XMLHttpRequest();
		x.onreadystatechange = function() {
			if (x.readyState == 4 && x.status == 200) {
				var items = x.responseText;
				items = items.split('####');
				var departmentItems = items[0].split(",");
				var departmentIdItems = items[1].split(",");
				var optionsdepartment = '<option value="">--Select--</option>';
				for (var i = 0; i < departmentItems.length; i++) {
					optionsdepartment += '<option value="' + departmentIdItems[i] + '">'
							+ departmentItems[i] + '</option>';
				}
				$("select#employeedepartment").html(optionsdepartment);
			} else {}
		}
		x.open("GET", "getDepartment.jsp", true);
		x.send();
	}
  
 	function loadSearch() {
 		
 		var empname=document.getElementById("txtempname").value;
 		var mob=document.getElementById("txtmobile").value;
 		var employeedesignation=document.getElementById("employeedesignation").value;
 		var employeedepartment=document.getElementById("employeedepartment").value;
 		var empid=document.getElementById("txtempid").value;
 		var doj=document.getElementById("txtdoj").value;
 		var employeebranchchk=window.parent.employeebranchchk.value; 
 		var branch=document.getElementById("brchName").value; 
        var check = 1;
        
 		getdata(empname,mob,employeedesignation,employeedepartment,empid,doj,check, employeebranchchk, branch);
	}
 	
	function getdata(empname,mob,employeedesignation,employeedepartment,empid,doj,check, employeebranchchk, branch){
		
		 $("#refreshdiv").load('employeeDetailsSearchGrid.jsp?empname='+empname.replace(/ /g, "%20")+'&mob='+mob+'&employeedesignation='+employeedesignation+'&employeedepartment='+employeedepartment+'&empid='+empid+'&doj='+doj+'&check='+check+'&branchid='+branch+'&employeebranchchk='+employeebranchchk);
		}

	</script>
<style>
/* =========================================================
   SCOPED UI: Pure White Panel (Master UI)
========================================================= */
body, html {
    margin: 0;
    padding: 0;
    background-color: #ffffff !important;
    font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
}

.modern-ui {
    font-size: 12px;
    color: #333;
    padding: 10px;
    box-sizing: border-box;
    width: 100%;
    background-color: #ffffff !important;
}

/* Master Input Styles */
.modern-ui input[type="text"],
.modern-ui select {
    height: 24px !important;
    border: 1px solid #cccccc;
    border-radius: 3px;
    padding: 2px 6px;
    font-size: 12px;
    font-family: inherit;
    box-sizing: border-box;
    background-color: #ffffff;
    color: #333;
    width: 100%;
}

.modern-ui input[type="text"]:focus,
.modern-ui select:focus {
    border-color: #2563eb;
    outline: none;
}

/* Panel Styling */
.modern-ui .search-panel {
    background-color: #ffffff !important;
    border: 1px solid #cccccc;
    border-radius: 4px;
    padding: 15px 10px;
    margin-bottom: 15px;
    width: 100%;
    box-sizing: border-box;
}

/* Table Alignment */
.modern-ui table {
    border-collapse: separate;
    border-spacing: 5px 8px;
    width: 100%;
    table-layout: fixed;
}

.modern-ui td {
    vertical-align: middle;
}

.modern-ui .lbl-right {
    text-align: right;
    color: #333;
    font-size: 12px;
    font-weight: 500;
    font-family: inherit;
    white-space: nowrap;
    padding-right: 5px;
}

/* Search Button */
.modern-ui .myButton {
    height: 28px;
    padding: 0 24px;
    background-color: #205fd3;
    color: #ffffff;
    border: none;
    border-radius: 4px;
    cursor: pointer;
    font-size: 12px;
    font-weight: 600;
    font-family: inherit;
    transition: background-color 0.2s;
}

.modern-ui .myButton:hover {
    background-color: #1a4eb8;
}

/* Grid Container */
.modern-ui .grid-container {
    background-color: #ffffff !important;
    border: 1px solid #cccccc;
    border-radius: 4px;
    overflow: hidden;
    width: 100%;
    min-height: 200px;
}
</style>

<body style="background-color:#ffffff;">

<div id="search" class="modern-ui">

    <div class="search-panel">

        <table width="100%" border="0" cellspacing="0" cellpadding="0">

            <colgroup>
                <col width="10%">
                <col width="22%">
                <col width="10%">
                <col width="18%">
                <col width="8%">
                <col width="12%">
                <col width="10%">
                <col width="10%">
            </colgroup>

            <tr>

                <td class="lbl-right">Name</td>
                <td colspan="3">
                    <input type="text" 
                           name="txtempname" 
                           id="txtempname"
                           value='<s:property value="txtempname"/>'>
                </td>

                <td class="lbl-right">Mob</td>
                <td>
                    <input type="text" 
                           name="txtmobile" 
                           id="txtmobile"
                           value='<s:property value="txtmobile"/>'>
                </td>

                <td colspan="2" align="center">
                    <button type="button"
                            name="btnsearch"
                            id="btnsearch"
                            class="myButton"
                            onclick="loadSearch(); return false;">
                        Search
                    </button>
                </td>

            </tr>

            <tr>

                <td class="lbl-right">Designation</td>
                <td>
                    <select id="employeedesignation"
                            name="employeedesignation"
                            value='<s:property value="employeedesignation"/>'>
                        <option value="">--Select--</option>
                    </select>
                </td>

                <td class="lbl-right">Department</td>
                <td>
                    <select id="employeedepartment"
                            name="employeedepartment"
                            value='<s:property value="employeedepartment"/>'>
                        <option value="">--Select--</option>
                    </select>
                </td>

                <td class="lbl-right">Emp#</td>
                <td>
                    <input type="text"
                           name="txtempid"
                           id="txtempid"
                           value='<s:property value="txtempid"/>'>
                </td>

                <td class="lbl-right">Date of Join</td>
                <td>
                    <div id="txtdoj"
                         name="txtdoj"
                         value='<s:property value="txtdoj"/>'>
                    </div>
                </td>

            </tr>

        </table>

    </div>

    <div class="grid-container">
        <div id="refreshdiv">
            <jsp:include page="employeeDetailsSearchGrid.jsp"></jsp:include>
        </div>
    </div>

</div>

</body>
</html>