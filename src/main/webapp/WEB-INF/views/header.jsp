<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!-- <!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body> -->

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
           <li><a href="<c:url value="/j_spring_security_logout" />"><i class="icon-off "></i> Sign Out</a></li>
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
      <ul class="project-list" style="width: 799px;">
        <li> <a href="hr-dashboard.html"> <span class="image nav-dashboard"><i></i></span> <span class="title">Dashboard</span> </a> </li>
        <li> <a href="staff-details.html"> <span class="image nav-staff"><i></i></span> <span class="title">Staff</span> </a> </li>
        <li> <a href="staff-daily-attendance.html"> <span class="image nav-attendance"><i></i></span> <span class="title">Attendance</span> </a> </li>
        <li> <a href="staff-payroll-lists.html"> <span class="image nav-payroll"><i></i></span> <span class="title">Payroll</span> </a> </li>
        <li> <a href="staff-new-staff-lists.html"> <span class="image nav-new-staff"><i></i></span> <span class="title">New Staff</span> </a> </li>
      </ul>
        </div><div class="slimScrollBar ui-draggable" style="height: 5px; position: absolute; bottom: 1px; opacity: 0.2; display: block; border-radius: 5px; z-index: 99; background: rgb(255, 255, 255);"></div><div class="slimScrollRail" style="width: 100%; height: 5px; position: absolute; bottom: 1px; display: none; border-radius: 5px; opacity: 0.2; z-index: 90; background: rgb(51, 51, 51);"></div></div>
    <!-- /#frame --> 
  </div>
      <!-- /#project-switcher --> 
    </header>
<!-- /.header -->

<!-- </body>
</html> -->