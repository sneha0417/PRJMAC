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
<style>
/* .myButtons {
	background:-webkit-gradient(linear, left top, left bottom, color-stop(0.05, #7d5d3b), color-stop(1, #634b30));
	background:-moz-linear-gradient(top, #7d5d3b 5%, #634b30 100%);
	background:-webkit-linear-gradient(top, #7d5d3b 5%, #634b30 100%);
	background:-o-linear-gradient(top, #7d5d3b 5%, #634b30 100%);
	background:-ms-linear-gradient(top, #7d5d3b 5%, #634b30 100%);
	background:linear-gradient(to bottom, #7d5d3b 5%, #634b30 100%);
	filter:progid:DXImageTransform.Microsoft.gradient(startColorstr='#7d5d3b', endColorstr='#634b30',GradientType=0);
	background-color:#7d5d3b;
	-moz-border-radius:1px;
	-webkit-border-radius:1px;
	border-radius:1px;
	display:inline-block;
	cursor:pointer;
	color:#ffffff;
	font-family:Arial;
	font-size:12px;
	padding:3px 17px;
	text-decoration:none;
}
.myButtons:hover {
	background:-webkit-gradient(linear, left top, left bottom, color-stop(0.05, #634b30), color-stop(1, #7d5d3b));
	background:-moz-linear-gradient(top, #634b30 5%, #7d5d3b 100%);
	background:-webkit-linear-gradient(top, #634b30 5%, #7d5d3b 100%);
	background:-o-linear-gradient(top, #634b30 5%, #7d5d3b 100%);
	background:-ms-linear-gradient(top, #634b30 5%, #7d5d3b 100%);
	background:linear-gradient(to bottom, #634b30 5%, #7d5d3b 100%);
	filter:progid:DXImageTransform.Microsoft.gradient(startColorstr='#634b30', endColorstr='#7d5d3b',GradientType=0);
	background-color:#634b30;
}
.myButtons:active {
	position:relative;
	top:1px;
}
 */
 .myButtons {
	background:-webkit-gradient(linear, left top, left bottom, color-stop(0.05, #7892c2), color-stop(1, #476e9e));
	background:-moz-linear-gradient(top, #7892c2 5%, #476e9e 100%);
	background:-webkit-linear-gradient(top, #7892c2 5%, #476e9e 100%);
	background:-o-linear-gradient(top, #7892c2 5%, #476e9e 100%);
	background:-ms-linear-gradient(top, #7892c2 5%, #476e9e 100%);
	background:linear-gradient(to bottom, #7892c2 5%, #476e9e 100%);
	filter:progid:DXImageTransform.Microsoft.gradient(startColorstr='#7892c2', endColorstr='#476e9e',GradientType=0);
	background-color:#7892c2;
	border:1px solid #4e6096;
	display:inline-block;
	cursor:pointer;
	color:#ffffff;
	font-family:Arial;
	font-size:12px;
	padding:2px 7px;
	text-decoration:none;
}
.myButtons:hover {
	background:-webkit-gradient(linear, left top, left bottom, color-stop(0.05, #476e9e), color-stop(1, #7892c2));
	background:-moz-linear-gradient(top, #476e9e 5%, #7892c2 100%);
	background:-webkit-linear-gradient(top, #476e9e 5%, #7892c2 100%);
	background:-o-linear-gradient(top, #476e9e 5%, #7892c2 100%);
	background:-ms-linear-gradient(top, #476e9e 5%, #7892c2 100%);
	background:linear-gradient(to bottom, #476e9e 5%, #7892c2 100%);
	filter:progid:DXImageTransform.Microsoft.gradient(startColorstr='#476e9e', endColorstr='#7892c2',GradientType=0);
	background-color:#476e9e;
}
.myButtons:active {
	position:relative;
	top:1px;
}      

        

</style>
	<script type="text/javascript">

	$(document).ready(function () { 
	    
		   $("#datess").jqxDateTimeInput({  width: '125px', height: '15px', formatString:"dd.MM.yyyy",value:null}); 
		   
		   
		 /*   if($("#cmbreftype").val()=="DEL")
				   {
			   $('#ref').attr('disabled', false);
				   } 
		   else
			   {
			   $('#ref').attr('disabled', true);
			   } */
			   
			   
		   
	});   
		   
  	function loadSearchss() {
 		
 		var docnoss=document.getElementById("docnoss").value;
 		 
 		var datess=document.getElementById("datess").value;
 		var refnosss=document.getElementById("refnosss").value;
 		
 		//alert("reftypeload===");

		
	var aa="yes";
		getdatas(docnoss,refnosss,datess,aa);
		document.getElementById("stockmsg").innerText="";

	}
	function getdatas(docnoss,refnosss,datess,aa){
		
		var clientid=document.getElementById("clientid").value;
		var reftype=$("#cmbreftype").val();
		//alert("reftype==="+reftype);
		
		var ref=$("#ref").val();
	
			 $("#refsearch").load('subrefnosearch.jsp?docnoss='+docnoss+'&datess='+datess+'&refnosss='+refnosss+'&aa='+aa+'&clientid='+clientid+'&reftype='+reftype+"&ref="+ref);
		

		}  
	
	
	function searchdata()
	{
		
		  var rows = $('#reqMastersearch').jqxGrid('getrows');
          var temp="";
          var temp2="";
          var aa=0;
          for(var i=0 ; i < rows.length ; i++){
      	    
              if(rows[i].chk==true)
           	   
           	   {
           	   
           	  aa=1;
           	   
           	   }
               	    
               	   } 
          
          if(parseInt(aa)==0)
        	  {
        	  
        	  document.getElementById("errormsg").innerText="Choose at least one request";
        		 

        		 return 0;
        	  }
          
          
          
          
           for(var i=0 ; i < rows.length ; i++){
        	    
       if(rows[i].chk==true)
    	   
    	   {
    	   
    	   temp=temp+rows[i].voc_no+",";
    	   temp2=temp2+rows[i].doc_no+",";
    	   
    	   }
        	    
        	   }
          
           document.getElementById("refmasterdocno").value=temp2.replace(/,\s*$/, "");
           
           document.getElementById("rrefno").value=temp.replace(/,\s*$/, "");
           
		
		 $('#refnosearchwindow').jqxWindow('close'); 
		// importsearchcontent('importoption.jsp');	
	       $.messager.confirm('Message', 'Do you want to Import?', function(r){
	        	  
 		       
		        	if(r==false)
		        	  {
		        		
		        		$("#prodsearchtype").val("1");
		        		/*  document.getElementById("rrefno").value="";
		        		 document.getElementById("reqmasterdocno").value=""; */
		        		 
		        		 $("#jqxInvoiceGrid").jqxGrid('clear');
		 			    $("#jqxInvoiceGrid").jqxGrid('addrow', null, {});
		        		return false; 
		        	  }
		        	else{
				  	
		        		$("#prodsearchtype").val("2");
		        		
		        		 var chk="req";
		       		  
		       		  var from="pro";
		       		  var reftype=$("#cmbreftype").val();
		       		  
		       		 var date=document.getElementById("date").value;
		       		var clientcaid=document.getElementById("clientcaid").value; 

		    		var clientid=document.getElementById("clientid").value;
		       		
		       		var cmbbilltype=document.getElementById("cmbbilltype").value; 
		       		 
		       		  
		       		  $("#invoiceDiv").load("invoiceGrid.jsp?enqdoc="+ document.getElementById("refmasterdocno").value+"&chk="+chk+"&from="+from+"&cond=1&reftype="+reftype+"&date="+date+"&catid="+clientcaid+"&cmbbilltype="+cmbbilltype+"&clientid="+clientid);	
		        		
		        		
		        		
		        	   }
     });  
		
		
	 
		 
           
          
	}
	
	

	</script>
<style>
/* =========================================================
   MASTER SEARCH UI - PURE WHITE PANEL
========================================================= */

body,
html{
    margin:0;
    padding:0;
    background:#ffffff !important;
    font-family:'Segoe UI',Tahoma,Verdana,sans-serif;
}

body[bgcolor]{
    background:#ffffff !important;
}

#search{
    background:#ffffff !important;
    padding:10px;
}

.search-panel{
    background:#ffffff !important;
    border:1px solid #d6d6d6;
    border-radius:4px;
    padding:12px;
    margin-bottom:12px;
}

.search-panel table{
    width:100%;
    border-collapse:collapse;
}

.search-panel td{
    padding:6px;
    vertical-align:middle;
}

.lbl-right{
    text-align:right;
    white-space:nowrap;
    font-size:12px;
    font-weight:500;
    color:#333;
    padding-right:8px;
}

.search-panel input[type="text"]{
    width:100%;
    height:28px;
    border:1px solid #cfcfcf;
    border-radius:3px;
    padding:2px 8px;
    box-sizing:border-box;
    background:#ffffff;
    font-size:12px;
}

.grid-container{
    background:#ffffff !important;
    border:1px solid #cccccc;
    border-radius:4px;
    overflow:hidden;
}
</style>

<body>

<div id="search">

    <!-- Search Panel -->

    <div class="search-panel">

        <table>

            <colgroup>
                <col width="8%">
                <col width="18%">
                <col width="8%">
                <col width="18%">
                <col width="20%">
                <col width="14%">
                <col width="14%">
            </colgroup>

            <tr>

                <td class="lbl-right">
                    Doc No
                </td>

                <td>
                    <input type="text"
                           name="docnoss"
                           id="docnoss"
                           value='<s:property value="docnoss"/>'>

                    <input type="hidden"
                           name="refnosss"
                           id="refnosss"
                           value='<s:property value="refnosss"/>'>
                </td>

                <td class="lbl-right">
                    Date
                </td>

                <td>
                    <div id="datess"
                         name="datess"
                         value='<s:property value="datess"/>'>
                    </div>
                </td>

                <td></td>

                <!-- Search Button -->

                <td align="center">

                    <button type="button"
                            id="searchss"
                            onclick="loadSearchss();"
                            style="
                                width:110px;
                                height:30px;
                                background:#205fd3;
                                color:#ffffff;
                                border:1px solid #205fd3;
                                border-radius:4px;
                                font-size:12px;
                                font-weight:600;
                                cursor:pointer;">
                        Search
                    </button>

                </td>

                <!-- Submit Button -->

                <td align="center">

                    <button type="button"
                            id="searchs"
                            onclick="searchdata();"
                            style="
                                width:110px;
                                height:30px;
                                background:#16a34a;
                                color:#ffffff;
                                border:1px solid #16a34a;
                                border-radius:4px;
                                font-size:12px;
                                font-weight:600;
                                cursor:pointer;">
                        Submit
                    </button>

                </td>

            </tr>

        </table>

    </div>

    <!-- Grid -->

    <div class="grid-container">

        <div id="refsearch">

            <jsp:include page="subrefnosearch.jsp"></jsp:include>

        </div>

    </div>

</div>

</body>
</html>