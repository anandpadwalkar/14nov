<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@page session="true"%>

<head>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=0">
	<title>Staff Details | RITENOW Infra</title>

	<!--=== CSS ===-->
<title>Enable Hover State on Bootstrap 3 Table Rows</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap-theme.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>





	<!-- Bootstrap -->
	<link href="${pageContext.request.contextPath}/resources/bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css">

	<!-- jQuery UI -->
	<!--<link href="plugins/jquery-ui/jquery-ui-1.10.2.custom.css" rel="stylesheet" type="text/css" />-->
	<!--[if lt IE 9]>
		<link rel="stylesheet" type="text/css" href="plugins/jquery-ui/jquery.ui.1.10.2.ie.css"/>
	<![endif]-->

	<!-- Theme -->
	<link href="${pageContext.request.contextPath}/resources/assets/css/main.css" rel="stylesheet" type="text/css">
	<link href="${pageContext.request.contextPath}/resources/assets/css/plugins.css" rel="stylesheet" type="text/css">
	<link href="${pageContext.request.contextPath}/resources/assets/css/responsive.css" rel="stylesheet" type="text/css">
	<link href="${pageContext.request.contextPath}/resources/assets/css/icons.css" rel="stylesheet" type="text/css">
	<link href="${pageContext.request.contextPath}/resources/assets/css/datatables.css" rel="stylesheet" type="text/css">
	<link href="${pageContext.request.contextPath}/resources/assets/css/select2.min.css" rel="stylesheet" type="text/css">
	<link href="${pageContext.request.contextPath}/resources/assets/css/select2.css" rel="stylesheet" type="text/css">
	<link href="${pageContext.request.contextPath}/resources/assets/css/datatables_bootstrap.css" rel="stylesheet" type="text/css">
	<link href="${pageContext.request.contextPath}/resources/assets/css/my_hor_menu.css" rel="stylesheet" type="text/css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/assets/css/fontawesome/font-awesome.min.css">
	<!--[if IE 7]>
		<link rel="stylesheet" href="assets/css/fontawesome/font-awesome-ie7.min.css">
	<![endif]-->

	<!--[if IE 8]>
		<link href="assets/css/ie8.css" rel="stylesheet" type="text/css" />
	<![endif]-->
	
		<link href="${pageContext.request.contextPath}/resources/bower_components/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">
	<link href="http://fonts.googleapis.com/css?family=Open+Sans:400,600,700" rel="stylesheet" type="text/css">

 <style type="text/css">
table td{
border-bottom:none;
margin-bottom:5px;
}
 label{
    margin-bottom: 5px;
        font-weight: 700;
        max-width:100%;
}
</style>


	<!--=== JavaScript ===-->
<link href="//cdnjs.cloudflare.com/ajax/libs/select2/4.0.0/css/select2.min.css" rel="stylesheet" />
<script src="//cdnjs.cloudflare.com/ajax/libs/select2/4.0.0/js/select2.min.js"></script>

	<script type="text/javascript" src="${pageContext.request.contextPath}/resources/assets/js/libs/jquery-1.10.2.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/resources/plugins/jquery-ui/jquery-ui-1.10.2.custom.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/resources/bootstrap/js/bootstrap.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/resources/assets/js/libs/lodash.compat.min.js"></script>
	<!-- HTML5 shim, for IE6-8 support of HTML5 elements -->
	<!--[if lt IE 9]>
		<script src="assets/js/libs/html5shiv.js"></script>
	<![endif]-->

	<!-- Smartphone Touch Events -->
	<script type="text/javascript" src="${pageContext.request.contextPath}/resources/plugins/touchpunch/jquery.ui.touch-punch.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/resources/plugins/event.swipe/jquery.event.move.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/resources/plugins/event.swipe/jquery.event.swipe.js"></script>

	<!-- General -->
	<script type="text/javascript" src="${pageContext.request.contextPath}/resources/assets/js/libs/breakpoints.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/resources/plugins/respond/respond.min.js"></script><!-- Polyfill for min/max-width CSS3 Media Queries (only for IE8) -->
	<script type="text/javascript" src="${pageContext.request.contextPath}/resources/plugins/cookie/jquery.cookie.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/resources/plugins/slimscroll/jquery.slimscroll.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/resources/plugins/slimscroll/jquery.slimscroll.horizontal.min.js"></script>

	<!-- Page specific plugins -->
	<!-- Charts -->
	<script type="text/javascript" src="${pageContext.request.contextPath}/resources/plugins/sparkline/jquery.sparkline.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/resources/plugins/daterangepicker/moment.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/resources/plugins/daterangepicker/daterangepicker.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/resources/plugins/blockui/jquery.blockUI.min.js"></script>

	<!-- Forms -->
	<script type="text/javascript" src="${pageContext.request.contextPath}/resources/plugins/uniform/jquery.uniform.min.js"></script><!-- Styled radio and checkboxes -->
	<script type="text/javascript" src="${pageContext.request.contextPath}/resources/plugins/select2/select2.min.js"></script><!-- Styled select boxes -->

	<!-- DataTables -->
	<script type="text/javascript" src="${pageContext.request.contextPath}/resources/plugins/datatables/jquery.dataTables.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/resources/plugins/datatables/DT_bootstrap.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/resources/plugins/datatables/responsive/datatables.responsive.js"></script><!-- optional -->

	<!-- App -->
	<script type="text/javascript" src="${pageContext.request.contextPath}/resources/assets/js/app.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/resources/assets/js/plugins.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/resources/assets/js/plugins.form-components.js"></script>
	<script>
	$(document).ready(function(){
		"use strict";

		App.init(); // Init layout and core plugins
		Plugins.init(); // Init all plugins
		FormComponents.init(); // Init all form-specific plugins
	});
	</script>



	<!-- Demo JS -->
	<script type="text/javascript" src="${pageContext.request.contextPath}/resources/assets/js/custom.js"></script>
	<style type="text/css">.jqstooltip { position: absolute;left: 0px;top: 0px;visibility: hidden;background: rgb(0, 0, 0) transparent;background-color: rgba(0,0,0,0.6);filter:progid:DXImageTransform.Microsoft.gradient(startColorstr=#99000000, endColorstr=#99000000);-ms-filter: "progid:DXImageTransform.Microsoft.gradient(startColorstr=#99000000, endColorstr=#99000000)";color: white;font: 10px arial, san serif;text-align: left;white-space: nowrap;padding: 5px;border: 1px solid white;z-index: 10000;}.jqsfield { color: white;font: 10px arial, san serif;text-align: left;}</style></head>
	
	<body class="breakpoint-1200" style="height: 609px;">
<!-- Header -->
<header class="header navbar navbar-fixed-top" role="banner"> 
      <!-- Top Navigation Bar -->
      <div class="container"> 
    <!-- Only visible on smartphones, menu toggle -->
    <ul class="nav navbar-nav">
          <li class="nav-toggle"><a href="javascript:void(0);" title=""><i class="icon-reorder"></i></a></li>
        </ul>
    
    <!-- Logo --> 
    <a class="navbar-brand" href="index.html"> <img src="resources/bootstrap/img/master_logo.png" alt="logo"> <!-- <strong>RITENOW</strong>Infra --> </a> 
    <!-- /logo --> 
    
    <!-- Sidebar Toggler --> 
    <!--<a href="#" class="toggle-sidebar bs-tooltip" data-placement="bottom" data-original-title="Toggle navigation">
				<i class="icon-reorder"></i>
			</a>--> 
    <!-- /Sidebar Toggler --> 
    
    <!-- Top Left Menu -->
    <ul class="nav navbar-nav navbar-left">
          <!-- Project Switcher Button -->
          <li class="dropdown"> <a href="#" class="project-switcher-btn dropdown-toggle"> <i class="icon-reorder fontsize_24"></i> </a> </li>
        </ul>
    <!-- /Top Left Menu --> 
    
    <!-- Top Right Menu -->
    <ul class="nav navbar-nav navbar-right">
      <li> 
      	<a href="index.html" class="bs-tooltip" data-original-title="Admin Dashboard" data-placement="bottom"> 
          <i class="icon-home fontsize_24"></i> 
        </a> 
      </li>
      <!-- User Login Dropdown -->
      <li class="dropdown user"> 
      	<a href="#" class="dropdown-toggle" data-toggle="dropdown">
          <i class="icon-male"></i> 
          <span class="username">Admin</span> 
          <i class="icon-caret-down small"></i> 
        </a>
        <ul class="dropdown-menu">
           <li><a href="#"><i class="icon-tasks"></i> Help Ritenow Infra</a></li>
           <li class="divider"></li>
           <li><a href="index.htm"><i class="icon-off "></i> Sign Out</a></li>
        </ul>
      </li>
      <!-- /user login dropdown -->
    </ul>
    <!-- /Top Right Menu --> 
  </div>
      <!-- /top navigation bar --> 
      
      <!--=== Project Switcher ===-->
      <div id="project-switcher" class="container project-switcher" style="position: relative; margin-top: 0px; display: none;"> 
 <!--<div id="scrollbar">
				<div class="handle"></div>
			</div>-->
    
    <div class="slimScrollDiv" style="position: relative; overflow: hidden; width: 100%; height: auto;"><div id="frame" style="overflow: hidden; width: 100%; height: auto;">
      <ul class="project-list" style="width: 1936px;">
    
        <li> <a href="#" class="module-link" for="1"> <span class="image nav-dashboard"><i><img src="resources/bootstrap/img/authorization.png" /></i></span> <span class="title">AUTHORISATION</span> </a> </li>
    
        <li> <a href="#" class="module-link" for="2"> <span class="image nav-dashboard"><i><img src="resources/bootstrap/img/academic.png" /></i></span> <span class="title">ACADEMIC</span> </a> </li>
    
        <li> <a href="#" class="module-link" for="3"> <span class="image nav-dashboard"><i><img src="resources/bootstrap/img/examination.gif" /></i></span> <span class="title">EXAMINATION</span> </a> </li>
    
        <li> <a href="#" class="module-link" for="4"> <span class="image nav-dashboard"><i><img src="resources/bootstrap/img/hostel.png" /></i></span> <span class="title">HOSTEL</span> </a> </li>
    
        <li> <a href="#" class="module-link" for="6"> <span class="image nav-dashboard"><i><img src="resources/bootstrap/img/attendance.png" /></i></span> <span class="title">ATTENDANCE</span> </a> </li>
    
       
        
      </ul>
        </div>
        <div class="slimScrollBar ui-draggable" style="height: 5px; position: absolute; bottom: 1px; opacity: 0.2; display: block; border-radius: 5px; z-index: 99; background: rgb(255, 255, 255) none repeat scroll 0% 0%; left: 0px;">
        </div><div class="slimScrollRail" style="width: 100%; height: 5px; position: absolute; bottom: 1px; display: none; border-radius: 5px; opacity: 0.2; z-index: 90; background: rgb(51, 51, 51);"></div></div>
    <!-- /#frame --> 
  </div>
      <!-- /#project-switcher --> 
    </header>
<!-- /.header -->

<div id="container" class="fixed-header">
    
    <div id="content">
    <div class="layout-container"> 
      <!--=== Page Header ===-->
      <div class="page-header">
        
							<nav class="navbar navbar-default navbar-static-top" role="navigation">
								<div class="navbar-header">
									<button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#navbar-collapse-1">
										<span class="sr-only">Toggle navigation</span> <span class="icon-bar"></span> <span class="icon-bar"></span> <span class="icon-bar"></span>
									</button>
									<!--   <a class="navbar-brand" href="#">Brand</a> -->
								</div>

								<div class="collapse navbar-collapse" id="navbar-collapse-1" style="position: relative">
									<ul class="nav navbar-nav">
										<!--  <li class="active"><a href="#">Active Link</a></li>
                    <li><a href="#">Link</a></li>
                   -->
										<li class="dropdown"><a href="#" class="dropdown-toggle" data-toggle="dropdown">Dropdown <b class="caret"></b></a>

											<ul class="dropdown-menu">
												<li class="kopie"><a href="#">Dropdown</a></li>
												<li><a href="#">Dropdown Link 1</a></li>
												<li><a href="#">Dropdown Link 2</a></li>
												<li><a href="#">Dropdown Link 3</a></li>

												<li class="dropdown dropdown-submenu"><a href="#" class="dropdown-toggle" data-toggle="dropdown">Dropdown
														Link 4</a>
													<ul class="dropdown-menu">
														<li class="kopie"><a href="#">Dropdown Link 4</a></li>
														<!-- 	<li><a href="#">Dropdown Submenu Link 4.1</a></li>
									<li><a href="#">Dropdown Submenu Link 4.2</a></li>
									<li><a href="#">Dropdown Submenu Link 4.3</a></li>
									<li><a href="#">Dropdown Submenu Link 4.4</a></li> -->

													</ul></li>

												<li class="dropdown dropdown-submenu"><a href="#" class="dropdown-toggle" data-toggle="dropdown">Dropdown
														Link 5</a>
													<ul class="dropdown-menu">
														<li class="kopie"><a href="#">Dropdown Link 5</a></li>
														<!-- <li><a href="#">Dropdown Submenu Link 5.1</a></li>
									<li><a href="#">Dropdown Submenu Link 5.2</a></li>
									<li><a href="#">Dropdown Submenu Link 5.3</a></li>
									 -->
														<!-- <li class="dropdown dropdown-submenu"><a href="#" class="dropdown-toggle" data-toggle="dropdown">Dropdown Submenu Link 5.4</a>
										<ul class="dropdown-menu">
                                            <li class="kopie"><a href="#">Dropdown Submenu Link 5.4</a></li>
											<li><a href="#">Dropdown Submenu Link 5.4.1</a></li>
											<li><a href="#">Dropdown Submenu Link 5.4.2</a></li>
											
											
										</ul>
									</li>   -->
													</ul></li>
											</ul></li>
										<li class="dropdown"><a href="#" class="dropdown-toggle" data-toggle="dropdown">Dropdown2 <b class="caret"></b></a>
											<ul class="dropdown-menu">
												<li class="kopie"><a href="#">Dropdown2</a></li>
												<li><a href="#">Dropdown2 Link 1</a></li>
												<li><a href="#">Dropdown2 Link 2</a></li>
												<li><a href="#">Dropdown2 Link 3</a></li>

												<li class="dropdown dropdown-submenu"><a href="#" class="dropdown-toggle" data-toggle="dropdown">Dropdown2
														Link 4</a>
													<ul class="dropdown-menu">
														<li class="kopie"><a href="#">Dropdown2 Link 4</a></li>
														<!-- <li><a href="#">Dropdown2 Submenu Link 4.1</a></li>
									<li><a href="#">Dropdown2 Submenu Link 4.2</a></li>
									<li><a href="#">Dropdown2 Submenu Link 4.3</a></li>
									<li><a href="#">Dropdown2 Submenu Link 4.4</a></li> -->

													</ul></li>
												<li class="dropdown dropdown-submenu"><a href="#" class="dropdown-toggle" data-toggle="dropdown">Dropdown2
														Link 5</a>
													<ul class="dropdown-menu">
														<!--  <li class="kopie"><a href="#">Dropdown Link 5</a></li>
									<li><a href="#">Dropdown2 Submenu Link 5.1</a></li>
									<li><a href="#">Dropdown2 Submenu Link 5.2</a></li>
									<li><a href="#">Dropdown2 Submenu Link 5.3</a></li>
									<li class="dropdown dropdown-submenu"><a href="#" class="dropdown-toggle" data-toggle="dropdown">Dropdown Submenu Link 5.4</a>
										<ul class="dropdown-menu">
                                            <li class="kopie"><a href="#">Dropdown2 Submenu Link 5.4</a></li>
											<li><a href="#">Dropdown2 Submenu Link 5.4.1</a></li>
											<li><a href="#">Dropdown2 Submenu Link 5.4.2</a></li>
											
										</ul>
									</li>         -->
													</ul></li>
											</ul></li>
									</ul>
								</div>
								<!-- /.navbar-collapse -->
							</nav>
						
      </div>
      <!-- /Page Header -->
      <form:form commandName="menuCreation" action="./add-menu-creation" method="post" >
      <div class="second-column one-child-container relative padding-top-75px"> 
       
        
        <div id="my_documents_container" style="margin-left:0px; margin:auto;width:90%" class="column-one clearfixs">
          <div class="">
            
<!--             jaskirat code start here -->

<div class="row">
                <div class="col-md-12">
                    
                    
                    
                    <fieldset class="scheduler-border">
                       
                        <div class="form-group">
                            <div class="col-sm-12 ">Note <b>:</b> <span style="color: #FF0000">* Marked Is Mandatory !</span></div>

                        </div>
                        <div class="col-md-8">
                            <div class="form-horizontal">

                                <div class="form-group">
                                    <div class="col-sm-4">
                                        User Name
                                        <span style="color: #FF0000; font-weight: bold">*</span>
                                    </div>
                                    <div class="col-sm-8">
                                        <div class="input-group">
                                            <input name="ctl00$ContentPlaceHolder1$txtUserFullName" type="text" id="ContentPlaceHolder1_txtUserFullName" tabindex="2" class="form-control" placeholder="Search USER">
                                            
                                            <span id="ContentPlaceHolder1_rfUserName" style="display:none;"></span>
                                            
                                            <span class="input-group-addon"><i><a href="#"><i id="imgSearch" class="fa fa-search"></i></a></i></span>
                                        </div>


                                    </div>

                                </div>
                                <div class="form-group">
                                    <div class="col-sm-4">
                                        User Photo
                                    </div>
                                    <div class="col-sm-4">
                                        <input type="file" name="ctl00$ContentPlaceHolder1$FileUpload1" id="ContentPlaceHolder1_FileUpload1" title="Please Select Photo">

                                    </div>
                                    <div class="col-sm-4">
                                        <input type="submit" name="ctl00$ContentPlaceHolder1$btnUpload" value="Upload" id="ContentPlaceHolder1_btnUpload" class="btn btn-default">
                                    </div>
                                </div>
                                <div class="form-group">
                                    <div class="col-sm-4">
                                    </div>
                                    <div class="col-sm-8">
                                      
                                      <img id="ContentPlaceHolder1_Image2" src="../images/nophoto.jpg" style="height:75px;width:75px;">
                                         </div>
                                </div>

                                <div class="form-group">
                                    <div class="col-sm-4">
                                        User Login
                                        <span style="color: #FF0000; font-weight: bold">*</span>
                                    </div>
                                    <div class="col-sm-6">

                                        <input name="ctl00$ContentPlaceHolder1$txtUserId" type="text" id="ContentPlaceHolder1_txtUserId" class="form-control" placeholder="Enter User Login">
                                           

                                    </div>
                                    <div class="col-sm-2">
                                        <span id="ContentPlaceHolder1_lblAssias">@RSML.com</span>
                                        <span id="ContentPlaceHolder1_RequiredFieldValidator4" style="display:none;"></span>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <div class="col-sm-4">
                                        Password
                                        <span style="color: #FF0000; font-weight: bold">*</span>
                                    </div>
                                    <div class="col-sm-8">
                                        <input name="ctl00$ContentPlaceHolder1$txtPassword" type="password" maxlength="10" id="ContentPlaceHolder1_txtPassword" class="form-control" placeholder="Enter Password For New User">
                                        <span id="ContentPlaceHolder1_rfPassword" style="display:none;"></span>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <div class="col-sm-4">
                                        Confirm Password
                                        <span style="color: #FF0000; font-weight: bold">*</span>
                                    </div>
                                    <div class="col-sm-8">
                                        <input name="ctl00$ContentPlaceHolder1$txtConPass" type="password" maxlength="10" id="ContentPlaceHolder1_txtConPass" class="form-control" placeholder="Confirm Password For New User">
                                    </div>
                                </div>
                                <div class="form-group">
                                    <div class="col-sm-4">
                                        Counter No.
                                    </div>
                                    <div class="col-sm-4">
                                        <input name="ctl00$ContentPlaceHolder1$txrtCouterNo" type="text" maxlength="2" id="ContentPlaceHolder1_txrtCouterNo" class="form-control" placeholder="Enter Counter No">
                                        
                                        <span id="ContentPlaceHolder1_rgSocity" style="display:none;"></span>
                                        <span id="ContentPlaceHolder1_rgCollege" style="display:none;"></span>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <div class="col-sm-4">
                                        Change Working Date
                                    </div>
                                    <div class="col-sm-8">
                                        <input id="ContentPlaceHolder1_chkWorkingDate" type="checkbox" name="ctl00$ContentPlaceHolder1$chkWorkingDate"><label for="ContentPlaceHolder1_chkWorkingDate">Check If Allow</label>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <div class="col-sm-4">
                                        Status
                                    </div>
                                    <div class="col-sm-8">
                                        <input id="ContentPlaceHolder1_chkStatus" type="checkbox" name="ctl00$ContentPlaceHolder1$chkStatus"><label for="ContentPlaceHolder1_chkStatus">Check If Active</label>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <div class="col-sm-4">
                                        Mobile No.
                                    </div>
                                    <div class="col-sm-4">
                                        <input name="ctl00$ContentPlaceHolder1$txtMobile" type="text" maxlength="15" id="ContentPlaceHolder1_txtMobile" class="form-control" placeholder="Enter Mobile No">
                                        
                                    </div>
                                </div>
                                <div class="form-group">
                                    <div class="col-sm-4">
                                        Email ID
                                          <span style="color: #FF0000; font-weight: bold">*</span>
                                    </div>
                                    <div class="col-sm-4">
                                        <input name="ctl00$ContentPlaceHolder1$txtEmailID" type="text" maxlength="100" id="ContentPlaceHolder1_txtEmailID" class="form-control" placeholder="Enter Email ID">
                                        <span id="ContentPlaceHolder1_RequiredFieldValidator15" style="display:none;"></span>
                                   
                                          <span id="ContentPlaceHolder1_revEmail" style="display:none;"></span> 

                                    </div>
                                </div>
                                <div class="help-block"></div>



                            </div>
                        </div>

                        <div class="col-md-4" style="border:1px solid black;padding:10px">
                            <div class="form-horizontal">

                                <fieldset class="scheduler-border">
                                    <legend class="scheduler-border" style="background:#318FE8;padding:5px;color:white">Roles</legend>
                                    <div class="form-group">
                                        <div class="DocumentList">
                                            
                                            <div class="col-sm-8">
                                                <table id="ContentPlaceHolder1_chkRole">
			<tbody><tr>
				<td><input id="ContentPlaceHolder1_chkRole_0" type="checkbox" name="ctl00$ContentPlaceHolder1$chkRole$0" value="322"><label for="ContentPlaceHolder1_chkRole_0">ADM</label></td>
			</tr><tr>
				<td><input id="ContentPlaceHolder1_chkRole_1" type="checkbox" name="ctl00$ContentPlaceHolder1$chkRole$1" value="89"><label for="ContentPlaceHolder1_chkRole_1">ADMIN</label></td>
			</tr><tr>
				<td><input id="ContentPlaceHolder1_chkRole_2" type="checkbox" name="ctl00$ContentPlaceHolder1$chkRole$2" value="367"><label for="ContentPlaceHolder1_chkRole_2">APPROVAL USER</label></td>
			</tr><tr>
				<td><input id="ContentPlaceHolder1_chkRole_3" type="checkbox" name="ctl00$ContentPlaceHolder1$chkRole$3" value="91"><label for="ContentPlaceHolder1_chkRole_3">DEMO</label></td>
			</tr><tr>
				<td><input id="ContentPlaceHolder1_chkRole_4" type="checkbox" name="ctl00$ContentPlaceHolder1$chkRole$4" value="95"><label for="ContentPlaceHolder1_chkRole_4">DSSS</label></td>
			</tr><tr>
				<td><input id="ContentPlaceHolder1_chkRole_5" type="checkbox" name="ctl00$ContentPlaceHolder1$chkRole$5" value="97"><label for="ContentPlaceHolder1_chkRole_5">FACULTY </label></td>
			</tr><tr>
				<td><input id="ContentPlaceHolder1_chkRole_6" type="checkbox" name="ctl00$ContentPlaceHolder1$chkRole$6" value="93"><label for="ContentPlaceHolder1_chkRole_6">GHGH</label></td>
			</tr><tr>
				<td><input id="ContentPlaceHolder1_chkRole_7" type="checkbox" name="ctl00$ContentPlaceHolder1$chkRole$7" value="366"><label for="ContentPlaceHolder1_chkRole_7">REQUISITION USER</label></td>
			</tr><tr>
				<td><input id="ContentPlaceHolder1_chkRole_8" type="checkbox" name="ctl00$ContentPlaceHolder1$chkRole$8" value="94"><label for="ContentPlaceHolder1_chkRole_8">RFTG</label></td>
			</tr><tr>
				<td><input id="ContentPlaceHolder1_chkRole_9" type="checkbox" name="ctl00$ContentPlaceHolder1$chkRole$9" value="90"><label for="ContentPlaceHolder1_chkRole_9">RRRRR</label></td>
			</tr><tr>
				<td><input id="ContentPlaceHolder1_chkRole_10" type="checkbox" name="ctl00$ContentPlaceHolder1$chkRole$10" value="96"><label for="ContentPlaceHolder1_chkRole_10">SD</label></td>
			</tr><tr>
				<td><input id="ContentPlaceHolder1_chkRole_11" type="checkbox" name="ctl00$ContentPlaceHolder1$chkRole$11" value="321"><label for="ContentPlaceHolder1_chkRole_11">STUDENT</label></td>
			</tr><tr>
				<td><input id="ContentPlaceHolder1_chkRole_12" type="checkbox" name="ctl00$ContentPlaceHolder1$chkRole$12" value="92"><label for="ContentPlaceHolder1_chkRole_12">TEST</label></td>
			</tr>
		</tbody></table>
                                                <span id="ContentPlaceHolder1_CustomValidator1" style="display:none;"></span>
                                            </div>
                                        </div>
                                    </div>
                                </fieldset>
                                
                            </div>

                            <div class="form-group">
                                <div class="col-sm-4">
                                </div>
                                <div class="col-sm-8">
                                    <input type="button" name="" value="Save" onclick="" id="ContentPlaceHolder1_btnSubmit" tabindex="12" title="Click to Save" class="btn btn-xl btn-primary button-submit font13">
                                    <input type="submit" name="ctl00$ContentPlaceHolder1$btnCancel" value="Cancel" id="ContentPlaceHolder1_btnCancel" tabindex="13" title="Click to Cancel" class="btn btn-default">
                                    <div id="ContentPlaceHolder1_valsummarySubmit" style="display:none;">

		</div>
                                </div>
                            </div>
                        </div>
                    </fieldset>
                </div>
            </div>

<!--           jaskirtat code end here -->
            
            
            
          </div>
        </div>
      </div>
        </form:form>
      <!--=== Page Content ===--> 
    </div>
    
    </div></div>
    <!-- /.container --> 
    <!-- /.container --> 
    
    
    <script type="text/javascript">
    var validator;
	$(document).ready(function(){
// 		alert();
		$.ajax({
						        			url:"./modules-list",
						        			success:function(response){
						        				//alert(JSON.stringify(response));
						        				var text = '';
						        				text += '<option value="0" selected="selected">Select Module</option>'
						        				$.each(response, function(index, module){
						        					text += '<option value="'+module.id+'">'+module.moduleName+'</option>'
						        				});
						        				$("#module_id").html(text);
						        					$("#module_id").val("${module.id}");	
						        			},
						        			error:function(){
						        				
						        			}
						        		});
	});
		
		/* DEPARTMENT ON CHANGE  */
			var tempItemId = '';
		$("#module_id").change(function(){
			var Modulavalue = $("#module_id").val();
			$("#menu_id").empty();
			
			if(Modulavalue != 0){
				$.ajax({
					url:"./get_menu-lists",
					type:"POST",
					data:{"module_id" : Modulavalue},
					success:function(response){
// 						alert()
						var text = '';
						var text2=''
						text += '<option value="0" selected="selected">Select Module</option>';
						
						if(JSON.stringify(response) != '[]'){
							$.each(response, function(index, MainMenuEntityList){
								text += '<option value="'+MainMenuEntityList.menuId+'">'+MainMenuEntityList.menuName+'</option>'
							    text2+=""
							    	+ "<tr class=\"odd\"> "
							    	+ "                          <td class=\" \"> "
							    	+ "                          	<a href=\"#\" onclick=\"updateMenu('module_id','"+MainMenuEntityList.menuId+"','"+MainMenuEntityList.menuName+"','"+MainMenuEntityList.menuLink+"','"+MainMenuEntityList.menuToolTip+"','"+MainMenuEntityList.menuSrno+"','"+MainMenuEntityList.active+"')\" data-toggle=\"modal\" data-original-title=\"Add to Project\" data-placement=\"top\" style=\"border-radius:40px; padding:4px 6px 2px;\" class=\"btn btn-xl btn-success button-submit font13 bs-tooltip\"> "
							    	+ "                            	<i class=\"icon-cog font14\"></i> "
							    	+ "                            </a> "
							    	+ "                          </td> "
							    	+ "                          <td class=\" \">"+MainMenuEntityList.menuId+"</td> "
							    	+ "                          <td class=\" \">"+MainMenuEntityList.menuName+"</td> "
							    	+ "                          <td class=\" \">"+MainMenuEntityList.menuLink+"</td> "
							    	+ "                        </tr>";
							
							});
						}
						$("#menu_table tr td").remove();
						$("#menu_id").html(text);
						$('#menu_table').append(text2);
						$('#call').val('update');
// 						$("#submit_button").text('Update');
						if(tempItemId != ''){
							$("#menu_id").val(tempItemId);
						}
						
					},
					error:function(){
						
					}
				});
			}else{
				$("#menu_id").empty();
				var text = '';
				text += '<option value="0" selected="selected">Select Module</option>';
				$("#menu_id").html(text);
			}
			
        });
	
		
		/* DEPARTMENT ON CHANGE ENDS */
		
		
		function updateMenu(id, parent, menu_name, menulink, menutooltip, menusrno, status){
		//alert(itemId+" - "+itemCode+ " - "+itemName+ " - "+minStock+ " - "+maxStock+ " - "+currentStock+ " - "+itemUnit + " - "+ deptId + " - " + complaintTypeId);
		
		
		$("#menuId").val(parent);
// 		$("#module_id").val(parent).change();
		//$("#complaintTypeId").val(complaintTypeId).change();
		$("#menu_id").val(parent);
		$("#menu_name").val(menu_name);
		$("#menu_link").val(menulink);
		$("#menu_tool_tip").val(menutooltip);
		$("#menu_srno").val(menusrno);
// 		if( status.trim()=='1')
// 		$("#menu_status").prop('checked','checked');
// 		alert(status)
		$("#submit_button").text('Update');
		
		if( status.trim()=='1'){
			$("#menu_status").prop('checked','checked');
	}
		}
		
		$("#cancel_id").click(function(){
			$("#submit_button").text('Save');
		});
    </script>
 

</body>

