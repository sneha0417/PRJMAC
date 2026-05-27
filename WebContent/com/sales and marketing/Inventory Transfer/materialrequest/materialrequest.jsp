<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html>
 <% String contextPath=request.getContextPath();%>

<html>
<head>
<title>GatewayERP(i)</title>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
 <jsp:include page="../../../../includeso.jsp"></jsp:include>

<style>
form label.error {
color:red;
  font-weight:bold;

}

.textbox {
    border: 0;
    height: 25px;
    width: 20%;
    border-radius: 5px;
    -moz-border-radius: 5px;
    -webkit-border-radius: 5px;
    box-shadow: 1px 1px 0 0 #E0ECF8, 5px 5px 40px 2px #E0ECF8 inset;
    -moz-box-shadow: 1px 1px 0 0 #E0ECF8, 5px 5px 40px 2px #E0ECF8 inset;
    -webkit-box-shadow: 1px 1px 0 0 #E0ECF8, 5px 5px 40px 2px #E0ECF8 inset;
    -webkit-background-clip: padding-box;
    outline: 0;
}

body {
    background: linear-gradient(135deg, #f5f7fa 0%, #c3cfe2 100%);
    font-family: 'Segoe UI', 'Roboto', 'Arial', sans-serif;
    color: #222;
    margin: 0;
    padding: 24px 0;
    box-sizing: border-box;
    overflow-y: auto !important;
}

#mainBG {
    background: #fff;
    border-radius: 16px;
    padding: 15px;
    max-width: 100%;
    margin: 0 auto;
    box-shadow: 0 4px 24px rgba(0,0,0,0.06);
}

#frmmr input[type="text"],
#frmmr select,
.textbox { 
    height: 24px !important; 
    border: 1px solid #b8c6d8; 
    border-radius: 3px; 
    padding: 2px 6px;
    font-size: 12px;
    font-family: Arial, sans-serif;
    box-sizing: border-box; 
    background-color: #fff; 
    color: #333;
    box-shadow: none !important;
    outline: none;
}

#frmmr input[type="text"]:focus,
#frmmr select:focus,
.textbox:focus { 
    border-color: #007bff; 
}

#frmmr input[readonly],
#frmmr input:disabled,
#frmmr select:disabled,
.textbox[readonly] { 
    background-color: #f8f9fa; 
    color: #6b7280;
}

fieldset {
    border: 1px solid #c5d3e0; 
    padding: 8px 8px 4px 8px; 
    background: #ffffff; 
    position: relative; 
    border-radius: 4px; 
    margin-bottom: 12px;
    margin-top: 10px;
}

legend {
    background: #ffffff; 
    padding: 0 8px; 
    color: #0056b3;
    font-weight: bold; 
    font-size: 14px; 
    font-family: Arial, sans-serif;
    border-left: 3px solid #0056b3;
    line-height: normal; 
    margin-left: -2px; 
}

#frmmr table {
    width: 100%;
    border-collapse: separate;
    border-spacing: 0 8px; 
}

#frmmr td {
    padding: 0 5px;
    vertical-align: middle;
    font-family: Arial, sans-serif; 
    font-size: 12px; 
    color: #333;
}

#frmmr td[align="right"] {
    text-align: right; 
    color: #444;
    font-size: 12px; 
    font-weight: bold;
    white-space: nowrap; 
    padding-right: 10px;
}

form label.error {
    color: red;
    font-weight: bold;
    font-size: 11px;
    font-family: Arial, sans-serif;
}

.myButton {
    height: 24px !important;
    line-height: 22px !important;
    padding: 0 12px;
    font-family: Arial, sans-serif;
    font-size: 11px;
    font-weight: bold;
    border-radius: 3px;
    cursor: pointer;
    text-shadow: none;
    transition: all 0.2s;
    box-shadow: 0 1px 2px rgba(0,0,0,0.1);
    border: none;
    background: linear-gradient(135deg, #0b45a2 0%, #2563eb 100%);
    color: #ffffff;
    white-space: nowrap;
    display: inline-block;
    box-sizing: border-box;
}

.myButton:hover { 
    background: linear-gradient(135deg, #083a8a 0%, #1d4ed8 100%); 
}

#sevdesc {
    border: 1px solid #c5d3e0;
    border-radius: 4px;
    overflow: hidden;
    margin-top: 5px;
}
</style>

<script type="text/javascript">


$(document).ready(function () {  
    
	   /* Date */ 	
	    
	   		 $('#btnvaluechange').hide();
	   
	   	  
       $("#masterdate").jqxDateTimeInput({  width: '125px', height: '15px', formatString:"dd.MM.yyyy"});
     
       $('#accountSearchwindow').jqxWindow({ width: '50%', height: '62%',  maxHeight: '75%' ,maxWidth: '50%' , title: 'Account Search' ,position: { x: 150, y: 60 }, keyboardCloseKey: 27});
	   $('#accountSearchwindow').jqxWindow('close');
	     $('#searchwndow').jqxWindow({ width: '50%', height: '55%',  maxHeight: '85%' ,maxWidth: '80%' ,title: 'Product Search' , position: { x: 250, y: 120 }, keyboardCloseKey: 27});
	     $('#searchwndow').jqxWindow('close');  
	       $('#sidesearchwndow').jqxWindow({ width: '55%', height: '90%',  maxHeight: '90%' ,maxWidth: '80%' ,title: 'Product Search ' , position: { x: 600, y: 0 }, keyboardCloseKey: 27});
	     $('#sidesearchwndow').jqxWindow('close');   
	     
	     
	     
	     $('#searchwindow').jqxWindow({ width: '50%', height: '60%',  maxHeight: '75%' ,maxWidth: '50%' , title: ' Search' ,position: { x: 500, y: 60 }, keyboardCloseKey: 27});
		   $('#searchwindow').jqxWindow('close'); 
	 
		   
		   
		   $('#importwindow').jqxWindow({ width: '30%', height: '24.4%',  maxHeight: '85%' ,maxWidth: '80%' ,title: 'Import Options' , position: { x: 500, y: 200 }, theme: 'energyblue', showCloseButton: false});
		     $('#importwindow').jqxWindow('close');   
		     
		     
		     $('#locationwindow').jqxWindow({ width: '30%', height: '55%',  maxHeight: '75%' ,maxWidth: '50%' , title: 'Location Search' ,position: { x: 200, y: 70 }, keyboardCloseKey: 27});
		     $('#locationwindow').jqxWindow('close');  
			   
		     $('#sitewindow').jqxWindow({ width: '30%', height: '55%',  maxHeight: '75%' ,maxWidth: '50%' , title: 'Site Search' ,position: { x: 400, y: 70 }, keyboardCloseKey: 27});
		     $('#sitewindow').jqxWindow('close');  
			   
		 
		   
		   $('#itemdocno').dblclick(function(){

				  if($("#mode").val() == "A" || $("#mode").val() == "E")
					  {
			 
				//itemtype,itemdocno,itemname
				  
		  	    $('#searchwindow').jqxWindow('open');
		  	
				if(document.getElementById("itemtype").value=="1")
					{
					refsearchContent('costCodeSearchGrid.jsp?docno='+document.getElementById("itemtype").value); 	
					}
				
				
				
	    		else if(document.getElementById("itemtype").value=="6")
				{
				 refsearchContent('fleetGrid.jsp?'); 	
				}
			
		  	  	  	  
		  	
	    		else
				{
				 refsearchContent('costunitsearch.jsp?docno='+document.getElementById("itemtype").value); 	
				} 
					  }
			  }); 
			  
		   $('#site').dblclick(function(){

				  if($("#mode").val() == "A" || $("#mode").val() == "E")  
					  {
			 
		 
						if(document.getElementById("itemtype").value!="1" && document.getElementById("itemtype").value!="6")
						{
						sitesearchContent('sitesearch.jsp?typedocno='+document.getElementById("itemtype").value+'&tr_no='+document.getElementById("costtr_no").value); 	
						}
				
					  }
				
	    		 
			  }); 
		   
		   
			   $('#txtlocation').dblclick(function(){
				   
					  if($("#mode").val() == "A" || $("#mode").val() == "E")
						  {
					   
				  	    $('#locationwindow').jqxWindow('open');
				  	
				  	  locationsearchContent('searchlocation.jsp?'); 
						  }
					  
			  	  
		          
	                     }); 
		   
		   
 
  
});


 

	  
	  
	  function getitem(event){
	      	 var x= event.keyCode;
	      	 if(x==114){

	      		  $('#searchwindow').jqxWindow('open');
	      			
	      		if(document.getElementById("itemtype").value=="1") //com/search/costunit/costCodeSearchGrid.jsp
				{
				refsearchContent('costCodeSearchGrid.jsp?docno='+document.getElementById("itemtype").value); 	
				}
	      		
	    		else if(document.getElementById("itemtype").value=="6")
				{
				 refsearchContent('fleetGrid.jsp?'); 	
				}
			
	      		
			else
				{
				 refsearchContent('costunitsearch.jsp?docno='+document.getElementById("itemtype").value); 	
				}
			

	      		 
	      		  
	      	 
	      	 }
	      	 else{
	      		 }
	      	 }  
	      	  function refsearchContent(url) {
	           //alert(url);
	              $.get(url).done(function (data) {
	      //alert(data);
	            $('#searchwindow').jqxWindow('setContent', data);

	      	}); 
	        	}
	  
	  
      function productSearchContent(url) {
     	 //alert(url);
     		 $.get(url).done(function (data) {
     			 
     			 $('#sidesearchwndow').jqxWindow('open');
     		$('#sidesearchwndow').jqxWindow('setContent', data);
     
     	}); 
     	} 

      


	
      
      function getloc(event){
       	 var x= event.keyCode;
       	 if(x==114){
       	  $('#locationwindow').jqxWindow('open');
       	
       	  locationsearchContent('searchlocation.jsp?');   }
       	 else{
       		 }
       	 }  
	  
	  
      
      function getsite(event){
      	 var x= event.keyCode;
      	 if(x==114){
      		  if($("#mode").val() == "A" || $("#mode").val() == "E")
    		  {
     
     
    	if(document.getElementById("itemtype").value!="1" && document.getElementById("itemtype").value!="6")
    		{
    		sitesearchContent('sitesearch.jsp?typedocno='+document.getElementById("itemtype").value+'&tr_no='+document.getElementById("costtr_no").value); 	
    		}
    	
    		  }  }
      	 else{
      		 }
      	 }  
      	  function locationsearchContent(url) {
           //alert(url);
              $.get(url).done(function (data) {
      //alert(data);
            $('#locationwindow').jqxWindow('setContent', data);

      	}); 
        	}
      	  
      	  function sitesearchContent(url) {
      		 $('#sitewindow').jqxWindow('open');
                 $.get(url).done(function (data) {
         //alert(data);
               $('#sitewindow').jqxWindow('setContent', data);

         	}); 
           	}
         	   
      	  
      	


function funReset(){
	//$('#frmmr')[0].reset(); 
}
function funReadOnly(){
	$('#frmmr input').attr('readonly', true );
	$('#frmmr select').attr('disabled', true );
	 $('#masterdate').jqxDateTimeInput({ disabled: true});
	 
		$("#serviecGrid").jqxGrid({ disabled: true});
		
 
 
 $('#btnvaluechange').hide();
 
	
}
function funRemoveReadOnly(){
	
	 document.getElementById("editdata").value="";
	$('#frmmr input').attr('readonly', false );
/* 	$('#serviecGrid').jqxGrid('setcolumnproperty', 'discount',  "editable", true); */
	$('#frmmr select').attr('disabled', false );
    
		 $('#btnvaluechange').hide();
		 
		 $('#txtlocation').attr('readonly', true);
		 
		 $('#itemdocno').attr('readonly', true);
		 $('#itemname').attr('readonly', true);
		 
		 $('#clientname').attr('readonly', true);
		 
		 $('#site').attr('readonly', true);
		 
		 
		// itemname  clientname site
		 
		 
	  
	 $('#masterdate').jqxDateTimeInput({ disabled: false});
	 
 
	 
	$('#docno').attr('readonly', true);
	 
	 $("#serviecGrid").jqxGrid({ disabled: false});

 
	 
	if ($("#mode").val() == "A") {
		  //$('#chkdiscount').attr('disabled', false);
		$('#masterdate').val(new Date());
	 
			 $("#serviecGrid").jqxGrid('clear');
			    $("#serviecGrid").jqxGrid('addrow', null, {});
				 $('#itemname').attr('readonly', true);
				 
				 $('#clientname').attr('readonly', true);
				 
				 $('#site').attr('readonly', true);
				 
		   
	   }
	
  	if ($("#mode").val() == "E") {
		 $('#btnvaluechange').show();
  	 
		$("#serviecGrid").jqxGrid({ disabled: true});
		
		
		
	}  
  
  	chkproductconfig();	
		
	 
}

function chkproductconfig()
{
	
   var x=new XMLHttpRequest();
   x.onreadystatechange=function(){
   if (x.readyState==4 && x.status==200)
    {
      var items= x.responseText.trim();
     
      if(parseInt(items)>0)
       {
    	
    	   document.getElementById("productchk").value=1;
    	 
    	     $('#serviecGrid').jqxGrid('setcolumnproperty','productid','editable',false);
    	   	$('#serviecGrid').jqxGrid('setcolumnproperty','productname','editable',false);
    	   		
    	   } 
        
          else
      {
        	   document.getElementById("productchk").value=0; 
        	   $('#serviecGrid').jqxGrid('setcolumnproperty','productid','editable',true);
       	   	$('#serviecGrid').jqxGrid('setcolumnproperty','productname','editable',true);
      }
      
       }}
   x.open("GET","checkproductconfig.jsp?",true);
	x.send();

	
} 

function funcheckaccinvendor()
{
	if(document.getElementById("puraccid").value=="")
		{
		
		 document.getElementById("errormsg").innerText="Search Vendor";  
		 document.getElementById("puraccid").focus();
	       
	        return 0;
		}
	
}


function funFocus(){
	 
   	$('#masterdate').jqxDateTimeInput('focus'); 	    		
}
function funNotify(){	
 
  
	   
if(document.getElementById("txtlocation").value=="")
{

 document.getElementById("errormsg").innerText="Search Location";  
 document.getElementById("txtlocation").focus();
   
    return 0;
}
	 
else
	{
	  document.getElementById("errormsg").innerText="";
	}
	   
 
 

 
var rows = $("#serviecGrid").jqxGrid('getrows');
   $('#serviecGridlength').val(rows.length);
  //alert($('#gridlength').val());
  for(var i=0 ; i < rows.length ; i++){
	  
	 
	  
			  // var myvar = rows[i].tarif; 
				   newTextBox = $(document.createElement("input"))  
				      .attr("type", "dil")
				      .attr("id", "sertest"+i)
				      .attr("name", "sertest"+i)
				      .attr("hidden", "true");         
				  
		 
				 
				 newTextBox.val(rows[i].psrno+"::"+rows[i].prodoc+" :: "+rows[i].unitdocno+" :: "+rows[i].qty+" :: "  
						   +rows[i].saveqty+" :: "+rows[i].checktype+" :: "+rows[i].specid+" :: "+rows[i].foc+" ::"+"0"+" :: "+"0" );
				
				 
				// alert(newTextBox.val());
				  newTextBox.appendTo('form');
				  
		   
 
   
  }   
	  
	    
	    	   
	    		$("#serviecGrid").jqxGrid({ disabled: false});
			 
			 
			 
			 
			   
	   
	
	return 1;
} 



function funwarningopen(){
	   $.messager.confirm('Confirm', 'Transaction Will Affect Already Inserted Values.', function(r){
	       if (r){
	     
		 		  document.getElementById("editdata").value="Editvalue";
				 
	    		$("#serviecGrid").jqxGrid({ disabled: false});
	    		  $("#serviecGrid").jqxGrid('addrow', null, {});

	       }
	      });
	   }

function funChkButton() {
	

}

function funSearchLoad(){
	changeContent('mainsearch.jsp'); 
}
function getCurrencyIds(){
	   
	      
	        }
	   
	   function getRatevalue(angel)
	   {
	   
	      
	        }
	   
	   
	   function combochange()
	   {
		   
 
		   
		   
		   
		   
		   
			
	   }

	   function setValues() {
			if($('#hidmasterdate').val()){
				$("#masterdate").jqxDateTimeInput('val', $('#hidmasterdate').val());
			}
			
			 
			
		 	var dis=document.getElementById("masterdoc_no").value;
			if(dis>0)
				{     
				//alert("");
				 funchkforedit();
		 	 var indexval1 = document.getElementById("masterdoc_no").value;   

	     	  		  
		 	
		 	var locationid=document.getElementById("txtlocationid").value;
	     	  		 
	     	  		 $("#sevdesc").load("serviecgrid.jsp?purdoc="+indexval1+"&locationid="+locationid);
	     	  		
				 } 

				 if($('#msg').val()!=""){
				   $.messager.alert('Message',$('#msg').val());
				  } 
				
    		combochange();
    		document.getElementById("formdet").innerText=$('#formdetail').val()+" ("+$('#formdetailcode').val().trim()+")";
				//  getCurrencyId();
		} 
	   function funPrintBtn(){
	 	  
	 	   if (($("#mode").val() == "view") && $("#masterdoc_no").val()!="") {
	 	  
	 	   var url=document.URL;
 
	        var reurl=url.split("saveActionmr");
	        
	        $("#docno").prop("disabled", false);                
	        var dtype=$('#formdetailcode').val();
	  
	 
	         var win= window.open(reurl[0]+"PRINTmr?docno="+document.getElementById("masterdoc_no").value+"&dtype="+dtype,"_blank","top=250,left=310,Width=800,Height=800,location=no,scrollbars=no,toolbar=yes");
		     
	    	win.focus(); 
	 	   } 
	 	  
	 	   else {
		    	      $.messager.alert('Message','Select a Document....!','warning');
		    	      return false;
		    	     }
		    	
	 	}
	$(function(){
        $('#frmmr').validate({
                rules: { 
              
                	delterms:{maxlength:200},
                	purdesc:{maxlength:200},
                	payterms:{maxlength:200},
                	/* refno:{required:true}, */
                	puraccid:{required:true}
                 },
                 messages: {
                	 delterms: {maxlength:"  Max 200 chars"},
                	 purdesc: {maxlength:"  Max 200 chars"},
                	 payterms: {maxlength:"  Max 200 chars"},
               /*  	 refno: {required:" * required"}, */
                	 puraccid: {required:" *"}
                 }
        });});
    function isNumber(evt) {
        var iKeyCode = (evt.which) ? evt.which : evt.keyCode
        if (iKeyCode != 46 && iKeyCode > 31 && (iKeyCode < 48 || iKeyCode > 57))
        	{
     	   document.getElementById("errormsg").innerText=" Enter Numbers Only";  
           
            return false;
        	}
        document.getElementById("errormsg").innerText="";  
        return true;
    }
 
 
 function funrefdisslno()
 {
	 
	 
 }
 
	 
		function funchkforedit()
	    {
		

		
			var x = new XMLHttpRequest();
			x.onreadystatechange = function() {
				if (x.readyState == 4 && x.status == 200) {
					var items = x.responseText.trim();	
					if(parseInt(items)>0)
						{
						
						 $("#btnEdit").attr('disabled', true );
						 $("#btnDelete").attr('disabled', true ); 
						 
						 
						 
						}
					else
						{
						 
						}
				  
					
					
					
				} else {
				}
			}
			x.open("GET", "linkchk.jsp?masterdoc_no="+document.getElementById("masterdoc_no").value, true);
			x.send();
		
		
		}
	 
	function removemsg()
	{
		 document.getElementById("errormsg").innerText="";
		
	}
	
	 function gettype(){ 
		 
			
			   var x=new XMLHttpRequest();
			   x.onreadystatechange=function(){
			   if (x.readyState==4 && x.status==200)
			    {
			      items= x.responseText;
			       
			      items=items.split('####');
			           var docno=items[0].split(",");
			           var type=items[1].split(",");
			        
			           var optionstype = '';
 
			
			           for ( var i = 0; i < type.length; i++) {
			        	   optionstype += '<option value="' + docno[i] + '">' + type[i] + '</option>';
				        }
			          
			            $("select#type").html(optionstype); 	
			            
			        
			            if($('#hidtype').val()!="")
						  {
						  
						  
						  $('#type').val($('#hidtype').val());   
						  
						  }
					 
			  
			    }
			       }
			   x.open("GET","gettype.jsp?",true);
				x.send();
			        
			      
			        }
	 
	 function getitemtype(){ 
		 
			
		   var x=new XMLHttpRequest();
		   x.onreadystatechange=function(){
		   if (x.readyState==4 && x.status==200)
		    {
		      items= x.responseText;
		       
		      items=items.split('####');
		           var docno=items[0].split(",");
		           var type=items[1].split(",");
		        
		           var optionstype = '';

		
		           for ( var i = 0; i < type.length; i++) {
		        	   optionstype += '<option value="' + docno[i] + '">' + type[i] + '</option>';
			        }
		            
		            $("select#itemtype").html(optionstype); 	
		            
		        
		            if($('#hideitemtype').val()!="")
					  {
					  
					  
					  $('#itemtype').val($('#hideitemtype').val());   
					  
					  }
				 
		  
		    }
		       }
		   x.open("GET","getitem.jsp?",true);
			x.send();
		        
		      
		        }
	 
	 
	 function cleardata()
	 {
		 document.getElementById("itemdocno").value="";
		 document.getElementById("itemname").value="";
		 document.getElementById("clientname").value="";
	 
		 document.getElementById("cldocno").value="";
		 document.getElementById("siteid").value="";
		 document.getElementById("site").value="";
		 
	 
	 }
	 
	 
</script>
</head>
<body onLoad="setValues();gettype();getitemtype();" >


<div id="mainBG" class="homeContent" data-type="background">
<form id="frmmr" action="saveActionmr" method="post" autocomplete="off">  
<jsp:include page="../../../../header.jsp" />    
	<br/> 
	<fieldset>
  <legend>General Info</legend>
  <table width="100%"> 
    <tr>
      <td width="6%" align="right">Date</td>
      <td width="12%">
        <div id="masterdate" name="masterdate" value='<s:property value="masterdate"/>'></div>
        <input type="hidden" name="hidmasterdate" id="hidmasterdate" value='<s:property value="hidmasterdate"/>'>
      </td>
      <td width="6%" align="right">Type</td>
      <td width="12%">
        <select id="type" name="type" style="width:100%;"></select>
      </td>
      <td width="7%" align="right">Location</td> 
      <td width="20%">
        <input type="text" id="txtlocation" name="txtlocation" style="width:100%;" placeholder="Press F3 to Search" value='<s:property value="txtlocation"/>' onkeydown="getloc(event);"/>
        <input type="hidden" id="txtlocationid" name="txtlocationid" value='<s:property value="txtlocationid"/>'/>
      </td>
      <td width="6%" align="right">Ref No</td>
      <td width="14%">
        <input type="text" name="refno" id="refno" style="width:100%;" value='<s:property value="refno"/>'>
      </td>
      <td width="7%" align="right">Doc No</td>
      <td width="10%">
        <input type="text" name="docno" id="docno" style="width:100%;" tabindex="-1" value='<s:property value="docno"/>' readonly>
      </td>
    </tr>

    <tr>
      <td align="right">&nbsp;</td>
      <td>
        <select id="itemtype" name="itemtype" style="width:100%;" onchange="cleardata()"></select>  
      </td>
      <td colspan="2">
        <input type="text" id="itemdocno" name="itemdocno" style="width:100%;" placeholder="Press F3 to Search" value='<s:property value="itemdocno"/>'>
      </td>
      <td colspan="6">
        <input type="text" id="itemname" name="itemname" style="width:100%;" value='<s:property value="itemname"/>' onkeydown="getitem(event);">
      </td>
    </tr>
    
    <tr>
      <td align="right">Client</td>    
      <td colspan="5">
        <input type="text" id="clientname" name="clientname" style="width:100%;" value='<s:property value="clientname"/>'/>
        <input type="hidden" id="cldocno" name="cldocno" value='<s:property value="cldocno"/>'/>
      </td>
      <td align="right">Site</td>
      <td colspan="3">
        <input type="text" name="site" id="site" style="width:100%;" value='<s:property value="site"/>' onkeydown="getsite(event);">
        <input type="hidden" name="siteid" id="siteid" value='<s:property value="siteid"/>'>
      </td>
    </tr>
     
    <tr>
      <td align="right">Description</td>
      <td colspan="7">
        <input type="text" name="purdesc" id="purdesc" style="width:100%;" value='<s:property value="purdesc"/>'> 
      </td>
      <td colspan="2" align="right">
        <button class="myButton" type="button" id="btnvaluechange" name="btnvaluechange" onclick="funwarningopen();">Value Change</button>
      </td>
    </tr>
  </table>
  
  <input type="text" name="gridtext" id="gridtext" style="width:0%;height:0%;" class="textbox" value='<s:property value="gridtext"/>'/>   
  <input type="text" name="gridtext1" id="gridtext1" style="width:0%;height:0%;" class="textbox" value='<s:property value="gridtext1"/>'/>  
</fieldset>
<br>
<fieldset>
  <div id="sevdesc"><jsp:include page="serviecgrid.jsp"></jsp:include></div>
</fieldset>

 
<table width="100%">
<tr>
<td align="right">&nbsp;</td><td><input type="hidden" name="productTotal" readonly="readonly" id="productTotal" value='<s:property value="productTotal"/>'    style="width:50%;text-align: right;"></td>

 <td><input type="hidden" name="prddiscount" id="prddiscount" value='<s:property value="prddiscount"/>'   onkeypress="javascript:return isNumber (event);"  style="width:51%;text-align: right;"></td>
<%-- <td align="right">Discount</td><td><input type="checkbox"  value="0" id="chkdiscount" name="chkdiscount" onchange="fundisable()"    onclick="$(this).attr('value', this.checked ? 1 : 0)" ></td>
<td align="right">Discount %</td><td><input type="text" name="descPercentage" id="descPercentage" value='<s:property value="descPercentage"/>'   onblur="funRoundAmt(this.value,this.id);" onkeypress="javascript:return isNumber (event);"  style="width:50%;text-align: right;"></td>
    <td align="center"><button type="button" class="icon" id="btnCalculate" title="Calculate" onclick="funcalcu();">
       <img alt="Calculate" src="<%=contextPath%>/icons/calculate_new.png">
      </button> 
      </td> --%>
  <%-- <td align="right">Discount Value</td><td><input type="text" name="descountVal" id="descountVal" value='<s:property value="descountVal"/>' onblur="funvalcalcu();" onkeypress="javascript:return isNumber (event);"  style="width:51%;text-align: right;"></td> --%>  
<%-- <td align="right">Round of</td><td><input type="text" name="roundOf" id="roundOf" value='<s:property value="roundOf"/>' onblur="roundval();funRoundAmt(this.value,this.id);" onkeypress="javascript:return isNumber (event);"  style="width:51%;text-align: right;"></td> --%>
<td align="right">&nbsp;</td><td><input type="hidden" name="netTotaldown" readonly="readonly" id="netTotaldown" value='<s:property value="netTotaldown"/>'  onblur="funRoundAmt(this.value,this.id);" onkeypress="javascript:return isNumber (event);"  style="width:50%;text-align: right;"></td>
 
<%-- <td align="right">&nbsp;<td><td width="10%" align="right"><label >Order Value :</label></td><td><input type="text" class="textbox" id="orderValue" readonly="readonly" tabindex="-1" name="orderValue" style="width:73%;" value='<s:property value="orderValue"/>'/></td> --%>
 
 
</tr>


</table>
 





 


 <input type="hidden" id="costtr_no" name="costtr_no"  value='<s:property value="costtr_no"/>'/> 

 <input type="hidden" id="hideitemtype" name="hideitemtype"  value='<s:property value="hideitemtype"/>'/> 
	 <input type="hidden" id="hidetype" name="hidetype"  value='<s:property value="hidetype"/>'/>
	 <input type="hidden" id="masterdoc_no" name="masterdoc_no"  value='<s:property value="masterdoc_no"/>'/>

 
<input type="hidden" id="refmasterdoc_no" name="refmasterdoc_no"  value='<s:property value="refmasterdoc_no"/>'/>
     <input type="hidden" id="msg" name="msg"  value='<s:property value="msg"/>'/>
     <input type="hidden" id="mode" name="mode"  value='<s:property value="mode"/>'/>   
    

     <input type="hidden" id="rowval" name="rowval"  value='<s:property value="rowval"/>'/>   <!-- for refno  slno set grid -->
               <input type="hidden" id="accdocno" name="accdocno"  value='<s:property value="accdocno"/>'/>  
              <input type="hidden" id="descgridlenght" name="descgridlenght"  value='<s:property value="descgridlenght"/>'/>    
         <input type="hidden" id="cmbcurrval" name="cmbcurrval"  value='<s:property value="cmbcurrval"/>'/>    
          <input type="hidden" id="acctypeval" name="acctypeval"  value='<s:property value="acctypeval"/>'/>  
           <input type="hidden" id="reftypeval" name="reftypeval"  value='<s:property value="reftypeval"/>'/>  
           
           
           <input type="hidden" id="deleted" name="deleted"  value='<s:property value="deleted"/>'/>
           
            <input type="hidden" id="acctypegrid" name="acctypegrid"  value='<s:property value="acctypegrid"/>'/>
           
            <input type="hidden" id="serviecGridlength" name="serviecGridlength"  value='<s:property value="serviecGridlength"/>'/>  
          
                <input type="hidden" id="hidelocation" name="hidelocation"  value='<s:property value="hidelocation"/>'/>
                  <input type="hidden" id="editdata" name="editdata"  value='<s:property value="editdata"/>'/>
                  <input type="hidden" id="productchk" name="productchk"  value='<s:property value="productchk"/>'/>
          
          
</form>
 <div id="searchwindow">
   <div ></div>
</div>
  <div id="accountSearchwindow">
	   <div ></div>
	</div>
	  <div id="sidesearchwndow">
	   <div ></div>
	</div>
		  <div id="importwindow">
	   <div ></div>
	</div>
		  <div id="searchwndow">
	   <div ></div>
	</div>
		  <div id="locationwindow">
	   <div ></div>
	</div>
		  <div id="sitewindow">
	   <div ></div>
	</div>
	
	
	
</div>
</body>
</html>