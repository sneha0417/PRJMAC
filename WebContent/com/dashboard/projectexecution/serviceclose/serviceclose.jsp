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
.release-filter-table div[id^="frmdate"],
.release-filter-table div[id^="todate"] {
    width: 100%;
}

/* ===== BLUE BUTTONS ===== */
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
	
	  $("body").prepend('<div id="overlay" class="ui-widget-overlay" style="z-index: 1; display: none;"></div>');
	  $("body").prepend("<div id='PleaseWait' style='display: none;position:absolute; z-index: 1;top:180px;right:550px;'><img src='../../../../icons/31load.gif'/></div>");

	  $('#clientsearch1').jqxWindow({ width: '50%', height: '55%',  maxHeight: '85%' ,maxWidth: '80%' ,title: 'Client Search' , position: { x: 250, y: 120 }, keyboardCloseKey: 27});
	  $('#clientsearch1').jqxWindow('close');
		  
	  $('#contractwindow').jqxWindow({width: '40%', height: '50%',  maxHeight: '60%' ,maxWidth: '40%' , title: 'Contract Search',position: { x: 300, y: 87 } , theme: 'energyblue', showCloseButton: true, keyboardCloseKey: 27});
	  $('#contractwindow').jqxWindow('close');
		  
	 // Standardized to 100% width and 24px height
	 $("#todate").jqxDateTimeInput({ width: '100%', height: '24px',formatString:"dd.MM.yyyy"});
	 $("#frmdate").jqxDateTimeInput({ width: '100%', height: '24px',formatString:"dd.MM.yyyy"});
	
	 var todates=new Date($('#todate').jqxDateTimeInput('getDate'));
	 var onemounth=new Date(new Date(todates).setMonth(todates.getMonth()-1)); 
	    
	 $('#frmdate').jqxDateTimeInput('setDate', onemounth);
     $('#todate').jqxDateTimeInput('setDate', new Date());
     
	
     $('#txtclient').dblclick(function(){
		   
    	 $('#clientsearch1').jqxWindow('open');
    	 clientSearchContent('clientINgridsearch.jsp?', $('#clientsearch1')); 
		   		
		 });
	 
     $('#txtcontract').dblclick(function(){
	 	    $('#contractwindow').jqxWindow('open');
	   
	 	//  contractSearchContent('contractMastersearch.jsp');
	 	  contractSearchContent('contractDetailsSearch.jsp?', $('#contractwindow'));
     });
    
	  
});


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
     
   
     function funExportBtn(){
			
 	
 	   JSONToCSVCon(excelsrvclosedata,'Service Close',true);
 
  }
   



function funreload()
{
     var id=1;
  
    if(id>0){
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
		 
	
		 var date=$('#todate').val();
		 var frmdate=$('#frmdate').val();
		 
		 var contractType=document.getElementById("cmbreftype").value;
	 	 var cldocno=document.getElementById("clientid").value;
	 
	 	 var contractno=document.getElementById("txtcontract").value;
	 	 var branchval = document.getElementById("cmbbranch").value;
	 	 if(contractType==""){
	 		 $.messager.alert('Message','Select a contract Type','warning');
	 		 return 0;
	 	 }
	 
		 if(id>0){
            $("#serCountgrid").load('serCountgrid.jsp?contracttype='+contractType+'&cldocno='+cldocno+'&contractno='+contractno+'&date='+date+'&frmdate='+frmdate+'&id='+id+'&branchval='+branchval);
		 }
		
		 
	 }
	 
	 	

	   
	   function funClear(){
			
		   document.getElementById("txtclient").value="";
		   document.getElementById("clientid").value="0";
		   $("#txtclient").attr("placeholder", "press F3 for Search");
		   document.getElementById("txtcontract").value="";
		   document.getElementById("schtrno").value="0";
		   $("#txtclient").attr("placeholder", "press F3 for Search");
		   
		   $("#jqxloaddataGrid").jqxGrid('clear'); 
			$("#jqxSerCount").jqxGrid('clear');
		 }
	   
	   
	   function getcontract(event){

		   var contractType=document.getElementById("cmbreftype").value;
	 		var cldocno=document.getElementById("clientid").value;
		   
			var x= event.keyCode;
		 	 if(x==114){
		 		 $('#contractwindow').jqxWindow('open');
		 		// changeContent('contractMastersearch.jsp');  
		 		 contractSearchContent('contractDetailsSearch.jsp?contracttype='+contractType+'&cldocno='+cldocno, $('#contractwindow'));
		    	 }
		 	 else{
		 		 
		 		 }
		 	 }
		    	 
		function contractSearchContent(url) {
			 $.get(url).done(function (data) {
			$('#contractwindow').jqxWindow('setContent', data);
		            	}); 
		 	}
	
		function save(){
			
			
			 var date=$('#todate').val();
			 var frmdate=$('#frmdate').val();
			 
			 var contractType=document.getElementById("cmbreftype").value;
		 	 var cldocno=document.getElementById("clientid").value;
		 	 var contractno=document.getElementById("txtcontract").value;
			 var barchval = document.getElementById("cmbbranch").value;
		     var schtrno=document.getElementById("schtrno").value;
		     var id=1;
		     
				var x=new XMLHttpRequest();
				x.onreadystatechange=function(){
				if (x.readyState==4 && x.status==200)
					{
					 	var items= x.responseText;
					 	 items=items.split('###');
					 	 var res=items[0];
					 	 
					 	if(res>0){
							   $.messager.alert('Message',"Saved Successfully");
							   
							   var contractType=document.getElementById("cmbreftype").value;
				   		 	 var cldocno=document.getElementById("clientid").value;
				   		 	 var contractno=document.getElementById("txtcontract").value;
				   			 var barchval = document.getElementById("cmbbranch").value;
					             var rowindex=document.getElementById("rowindex").value;
					             
					             $('#jqxloaddataGrid').jqxGrid('setcellvalue', rowindex, "gridrow",1);
					             funreload();
					             
					         /* $("#txtgroup").attr("placeholder", "press F3 for Search");
					             $("#txtgrpmember").attr("placeholder", "press F3 for Search");
					             $("#txtassign").attr("placeholder", "press F3 for Search");
					       
					              */
				   		
							  }
					 	else{
					 		$.messager.alert('Message',"Not Updated");
					 	}
					 	 
						}
				       else
					  {}
			     }
			      x.open("GET",'saveSchedule.jsp?contracttype='+contractType+'&cldocno='+cldocno+'&contractno='+contractno+'&date='+date+'&frmdate='+frmdate+'&id='+id+'&barchval='+barchval+'&schtrno='+schtrno,true);
			     x.send();
			    
			   }
	
</script>
</head>
<body onload="getBranch();">
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
                        <td class="label-cell">From Date</td>
                        <td><div id='frmdate' name='frmdate' value='<s:property value="frmdate"/>'></div></td>
                    </tr>
                    <tr>
                        <td class="label-cell">To Date</td>
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
                        <td class="label-cell">Contr. Type</td>
                        <td>
                            <select id="cmbreftype" name="cmbreftype" value='<s:property value="cmbreftype"/>'>
                                <option value=""></option>
                                <option value="AMC">AMC</option>
                                <option value="SJOB">SJOB</option>
                                <option value="CREG">CREG</option>
                            </select>
                        </td>
                    </tr>
                    <tr>
                        <td class="label-cell">Contract No</td>
                        <td>
                            <input type="text" name="txtcontract" id="txtcontract" placeholder="Press F3 To Search" onKeyDown="getcontract(event);" readonly value='<s:property value="txtcontract"/>'>
                        </td>
                    </tr>
                </table>
                
                <div class="button-group">
                    <button type="button" name="btnsave" class="btn-submit" onclick="save();">Update</button>
                </div>
            </div>
            
            <div class="filter-card" style="padding: 5px;">
                <div id="serCountgrid"><jsp:include page="serCountgrid.jsp"></jsp:include></div>
                <div style="text-align: center; margin-top: 5px;">
                    <label id="test" style="font-family: comic sans ms; font-weight: bold; color: blue; font-size: 12px;"></label>
                </div>
            </div>
            
            <div style="display: none;">
                <input type="hidden" id="clientid" name="clientid" value='<s:property value="clientid"/>'>
                <input type="hidden" id="trno" name="trno" value='<s:property value="trno"/>'>
                <input type="hidden" id="schtrno" name="schtrno" value='<s:property value="schtrno"/>'>
                <input type="hidden" id="rowindex" name="rowindex" value='<s:property value="rowindex"/>'>
            </div>
            
        </div>
    </div>

    <div class="main-content-area">
        <div class="grid-container">
            <div id="serschedulediv"><jsp:include page="servicecloseDetails.jsp"></jsp:include></div>
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
<div id="contractwindow">
   <div></div>
</div>

</div>
</body>
</html>