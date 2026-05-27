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
 <link href="<%=contextPath%>/css/body.css" media="screen" rel="stylesheet" type="text/css" />
</style>

	<script type="text/javascript">

	$(document).ready(function () { 
	    
		   $("#datess").jqxDateTimeInput({  width: '125px', height: '15px', formatString:"dd.MM.yyyy",value:null}); 
		   
	});   
		   
  	function loadSearchss() {
 		
 		var docnoss=document.getElementById("docnoss").value;
 		 
 		var datess=document.getElementById("datess").value;
 		var refnosss=document.getElementById("refnosss").value;
 		
 		 var headacccode=document.getElementById("accdocno").value;
 		var reftype=document.getElementById("reftype").value;

		
	var aa="yes";
		getdatas(docnoss,refnosss,datess,aa,headacccode,reftype);
 

	}
	function getdatas(docnoss,refnosss,datess,aa,headacccode,reftype){
		
		 $("#refsearch").load('purchaseordersubrefnosearch.jsp?docnoss='+docnoss+'&datess='+datess+'&refnosss='+refnosss+'&aa='+aa+'&headacccode='+headacccode+'&reftype='+reftype);

		}  
	
	
	function searchdata()
	{
		
		  var rows = $('#vehreqMastersearch').jqxGrid('getrows');
          var temp="";
          var temp1="";
          var aa=0;
          for(var i=0 ; i < rows.length ; i++){
      	    
              if(rows[i].chk==true)
           	   
           	   {
           	   
           	  aa=1;
           	   
           	   }
               	    
               	   } 
          
          if(parseInt(aa)==0)
        	  {
        	  
        	  document.getElementById("errormsg").innerText="Choose at least one option";
        		 

        		 return 0;
        	  }
          
          
          var mm=0;
          
           for(var i=0 ; i < rows.length ; i++){
        	    
       if(rows[i].chk==true)
    	   
    	   {
    	   
    	   if(mm==0)
		   { 
		   $('#deliverydate').val(rows[i].deldate);
		   document.getElementById("refno").value=rows[i].refno;
		   document.getElementById("delterms").value=rows[i].delterms;
		   document.getElementById("payterms").value=rows[i].payterms;
		   document.getElementById("purdesc").value=rows[i].description;
		   document.getElementById("itemtype").value=rows[i].costtype;
		   document.getElementById("itemdocno").value=rows[i].costcode;
		   document.getElementById("itemname").value=rows[i].prjname;
		   document.getElementById("costtr_no").value=rows[i].costtr_no;
		   mm=1;
		   }
    	  
    	   
    	   
    	   temp=temp+rows[i].voc_no+",";
    	   temp1=temp1+rows[i].doc_no+",";
    	   
    	   }
        	    
        	   }    
           document.getElementById("reqmasterdocno").value=temp1.replace(/,\s*$/, "");
           
           document.getElementById("rrefno").value=temp.replace(/,\s*$/, "");
           
		
		 $('#refnosearchwindow').jqxWindow('close'); 
		// importsearchcontent('importoption.jsp');	
	       $.messager.confirm('Message', 'Do you want to Import?', function(r){
	        	  
 		       
		        	if(r==false)
		        	  {
		        		/*  document.getElementById("rrefno").value="";
		        		 document.getElementById("reqmasterdocno").value=""; */
		        		 
		        		 $("#serviecGrid").jqxGrid('clear');
		 			    $("#serviecGrid").jqxGrid('addrow', null, {});
		 			    
		 			/*    $("#descdetailsGrid").jqxGrid('clear');
		 			    $("#descdetailsGrid").jqxGrid('addrow', null, {});
		 			    
		 			     */
		 			    var load="1";
		 			    $("#descdetail").load("descgridDetails.jsp?reqdoc="+document.getElementById("reqmasterdocno").value+"&load="+load);
		 			    
		        		return false; 
		        	  }
		        	else{
				 
		        		
		        		 var chk="req";
		        		 
		        		 var search ="PO";
		        		 
		       		  
		       		  var from="pro";
		      		  var load="1";
		      		  var accdocno = document.getElementById("accdocno").value; 
		        		 var dates=document.getElementById("masterdate").value; 
				    		
		        	 		var cmbbilltype=document.getElementById("cmbbilltype").value;
		        	 		
		       		  $("#sevdesc").load("serviecgrid.jsp?reqdoc="+ document.getElementById("reqmasterdocno").value+"&chk="+chk+"&from="+from+"&search="+search+"&cmbbilltype="+cmbbilltype+"&dates="+dates+"&accdocno="+accdocno);	
		        		 
		       		  $("#descdetail").load("descgridDetails.jsp?reqdoc="+document.getElementById("reqmasterdocno").value+"&load="+load);	
		        		
		        	   }
     });  
		
		
	 
		 
           
          
	}
	
	

	</script>
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
    width: 100px; /* Standardized width for stacked buttons */
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
                <td class="lbl-right">Doc No</td>
                <td>
                    <input type="text" name="docnoss" id="docnoss" value='<s:property value="docnoss"/>'>
                </td>
                
                <td class="lbl-right">Ref No</td>
                <td>
                    <input type="text" name="refnosss" id="refnosss" value='<s:property value="refnosss"/>'>
                </td>
                
                <td align="center" rowspan="2" valign="middle">
                    <button type="button" name="searchss" id="searchss" class="myButton" onclick="loadSearchss(); return false;" style="margin-bottom: 5px;">
                        Search
                    </button>
                    <br/>
                    <button type="button" name="searchs" id="searchs" class="myButton" onclick="searchdata(); return false;">
                        Submit
                    </button>
                </td>
            </tr>
            
            <tr>
                <td class="lbl-right">Date</td>
                <td>
                    <div id="datess" name="datess" value='<s:property value="datess"/>'></div>
                </td>
                <td></td>
                <td></td>
            </tr>

        </table>
    </div>

    <div class="grid-container">
        <div id="refsearch">
            <jsp:include page="purchaseordersubrefnosearch.jsp"></jsp:include> 
        </div>
    </div>

</div>

</body>
</html>