 <%@ taglib prefix="s" uri="/struts-tags" %>
 <% String contextPath=request.getContextPath(); %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link href="<%=contextPath%>/css/body.css" media="screen" rel="stylesheet" type="text/css" />
<title>GatewayERP(i)</title>

<style>
body,
html {
    margin: 0;
    padding: 0;
    background: #ffffff !important;
    font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
}

.modern-ui {
    font-size: 12px;
    color: #333;
    padding: 10px;
    box-sizing: border-box;
    width: 100%;
    background: #ffffff !important;
}

.modern-ui,
.modern-ui table,
.modern-ui td,
.modern-ui input {
    font-weight: 400 !important;
}

.modern-ui input[type="text"] {
    height: 24px !important;
    border: 1px solid #cccccc;
    border-radius: 3px;
    padding: 2px 6px;
    font-size: 12px;
    width: 100%;
    box-sizing: border-box;
    background: #ffffff;
}

.modern-ui input[type="text"]:focus {
    border-color: #2563eb;
    outline: none;
}

.search-panel {
    background: #ffffff;
    border: 1px solid #cccccc;
    border-radius: 4px;
    padding: 15px 10px;
    margin-bottom: 15px;
}

.modern-ui table {
    border-collapse: separate;
    border-spacing: 5px 8px;
    width: 100%;
    table-layout: fixed;
}

.lbl-right {
    text-align: right;
    color: #333;
    font-size: 12px;
    font-weight: 600 !important;
    padding-right: 5px;
}

.action-buttons {
    display: flex;
    gap: 8px;
    justify-content: center;
}

div#search.modern-ui input#btnsearch.myButton,
div#search.modern-ui input#btnsearchselectok.myButton {
    height: 24px !important;
    min-width: 80px;
    background-color: #205fd3 !important;
    color: #ffffff !important;
    border: none !important;
    border-radius: 4px !important;
    cursor: pointer;
    font-size: 12px !important;
    font-weight: 600 !important;
}

div#search.modern-ui input#btnsearch.myButton:hover,
div#search.modern-ui input#btnsearchselectok.myButton:hover {
    background-color: #124096 !important;
}

.grid-container {
    background: #ffffff;
    border: 1px solid #cccccc;
    border-radius: 4px;
    overflow: hidden;
    min-height: 200px;
}
</style>


	<script type="text/javascript">
	$(document).ready(function () {}); 

 	function loadFillSearch() {

 		var employeeName=document.getElementById("txtfillpartyname").value;
 		var empId=document.getElementById("txtfillpartyid").value;
 		var contactNo=document.getElementById("txtfillcontactno").value;
 		
		getdata(employeeName,empId,contactNo);
	}
	function getdata(employeeName,empId,contactNo){
		 $("#refreshdiv").load('employeeDetailsMultiSearchGrid.jsp?employeename='+employeeName.replace(/ /g, "%20")+'&empid='+empId+'&contactno='+contactNo);
		}
	
	function loadSearchSelect(){
		
		var rows = $("#employeeDetailsMultiSearch").jqxGrid('getrows');
		
		var selectedrows=$("#employeeDetailsMultiSearch").jqxGrid('selectedrowindexes');
		selectedrows = selectedrows.sort(function(a,b){return a - b});
		
		var i=0;var j=0;var k=0;var tempcodeno="",tempdocno="";
	    for (i = 0; i < rows.length; i++) {
				if(selectedrows[j]==i){
					
					if(k==0){
						tempcodeno=rows[i].codeno;
						tempdocno=rows[i].doc_no;
					}
					else{
						tempcodeno=tempcodeno+","+rows[i].codeno;
						tempdocno=tempdocno+","+rows[i].doc_no;
					}
					tempcodeno1=tempcodeno;
					tempdocno1=tempdocno;
				k++;	
				j++; 
			  }
            }
	    $('#txtselectedempids').val(tempcodeno1);
	    $('#txtselectedempdocnos').val(tempdocno1);
	    
	    $('#employeeDetailsWindow').jqxWindow('close'); 
	}

	</script>
<body>
<div id="search" class="modern-ui">

```
<div class="search-panel">
    <table width="100%" border="0" cellspacing="0" cellpadding="0">
        <colgroup>
            <col width="10%" />
            <col width="35%" />
            <col width="10%" />
            <col width="20%" />
            <col width="25%" />
        </colgroup>

        <tr>
            <td class="lbl-right">Name</td>
            <td>
                <input type="text"
                       name="txtfillpartyname"
                       id="txtfillpartyname"
                       value='<s:property value="txtfillpartyname"/>'>
            </td>

            <td class="lbl-right">ID#</td>
            <td>
                <input type="text"
                       name="txtfillpartyid"
                       id="txtfillpartyid"
                       value='<s:property value="txtfillpartyid"/>'>
            </td>

            <td rowspan="2" align="center" valign="middle">
                <div class="action-buttons">
                    <input type="button"
                           name="btnsearch"
                           id="btnsearch"
                           class="myButton"
                           value="Search"
                           onclick="loadFillSearch();">

                    <input type="button"
                           name="btnsearchselectok"
                           id="btnsearchselectok"
                           class="myButton"
                           value="OK"
                           onclick="loadSearchSelect();">
                </div>
            </td>
        </tr>

        <tr>
            <td class="lbl-right">Contact No.</td>
            <td>
                <input type="text"
                       name="txtfillcontactno"
                       id="txtfillcontactno"
                       value='<s:property value="txtfillcontactno"/>'>
            </td>

            <td colspan="2"></td>
        </tr>
    </table>
</div>

<div class="grid-container">
    <div id="refreshdiv">
        <jsp:include page="employeeDetailsMultiSearchGrid.jsp"></jsp:include>
    </div>
</div>
```

</div>
</body>

</html>