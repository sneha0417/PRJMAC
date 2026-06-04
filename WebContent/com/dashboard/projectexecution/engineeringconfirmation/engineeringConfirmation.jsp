<jsp:include page="../../../../includes.jsp"></jsp:include>    
<%@ taglib prefix="s" uri="/struts-tags" %>
<% String contextPath=request.getContextPath();%>
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
    width: 80px;
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

input[readonly],
input:disabled,
select:disabled {
    background-color: #f3f6f9 !important;
    color: #555;
    cursor: default !important;
}

/* jqx date/time containers */
.release-filter-table div[id^="fromdate"],
.release-filter-table div[id^="todate"],
.release-filter-table div[id^="followupdate"],
.release-filter-table div[id^="date"] {
    width: 100%;
}

/* Inline Checkbox */
.inline-checkbox-label {
    display: flex;
    align-items: center;
    gap: 5px;
    font-size: 12px;
    font-weight: 600;
    color: #4e5e71;
    cursor: pointer;
}
.inline-checkbox-label input[type="checkbox"] {
    margin: 0;
    cursor: pointer;
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
.btn-submit:disabled { background: #9ca3af; cursor: default !important; opacity: 0.7; }
.btn-submit:active:not(:disabled) { transform: scale(0.98); }

.button-group {
    display: flex;
    gap: 10px;
    margin-top: 15px;
    width: 100%;
}

/* Main Content Area (RIGHT SIDE) */
.main-content-area {
    flex: 1;
    height: 100vh;
    overflow-y: auto; 
    background: #ffffff;
    padding: 15px;
    box-sizing: border-box;
    display: flex;
    flex-direction: column;
}

.grid-container {
    margin-bottom: 20px;
}
</style>

<script type="text/javascript">

	$(document).ready(function () {
		
         // Standardized to 100% width and 24px height
		 $("#date").jqxDateTimeInput({ width: '100%', height: '24px',formatString:"dd.MM.yyyy"});
		 $("#followupdate").jqxDateTimeInput({ width: '100%', height: '24px',formatString:"dd.MM.yyyy"});
		 $("#fromdate").jqxDateTimeInput({ width: '100%', height: '24px',formatString:"dd.MM.yyyy"});
		 $("#todate").jqxDateTimeInput({ width: '100%', height: '24px',formatString:"dd.MM.yyyy"});
			
		 var fromdates=new Date($('#fromdate').jqxDateTimeInput('getDate'));
		 var onemounth=new Date(new Date(fromdates).setMonth(fromdates.getMonth()-1)); 
		  
	     $('#fromdate').jqxDateTimeInput('setDate', new Date(onemounth));
	     $('#todate').on('change', function (event) {
					
				   var fromdates=new Date($('#fromdate').jqxDateTimeInput('getDate'));
			
				   // out date
				 	 var todates=new Date($('#todate').jqxDateTimeInput('getDate')); //del date
				 	 
				   if(fromdates>todates){
					   
					   $.messager.alert('Message','To Date Less Than From Date  ','warning');   
					 
				   return false;
				  }})
	   
		 $("body").prepend('<div id="overlay" class="ui-widget-overlay" style="z-index: 1; display: none;"></div>');
	     $("body").prepend("<div id='PleaseWait' style='display: none;position:absolute; z-index: 1;top:180px;right:550px;'><img src='../../../../icons/31load.gif'/></div>");
	     $('#sidesearchwndow').jqxWindow({ width: '30%', height: '70%',  maxHeight: '90%' ,maxWidth: '80%' ,title: 'Search ' , position: { x: 300, y: 0 }, keyboardCloseKey: 27});
			$('#sidesearchwndow').jqxWindow('close'); 
			 $('#servicetypewindow').jqxWindow({ width: '25%', height: '70%',  maxHeight: '85%' ,maxWidth: '80%' ,title: ' Service Type Search' , position: { x: 250, y: 60 }, keyboardCloseKey: 27});
			  $('#servicetypewindow').jqxWindow('close');
			  $('#sitewindow').jqxWindow({ width: '25%', height: '60%',  maxHeight: '60%' ,maxWidth: '80%' ,title: ' Site Search' , position: { x: 250, y: 60 }, keyboardCloseKey: 27});
			  $('#sitewindow').jqxWindow('close');

	});
	
	 function productSearchContent(url) {
         	 //alert(url);
         		 $.get(url).done(function (data) {
         			 
         			 $('#sidesearchwndow').jqxWindow('open');
         		$('#sidesearchwndow').jqxWindow('setContent', data);
         
         	}); 
       } 
	
	function getservicetype(rowBoundIndex){
		 
		  $('#servicetypewindow').jqxWindow('open');

	        serviceSearchContent('servicesearch.jsp?rowBoundIndex='+rowBoundIndex);
	   	 }
	   	 
	function serviceSearchContent(url) {
	
		 $.get(url).done(function (data) {
			
	$('#servicetypewindow').jqxWindow('setContent', data);

	             	}); 
	 	}
	function getsite(rowBoundIndex,reftrno,id){
		 
		  $('#sitewindow').jqxWindow('open');
	  var reftype="ENQ";
	 // $('#accountWindow').jqxWindow('focus');
	        siteSearchContent("sitesearch.jsp?rowBoundIndex="+rowBoundIndex+"&reftrno="+reftrno+"&id="+id+"&reftype="+reftype);
	   	 }
	   	 
	function siteSearchContent(url) {
	//alert(url);
		 $.get(url).done(function (data) {
			 //alert(data);
	$('#sitewindow').jqxWindow('setContent', data);

	             	}); 
	 	}
	function getProcess() {
		var x = new XMLHttpRequest();
		x.onreadystatechange = function() {
			if (x.readyState == 4 && x.status == 200) {
				var items = x.responseText;
				items = items.split('####');
				
				var srno  = items[0].split(",");
				var process = items[1].split(",");
				var optionsbranch = '<option value="" selected>-- Select -- </option>';
				for (var i = 0; i < process.length; i++) {
					optionsbranch += '<option  value="' + srno[i].trim()+'">'
					+ process[i] + '</option>';
				}
				$("select#cmbprocess").html(optionsbranch);
				
			} else {}
		}
		x.open("GET","getProcess.jsp", true);
		x.send();
	}
	
	function disable(){
		 
		
		 $('#date').jqxDateTimeInput({ disabled: true});
		 $('#cmbprocess').attr("disabled",true);
		
		 $('#txtremarks').attr("readonly",true);
		 $('#btnupdate').attr("disabled",true);
		
		 $("#engconfirmsubgrid").jqxGrid('clear');
		 $("#engconfirmsubgrid").jqxGrid("addrow", null, {}); 
		 $("#engconfirmsubgrid").jqxGrid({ disabled: true});
		 
		 $("#materialEstPriceGrid").jqxGrid('clear');
		 $("#materialEstPriceGrid").jqxGrid("addrow", null, {}); 
		 $("#materialEstPriceGrid").jqxGrid({ disabled: true});
	}
	
	function funreload(event){
		 disable();
		 var fromdate = $('#fromdate').val();
		 var todate = $('#todate').val();
		 var branchval = document.getElementById("cmbbranch").value;
		 var chkfollowup = $('#hidchckfollowup').val();
		 var followupdate = $('#followupdate').val();
		
		 $("#overlay, #PleaseWait").show();  
		 $("#engConfirmDiv").load("engineeringConfirmationGrid.jsp?branchval="+branchval+"&followupdate="+followupdate+'&fromdate='+fromdate+'&todate='+todate+"&chkfollowup="+chkfollowup+"&check=1");
	}
	function funUpdate(event){      
		 $("#materialEstPriceGrid").jqxGrid('clearfilters');
		
		 var rdocno=$('#txtrdocno').val();
		 var date =  $('#date').val();
		 var remarks = $('#txtremarks').val();
	     var proid=$('#cmbprocess').val();
	     var msg="";
		 if(proid==3){ 
			 msg="Do you want to confirm?";
		 }else if(proid==4){
			 msg="Do you want to update?";
		 }else{
			 msg="Do you want to save changes?";
		 }
		 var branchid =$("#txtbrchid").val(); 
		 var userid=$("#txtuserid").val(); 
		 var contracttrno=$("#hidcontracttrno").val(); 
		 if(proid==''){
			 $.messager.alert('Message','Please choose a Process.','warning');
			 return 0;
		 }
		
		 if(proid==3 || proid==4){ 
			 var rows1 = $("#materialEstPriceGrid").jqxGrid('getrows');
		  	//document.getElementById("errormsg").innerText="";
		  	 var val=0,gridlen=0;
		  	 for(var i=0 ; i < rows1.length ; i++){
		  		     var psrno=rows1[i].psrno;
		  		     var site=rows1[i].site;
		  		     if(typeof(site)!="undefined" && typeof(site)!="NaN" && site!="" && site!="0"){        
			  		     newTextBox = $(document.createElement("input"))
			  		       .attr("type", "dil")
			  		       .attr("id", "mate"+i)
			  		       .attr("name", "mate"+i)
			  		       .attr("hidden", "true"); 
				 
			  	 		   newTextBox.val(rows1[i].desc1+" :: "+rows1[i].prodoc+" :: "+rows1[i].psrno+" :: "+rows1[i].unitdocno+" :: "+rows1[i].qty+" :: "+
			  	 				   rows1[i].amount+" :: "+rows1[i].total+" :: "+rows1[i].margin+" :: "+rows1[i].nettotal+" :: "+rows1[i].activityid+" :: "+
			  	 				   rows1[i].site+" :: "+rows1[i].stypeid+" :: "+rows1[i].sitesrno+" :: ");
			  		     newTextBox.appendTo('form');
			  		     if(typeof(psrno)=="undefined" || typeof(psrno)=="NaN" || psrno=="" || psrno=="0"){   
			  				 val=1;  
			  		     } 
			  		     gridlen++;  
		  		     }  
		  	 }
		  	 if(proid==3 && val==1){  
		  		 $.messager.alert('Message','Product is missing!!! You cannot confirm without valid products.','warning');
				 return 0;  
		  	 }
		  	 $.messager.confirm('Message', ''+msg, function(r){  
					if(r==false) {
						return false; 
					} else {
						$('#estimationgrdlen').val(gridlen);   
						$('#frmprocfol').submit();
					    return 1;    
					}
				}); 
       } else{
		 if(remarks==''){
			 $.messager.alert('Message','Please Enter Remarks.','warning');   
			 return 0;
		 }
		 $.messager.confirm('Message', 'Do you want to save changes?', function(r){
		     	if(r==false)
		     	  {
		     		return false; 
		     	  }
		     	else{
		     		saveGridData(rdocno,date,remarks,proid,branchid,userid,contracttrno);	
		     	}
		});
      }	 
		 
	}
	
	function followupcheck(){
		 if(document.getElementById("chckfollowup").checked){
			 document.getElementById("hidchckfollowup").value = 1; 
			
			 $('#followupdate').jqxDateTimeInput({ disabled: false});
			 $('#fromdate').jqxDateTimeInput({ disabled: true});
			 $('#todate').jqxDateTimeInput({ disabled: true});
		 }
		 else{
			 document.getElementById("hidchckfollowup").value = 0;
			 $('#followupdate').jqxDateTimeInput({ disabled: true});
			 $('#fromdate').jqxDateTimeInput({ disabled: false});
			 $('#todate').jqxDateTimeInput({ disabled: false});
		 }
	 }
		
	function saveGridData(rdocno,date,remarks,proid,branchid,userid,contracttrno){
		var x=new XMLHttpRequest();
		x.onreadystatechange=function(){
		if (x.readyState==4 && x.status==200){
	       			
				var items=x.responseText;
				if(parseInt(items)==1)  
				{	
				 $('#cmbprocess').val('');
				$('#date').val(new Date());
				$('#txtbrchid').val('');
				$('#txtremarks').val('');
				$('#txtrdocno').val('');
				$('#txtcldocno').val('');
				$('#txtuserid').val('');
				$('#hidcontracttrno').val('');
				
				$.messager.alert('Message', '  Record Successfully Updated ');
			//	funreload(event); 
				disable();
				}
				else
				{
				$.messager.alert('Message', '  Not Updated  ');
				}
				}
		}
		
    x.open("GET","saveData.jsp?trdocno="+rdocno+"&fldate="+date+"&remark="+remarks+"&bibpid="+proid+"&brchid="+branchid+"&userid="+userid+"&contracttrno="+contracttrno,true);			
	x.send();
			
	}
	   function setValues(){

			 if($('#msg').val()!=""){
				 
	   		  $.messager.alert('Message','<center>'+$('#msg').val()+'</center>');
	   		  }
		}
	   
	   
	   function funExportBtn(){
		   $("#engConfirmDiv").excelexportjs({  
				containerid: "engConfirmDiv", 
				datatype: 'json', 
				dataset: null, 
				gridId: "jqxEngConfGrid", 
				columns: getColumns("jqxEngConfGrid") ,   
				worksheetName:"EngineeringConformation"
			});
			$("#EstDiv").excelexportjs({  
				containerid: "EstDiv", 
				datatype: 'json', 
				dataset: null, 
				gridId: "materialEstPriceGrid", 
				columns: getColumns("materialEstPriceGrid") ,   
				worksheetName:"EngineeringConformation1"
			});
		}
</script>
</head>
<body onload="getBranch();getProcess();disable();followupcheck();setValues();">
<form id="frmprocfol" action="savePFdetails" method="post" autocomplete="off">
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
                        <td class="label-cell">From</td>
                        <td><div id='fromdate' name='fromdate' value='<s:property value="fromdate"/>'></div></td>
                    </tr>
                    <tr>
                        <td class="label-cell">To</td>
                        <td><div id='todate' name='todate' value='<s:property value="todate"/>'></div></td>
                    </tr>                 
                    <tr>
                        <td class="label-cell"></td>
                        <td>
                            <label class="inline-checkbox-label">
                                <input type="checkbox" id="chckfollowup" name="chckfollowup" value="" onchange="followupcheck();" onclick="$(this).attr('value', this.checked ? 1 : 0)" /> 
                                Enable FollowUp
                            </label>
                            <input type="hidden" id="hidchckfollowup" name="hidchckfollowup" value='<s:property value="hidchckfollowup"/>'/>
                        </td>
                    </tr>
                    <tr>
                        <td class="label-cell">FollowUp</td>
                        <td><div id="followupdate" name="followupdate" value='<s:property value="followupdate"/>'></div></td>
                    </tr>
                </table>
            </div>

            <div class="filter-card">
                <div style="font-size: 13px; font-weight: bold; color: #333; margin-bottom: 10px;">Process Update</div>
                <table class="release-filter-table">
                    <tr>
                        <td class="label-cell">Process</td>
                        <td><select name="cmbprocess" id="cmbprocess" value='<s:property value="cmbprocess"/>'></select></td>
                    </tr>
                    <tr>
                        <td class="label-cell">Date</td>
                        <td><div id="date" name="date" value='<s:property value="date"/>'></div></td>
                    </tr>
                    <tr>
                        <td class="label-cell">Remarks</td>
                        <td><input type="text" id="txtremarks" name="txtremarks" value='<s:property value="txtremarks"/>'/></td>
                    </tr>
                </table>
                
                <div class="button-group">
                    <button type="button" class="btn-submit" id="btnupdate" name="btnupdate" onclick="funUpdate(event);">Update</button>
                </div>
            </div>
            
            <div style="display: none;">
                <input type="text" name="gridtext" id="gridtext" value='<s:property value="gridtext"/>' />   
                <input type="text" name="gridtext1" id="gridtext1" value='<s:property value="gridtext1"/>' />
                
                <input type="hidden" id="txtdocno" name="txtdocno" value='<s:property value="txtdocno"/>'/>
                <input type="hidden" id="txtbranch" name="txtbranch" value='<s:property value="txtbranch"/>'/>
                <input type="hidden" id="txtsalid" name="txtsalid" value='<s:property value="txtsalid"/>'/>
                <input type="hidden" id="txtrdocno" name="txtrdocno" value='<s:property value="txtrdocno"/>'/>
                <input type="hidden" id="txtbrchid" name="txtbrchid" value='<s:property value="txtbrchid"/>'/>
                <input type="hidden" id="txtuserid" name="txtuserid" value='<s:property value="txtuserid"/>'/>
                <input type="hidden" id="txtnettotal" name="txtnettotal" value='<s:property value="txtnettotal"/>'/> 
                <input type="hidden" id="txtmatotal" name="txtmatotal" value='<s:property value="txtmatotal"/>'/> 
                <input type="hidden" id="hidsurtrno" name="hidsurtrno" value='<s:property value="hidsurtrno"/>' />
                <input type="hidden" id="hidenqtrno" name="hidenqtrno" value='<s:property value="hidenqtrno"/>' />
                <input type="hidden" id="estimationgrdlen" name="estimationgrdlen" value='<s:property value="estimationgrdlen"/>'/>
                <input type="hidden" id="hidcontracttrno" name="hidcontracttrno" value='<s:property value="hidcontracttrno"/>' />
                <input type="hidden" id="productchk" name="productchk" value='<s:property value="productchk"/>' />  
            </div>
            
        </div>
    </div>

    <div class="main-content-area">
        <div class="grid-container">
            <div id="engConfirmDiv"><jsp:include page="engineeringConfirmationGrid.jsp"></jsp:include></div>
        </div>
        <div class="grid-container">
            <div id="EstDiv"><jsp:include page="EstDetailGrid.jsp"></jsp:include></div>
        </div>
        <div class="grid-container">
            <div id="detailDiv"><jsp:include page="engineeringConfirmationSubGrid.jsp"></jsp:include></div>
        </div>
    </div>

</div>

<div id="sidesearchwndow">
   <div></div> 
</div>
<div id="servicetypewindow">
   <div></div>
</div>
<div id="sitewindow">
   <div></div>
</div>

</div> 
</form>
</body>
</html>