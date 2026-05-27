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
	    
		   /* Date */ 	
	    $("#datess").jqxDateTimeInput({  width: '125px', height: '15px', formatString:"dd.MM.yyyy",value:null}); 
		   
	});   
		   
 	function loadSearchs() {
 		
 		var docnoss=document.getElementById("docnoss").value;
 		var accountss=document.getElementById("types").value;
 	 
 		var datess=document.getElementById("datess").value;
 		var prjdocnos=document.getElementById("prjdocnos").value;
 
 		
		
	var aa="yes";
		getdata(docnoss,accountss,datess,aa,prjdocnos);
 

	}
	function getdata(docnoss,accountss,datess,aa,prjdocnos){
		
		 $("#refreshdivs").load('Subsearch.jsp?docnoss='+docnoss+'&types='+accountss+'&datess='+datess+'&aa='+aa+"&prjdocnos="+prjdocnos);

		}

	</script>
<body>
    <div id="search">
        
        <div class="search-bar-wrapper">
            <table width="100%">
                <tr>
                    <td align="right" width="8%">Doc No</td>
                    <td align="left" width="14%">
                        <input type="text" name="docnoss" id="docnoss" style="width:100%;" value='<s:property value="docnoss"/>'>
                    </td>
                    
                    <td align="right" width="5%">Type</td>
                    <td align="left" width="14%">
                        <input type="text" name="types" id="types" style="width:100%;" value='<s:property value="types"/>'>
                    </td>
                    
                    <td align="right" width="8%">Job No</td>
                    <td align="left" width="14%">
                        <input type="text" name="prjdocnos" id="prjdocnos" style="width:100%;" value='<s:property value="prjdocnos"/>'>
                    </td>
                    
                    <td align="right" width="5%">Date</td>
                    <td align="left" width="16%">
                        <div id="datess" name="datess" value='<s:property value="datess"/>'></div>
                    </td>
                    
                    <td align="left" width="20%">
                        <input type="button" name="searchs" id="searchs" class="myButton" value="Search" onclick="loadSearchs()">
                    </td>
                </tr>
            </table>
        </div>
        
        <table width="100%">
            <tr>
                <td align="right">
                    <div id="refreshdivs">
                        <jsp:include page="Subsearch.jsp"></jsp:include> 
                    </div>
                </td>
            </tr>
        </table>
        
    </div>
</body>
</html>