<jsp:include page="../../../../includes.jsp"></jsp:include>    
<%@ taglib prefix="s" uri="/struts-tags" %>
<%
	String contextPath=request.getContextPath();
 %>
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
    overflow: hidden; /* Prevents whole-page scrolling, delegates to specific panes */
}

.master-container {
    display: flex;
    width: 100%;
    height: 100vh;
    font-family: 'Segoe UI', 'Roboto', 'Arial', sans-serif;
    background-color: #f4f7f9;
}

/* Sidebar (LEFT SIDE ONLY) */
.sidebar-filters {
    width: 350px;
    flex: 0 0 350px;
    background: #fff;
    border-right: 1px solid #e1e8ed;
    display: flex;
    flex-direction: column;
    height: 100%;
    overflow-y: auto; /* Independent Sidebar Scrollbar */
    box-shadow: 2px 0 8px rgba(0,0,0,.05);
    z-index: 2;
}

.sidebar-fixed-top {
    padding: 15px 20px;
    border-bottom: 1px solid #f0f4f8;
}

.sidebar-scroll-content {
    flex: 1;
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

/* Readonly / disabled look - NO BAN ICON */
input[readonly],
input:disabled,
select:disabled {
    background-color: #f3f6f9 !important;
    color: #555;
    cursor: default !important; /* Forces normal cursor instead of not-allowed */
}

/* jqx date/time containers */
.release-filter-table div[id^="fromdate"],
.release-filter-table div[id^="todate"],
.release-filter-table div[id^="adate"],
.release-filter-table div[id^="atime"] {
    width: 100%;
}

/* ===== BUTTONS ===== */
.btn-submit {
    flex: 1;
    height: 30px;
    background: #007bff; /* Primary Blue */
    color: #fff;
    border: none;
    border-radius: 4px;
    font-size: 13px;
    font-weight: 600;
    cursor: pointer;
    transition: background 0.2s, transform 0.1s;
    width: 100%;
    text-align: center;
}
.btn-submit:hover:not(:disabled) { background: #0056b3; }
.btn-submit:disabled { background: #9ca3af; cursor: default !important; }
.btn-submit:active:not(:disabled) { transform: scale(0.98); }

.button-group {
    display: flex;
    gap: 10px;
    margin-top: 15px;
    justify-content: center;
}

.bicon {
    background-color: transparent;
    border: none;
    cursor: pointer;
    padding: 0 5px;
    display: flex;
    align-items: center;
    justify-content: center;
}

/* Main Content Area (RIGHT SIDE) */
.main-content-area {
    flex: 1;
    height: 100vh;
    overflow-y: auto; /* Independent Main Content Scrollbar */
    background: #ffffff;
    padding: 15px;
    box-sizing: border-box;
}

.grid-container {
    margin-bottom: 20px;
}
</style>

<script type="text/javascript">

$(document).ready(function () {
	
	/* $('#loadsalikdata').hide();
	  $('#loadtrafficdata').hide(); */
	  pChange();
	  $("body").prepend('<div id="overlay" class="ui-widget-overlay" style="z-index: 1; display: none;"></div>');
	     $("body").prepend("<div id='PleaseWait' style='display: none;position:absolute; z-index: 1;top:180px;right:550px;'><img src='../../../../icons/31load.gif'/></div>");

	     $('#grpinfowindow').jqxWindow({ width: '25%', height: '60%',  maxHeight: '85%' ,maxWidth: '80%' ,title: 'Assign Group' , position: { x: 250, y: 60 }, keyboardCloseKey: 27});
			$('#grpinfowindow').jqxWindow('close');
			
			$('#teaminfowindow').jqxWindow({ width: '30%', height: '60%',  maxHeight: '85%' ,maxWidth: '80%' ,title: 'Assign Team' , position: { x: 250, y: 60 }, keyboardCloseKey: 27});
			$('#teaminfowindow').jqxWindow('close');
			  
			$('#assigninfowindow').jqxWindow({ width: '25%', height: '60%',  maxHeight: '85%' ,maxWidth: '80%' ,title: 'Assign Method' , position: { x: 250, y: 60 }, keyboardCloseKey: 27});
			$('#assigninfowindow').jqxWindow('close');
	   		
			 $('#areainfowindow').jqxWindow({ width: '25%', height: '70%',  maxHeight: '85%' ,maxWidth: '80%' ,title: ' Area Search' , position: { x: 250, y: 60 }, keyboardCloseKey: 27});
			  $('#areainfowindow').jqxWindow('close');
			
	     $('#clientsearch1').jqxWindow({ width: '50%', height: '55%',  maxHeight: '85%' ,maxWidth: '80%' ,title: 'Client Search' , position: { x: 250, y: 120 }, keyboardCloseKey: 27});
		  $('#clientsearch1').jqxWindow('close');
		  
		 // Standardized to 100% width and 24px height
		 $("#fromdate").jqxDateTimeInput({ width: '100%', height: '24px',formatString:"dd.MM.yyyy"});
	     $("#todate").jqxDateTimeInput({ width: '100%', height: '24px',formatString:"dd.MM.yyyy"});
	 
	     $("#adate").jqxDateTimeInput({ width: '100%', height: '24px',formatString:"dd.MM.yyyy",enableBrowserBoundsDetection:true});
	     $("#atime").jqxDateTimeInput({ width: '100%', height: '24px',formatString:"HH:mm",showCalendarButton: false});
	 
	 var todates=new Date($('#todate').jqxDateTimeInput('getDate'));
	 var onemounth=new Date(new Date(todates).setMonth(todates.getMonth()-1)); 
	    
     $('#todate').jqxDateTimeInput('setDate', new Date());
     $('#adate').jqxDateTimeInput('setDate', new Date());
     $('#atime').jqxDateTimeInput('setDate', new Date());

     $('#txtclient').dblclick(function(){
		   
    	 $('#clientsearch1').jqxWindow('open');
    	 clientSearchContent('clientINgridsearch.jsp?', $('#clientsearch1')); 
		   		
		 });
	 
     $('#txtgroup').dblclick(function(){
		   
    	 var id=2;
    	 $('#grpinfowindow').jqxWindow('open');
	      //grpSearchContent('servicegrpsearch.jsp');
    	 grpSearchContent('servicegrpsearch.jsp?id='+id);
		   		
		 });
     
     
     $('#txtgrpmember').dblclick(function(){
		   
    	 var id=2;
    	 
    	 if(id==1){
 			
			 assgnid=document.getElementById("sergroupid").value;
   	    }
        	if(id==2){
        	
        		assgnid=document.getElementById("groupid").value;
        	}
		  $('#teaminfowindow').jqxWindow('open');
		 
	    teamSearchContent('servicegrptoearch.jsp?assgnid='+assgnid+'&id='+id);
		   		
		 });
     
     
     $('#txtassign').dblclick(function(){
		   
    	 $('#assigninfowindow').jqxWindow('open');
		  assignSearchContent('assignmodesearch.jsp');
		   		
		 });
     
     //-----------------------------------------------------------------------
      $('#txtsergroup').dblclick(function(){
		   
    	 var id=1;
    	 $('#grpinfowindow').jqxWindow('open');
	      //grpSearchContent('servicegrpsearch.jsp');
    	 grpSearchContent('servicegrpsearch.jsp?id='+id);
		   		
		 });
     
     
     $('#txtsergrpemp').dblclick(function(){
		   
    	 var id=1;
    	 
    	 if(id==1){
 			
			 assgnid=document.getElementById("sergroupid").value;
   	    }
        	if(id==2){
        	
        		assgnid=document.getElementById("groupid").value;
        	}
		  $('#teaminfowindow').jqxWindow('open');
		 
	    teamSearchContent('servicegrptoearch.jsp?assgnid='+assgnid+'&id='+id);
		   		
		 });
     
     
     $('#txtassignarea').dblclick(function(){
		   
    	 $('#areainfowindow').jqxWindow('open');
	        areaSearchContent('area.jsp');
		   		
		 });
    
    //---------------------------------------------------------------------------
	  
});

	function serviceview(){
		
		var x=new XMLHttpRequest();
		x.onreadystatechange=function(){
		if (x.readyState==4 && x.status==200)
			{
			 	var items= x.responseText;
			 	 items=items.split('###');
			 	 var res=items[0];
			 	
			 	if(res>0){             
			            
			 		document.getElementById("bttnview").value="1";
			   			
		    		
					  }
			 	else{
			 		document.getElementById("bttnview").value="0";
			 	}
			 	 
				}
		       else
			  {}
	     }
	      x.open("GET","viewSchedule.jsp?",true);
	     x.send();
	    
	   }

       function printcheck(){
		//alert("gfdyukgfy");
		var x=new XMLHttpRequest();
		x.onreadystatechange=function(){
		if (x.readyState==4 && x.status==200)
			{
				//alert("vguyewrtwyurtwy");
			 	var items= x.responseText.trim();
			 	//alert(items);
			 	document.getElementById("confvalue").value=items;
			   	
	      }
		}
	      x.open("GET","viewprint.jsp",true);
	     x.send();
	    
	   
       }
	
function getclinfo(event){
	 var x= event.keyCode;
	 if(x==114){
	  $('#clientsearch1').jqxWindow('open');
	 clientSearchContent('clientINgridsearch.jsp?', $('#clientsearch1'));    }
	 else{
		 }
	 } 
     function clientSearchContent(url) {
           
               $.get(url).done(function (data) {
  
	            $('#clientsearch1').jqxWindow('setContent', data);

    	}); 
         	}
     
     
     function getareas(event){
    	 var x= event.keyCode;
    	 if(x==114){
		  $('#areainfowindow').jqxWindow('open');
	        areaSearchContent('area.jsp');
	     	 }
     }
	     	 
	function areaSearchContent(url) {
	//alert(url);
		 $.get(url).done(function (data) {
			 //alert(data);
	$('#areainfowindow').jqxWindow('setContent', data);

	            	}); 
	 	}

	function funExportBtn(){
		
	 	   //JSONToCSVCon(exceldata,'AssignJobFollowUp',true);
	 	 $("#serschedulediv").excelexportjs({
				containerid: "serschedulediv",   
				datatype: 'json',
				dataset: null,
				gridId: "jqxloaddataGrid",
				columns: getColumns("jqxloaddataGrid") ,   
				worksheetName:"AssignJobFollowUp"       
			});

	  }



function funreload()
{
	 $("#assignSubGridDetails").jqxGrid('clear');
	 
	 var clientid=$('#clientid').val();
	 var date=$('#todate').val();
	 var barchval = document.getElementById("cmbbranch").value;
     var dtype="0";
     var id=1;
   // $("#overlay, #PleaseWait").show();
   var isprior=document.getElementById("isprior").value;
   
    if(id>0){
    	//$("#serschedulediv").load("serScheduleDetails.jsp?clientid"+clientid+"&date="+date+"&barchval="+barchval+"&dtype="+dtype+"&id="+id+"&isprior="+isprior);
    	countload(id);
    }
     
	}
	
	
function pChange(){
	 if(document.getElementById("priority").checked){
		 
		 document.getElementById("isprior").value=1;
		
	 }
	 else{
		 document.getElementById("isprior").value=0;
		
	 }
	 
	}
		

	 function countload(id){
		 
		 var clientid=$('#clientid').val();
		 var date=$('#todate').val();
		 var chkfromdate = $('#hidchckfromdate').val();
		 var fromdate = $('#fromdate').val();
		 var barchval = document.getElementById("cmbbranch").value;
		 var isprior=document.getElementById("isprior").value;
		 
		 var grp=document.getElementById("sergroupid").value;
		 var emp=document.getElementById("grpserempid").value;
		 var mem=document.getElementById("grpsermemberid").value;
		 var area=document.getElementById("txtareaid").value;
		
		 
		    $("#jqxloaddataGrid").jqxGrid('clear'); 
			$("#jqxSerCount").jqxGrid('clear');
			//$("#jqxloaddataGrid").jqxGrid('addrow', null, {});
			
		 
$("#serCountgrid").load("serCountgrid.jsp?barchval="+barchval+"&date="+date+"&clientid="+clientid+"&id="+id+"&isprior="+isprior+"&grp="+grp+"&emp="+emp+"&mem="+mem+"&area="+area+'&chkfromdate='+chkfromdate+'&fromdate='+fromdate);
		
		
		 
	 }
	 
	 
	 function getgrpcode(event,id){
		 
		 var x= event.keyCode;
		 if(x==114){
		  $('#grpinfowindow').jqxWindow('open');
	      grpSearchContent('servicegrpsearch.jsp?id='+id);
	   	 }
		 else{
			 }
		 }
	   	 
	function grpSearchContent(url) {
	//alert(url);
		 $.get(url).done(function (data) {
			 //alert(data);
	$('#grpinfowindow').jqxWindow('setContent', data);

	         	}); 
		}
		
	function getteam(event,id){
		 var x= event.keyCode;
		 if(x==114){
			 var assgnid;
			 if(id==1){
        			
				 assgnid=document.getElementById("sergroupid").value;
       	    }
           	if(id==2){
           	
           		assgnid=document.getElementById("groupid").value;
           	}	
			 
		
		  $('#teaminfowindow').jqxWindow('open');
	    teamSearchContent('servicegrptoearch.jsp?assgnid='+assgnid+'&id='+id);
	 	 }
		 else{
			 }
		 }
	 	 
	function teamSearchContent(url) {
	//alert(url);
		 $.get(url).done(function (data) {
			 //alert(data);
	$('#teaminfowindow').jqxWindow('setContent', data);

	        	}); 
		}	
	
	
      function getassign(event){
    	  
    	  var x= event.keyCode;
    	  
 		 if(x==114){
		  $('#assigninfowindow').jqxWindow('open');
		  
		  assignSearchContent('assignmodesearch.jsp');
		  
	 	 }
 		 else{
 			 }
 		 }
	 	 
	function assignSearchContent(url) {
		 $.get(url).done(function (data) {
			 
	$('#assigninfowindow').jqxWindow('setContent', data);

	        	}); 
		}
		
		
	

	   
	   function funClear(){
			$("#jqxloaddataGrid").jqxGrid('clear'); 
			$("#jqxSerCount").jqxGrid('clear');
			$("#jqxloaddataGrid").jqxGrid('addrow', null, {});
			
		   document.getElementById("txtclient").value="";
		   document.getElementById("clientid").value="0";
		   
		   document.getElementById("txtsergroup").value="";
		   document.getElementById("sergroupid").value="0";
		   
		   document.getElementById("txtsergrpemp").value="";
		   document.getElementById("grpsermemberid").value="0";
		   document.getElementById("grpserempid").value="0";
		   
		   document.getElementById("txtassignarea").value="";
		   document.getElementById("txtareaid").value="0";
		   
		   $("#txtclient").attr("placeholder", "press F3 for Search");
		   $("#txtsergroup").attr("placeholder", "press F3 for Search");
		   $("#txtsergrpemp").attr("placeholder", "press F3 for Search");
		   $("#txtassignarea").attr("placeholder", "press F3 for Search");
	   }
	   
	   function save(){
			
			var groupid=document.getElementById("groupid").value;
		    var grpmemberid=document.getElementById("grpmemberid").value;
		    var grpempid=document.getElementById("grpempid").value;
		    var assignid=document.getElementById("assignid").value;
		    var trno=document.getElementById("trno").value;
		    var srno=document.getElementById("srno").value;
		    var clientid=document.getElementById("clientid").value;
		    var dtype=document.getElementById("dtype").value;
		    var brchid=document.getElementById("cmbbranch").value;
		    var desc=document.getElementById("txtdesc").value;
		    var rowindex=document.getElementById("rowindex").value;
		    var pdate=$('#adate').val();
			 var ptime=$('#atime').val();
			 if($('#rowindex').val()== "")
				{
			   	$.messager.alert('Message',"select a document");
				
				return 0;
				}
		    if($('#groupid').val()== "")
			{
		    	$.messager.alert('Message',"select Assign Group");
			
			return 0;
			}
			
			if($('#grpmemberid').val()== "")
			{
				$.messager.alert('Message',"select Group Member");
			
			return 0;
			}
			
			if($('#assignid').val()== "")
			{
				$.messager.alert('Message',"Select Assign Method");
			//document.getElementById("errormsg").innerText="Select Assign Method";
			return 0;
			}
				
				var x=new XMLHttpRequest();
				x.onreadystatechange=function(){
				if (x.readyState==4 && x.status==200)
					{
					 	var items= x.responseText;
					 	 items=items.split('###');
					 	 var res=items[0];
					 	 
					 	if(res>0){
							   $.messager.alert('Message',"Saved Successfully");
							   
							   var clientid=$('#clientid').val();
				   			 var date=$('#todate').val();
				   			 var chkfromdate = $('#hidchckfromdate').val();
				   			 var fromdate = $('#fromdate').val();
				   			
				   			 var barchval = document.getElementById("cmbbranch").value;
					             var dtype=document.getElementById("dtype").value;
					             var rowindex=document.getElementById("rowindex").value;
					             $('#jqxloaddataGrid').jqxGrid('setcellvalue', rowindex, "gridrow",1);
					             
					             
					             document.getElementById("groupid").value="";
					             document.getElementById("grpmemberid").value="";
					            document.getElementById("grpempid").value="";
					             document.getElementById("assignid").value="";
					            document.getElementById("trno").value="";
					             document.getElementById("srno").value="";
					            document.getElementById("dtype").value="";
					             document.getElementById("txtgroup").value="";
					             document.getElementById("txtgrpmember").value="";
					             document.getElementById("txtassign").value="";
					             document.getElementById("txtdesc").value="";
					             $("#txtgroup").attr("placeholder", "press F3 for Search");
					             $("#txtgrpmember").attr("placeholder", "press F3 for Search");
					             $("#txtassign").attr("placeholder", "press F3 for Search");
					            /* $('#adate').val("");
					         	$('#atime').val(""); */
					         	$('#adate').jqxDateTimeInput('setDate', new Date());
					             $('#atime').jqxDateTimeInput('setDate', new Date());
					         
					   		 var isprior=document.getElementById("isprior").value;
					   		 var id=1;
					   			 $("#serCountgrid").load("serCountgrid.jsp?barchval="+barchval+"&date="+date+"&clientid="+clientid+"&id="+id+"&isprior="+isprior+'&chkfromdate='+chkfromdate+'&fromdate='+fromdate);
					             
					             
				   		//$("#serschedulediv").load("serScheduleDetails.jsp?clientid"+clientid+"&date="+date+"&barchval="+barchval+"&dtype="+dtype);
				   		
				   		
							  }
					 	else{
					 		$.messager.alert('Message',"Not Updated");
					 	}
					 	 
						}
				       else
					  {}
			     }
			      x.open("GET","saveSchedule.jsp?groupid="+groupid+"&grpmemberid="+grpmemberid+"&grpempid="+grpempid+"&assignid="+assignid+"&trno="+trno+"&srno="+srno+"&clientid="+clientid+"&dtype="+dtype+"&brchid="+brchid+"&desc="+desc+"&pdate="+pdate+"&ptime="+ptime,true);
			     x.send();
			    
			   }
	   
	   
		  function funPrintBtn() {
					 
					var docno=$('#docno').val();
			 		var trno=$('#masterdoc_no').val();
			 		var dtype=$('#formdetailcode').val();
			 		//alert(dtype);
			 		var brhid=<%= session.getAttribute("BRANCHID").toString()%>
			 		var url=document.URL;
			 		var reurl=url.split("com/"); 
			     
			 		
			 		var win= window.open(reurl[0]+"printAssignjob?docno="+docno+"&brhid="+brhid+"&trno="+trno+"&dtype="+dtype+"&header=1","_blank","top=250,left=310,Width=800,Height=800,location=no,scrollbars=no,toolbar=yes");
			 		
			   
			    
	  }
		  function fromdatecheck(){
				 if(document.getElementById("chckfromdate").checked){
					 document.getElementById("hidchckfromdate").value = 1;
					 $('#fromdate').jqxDateTimeInput({ disabled: false});
				 }
				 else{
					 document.getElementById("hidchckfromdate").value = 0;
					 $('#fromdate').jqxDateTimeInput({ disabled: true});
				 }
			 }
	
		  function  funPrint()
		  {
		  
			 var doccno=$('#doccno').val();
			 
			
			 var barchval = document.getElementById("cmbbranch").value;
			
			
			 
			  if(doccno==''){
					 $.messager.alert('Message','Please Select a Row.','warning');
					 return 0;
				 }
		   			
			 	    if ($("#doccno").val()!="") {
				        var url=document.URL;
				        var reurl=url.split("assignjobfollowup.jsp");
			
				        var win= window.open(reurl[0]+"printassignjobfollowup?branch="+barchval+"&docno="+document.getElementById("doccno").value+'&dtype='+$("#dtype").val()+'&srno='+$("#srno").val(),"_blank","top=150,left=250,Width=1020,Height=500,location=no,scrollbars=no,toolbar=yes");
				        
				        win.focus();
				     }
				    else {
						$.messager.alert('Message','Please Select a Client.','warning');
						return;
					}
				   }
		  
		  function  funPrintbutton()
		  {
		  
			 var doccno=$('#doccno').val();
			 
			 var dtype=document.getElementById("dtyp").value;
			 //alert(dtype);
			 var barchval = document.getElementById("cmbbranch").value;
			
			
			 
			  if(doccno==''){
					 $.messager.alert('Message','Please Select a Row.','warning');
					 return 0;
				 }
		   			
			 	    if ($("#doccno").val()!="" && dtype=="AMC") {
				        var url=document.URL;
				        var reurl=url.split("assignjobfollowup.jsp");
			
				        var win= window.open(reurl[0]+"printassignjobfollowupAMC?branch="+barchval+"&docno="+document.getElementById("doccno").value+'&dtype='+$("#dtype").val()+'&srno='+$("#srno").val(),"_blank","top=150,left=250,Width=1020,Height=500,location=no,scrollbars=no,toolbar=yes");
				        
				        win.focus();
				     }
			 	     else if($("#doccno").val()!="" && dtype=="SJOB"){
			 	    	
			 	    	var url=document.URL;
				        var reurl=url.split("assignjobfollowup.jsp");
			
				        var win= window.open(reurl[0]+"printassignjobfollowupSjob?branch="+barchval+"&docno="+document.getElementById("doccno").value+'&dtype='+$("#dtype").val()+'&srno='+$("#srno").val(),"_blank","top=150,left=250,Width=1020,Height=500,location=no,scrollbars=no,toolbar=yes");
				        
				        win.focus();
			 	    	
			 	    }
			 	     
			 	     
			 	    else {
						$.messager.alert('Message','Please Select a Client.','warning');
						return;
					}
				   }
		  
		  function configCheck()
          {
			 // alert("///");
			  
			 var confvalue=document.getElementById("confvalue").value;
			// alert("confvalue:"+confvalue);
			  
			  if(confvalue==1){
				  
				  funPrintbutton();
				  
			  }
			  else if(confvalue==2){
				     
				     var doccno=$('#doccno').val();
					 
					 var dtype=document.getElementById("dtyp").value;
					 //alert(dtype);
					 var barchval = document.getElementById("cmbbranch").value;
					// alert(barchval);
					
					 
					  if(doccno==''){
							 $.messager.alert('Message','Please Select a Row.','warning');
							 return 0;
						 }
				   			
					 	    if ($("#doccno").val()!="" && dtype=="AMC") {
						        var url=document.URL;
						        var reurl=url.split("assignjobfollowup.jsp");
					
						        var win= window.open(reurl[0]+"printassignjobfollowupAMC?branch="+barchval+"&docno="+document.getElementById("doccno").value+'&dtype='+$("#dtype").val()+'&srno='+$("#srno").val(),"_blank","top=150,left=250,Width=1020,Height=500,location=no,scrollbars=no,toolbar=yes");
						        
						        win.focus();
						     }
					 	     else if($("#doccno").val()!="" && dtype=="SJOB"){
					 	    	
					 	    	var url=document.URL;
						        var reurl=url.split("assignjobfollowup.jsp");
					
						        var win= window.open(reurl[0]+"printassignjobfollowupSjob?branch="+barchval+"&docno="+document.getElementById("doccno").value+'&dtype='+$("#dtype").val()+'&srno='+$("#srno").val(),"_blank","top=150,left=250,Width=1020,Height=500,location=no,scrollbars=no,toolbar=yes");
						        
						        win.focus();
					 	    	
					 	    }
					 	    else if ($("#doccno").val()!="" && dtype=="CREG") {
						        
					 	    	var url=document.URL;
						        var reurl=url.split("assignjobfollowup.jsp");
						        var brhid=<%= session.getAttribute("BRANCHID").toString()%>
					
						      // var win= window.open(reurl[0]+"printassignjobfollowup?branch="+barchval+"&docno="+document.getElementById("doccno").value+'&dtype='+$("#dtype").val()+'&srno='+$("#srno").val(),"_blank","top=150,left=250,Width=1020,Height=500,location=no,scrollbars=no,toolbar=yes");
						      
						      var win= window.open(reurl[0]+"printAssignCallRegister?docno="+document.getElementById("doccno").value+"&brhid="+brhid+"&trno="+$("#calld").val()+"&header=1","_blank","top=250,left=310,Width=800,Height=800,location=no,scrollbars=yes,toolbar=yes");
						        win.focus();
						     }
					 	     
					 	    else {
								$.messager.alert('Message','Please Select a Client.','warning');
								return;
							}
				  
			  }
			  else
				  {
				  funPrint();
				  }
			  }
          
          
          
          		  
       
		  
		  
</script>
</head>
<body onload="getBranch();fromdatecheck();serviceview();printcheck();">
<div id="mainBG" class="homeContent" data-type="background"> 
<div class='hidden-scrollbar'>

<div class="master-container">
    
    <div class="sidebar-filters">
        <div class="sidebar-fixed-top">
            <div class="filter-card" style="padding: 10px;">
                <jsp:include page="../../heading.jsp"></jsp:include>
            </div>
        </div>

        <div class="sidebar-scroll-content">
            
            <div class="filter-card">
                <table class="release-filter-table">
                    <tr>
                        <td class="label-cell">
                            <div style="display: flex; align-items: center; justify-content: flex-end; gap: 5px;">
                                <input type="checkbox" id="chckfromdate" name="chckfromdate" value="" onchange="fromdatecheck();" onclick="$(this).attr('value', this.checked ? 1 : 0)" style="width: auto; height: auto;" /> 
                                <span>From</span>
                            </div>
                        </td>
                        <td>
                            <div id="fromdate" name="fromdate" value='<s:property value="fromdate"/>'></div>
                            <input type="hidden" id="hidchckfromdate" name="hidchckfromdate" value='<s:property value="hidchckfromdate"/>'/>
                        </td>
                    </tr>
                    <tr>
                        <td class="label-cell">Upto</td>
                        <td><div id='todate' name='todate' value='<s:property value="todate"/>'></div></td>
                    </tr>
                    <tr>
                        <td class="label-cell">Client</td>
                        <td>
                            <div style="display: flex; gap: 5px; align-items: center;">
                                <input type="text" name="txtclient" id="txtclient" value='<s:property value="txtclient"/>' onKeyDown="getclinfo(event);" readonly placeholder="Press F3 to Search">
                                <button type="button" class="bicon" id="clear" title="clear" onclick="funClear()"> 
                                    <img alt="clear" src="<%=contextPath%>/icons/clear.png">
                                </button>
                            </div>
                        </td>
                    </tr>
                    <tr>
                        <td class="label-cell">Assign Group</td>
                        <td>
                            <input type="text" name="txtsergroup" id="txtsergroup" value='<s:property value="txtsergroup"/>' onKeyDown="getgrpcode(event,1);" readonly placeholder="Press F3 to Search">
                        </td>
                    </tr>
                    <tr>
                        <td class="label-cell">Group Member</td>
                        <td>
                            <input type="text" name="txtsergrpemp" id="txtsergrpemp" value='<s:property value="txtsergrpemp"/>' onKeyDown="getteam(event,1);" readonly placeholder="Press F3 to Search">
                        </td>
                    </tr>
                    <tr>
                        <td class="label-cell">Area</td>
                        <td>
                            <input type="text" name="txtassignarea" id="txtassignarea" value='<s:property value="txtassignarea"/>' onKeyDown="getareas(event);" readonly placeholder="Press F3 to Search">
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2">
                            <div style="display: flex; justify-content: center; align-items: center; gap: 10px; margin-top: 5px;">
                                <label style="font-size: 12px; font-weight: 600; color: #4e5e71;">Priority</label>       
                                <input type="checkbox" name="priority" id="priority" onchange="pChange();" style="width: auto; height: auto;">
                                <button type="button" class="bicon" id="btnPrint" hidden="true" title="Print current Document" onclick="funPrintBtn()">  
                                    <img alt="printDocument" src="<%=contextPath%>/icons/print_new.png">
                                </button>
                            </div>
                        </td>
                    </tr>
                </table>
            </div>
            
            <div class="filter-card" style="padding: 5px;">
                <div id="serCountgrid"><jsp:include page="serCountgrid.jsp"></jsp:include></div>
                <div style="text-align: center; margin-top: 5px;">
                    <label id="test" style="font-family: comic sans ms; font-weight: bold; color: blue; font-size: 12px;"></label>
                </div>
            </div>

            <div class="filter-card">
                <div style="font-size: 13px; font-weight: bold; color: #333; margin-bottom: 10px;">Assign Actions</div>
                <table class="release-filter-table">
                    <tr>
                        <td class="label-cell">Assign Group</td>
                        <td>
                            <input type="text" name="txtgroup" id="txtgroup" value='<s:property value="txtgroup"/>' onKeyDown="getgrpcode(event,2);" readonly placeholder="Press F3 to Search">
                        </td>
                    </tr>
                    <tr>
                        <td class="label-cell">Group Member</td>
                        <td>
                            <input type="text" name="txtgrpmember" id="txtgrpmember" value='<s:property value="txtgrpmember"/>' onKeyDown="getteam(event,2);" readonly placeholder="Press F3 to Search">
                        </td>
                    </tr>
                    <tr>
                        <td class="label-cell">Assign Method</td>
                        <td>
                            <input type="text" name="txtassign" id="txtassign" value='<s:property value="txtassign"/>' onKeyDown="getassign(event);" readonly placeholder="Press F3 to Search">
                        </td>
                    </tr>
                    <tr>
                        <td class="label-cell">Description</td>
                        <td>
                            <input type="text" name="txtdesc" id="txtdesc" value='<s:property value="txtdesc"/>'>
                        </td>
                    </tr>
                    <tr>
                        <td class="label-cell">Planned Date</td>
                        <td>
                            <div id='adate' name='adate' value='<s:property value="adate"/>'></div> 
                        </td>
                    </tr>
                    <tr>
                        <td class="label-cell">Planned Time</td>
                        <td>
                            <div id='atime' name='atime' value='<s:property value="atime"/>'></div>
                            <input type="hidden" name="txtptime" id="txtptime" value='<s:property value="txtptime"/>' readonly >
                        </td>
                    </tr>
                </table>
                
                <div class="button-group">
                    <button type="button" name="btnsave" class="btn-submit" onclick="save();">Save</button>
                    <button type="button" name="btnprint" class="btn-submit" onclick="configCheck();">Print</button>
                </div>
            </div>
            
            <div style="display: none;">
                <input type="hidden" id="clientid" name="clientid" value='<s:property value="clientid"/>'>
                <input type="hidden" id="sergroupid" name="sergroupid" value='<s:property value="sergroupid"/>'>
                <input type="hidden" id="grpsermemberid" name="grpsermemberid" value='<s:property value="grpsermemberid"/>'>
                <input type="hidden" id="grpserempid" name="grpserempid" value='<s:property value="grpserempid"/>'>
                <input type="hidden" id="txtareaid" name="txtareaid" value='<s:property value="txtareaid"/>'>
                
                <input type="hidden" id="groupid" name="groupid" value='<s:property value="groupid"/>'>
                <input type="hidden" id="grpmemberid" name="grpmemberid" value='<s:property value="grpmemberid"/>'>
                <input type="hidden" id="grpempid" name="grpempid" value='<s:property value="grpempid"/>'>
                
                <input type="hidden" id="assignid" name="assignid" value='<s:property value="assignid"/>'>
                <input type="hidden" id="trno" name="trno" value='<s:property value="trno"/>'>
                <input type="hidden" id="srno" name="srno" value='<s:property value="srno"/>'>
                <input type="hidden" id="calld" name="calld" value='<s:property value="calld"/>'>
                <input type="hidden" id="doccno" name="doccno" value='<s:property value="doccno"/>'>
                <input type="hidden" id="dtype" name="dtype" value='<s:property value="dtype"/>'>
                <input type="hidden" id="isprior" name="isprior" value='<s:property value="isprior"/>'>
                <input type="hidden" id="rowindex" name="rowindex" value='<s:property value="rowindex"/>'>
                <input type="hidden" id="dtyp" name="dtyp">
                <input type="hidden" id="bttnview" name="bttnview" value='<s:property value="bttnview"/>'>
                <input type="hidden" id="confvalue" name="confvalue" value='<s:property value="confvalue"/>'>
            </div>
            
        </div>
    </div>

    <div class="main-content-area">
        <div class="grid-container">
            <div id="serschedulediv"><jsp:include page="serScheduleDetails.jsp"></jsp:include></div>
        </div>
        <div class="grid-container">
            <div id="assignSubDiv"><jsp:include page="assignSubGrid.jsp"></jsp:include></div>
        </div>
    </div>

</div>

<div id="clientsearch1">
   <div></div>
</div> 
<div id="grpinfowindow">
   <div></div>
</div>
<div id="teaminfowindow">
   <div></div>
</div>
<div id="assigninfowindow">
   <div></div>
</div>
<div id="areainfowindow">
   <div></div>
</div>

</div>
</body>
</html>