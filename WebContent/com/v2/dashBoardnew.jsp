<%@ taglib prefix="s" uri="/struts-tags"%>
<% String contextPath=request.getContextPath();%>
<%@page import="com.dashboard.ClsDashBoardNewDAO"%>
<%ClsDashBoardNewDAO DAO= new ClsDashBoardNewDAO(); %>   
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">  
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>GatewayERP(i)</title>
<jsp:include page="includesdashboard.jsp"></jsp:include>
<link href='http://fonts.googleapis.com/css?family=Mr+Dafoe' rel='stylesheet' type='text/css'> 
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css">
<%-- <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script> --%>
<%-- <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script> --%>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>
<link href="https://cdnjs.cloudflare.com/ajax/libs/select2/4.0.10/css/select2.min.css" rel="stylesheet" />
<script src="https://cdnjs.cloudflare.com/ajax/libs/select2/4.0.10/js/select2.min.js"></script>
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.1/css/all.css">
<link href="https://fonts.googleapis.com/css?family=Poppins" rel="stylesheet">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/3.7.0/animate.min.css">
<link href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet">
<link rel="stylesheet" href="../../css/util.css">
<link rel="stylesheet" href="https://cdn.datatables.net/1.10.21/css/dataTables.bootstrap.min.css"/>
<link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/npm/daterangepicker/daterangepicker.css" />
<style type="text/css">
	@import url(https://fonts.googleapis.com/css?family=Source+Sans+Pro);
	@import url(https://fonts.googleapis.com/css?family=Teko:700);
	@font-face {
		font-family: Poppins-Regular;
	  	src: url('fonts/poppins/Poppins-Regular.ttf'); 
	}
	
	@font-face {
	  	font-family: Poppins-Medium;
	  	src: url('fonts/poppins/Poppins-Medium.ttf'); 
	}
	
	@font-face {
	  	font-family: Montserrat-Medium;
	  	src: url('fonts/montserrat/Montserrat-Medium.ttf'); 
	}
	
	@font-face {
	  	font-family: Montserrat-SemiBold;
	  	src: url('fonts/montserrat/Montserrat-SemiBold.ttf'); 
	}
	* {
		margin: 0px; 
		padding: 0px; 
		box-sizing: border-box;
	}
	html,body{
		width:100%;
		height:100%;
		background-color:#F7F7F7;
		font-family: Poppins-Regular, sans-serif;
	}
	html {
	    font-family: sans-serif;
	    line-height: 1.15;
	    -webkit-text-size-adjust: 100%;
	    -webkit-tap-highlight-color: rgba(0, 0, 0, 0);
	}
	body {
	    margin: 0;
	    font-family: "Poppins";
	    font-size: 1.3rem;
	    font-weight: 400;
	    line-height: 1.5;
	    color: #212529;
	    text-align: left;
	    background-color: #F7F7F7;
	    width:100%;
	    overflow:auto;
		height:100%;
		background-color: #F7F7F7;
	}
	.sidebar{
		position:absolute;
		z-index:999999;
		width:100px;
		min-height:100%;
		background-color:#fff;
	}
	
	.admin-cover .panel-body,.chart-panel .panel-body{
		border:none;
	}
		
	.page-loader{
		position:fixed;
		top:50%;
		left:50%;
		transform:translate(-50%,-50%);
		z-index:9999999;
		width:100vw;
		height:100vh;
		background-color:rgba(255,255,255,0.9);
	}
	.page-loader button,.page-loader button:hover,.page-loader button:active,.page-loader button:focus{
		background-color: #5867dd;
    	border-color: #5867dd;
		color:#fff;
		margin:0 auto;
		position:absolute;
		top:50%;
		left:50%;
		transform:translate(-50%,-50%);
	}
	.btn-chartfleetsales.active{
		background-color:#5867dd;
		border-color:#5867dd;
		color:#fff;
	}
	.knob:focus,.knob{
        border: 0;
        outline:0;
    }
    .card-container{
        background-color: var(--white);
        box-shadow: 0 10px 20px rgba(0,0,0,0.19), 0 6px 6px rgba(0,0,0,0.23);
        border-radius: 8px;
        margin-bottom: 15px;
		background-color:#fff;
    }
    .card-container .card-body{
        width: 100%;
        padding-top: 8px;
        padding-bottom: 8px;
    }
    .card-container .card-body .card-chart-container,.card-icon-container{
        width: 30%;
        text-align: center;
        vertical-align: middle;
    }
    .card-container .card-body .card-detail-container{
        width: 68%;
        vertical-align: middle;
    }
    .card-container .card-body>div{
        display: inline-block;
    }
    .card-container .card-body .card-detail-container>div{
        display: inline-block;
        width:24%;
        text-align:center;
    }
    .card-container .card-body .card-detail-container>div:not(:last-child){
    	border-right: 1px solid #efefef;
    }
        
    .chart-gauge {
        width: 200px;
        margin: 10px auto;
    }

    .chart-color1 {
        fill: #43da14;
    }

    .chart-color2 {
        fill: #e0ff00;
    }

    .chart-color3 {
        fill: #e97209;
    }

    .chart-color4 {
        fill: #ff001a;
    }

    .needle,
    .needle-center {
        fill: #464A4F;
    }
    .custom-badge1.badge{
   		margin-left: 10px;
    	border-radius: 3px;
    	background-color: darkblue;
    }
    table tr.active td{
    	background-color:blue;
    	color:#000;
    }
    .btn-table-dropdown,.btn-table-dropdown:focus,.btn-table-dropdown:active,.btn-table-dropdown:hover{
    	margin: 0;
	    padding: 0;
	    outline: 0;
	    border: 0;
	    background-color: transparent;
	    box-shadow: none;
    }
    .panel-heading .dropdown-menu li a[data-target="#"]{
    	cursor:pointer;
    }
    .panel-loader{
   		position: absolute;
    	width: 100%;
    	height: 100%;
    	z-index: 99;
    	background-color: rgba(0,0,0,0.5);
    	margin: 0;
    	padding: 0;
    	overflow: hidden;
    }
    .panel-loader i{
    	color:#fff;
    }
    .no-padding {
   		padding: 0;
   		margin: 0 !important;
	}
	.p-15{
		padding:15px;
	}
	.p-pad{
		padding-top:10px;
	}
</style>
<script type="text/javascript">
	
	
	
</script>
</head>
<body>
	<div class="page-loader">  
		<button type="button" class="btn btn-brand"><i class="fa fa-circle-o-notch fa-spin fa-fw"></i> Loading</button>
	</div> 
	<div class="container-fluid">
		<div class="panel panel-default admin-cover animated fadeInDown m-t-10">
	  		<div class="panel-body">
	  			<div class="col-xs-12 col-sm-6 col-md-6 col-lg-6">
	  				<p style="margin-bottom:0;" class="fs-12"><strong>Hi <span style="text-transform:capitalize;">Admin</span></strong>, Your Analytics are all set</p>	
	  			</div>
	    		<div class="col-xs-12 col-sm-6 col-md-6 col-lg-6">
	    			<p style="margin-bottom:0;" class="fs-12 pull-right last-updated">Last Updated on 01-07-2021 14:30</p>	
	    		</div>
	  		</div>
		</div>
		<div class="row">
           <div class="col-xs-12 col-sm-6 col-md-2 col-lg-2" id="enqschdiv">    
                <div class="card-container">
                    <div class="card-body text-center">
                        <div class="card-chart-container">
                            <div id="enqsch"></div>
                            <span><img src="icons/icons8-collaboration-30.png" alt="" width="30" height="30"></span>  
                        </div>
                        <div class="card-detail-container">
                             <span>Enuiry for schedule</span><br/>    
                             <span class="counter">10</span>  
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-xs-12 col-sm-6 col-md-2 col-lg-2" id="schenqdiv"> 
                <div class="card-container">
                    <div class="card-body  text-center">
                        <div class="card-chart-container">   
                            <div id="schenq"></div>
                            <span><img src="icons/icons8-schedule-30.png" alt="" width="30" height="30"></span> 
                        </div>
                        <div class="card-detail-container">
                             <span>Scheduled Enquiry</span><br/>
                             <span class="counter">10</span>
                        </div>
                    </div>
                </div>
            </div>
             <div class="col-xs-12 col-sm-6 col-md-2 col-lg-2" id="surdiv"> 
                <div class="card-container">
                    <div class="card-body  text-center">
                        <div class="card-chart-container">
                            <div id="sur"></div>
                            <span><img src="icons/icons8-survey-30.png" alt="" width="30" height="30"></span> 
                        </div>
                        <div class="card-detail-container">
                            <span>Surveyed</span><br/>
                             <span class="counter">10</span>  
                        </div>
                    </div>
                </div>
            </div>	
             <div class="col-xs-12 col-sm-6 col-md-2 col-lg-2" id="estdiv"> 
                <div class="card-container">
                    <div class="card-body  text-center">
                        <div class="card-chart-container">
                            <div id="est"></div>
                            <span><img src="icons/icons8-ledger-30.png" alt="" width="30" height="30"></span> 
                        </div>
                        <div class="card-detail-container">
                            <span>Estimated</span><br/>
                             <span class="counter">10</span>
                        </div>
                    </div>
                </div>
            </div>	
             <div class="col-xs-12 col-sm-6 col-md-2 col-lg-2" id="quotdiv"> 
                <div class="card-container">
                    <div class="card-body  text-center">
                        <div class="card-chart-container">
                            <div id="quot"></div>
                            <span><img src="icons/icons8-paycheque-30.png" alt="" width="30" height="30"></span> 
                        </div>
                        <div class="card-detail-container">
                            <span>Quoted</span><br/>
                             <span class="counter">10</span>
                        </div>
                    </div>
                </div>
            </div>	  
             <div class="col-xs-12 col-sm-6 col-md-2 col-lg-2" id="totalenqdiv"> 
                <div class="card-container">
                    <div class="card-body  text-center">
                        <div class="card-chart-container">   
                            <div id="totalenq"></div>
                            <span><img src="icons/icons8-inspection-16.png" alt="" width="30" height="30"></span> 
                        </div>
                        <div class="card-detail-container">
                            <span>Total Enquiry</span><br/>
                             <span class="counter">10</span>
                        </div>
                    </div>
                </div>
            </div>	  
        </div>   
   
		<div class="row">
	        <div class="col-xs-12 col-sm-12 col-md-6 col-lg-6">   
	            <div class="panel panel-default widget-enquirylist p-pad">  
	                <div class="panel-heading">
	                    <h4 class="panel-title">
	                        <span class="panel-title-text fs-12"><strong>Enquiry Details</strong></span>         
	                    </h4>
	                </div>
	                <div class="panel-body table-responsive pos-relative no-padding" style="height:310px;overflow:auto;border:none;">
	                	<div class="panel-loader dis-none">
	                		<i class="fa fa-circle-o-notch fa-spin fa-fw ab-c-m fa-2x"></i>  
	                	</div>
	                	<div >
		                    <table class="table" style="width:100%" id="tblenquiry">   
		                        <thead>
		                            <tr>
		                                <th>Sr.No.</th>
		                                <th>Enquiry No.</th>
		                                <th>Date</th>
		                                <th>Client Name</th>
		                                <th>Days</th>
		                            </tr>
		                        </thead>
		                        <tbody>
		                            <tr>
		                                <td>1</td>
		                                <td>50000</td>
		                                <td>30-06-2021</td>
		                                <td>Michael Jordan</td>
		                                <td>40</td>  
		                            </tr>
		                        </tbody>
		                    </table>
						</div>
	                </div>
	            </div>
	        </div>  
	        <div class="col-xs-12 col-sm-12 col-md-6 col-lg-6" >
				<div class="panel-group" id="chartenquiry" role="tablist" aria-multiselectable="true">  
					<div class="panel panel-default chart-panel">
						<div class="panel-heading">
							<strong>Enquiry Details Chart</strong>    
						</div>
		  				<div class="panel-body no-padding">
		  					<canvas id="chartenq"></canvas>  
		  				</div>
					</div>
			   </div> 
			</div>
	    </div>

	</div> 
	<script src="../../js/Chart.min.js"></script>
	<script type="text/javascript" src="../../js/dashboard/chartjs-plugin-colorschemes.min.js"></script>
	<script src="../../js/dashboard/d3.min.js" charset="utf-8"></script>   
	
	<script src="https://cdnjs.cloudflare.com/ajax/libs/waypoints/2.0.3/waypoints.min.js"></script>
	<script src="../../js/dashboard/jquery.counterup.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/underscore.js/1.10.2/underscore.js"></script>
	<script src="https://cdn.datatables.net/1.10.21/js/jquery.dataTables.min.js"></script>
	<script src="https://cdn.datatables.net/1.10.21/js/dataTables.bootstrap.min.js"></script>
	<script type="text/javascript" src="https://cdn.jsdelivr.net/momentjs/latest/moment.min.js"></script>
    <script type="text/javascript" src="https://cdn.jsdelivr.net/npm/daterangepicker/daterangepicker.min.js"></script>
	<script type="text/javascript">
	    var rawdata={};
	    window.chartColorsOrg = {
				red: 'rgb(255, 182, 193)',
				orange: 'rgb(255, 159, 64)',
				yellow: 'rgb(255, 205, 86)',
				green: 'rgb(75, 192, 192)',
				blue: 'rgb(54, 162, 235)',
				purple: 'rgb(153, 102, 255)',
				grey: 'rgb(201, 203, 207)',
			};

		var scatterdata = {
				  labels: [
				    '1',
				    '2',
				    '3',
				    '4'
				  ],
				  datasets: [{
				    type: 'bar',
				    label: 'Enquiry',
				    data: [10, 20, 30, 40],
				    borderColor: window.chartColorsOrg.red,
				    backgroundColor: window.chartColorsOrg.red
				  }, {
				    type: 'line',
				    label: 'SJOB',
				    data: [50, 10, 20, 50],
				    fill: false,
				    backgroundColor: window.chartColorsOrg.yellow,
				    borderColor: window.chartColorsOrg.yellow
				  }, {
					    type: 'line',
					    label: 'AMC',
					    data: [5, 10, 20, 30],
					    fill: false,
					    backgroundColor: window.chartColorsOrg.green,  
					    borderColor: window.chartColorsOrg.green   
					  }
				  ]
				};  

		var enqconfig = {
				  type: 'scatter',
				  data: scatterdata,
				  options: {
				    scales: {
				      y: {
				        beginAtZero: true
				      }
				    }
				  }
				};
		 var ctx = document.getElementById('chartenq').getContext('2d');     
		 window.chartenq = new Chart(ctx, {
			   type: 'bar',
			   data: scatterdata,
			   options: {
				   tooltips: {
						mode: 'index',
						intersect: false,
					},
				    scales: {
					      y: {
					        beginAtZero: true
					      }
					    }
					  }
			}); 
		$(document).ready(function () {
			var enqtype="enqsch";
			var widgetid="enquirylist";  
			getInitChartData(enqtype); 
			funGetFilterData(enqtype,widgetid);
		});

		
		function funGetFilterData(enqtype,widgetname){    
			$('.widget-'+widgetname).find('.panel-loader').removeClass('dis-none');
			var x=new XMLHttpRequest();
			x.onreadystatechange=function(){
				if (x.readyState==4 && x.status==200){
					var items=x.responseText.trim();
					var objdata=JSON.parse(items);
					if(widgetname=='enquirylist'){  
						rawdata.enqlistdata=objdata.enqlistdata;    
						var enquiryhtml='';
						$.each(rawdata.enqlistdata,function(key,value){
							enquiryhtml+='<tr>';
							enquiryhtml+='<td>'+value.srno+'</td>';
							enquiryhtml+='<td>'+value.enqno+'</td>';
							enquiryhtml+='<td align="left">'+value.date+'</td>';      
							enquiryhtml+='<td align="left">'+value.client+'</td>';  
							enquiryhtml+='<td align="left">'+value.days+'</td>';  
							enquiryhtml+='</tr>';
						});
						$('#tblenquiry tbody').html($.parseHTML(enquiryhtml));	     
					}
					
					$('.widget-'+widgetname).find('.panel-loader').addClass('dis-none');
				}
				else{
				}
			}
			x.open("GET","getFilterData.jsp?widgetname="+enqtype,true);     
			x.send(); 
		}
	function getInitChartData(enqtype){        
		var x=new XMLHttpRequest();
		x.onreadystatechange=function(){
			if (x.readyState==4 && x.status==200){
				var items=x.responseText.trim();
				var guagedata=JSON.parse(items.split("***")[2]);  
		        
            	$("#enqsch").closest('.card-container').find('.card-detail-container').find('.counter').text(guagedata.enqschcount);
            	$("#schenq").closest('.card-container').find('.card-detail-container').find('.counter').text(guagedata.schenqcount);	
            	$("#sur").closest('.card-container').find('.card-detail-container').find('.counter').text(guagedata.surcount);
            	$("#est").closest('.card-container').find('.card-detail-container').find('.counter').text(guagedata.estcount);
            	$("#quot").closest('.card-container').find('.card-detail-container').find('.counter').text(guagedata.quotcount);
            	$("#totalenq").closest('.card-container').find('.card-detail-container').find('.counter').text(guagedata.totalcount);     
				
            	var countchartdata=JSON.parse(items.split("***")[1]);   
            	console.log(countchartdata);  
            	console.log("1="+window.chartenq);    
				window.chartenq.data.labels=countchartdata.labels;   
				window.chartenq.data.datasets[0].data=countchartdata.chartenqcount;  
				window.chartenq.data.datasets[1].data=countchartdata.chartsjobcount;
				window.chartenq.data.datasets[2].data=countchartdata.chartamccount;   
				console.log("2="+window.chartenq.data.datasets[0].data); 
				//window.chartenq.options.title.text=countchartdata.chartcounttitle;     
				window.chartenq.update();
				
				$('.widget-clientlist .panel-heading .dropdown-menu li:first-child a').trigger('click');  
				$('.page-loader').hide();
			}
			else{
			}
		}
		x.open("GET","getInitChartData.jsp?enqtype="+enqtype,true);   
		x.send();
	}
	
		$('div').click(function() {
			  var divid=$(this).attr('id');  
			  if(divid!="" && typeof(divid)!="undefined" && typeof(divid)!="NaN" && divid!=null){
				  var realid=divid.replace(/div/g, "");
				  var widgetid="enquirylist";  
				  if(realid=="enqsch" || realid=="schenq" || realid=="est" || realid=="sur" || realid=="totalenq" || realid=="quot"){           
					  funGetFilterData(realid,widgetid);  
					  getInitChartData(realid);       
				  }
			  }
			  
		});
	</script>
</body>
</html>