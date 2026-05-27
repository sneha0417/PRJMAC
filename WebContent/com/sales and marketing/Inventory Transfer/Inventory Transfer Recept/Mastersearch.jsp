 <%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html>
<html>
<head>
 
<% String contextPath=request.getContextPath();%>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>GatewayERP(i)</title>
 <%--   <jsp:include page="../../../../includes.jsp"></jsp:include>   --%>   
<style>
     #search {
            font-family: Arial, sans-serif;
            font-size: 12px;
            padding: 10px;
            background-color: #fff !important;
        }

        #search .search-bar-wrapper {
            border: 1px solid #b8c6d8;
            background-color: #fff;
            border-radius: 4px;
            padding: 10px 5px;
            margin-bottom: 15px;
        }

        #search table {
            width: 100%;
            border-collapse: collapse;
            margin-bottom: 5px;
        }

        #search td {
            padding: 4px 5px;
            vertical-align: middle;
        }

        #search input[type="text"] {
            height: 24px;
            border: 1px solid #b8c6d8;
            border-radius: 3px;
            padding: 2px 6px;
            box-sizing: border-box;
            background-color: #fff;
            color: #333;
            outline: none;
        }

        #search input[type="text"]:focus {
            border-color: #0b45a2;
        }

        #search .myButton {
            height: 26px;
            padding: 0 15px;
            font-size: 11px;
            font-weight: bold;
            border-radius: 3px;
            cursor: pointer;
            border: none;
            background: linear-gradient(135deg, #0b45a2 0%, #2563eb 100%);
            color: #ffffff;
            box-shadow: 0 1px 2px rgba(0,0,0,0.1);
        }

        #search .myButton:hover {
            background: linear-gradient(135deg, #083a8a 0%, #1d4ed8 100%);
        }

        #search #refreshdivs {
            margin-top: 10px;
            width: 100%;
        }
    </style>

	<script type="text/javascript">
	$(document).ready(function () {
	  $("#sdate").jqxDateTimeInput({ width: '125px', height: '15px',formatString:"dd.MM.yyyy",value:null}); 
	}); 

 	function qotloadSearch1() {
 		
 		var sdate=document.getElementById("sdate").value;
 		 var tobranch=document.getElementById("tobranch").value;
 		var tolocation=document.getElementById("tolocation").value;
 		var msdocno=document.getElementById("msdocno").value; 
 		var reftype=document.getElementById("reftype").value; 
 		
 		
	getdata1(tobranch,msdocno,tolocation,sdate,reftype);
 

	}
	function getdata1(tobranch,msdocno,tolocation,sdate,reftype){
		

		
		 $("#refreshdivmas").load('subMastersearch.jsp?tobranch='+tobranch+'&msdocno='+msdocno+'&tolocation='+tolocation+'&sdate='+sdate+'&reftype='+reftype);
		
		}

	</script>
<body >
<div id=search>
<div class="search-bar-wrapper">
<table width="100%">
  <tr>
    <td width="5%" align="right">Docno</td>
    <td width="11%" align="left">
      <input type="text" name="msdocno" id="msdocno" style="width:100%;" value='<s:property value="msdocno"/>'>
    </td>
    
    <td width="7%" align="right">To Branch</td>
    <td width="12%" align="left">
      <input type="text" name="tobranch" id="tobranch" style="width:100%;" value='<s:property value="tobranch"/>'>
    </td>
    
    <td width="7%" align="right">To Loc</td>
    <td width="12%" align="left">
      <input type="text" name="tolocation" id="tolocation" style="width:100%;" value='<s:property value="tolocation"/>'>
    </td>
    
    <td width="4%" align="right">Type</td>
    <td width="15%" align="left">
      <select id="reftype" name="reftype" style="width:100%;" value='<s:property value="reftype"/>'>
        <option value="">----select------</option>
        <option value="IBT">Branch Transfer (IBT)</option>
        <option value="ILT">Location Transfer (ILT)</option>
      </select>
    </td>
    
    <td width="5%" align="right">Date</td>
    <td width="12%" align="left">
      <div id="sdate" name="sdate" value='<s:property value="sdate"/>'></div>
    </td>
    
    <td width="10%" align="center">
      <input type="button" name="qotbtnrasearch" id="qotbtnrasearch" class="myButton" value="Search" onclick="qotloadSearch1()">
    </td>
  </tr>
</table>
</div>
<table>

  <tr>
    <td colspan="8" align="right">
    
    <div id="refreshdivmas">
      
   <jsp:include  page="subMastersearch.jsp"></jsp:include> 
   
   </div>
    </td>
  </tr>
</table>
  </div>
</body>
</html>