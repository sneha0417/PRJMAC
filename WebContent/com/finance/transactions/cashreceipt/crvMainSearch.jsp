<%@ taglib prefix="s" uri="/struts-tags" %>
<% String contextPath=request.getContextPath();%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>GatewayERP(i)</title>
<link href="<%=contextPath%>/css/body.css" media="screen" rel="stylesheet" type="text/css" />

<style>
/* =========================================================
   SCOPED UI: Pure White Panel (Matches Reference)
========================================================= */
body, html {
    margin: 0;
    padding: 0;
    background-color: #ffffff !important; /* Forced pure white for the entire page */
    font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif; 
}

.modern-ui {
    font-size: 12px;
    color: #333;
    padding: 10px;
    box-sizing: border-box;
    width: 100%;
    background-color: #ffffff !important; /* Forced pure white */
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

/* Panel Styling - Clean White Panel */
.modern-ui .search-panel {
    background-color: #ffffff !important; /* Pure white inside the border */
    border: 1px solid #cccccc;
    border-radius: 4px;
    padding: 15px 10px;
    margin-bottom: 15px;
    width: 100%;
    box-sizing: border-box;
}

/* Table Alignment - STRICT PERCENTAGE GRID */
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

/* Search Button - Standard Blue */
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
    background-color: #ffffff !important; /* Pure white */
    border: 1px solid #cccccc;
    border-radius: 4px;
    overflow: hidden;
    width: 100%;
    min-height: 200px;
}
</style>

<script type="text/javascript">
    $(document).ready(function () {
        /* Aligning JQX widget to standard 24px height */
        $("#receiptdate").jqxDateTimeInput({ 
            width: '100%', 
            height: '24px', 
            formatString: "dd.MM.yyyy", 
            value: null,
            theme: 'light' // Use light theme to prevent colored backgrounds inside the widget
        });
        
        /* Force internal alignment to prevent JQX visual bugs */
        setTimeout(function () {
            $(".jqx-datetimeinput").css({"margin-top": "0px", "border-color": "#cccccc", "border-radius": "3px", "background-color": "#ffffff"});
            $(".jqx-datetimeinput").find("input").css({
                "margin-top": "0px", "line-height": "24px", "font-size": "12px", 
                "font-family": "inherit", "padding": "0 6px", "box-sizing":"border-box", "background-color": "#ffffff"
            });
            $(".jqx-datetimeinput").find(".jqx-action-button").css({"top": "0px", "height": "24px"});
        }, 50);
    }); 

    function loadSearch() {
        var partyname = document.getElementById("txtpartyname").value || "";
        var docNo = document.getElementById("txtdocno").value || "";
        var date = $('#receiptdate').jqxDateTimeInput('val') || "";
        var amount = document.getElementById("txtamount").value || "";
        var check = 1;
        
        getdata(partyname, docNo, date, amount, check);
    }

    function getdata(partyname, docNo, date, amount, check){
         $("#refreshdiv").load('crvMainSearchGrid.jsp?partyname=' + encodeURIComponent(partyname) + 
                               '&docNo=' + encodeURIComponent(docNo) + 
                               '&date=' + encodeURIComponent(date) + 
                               '&amount=' + encodeURIComponent(amount) + 
                               '&check=' + check);
    }
</script>
</head>

<body style="background-color: #ffffff;">

<div id="search" class="modern-ui">

    <div class="search-panel">
        <table width="100%" border="0" cellspacing="0" cellpadding="0">
            <colgroup>
                <col width="12%" /> 
                <col width="28%" /> 
                <col width="12%" /> 
                <col width="28%" /> 
                <col width="20%" />
            </colgroup>
            
            <tr>
                <td class="lbl-right">Name</td>
                <td>
                    <input type="text" name="txtpartyname" id="txtpartyname" value='<s:property value="txtpartyname"/>'>
                </td>
                
                <td class="lbl-right">Doc No</td>
                <td>
                    <input type="text" name="txtdocno" id="txtdocno" value='<s:property value="txtdocno"/>'>
                </td>
                
                <td align="center" rowspan="2" valign="middle">
                    <button type="button" name="btnsearch" id="btnsearch" class="myButton" onclick="loadSearch(); return false;">
                        Search
                    </button>
                </td>
            </tr>
            
            <tr>
                <td class="lbl-right">Date</td>
                <td>
                    <div id="receiptdate" name="receiptdate" value='<s:property value="receiptdate"/>'></div>
                    <input type="hidden" name="hidreceiptdate" id="hidreceiptdate" value='<s:property value="hidreceiptdate"/>'>
                </td>
                
                <td class="lbl-right">Amount</td>
                <td>
                    <input type="text" name="txtamount" id="txtamount" value='<s:property value="txtamount"/>'>
                </td>
            </tr>

        </table>
    </div>

    <div class="grid-container">
        <div id="refreshdiv">
            <jsp:include page="crvMainSearchGrid.jsp"></jsp:include>
        </div>
    </div>

</div>

</body>
</html>