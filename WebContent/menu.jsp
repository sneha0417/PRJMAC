<%@ taglib prefix="s" uri="/struts-tags"%>
<% String contextPath=request.getContextPath();%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1, user-scalable=no"> 
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta name="HandheldFriendly" content="true">
<link rel="shortcut icon" href="<%=contextPath+"/"%>icons/ink_new_logo_2025.png" >
<title>INK IT Business Solutions | ERP Workspace</title>

<!-- Modern Fonts and Icons -->
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;500;600;700;800&display=swap" rel="stylesheet">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">

<!-- Legacy Imports -->
<jsp:include page="includes.jsp"></jsp:include>
<link rel="stylesheet" type="text/css" href="<%=contextPath%>/css/easyui.css">
<link rel="stylesheet" type="text/css" href="<%=contextPath%>/css/icon.css">

<style>
    /* =========================================================
       PREMIUM ROYAL BLUE THEME - LIGHT & COMPACT
       ========================================================= */
    :root {
        --bg-page: #F1F5F9; /* Slightly darker to contrast with white tabs */
        --deep-navy: #0A2342;
        --navy-blue: #12355B;
        --royal-blue: #2563EB;
        --bright-blue: #3B82F6;
        --sky-blue: #60A5FA;
        --white: #FFFFFF;
        
        --text-dark: #1E293B;
        --text-muted: #64748B;
        --border-color: #E2E8F0;
        
        --font-family: 'Inter', sans-serif;
    }

    * { box-sizing: border-box; margin: 0; padding: 0; }

    html, body {
        width: 100%; height: 100%;
        overflow: hidden; 
        font-family: var(--font-family);
        background-color: var(--bg-page);
        color: var(--text-dark);
    }

    /* ─── APP SHELL LAYOUT ─── */
    .app-wrapper {
        display: flex; flex-direction: column;
        height: 100vh; width: 100vw;
    }

    /* ─── TOP NAVIGATION MENU ─── */
    .top-menu-bar {
        background: var(--navy-blue);
        min-height: 36px; /* COMPACT: Reduced from 40px */
        display: flex; align-items: center;
        padding: 0 1rem;
        z-index: 100;
        color: var(--white);
    }

    #jqxMenu {
        background: transparent !important; border: none !important; color: var(--white) !important;
    }
    .jqx-menu-item-top {
        color: var(--white) !important; font-family: var(--font-family) !important;
        font-size: 13px !important; font-weight: 500 !important;
        padding: 4px 10px !important; /* Tighter padding */
    }
    .jqx-menu-item-hover {
        background: var(--royal-blue) !important; color: var(--white) !important; border-radius: 4px;
    }

    .company {
        font-size: 13px; font-weight: 700; color: var(--sky-blue);
        text-transform: uppercase; letter-spacing: 1px;
        margin-left: 20px; display: flex; align-items: center;
    }

    /* ─── ACTION TOOLBAR ─── */
    .action-toolbar {
        background-color: var(--white);
        height: 48px; /* COMPACT: Reduced from 60px */
        display: flex; justify-content: space-between; align-items: center;
        padding: 0 1rem;
        border-bottom: 1px solid var(--border-color);
        z-index: 90; flex-shrink: 0;
    }

    /* Left Side: User Info & Period */
    .toolbar-left { display: flex; align-items: center; gap: 1rem; }

    .user-badge {
        display: flex; align-items: center; gap: 8px;
        background: #F8FAFC; padding: 4px 10px;
        border-radius: 50px; border: 1px solid #E2E8F0;
    }
    .user-badge i { color: var(--royal-blue); font-size: 1.1rem; }
    .user-greeting { font-size: 12px; font-weight: 600; color: var(--navy-blue); }

    .info-pill {
        font-size: 12px; font-weight: 500; color: var(--text-muted);
        display: flex; align-items: center; gap: 6px;
    }
    .info-pill input {
        width: 42px; background: transparent; border: none;
        color: var(--royal-blue); font-weight: 700; text-align: center;
        outline: none; font-size: 12px;
    }

    .licenceExpiry {
        font-size: 11px; font-weight: 700; color: #EF4444;
        background: #FEF2F2; padding: 2px 8px;
        border-radius: 4px; border: 1px solid #FECACA;
        margin-left: 0.5rem;
    }

    /* Right Side: Action Icons */
    .toolbar-right { display: flex; align-items: center; gap: 4px; }

    /* COMPACT GHOST ICONS: Transparent by default, colored background only on hover */
    .bicon {
        width: 32px; height: 32px; /* Smaller footprint */
        border-radius: 6px; /* Squircle instead of full circle for modern look */
        display: flex; align-items: center; justify-content: center;
        font-size: 1rem; cursor: pointer;
        transition: all 0.15s ease;
        border: none; background: transparent;
    }

    .bicon:disabled, .bicon.disabledbutton, .bicon[disabled] {
        opacity: 0.3; cursor: default !important; transform: none !important;
    }
    .disabledbutton { pointer-events: none; opacity: 0.5; cursor: default !important; }

    /* Icon specific colors (Text color always visible, background on hover) */
    #passchange { color: #D97706; } #passchange:hover { background: #FEF3C7; color: #B45309; }
    #email      { color: #2563EB; } #email:hover      { background: #DBEAFE; color: #1D4ED8; }
    #sms        { color: #059669; } #sms:hover        { background: #D1FAE5; color: #047857; }
    #iconym     { color: #7C3AED; } #iconym:hover     { background: #EDE9FE; color: #6D28D9; }
    #iconnm     { color: #64748B; } #iconnm:hover     { background: #F1F5F9; color: #475569; }
    #support    { color: #0284C7; } #support:hover    { background: #E0F2FE; color: #0369A1; }
    #approve    { color: #0D9488; } #approve:hover    { background: #CCFBF1; color: #0F766E; }
    #qa         { color: #EA580C; } #qa:hover         { background: #FFEDD5; color: #C2410C; }
    
    #icon1 { color: #EF4444; margin-left: 8px; } 
    #icon1:hover { background: #FEE2E2; color: #DC2626; }

    /* Divider */
    .toolbar-divider { width: 1px; height: 20px; background: var(--border-color); margin: 0 4px; }

    /* Messenger Animation */
    .animated { animation-duration: 2.5s; animation-fill-mode: both; animation-iteration-count: infinite; }
    @keyframes wobble {
        0% {transform: translateX(0%);} 15% {transform: translateX(-25%) rotate(-5deg);}
        30% {transform: translateX(20%) rotate(3deg);} 45% {transform: translateX(-15%) rotate(-3deg);}
        60% {transform: translateX(10%) rotate(2deg);} 75% {transform: translateX(-5%) rotate(-1deg);}
        100% {transform: translateX(0%);}
    }
    .wobble { animation-name: wobble; }

    /* ─── MAIN CONTENT AREA (SEAMLESS TABS) ─── */
    .main-content {
        flex: 1; min-height: 0; 
        display: flex; flex-direction: column;
        padding: 0; /* COMPACT: Removed outer padding so tabs are edge-to-edge */
        background-color: var(--bg-page);
    }

    .tabs-container { flex: 1; display: flex; flex-direction: column; width: 100% !important; height: 100% !important; }

    /* Tab Header Area */
    .tabs-header {
        background-color: #F8FAFC !important;
        border-bottom: 1px solid var(--border-color) !important;
        padding: 6px 10px 0 10px !important;
        flex-shrink: 0; width: 100% !important;
    }

    /* Inactive Tabs */
    .tabs li a.tabs-inner {
        background: transparent !important;
        border: none !important;
        color: #64748B !important;
        font-family: var(--font-family) !important;
        font-weight: 500; font-size: 13px !important;
        padding: 0 16px !important;
        height: 32px !important; line-height: 32px !important;
        border-radius: 8px 8px 0 0 !important;
        transition: background 0.2s;
    }
    .tabs li a.tabs-inner:hover { background: #E2E8F0 !important; color: #1E293B !important; }

    /* Active Tab */
    .tabs li.tabs-selected a.tabs-inner {
        background: var(--white) !important;
        color: var(--royal-blue) !important;
        border: 1px solid var(--border-color) !important;
        border-bottom: 1px solid var(--white) !important; /* Blends into panel */
        font-weight: 600;
        margin-bottom: -1px !important; /* Pull down over border */
    }

    /* Tab Content Panels */
    .tabs-panels {
        flex: 1;
        border: none !important;
        background: var(--white);
        width: 100% !important; height: 100% !important;
        display: flex; flex-direction: column;
    }

    .tabs-panels > .panel { flex: 1; width: 100% !important; height: 100% !important; }
    .tabs-panels > .panel > .panel-body { width: 100% !important; height: 100% !important; overflow: hidden !important; }
    iframe { display: block; border: none; }
</style>

<script type="text/javascript">
    $(document).ready(function () {
        $("body").prepend('<div id="overlay2" class="ui-widget-overlay" style="z-index: 1; display: none;"></div>');
        $("body").prepend("<div id='PleaseWait2' style='display: none;position:absolute; z-index: 1;top:200px;right:750px;'><img src='<%=contextPath%>/icons/31load.gif'/></div>");
    
        getDecimal();
        getBackDate();
        getPdcAsCdcDate();
        getMsgCount();
        funChkMenu();
        funChkExport();
        getEmployeeBranchChk();
        
        $('#windowcp').jqxWindow({width: '45%', height: '36%',  maxHeight: '36%' ,maxWidth: '45%' , title: 'Change Password',position: { x: 130, y: 55 } , theme: 'energyblue', showCloseButton: true});
        $('#windowcp').jqxWindow('close');

        $("#menuBody").keydown(function (evt) {
            if (evt.keyCode == 8) {
                var d = event.srcElement || event.target;
                if ((d.tagName.toUpperCase() === 'INPUT' && 
                     (d.type.toUpperCase() === 'TEXT' || d.type.toUpperCase() === 'PASSWORD' || 
                      d.type.toUpperCase() === 'FILE' || d.type.toUpperCase() === 'EMAIL' || 
                      d.type.toUpperCase() === 'SEARCH' || d.type.toUpperCase() === 'DATE' )) || 
                     d.tagName.toUpperCase() === 'TEXTAREA') {
                    doPrevent = d.readOnly || d.disabled;
                } else {
                    doPrevent = true;
                }
            }
            if(doPrevent) { event.preventDefault(); }
        }); 

        // Initialize jqxMenu
        $("#jqxMenu").jqxMenu({ width: '100%', height: '32', mode: 'horizontal', showTopLevelArrows: true});
        $("#jqxMenu").css('visibility', 'visible');
    });
    
    function addTab(title, url){
        if ($('#tt').tabs('exists', title)){
            $.messager.alert('Message','Form Already Exists in Tab.','warning');
            $('#tt').tabs('select', title);
            return 0;
        } else {
         var content = '<iframe scrolling="auto" frameborder="0" src="'+url+'" style="width:100%;height:100%;display:block;"></iframe>';
            $('#tt').tabs('add', { title:title, content:content, closable:true });
             return 1;
        } 
    }
    
    function geturl(aa){
        var x=new XMLHttpRequest();
        x.onreadystatechange=function(){
            if (x.readyState==4 && x.status==200) {
                document.getElementById("formData").value = x.responseText; 
                var Data = document.getElementById("formData").value;
                document.getElementById('formName').value = aa;
                document.getElementById('formCode').value = Data.split("$$$$$",2)[1];
                var url=document.URL;
                var reurl=url.split("login");
                if(Data.split("$$$$$",1)!=""){
                  var val=addTab(aa,reurl[0]+Data.split("$$$$$",1));     
                  if(val=="1" && aa!="HR Related Master" && aa!="Veh. Related Master" && aa!="Maintenance Master" && aa!="Product Related Master" && aa!="Asset Related Master" && aa!="Client Area" && aa!="Company Settings" && aa!="Service Settings" && aa!="Staff Master"  && aa!="Tax Master "  && aa!="Transport Masters"  && aa!="Property Related Master" && aa!="Dump Related Master"  && aa!="Floor Master"){
                      $("#overlay2, #PleaseWait2").show();         
                      $("#jqxMenu").addClass("disabledbutton");            
                      $("#tt").addClass("disabledbutton"); 
                  }
                }
            }
        }
        x.open("GET","getPageDetails.jsp?name="+aa,true);
        x.send();
     }

    function getDecimal(){
        var x=new XMLHttpRequest();
        x.onreadystatechange=function(){
            if (x.readyState==4 && x.status==200){
                var res = x.responseText;
                res=res.split('####');
                $('#amtdec').val(res[0]);
                $('#curdec').val(res[1]);
            }
        }
        x.open("GET","getDecimal.jsp",true);
        x.send();
    }
    
    function getBackDate(){
        var x = new XMLHttpRequest();
        x.onreadystatechange = function() {
            if (x.readyState == 4 && x.status == 200) { $('#backdateallowed').val(x.responseText); }
        }
        x.open("GET", "getBackDateAllowed.jsp", true);
        x.send();
    }

    function getEmployeeBranchChk(){
        var x = new XMLHttpRequest();
        x.onreadystatechange = function() {
            if (x.readyState == 4 && x.status == 200) { $('#employeebranchchk').val(x.responseText); }
        }
        x.open("GET", "getEmployeeBranchChk.jsp", true);
        x.send();
    }

    function funChkExport(){
        var x = new XMLHttpRequest();
        x.onreadystatechange = function() {
            if (x.readyState == 4 && x.status == 200) { $('#chkexportdata').val(x.responseText); }
        }
        x.open("GET", "chkexportdata.jsp", true);
        x.send();
    }
    
    function getPdcAsCdcDate(){
        var x = new XMLHttpRequest();
        x.onreadystatechange = function() {
            if (x.readyState == 4 && x.status == 200) { $('#pdcascdcdateallowed').val(x.responseText); }
        }
        x.open("GET", "getPdcAsCdcDateAllowed.jsp", true);
        x.send();
    }

    function funexit(){
        $.messager.confirm('Confirm', 'Do you Want To Quit Application?', function(result){
            if (result){ window.close(); }
        });
    }
    
   function funSession(){
     var x = new XMLHttpRequest();
     x.onreadystatechange = function() {
      if (x.readyState == 4 && x.status == 200) {
       var item=x.responseText.trim();
       if(item=="1"){ window.location.href="<%=contextPath+"/"%>sessionout.jsp"; }
      }
     }
     x.open("GET", "<%=contextPath+"/"%>getSessionDetails.jsp", true);
     x.send();   
   }

    function funSendEmail(){ window.open("<%=contextPath%>/com/email/Email.jsp","E-Mail","menubar=0,resizable=1,width=900,height=525 "); }
    function funSendSms(){ window.open("<%=contextPath%>/com/sms/Sms.jsp","SMS","menubar=0,resizable=1,width=500,height=325 "); }
    function funMsngr(){ window.open("<%=contextPath%>/com/messenger/chatForm.jsp","Messenger","menubar=0,resizable=1,width=800,height=525 ,top=100, left=260"); }

    function funSupport(){
        var userid='<%=session.getAttribute("USERID").toString().trim()%>';
        var compid='<%=session.getAttribute("COMPANYID").toString().trim()%>';
        $.get('getSupportDetails.jsp',{userid:userid,compid:compid},function(data){
            data=JSON.parse(data);
            if(parseInt(data.comprefid)>0){
                var username=data.username; var usermobile=data.usermobile;
                var usermail=data.usermobile; var compname=data.compname; var comprefid=data.comprefid;
                if(username!='' && username!='undefined' && username!=null && typeof(username)!='undefined'){
                    window.open("http://185.217.125.145:8877/ServiceDB/gwqueryapp/index.jsp?userid="+userid+"&username="+encodeURIComponent(username)+"&usermobile="+encodeURIComponent(usermobile)+"&usermail="+encodeURIComponent(usermail)+"&compname="+encodeURIComponent(compname)+"&comprefid="+comprefid,"Gateway Support","menubar=0,resizable=1,width=1000,height=580 ,top=100, left=260");
                }
            }
        });
    }
        
    function getMsgCount() { /* Legacy logic */ }
    
    function funChkMenu(){
        var x = new XMLHttpRequest();
        x.onreadystatechange = function() {
            if (x.readyState == 4 && x.status == 200) {
                var items = x.responseText.trim().split('##');
                var email  = items[0].split(","); var sms = items[1].split(",");
                var support  = items[2].split(","); var approve = items[3].split(",");
                var msngr = items[4].split(","); var passchnge = items[5].split(",");
                var user = items[6].split(",");
            
                if(parseInt(email)==0) { $("#email").attr('disabled', true ); }
                if(parseInt(sms)==0) { $("#sms").attr('disabled', true ); }
                if(parseInt(approve)==0) { $("#approve").attr('disabled', true ); } 
                if(parseInt(support)==0) { $("#support").attr('disabled', true ); }
                if(parseInt(msngr)==0) { $("#iconym").attr('disabled', true ); $("#iconnm").attr('disabled', true ); } 
                if(parseInt(passchnge)==0) { $("#passchange").attr('disabled', true ); } 
                if(parseInt(user)==0) { $("#user").attr('disabled', true ); } 
            }
        }
        x.open("GET",<%=contextPath+"/"%>+"chkmainmenu.jsp",true);
        x.send();
    }

    function funApprove(){
        top.addTab( 'Executive Folio',"<%=contextPath%>/com/common/executiveFolioNew.jsp");
    }

    function funchgpass(){
        $("#windowcp").jqxWindow('setTitle','<%=session.getAttribute("USERNAME")%>'+" - "+'<%=session.getAttribute("BRANCHID")%>');
        var brch='<%=session.getAttribute("BRANCHID")%>'; var userid='<%=session.getAttribute("USERID")%>';
        changePassword("<%=contextPath%>/com/common/changePassword.jsp?userid="+userid+"&branchid="+brch);    
    }

    function changePassword(url) {
        $.get(url).done(function (data) {
            $('#windowcp').jqxWindow('open'); $('#windowcp').jqxWindow('setContent',data); $('#windowcp').jqxWindow('bringToFront');
        }); 
    }
</script>
</head>

<body id="menuBody">
    <div class="app-wrapper">
        
        <!-- TOP NAVIGATION BAR -->
        <div class="top-menu-bar">
            <div id='jqxMenu' style="visibility: hidden;">
                <ul>
                    <s:iterator var="first" status="status" value="%{#request.MenuMap}">
                        <li><s:property value="key"></s:property>
                            <ul>
                                <s:iterator var="second" status="status1" value="%{#first.getValue()}">
                                    <a href="#" onClick="geturl('<s:property value='key'/>')">
                                    <li><s:property value='key'></s:property>
                                        <ul>
                                            <s:iterator var="al" status="status1" value="%{#second.getValue()}">
                                                <a href="#" onClick="geturl('<s:property value='key'/>')">
                                                <li><label><s:property value='key'></s:property></label>
                                                    <ul>
                                                        <s:iterator var="al1" status="status1" value="%{#al.getValue()}">
                                                            <a href="#" onClick="geturl('<s:property value='al1'/>')">
                                                                <li><label><s:property value='al1' /></label></li>
                                                            </a>
                                                        </s:iterator>
                                                    </ul> 
                                                </li> </a>
                                            </s:iterator>
                                        </ul>
                                    </li></a>
                                </s:iterator>
                            </ul>
                        </li>
                    </s:iterator>
                    <b><font class="company"><i class="fa-solid fa-building" style="margin-right: 8px;"></i> <%=session.getAttribute("COMPANYNAME") %></font></b>
                </ul>
            </div>
        </div>
        
        <!-- ACTION TOOLBAR -->
        <div class="action-toolbar">
            
            <div class="toolbar-left">
                <div class="user-badge" title="Logged in as <%=session.getAttribute("USERNAME")%>">
                    <i class="fa-solid fa-circle-user"></i>
                    <span class="user-greeting">Welcome, <%=session.getAttribute("USERNAME")%></span>
                </div>
                
                <div class="info-pill" title="Login Time">
                    <i class="fa-regular fa-clock"></i> <%=session.getAttribute("LOGGEDIN").toString().substring(0,19)%>
                </div>

                <div class="info-pill" title="Financial Period">
                    <i class="fa-regular fa-calendar"></i>
                    <span>Period:</span>
                    <input type="text" id="txtaccountperiodfrom" name="txtaccountperiodfrom" readonly value='<%=session.getAttribute("STYEAR")%>'>
                    <span>to</span>
                    <input type="text" id="txtaccountperiodto" name="txtaccountperiodto" readonly value='<%=session.getAttribute("EDYEAR")%>'>
                </div>

                <div class="licenceExpiry" title="License Expiry">
                    <i class="fa-solid fa-shield-halved" style="margin-right:4px;"></i> <%=session.getAttribute("ERA") %>
                </div>
            </div>

            <div class="toolbar-right">
                <button type="button" class="bicon" id="passchange" title="Change Password" onClick="funchgpass();"><i class="fa-solid fa-key"></i></button>
                <button type="button" class="bicon" id="email" title="E-Mail" onclick="funSendEmail()"><i class="fa-solid fa-envelope"></i></button>
                <button type="button" class="bicon" id="sms" title="SMS" onclick="funSendSms()"><i class="fa-solid fa-comment-sms"></i></button>
                <button type="button" class="bicon animated wobble" id="iconym" hidden="true" title="Messenger (New Messages)" onclick="funMsngr();"><i class="fa-solid fa-comments"></i></button>
                <button type="button" class="bicon" id="iconnm" title="Messenger" onclick="funMsngr();"><i class="fa-regular fa-comments"></i></button>
                <button type="button" class="bicon" id="support" title="Need Help? Contact Support" onclick="funSupport()"><i class="fa-solid fa-headset"></i></button>
                <button type="button" class="bicon" id="approve" title="Executive Folio" onclick="funApprove()"><i class="fa-solid fa-check-double"></i></button>
                
                <div class="toolbar-divider"></div>

                <button type="button" class="bicon" id="qa" title="Quit Application" onClick="funexit();"><i class="fa-solid fa-power-off"></i></button>
                <button type="button" class="bicon" id="icon1" title="Logout" onclick="location.href='logout';"><i class="fa-solid fa-right-from-bracket"></i></button>
            </div>
        </div>

        <!-- MAIN CONTENT TABS -->
        <main class="main-content">
            <div id="tt" class="easyui-tabs" fit="true" style="width:100%; height:100%;">
                <div title="Home" style="width:100%; height:100%;">
                    <iframe scrolling="auto" frameborder="0" src="com/dashboard/dashBoard.jsp" style="width:100%;height:100%;display:block;"></iframe>
                </div> 
            </div>
        </main>

    </div>

    <!-- Hidden Fields Strictly Preserved -->
    <input type="hidden" id="formData" /> <input type="hidden" id="formName" /> <input type="hidden" id="formCode" />
    <input type="hidden" id="branchid" /> <input type="hidden" id="mode" /> <input type="hidden" id="employeebranchchk" name="employeebranchchk"/>   
    <input type="hidden" id="backdateallowed" name="backdateallowed" value='<s:property value="backdateallowed"/>' />
    <input type="hidden" id="pdcascdcdateallowed" name="pdcascdcdateallowed" value='<s:property value="pdcascdcdateallowed"/>' />
    <input type="hidden" id="monthclosed" name="monthclosed" value='<s:property value="monthclosed"/>' />
    <input type="hidden" id="taxdateval" name="taxdateval" value='<s:property value="taxdateval"/>' />
    <input type="hidden" name="formcurrencytype" id="formcurrencytype" value='<s:property value="formcurrencytype"/>' />
    <input type="hidden" id="curdec" name="curdec" value='<s:property value="curdec"/>' />
    <input type="hidden" id="amtdec" name="amtdec" value='<s:property value="amtdec"/>' />
    <input type="hidden" id="chkexportdata" name="chkexportdata" value='<s:property value="chkexportdata"/>' />

    <div id="windowcp" style="display:none;"><div></div></div>
</body>
</html>