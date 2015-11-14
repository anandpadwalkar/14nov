<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html >
<html>
<head>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=0">
<title>Module Details | RF-Campus</title>

<!--=== CSS ===-->

<jsp:include page="script.jsp" />



<script type="text/javascript"
	src="<c:url value="/resources/common/ajax-call.js"/>"></script>

<script type="text/javascript">
	var currentModuleId;
	var dataTable;

	$(document).ready(function() {

		$("#add-edit-module").validate({

			// Specify the validation rules
			rules : {
				roleName : {
					required : true
				},
				roleDescription : {
					required : true
				}
			},

			// Specify the validation error messages
			messages : {
				roleName : {
					required : "Please enter Role"//,
				},
				roleDescription : {
					required : "Please enter Role Description"
				}
			},

			submitHandler : function(form) {
				form.submit();
			}
		});

		$('#active').change(function() {
			if ($(this).is(":checked")) {

				$("#active").val(1);
			}

		});

		$("#add-edit-btn").click(function() {
			var moduleId = $("#moduleId").val();
			;
			var moduleName = $("#moduleName").val();

			ajaxParams.url = "./modules/exist";
			ajaxParams.data = {
				"moduleId" : moduleId,
				"moduleName" : moduleName
			};
			ajaxParams.formType = "module";

			if ($("form").valid()) {
				alert('valid...');
				var flag = ajaxRequest();
				if (flag == true) {
					$("#add-edit-module").submit();
				}

			}
		});

		$("#roleType").change(function() {
			var roleTypeId = $(this).val();
		//	alert(roleTypeId);
			if (roleTypeId != 0) {
				$('.dataTable').DataTable({
					"sPaginationType" : "bootstrap",
					"bPaginate" : true,
					"bDestroy" : true,
					//"bRetrieve" : false,
					"bProcessing" : true,
					"iDisplayLength":10,
					"bFilter" : true,
					"bServerSide" : true,
					"sAjaxSource" : "./roles/records?roleTypeId="+roleTypeId,
					"fnServerParams" : function(aoData) {
						aoData.push({});
					},

					"aoColumns" : [  {
						"mData" : "roleName"
					}, {
						"mData" : "roleDescription"
					}, {
						"mData" : function ( source, type, val ){
							return source.active == 1 ? "Active" : "Inactive"
						}
					},{
						"mData" : function ( source, type, val ){
							return '<a href=\"#\"'+
							'data-toggle=\"modal\" data-original-title=\"Edit\"'+
							'data-placement=\"top\"'+
							'style=\"border-radius: 40px; padding: 4px 6px 2px;\"'+
							'class=\"btn btn-xl btn-success button-submit font13 bs-tooltip\"'+ 
'														onclick=\"updateModule('+source.roleId+',\''+source.roleName+'\',\''+source.roleDescription+'\','+source.active+','+source.userTypeId+')\">'+
'															<i class=\"icon-cog font14\"></i>'+
'													</a>'
						}
					} ],
				});
				
				
				$("#roleName").val('');
				$("#roleDescription").val('');
				$("#add-edit-module").attr('action', './roles/add');
				$("#submit-btn").html('Add');
			}
		});
		dataTable = $('.dataTable').dataTable({
			
			"sPaginationType" : "bootstrap",
			"bPaginate" : true,
			"bDestroy" : true,
			//"bRetrieve" : false,
			"bProcessing" : true,
			"iDisplayLength":1,
			"bFilter" : true,
			"bServerSide" : true,
			"sAjaxSource" : "./roles/records",
			"fnServerParams" : function(aoData) {
				aoData.push({});
			},

			"aoColumns" : [ {
				"mData" : "fName"
			}, {
				"mData" : "lName"
			}, {
				"mData" : "responseMessage"
			}, {
				"mData" : "hasError"
			} ],
		});
		//alert('ready...');
		
		$.ajax({
			async:false,
			url:"./roles/role-type",
			type:"GET",
			success:function(response){
				//alert(JSON.stringify(response));
				var jsonString = JSON.stringify(response);
				var text = '<option selected value="0">Select Role Type</option>';
				$.each(JSON.parse(jsonString), function(index, roleType){
					text += '<option value="'+roleType.id+'">'+roleType.roleTypeName+'</option>';
				});
				$("#roleType").html(text);
			//	alert(text);
			},
			error:function(){
				alert('error...');
			}
		});
		
		
		$("#cancel-btn").click(function(){
				$("#roleType").val(0).change();
				$("#roleName").val('');
				$("#roleDescription").val('');
				$("#add-edit-module").attr('action', './roles/add');
				$("#submit-btn").html('Add');
		});
	});

	function updateModule(roleId, roleName, roleDescription, active, userTypeId) {
		//alert(roleId+" - "+roleName+" - "+roleDescription+" - "+active);
		// currentModuleId = moduleId
		console.log(currentModuleId);
		$("#roleType").val(userTypeId);
		$("#roleId").val(roleId);
		$("#roleName").val(roleName);
		$("#roleDescription").val(roleDescription);
		if (active == 1) {
			$("#active").prop("checked", true);
			$("#active").val(1);
		} else {
			$("#active").prop("checked", false);
			$("#active").val(0);
		} 
		$("#add-edit-module").attr('action', './roles/update');
		$("#submit-btn").html('Update');
	}
</script>

</head>

<body class="breakpoint-1200" style="height: 609px;">
	<!-- Header -->
	<header class="header navbar navbar-fixed-top" role="banner">
		<!-- Top Navigation Bar -->
		<div class="container">
			<!-- Only visible on smartphones, menu toggle -->
			<ul class="nav navbar-nav">
				<li class="nav-toggle"><a href="javascript:void(0);" title=""><i
						class="icon-reorder"></i></a></li>
			</ul>

			<!-- Logo -->
			<a class="navbar-brand" href="index.html"> <img
				src="resources/bootstrap/img/master_logo.png" alt="logo"> <!-- <strong>RITENOW</strong>Infra -->
			</a>
			<!-- /logo -->

			<!-- Sidebar Toggler -->
			<!--<a href="#" class="toggle-sidebar bs-tooltip" data-placement="bottom" data-original-title="Toggle navigation">
				<i class="icon-reorder"></i>
			</a>-->
			<!-- /Sidebar Toggler -->

			<!-- Top Left Menu -->
			<ul class="nav navbar-nav navbar-left">
				<!-- Project Switcher Button -->
				<li class="dropdown"><a href="#"
					class="project-switcher-btn dropdown-toggle"> <i
						class="icon-reorder fontsize_24"></i>
				</a></li>
			</ul>
			<!-- /Top Left Menu -->

			<!-- Top Right Menu -->
			<ul class="nav navbar-nav navbar-right">
				<li><a href="index.html" class="bs-tooltip"
					data-original-title="Admin Dashboard" data-placement="bottom">
						<i class="icon-home fontsize_24"></i>
				</a></li>
				<!-- User Login Dropdown -->
				<li class="dropdown user"><a href="#" class="dropdown-toggle"
					data-toggle="dropdown"> <i class="icon-male"></i> <span
						class="username">Admin</span> <i class="icon-caret-down small"></i>
				</a>
					<ul class="dropdown-menu">
						<li><a href="#"><i class="icon-tasks"></i> Help Ritenow
								Infra</a></li>
						<li class="divider"></li>
						<li><a href="index.htm"><i class="icon-off "></i> Sign
								Out</a></li>
					</ul></li>
				<!-- /user login dropdown -->
			</ul>
			<!-- /Top Right Menu -->
		</div>
		<!-- /top navigation bar -->

		<!--=== Project Switcher ===-->
		<div id="project-switcher" class="container project-switcher"
			style="position: relative; margin-top: 0px; display: none;">
			<!--<div id="scrollbar">
				<div class="handle"></div>
			</div>-->

			<div class="slimScrollDiv"
				style="position: relative; overflow: hidden; width: 100%; height: auto;">
				<div id="frame" style="overflow: hidden; width: 100%; height: auto;">
					<ul class="project-list" style="width: 799px;">
						<li><a href="hr-dashboard.html"> <span
								class="image nav-dashboard"><i></i></span> <span class="title">Dashboard</span>
						</a></li>
						<li><a href="staff-details.html"> <span
								class="image nav-staff"><i></i></span> <span class="title">Staff</span>
						</a></li>
						<li><a href="staff-daily-attendance.html"> <span
								class="image nav-attendance"><i></i></span> <span class="title">Attendance</span>
						</a></li>
						<li><a href="staff-payroll-lists.html"> <span
								class="image nav-payroll"><i></i></span> <span class="title">Payroll</span>
						</a></li>
						<li><a href="staff-new-staff-lists.html"> <span
								class="image nav-new-staff"><i></i></span> <span class="title">New
									Staff</span>
						</a></li>
					</ul>
				</div>
				<div class="slimScrollBar ui-draggable"
					style="height: 5px; position: absolute; bottom: 1px; opacity: 0.2; display: block; border-radius: 5px; z-index: 99; background: rgb(255, 255, 255);"></div>
				<div class="slimScrollRail"
					style="width: 100%; height: 5px; position: absolute; bottom: 1px; display: none; border-radius: 5px; opacity: 0.2; z-index: 90; background: rgb(51, 51, 51);"></div>
			</div>
			<!-- /#frame -->
		</div>
		<!-- /#project-switcher -->
	</header>
	<!-- /.header -->

	<div id="container" class="fixed-header">
		<div id="content">
			<div class="layout-container">
				<div class="">
					<!--=== Page Header ===-->
					<div class="page-header">

						<!--         <div class="container"> -->

						<div id="navbar">
							<nav class="navbar navbar-default navbar-static-top"
								role="navigation">
								<div class="navbar-header">
									<button type="button" class="navbar-toggle"
										data-toggle="collapse" data-target="#navbar-collapse-1">
										<span class="sr-only">Toggle navigation</span> <span
											class="icon-bar"></span> <span class="icon-bar"></span> <span
											class="icon-bar"></span>
									</button>
									<!--   <a class="navbar-brand" href="#">Brand</a> -->
								</div>

								<div class="collapse navbar-collapse" id="navbar-collapse-1">
									<ul class="nav navbar-nav">
										<!--  <li class="active"><a href="#">Active Link</a></li>
                    <li><a href="#">Link</a></li>
                   -->
										<li class="dropdown"><a href="#" class="dropdown-toggle"
											data-toggle="dropdown">Dropdown <b class="caret"></b></a>

											<ul class="dropdown-menu">
												<li class="kopie"><a href="#">Dropdown</a></li>
												<li><a href="#">Dropdown Link 1</a></li>
												<li><a href="#">Dropdown Link 2</a></li>
												<li><a href="#">Dropdown Link 3</a></li>

												<li class="dropdown dropdown-submenu"><a href="#"
													class="dropdown-toggle" data-toggle="dropdown">Dropdown
														Link 4</a>
													<ul class="dropdown-menu">
														<li class="kopie"><a href="#">Dropdown Link 4</a></li>
														<!-- 	<li><a href="#">Dropdown Submenu Link 4.1</a></li>
									<li><a href="#">Dropdown Submenu Link 4.2</a></li>
									<li><a href="#">Dropdown Submenu Link 4.3</a></li>
									<li><a href="#">Dropdown Submenu Link 4.4</a></li> -->

													</ul></li>

												<li class="dropdown dropdown-submenu"><a href="#"
													class="dropdown-toggle" data-toggle="dropdown">Dropdown
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
										<li class="dropdown"><a href="#" class="dropdown-toggle"
											data-toggle="dropdown">Dropdown2 <b class="caret"></b></a>
											<ul class="dropdown-menu">
												<li class="kopie"><a href="#">Dropdown2</a></li>
												<li><a href="#">Dropdown2 Link 1</a></li>
												<li><a href="#">Dropdown2 Link 2</a></li>
												<li><a href="#">Dropdown2 Link 3</a></li>

												<li class="dropdown dropdown-submenu"><a href="#"
													class="dropdown-toggle" data-toggle="dropdown">Dropdown2
														Link 4</a>
													<ul class="dropdown-menu">
														<li class="kopie"><a href="#">Dropdown2 Link 4</a></li>
														<!-- <li><a href="#">Dropdown2 Submenu Link 4.1</a></li>
									<li><a href="#">Dropdown2 Submenu Link 4.2</a></li>
									<li><a href="#">Dropdown2 Submenu Link 4.3</a></li>
									<li><a href="#">Dropdown2 Submenu Link 4.4</a></li> -->

													</ul></li>
												<li class="dropdown dropdown-submenu"><a href="#"
													class="dropdown-toggle" data-toggle="dropdown">Dropdown2
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


						<!-- </div> -->















					</div>
					<!-- /Page Header -->

					<div
						class="second-column one-child-container relative padding-top-75px">
						<!--=== Navigation Vertical ===-->
						<div class="first-column">
							<ul class="navigation v-navbar-container">
								<li><a href="hr-dashboard.html"> <span
										class="image nav-dashboard"><i></i></span> Dashboard
								</a></li>
								<li><a class="active" href="staff-details.html"> <span
										class="image nav-list"><i></i></span> info-popup-table
								</a></li>
								<li><a href="staff-create-form.html"> <span
										class="image nav-create"><i></i></span> Create a Staff
								</a></li>
							</ul>
							<div class="clearfloat"></div>
						</div>
						<!-- /Navigation Vertical -->
						<div id="my_documents_container" class="column-one clearfix">
							<div class="grid box-filters">
								<div class="table-header">
									<form id="add-edit-module" class="form-inline ng-pristine ng-valid" method="post"
										action="./roles/add">
										<div class="row-fluid">
											<div class="span4">
												<div class="">
												<input type="hidden" name="roleId" id="roleId" value="0">
													<table width="100%" cellspacing="0" cellpadding="0">
														<tr>
															<td class="padding0 no_border" width="15%"><label
																class="float_left mrgall-01 font13"> <strong
																	class="">Role Type</strong>
															</label></td>
															<td class="no_border"><div
																	class="controls project-input-contr">
																	<select name="userTypeId" id="roleType"
																		class="col-md-6 select2 full-width-fix required">
																		
																	</select>
																</div></td>
															</td>
														</tr>
													</table>
												</div>
											</div>

											<div class="span4">
												<div class="">
													<table width="100%" cellspacing="0" cellpadding="0">
														<tr>
															<td class="padding0 no_border" width="15%"><label
																class="float_left mrgall-01 font13"> <strong
																	class="">Role Name</strong>
															</label></td>
															<td class="no_border"><div
																	class="controls project-input-contr">
																	<input type="text" name="roleName" id="roleName">
																</div></td>
															</td>
														</tr>
													</table>
												</div>
											</div>

											<div>
												<table width="10%" cellspacing="0" cellpadding="0">
													<tr>
														<td><label class="float_left mrgall-01 font13">
																<strong class="">Description</strong>
														</label></td>
														<td class="no_border"><div>
																<input type="text" name="roleDescription" id="roleDescription"/>
															</div></td>
														</td>

														<td><label class="float_left mrgall-01 font13">
																<strong class="">Active</strong>
														</label></td>
														<td class="no_border"><div>
																<input type="checkbox" name="active" id="active"/>
															</div></td>
														</td>
													</tr>
													<tr>
														<td class="no_border" style="position:relative;left: 15px">
															<button type="submit" id="submit-btn"
																class="btn btn-xl btn-success button-submit font13"
																>Add</button>
														</td>
														<td class="no_border" style="position:relative;left: 25px">
															<button type="button"
																class="btn btn-xl  font13"
																data-dismiss="modal" id="cancel-btn">Cancel</button>
														</td>
													</tr>
												</table>
											</div>
										</div>

									</form>
								</div>
								<div class="grid-title">
									<div class="pull-left">Staff List</div>
									<div class="clear"></div>
								</div>
								<div class="grid-content">
									<div id="DataTables_Table_0_wrapper"
										class="dataTables_wrapper form-inline" role="grid">
										<div class="row">
											<div class="dataTables_header clearfix">
												<div class="col-md-6">
											</div>
										</div>
										<table
											class="table table-striped table-bordered table-hover table-checkable table-responsive datatable dataTable"
											id="DataTables_Table_0"
											aria-describedby="DataTables_Table_0_info">
											<thead>
												<tr role="row">
													<th class="sorting" role="columnheader" tabindex="0"
														aria-controls="DataTables_Table_0" rowspan="1" colspan="1"
														aria-label="Email ID: activate to sort column ascending">Role Name
														</th>
													<th class="sorting" role="columnheader" tabindex="0"
														aria-controls="DataTables_Table_0" rowspan="1" colspan="1"
														aria-label="Job Category: activate to sort column ascending">Role Description</th>
													<th class="sorting" role="columnheader" tabindex="0"
														aria-controls="DataTables_Table_0" rowspan="1" colspan="1"
														aria-label="Department: activate to sort column ascending">Status</th>
													<th class="sorting" role="columnheader" tabindex="0"
														aria-controls="DataTables_Table_0" rowspan="1" colspan="1"
														aria-label="Assign to Project: activate to sort column ascending">Edit</th>
												</tr>
											</thead>

											<tbody role="alert" aria-live="polite" aria-relevant="all">
												
											</tbody>
										</table>
										
									</div>
									<div class="info-popup">
										<table width="100%" cellpadding="0" cellspacing="0">
											<tbody>
												<tr>
													
												</tr>
											</tbody>
										</table>

									</div>
								</div>
							</div>
						</div>

					</div>
					<!-- Modal dialog -->
					<!-- <div class="modal fade" id="assigntoProject">
						<div class="modal-dialog">
							<div class="modal-content">
								<div class="modal-header">
									<button type="button" class="close" data-dismiss="modal"
										aria-hidden="true">×</button>
									<h4 class="modal-title">Module Master</h4>
								</div>
								<div class="modal-body">
									<div class="row">
										<div class="col-md-12">
											<div class="">
												<label>Note: </label> <span class="label label-danger">*
													Marked is Mandatory</span> </br> </br>
												<div class="form-group">
													<label class="col-md-2 control-label-2">Module Name<span
														style="color: red">* </span>:
													</label>
													<div class="col-md-7">
														<div
															class="select2-container select2-container-multi col-md-6 select2 full-width-fix required"
															id="s2id_input20" style="width: 90%;">
															<ul class="select2-choices">
																<li class="select2-search-field"><input type="text"
																	autocomplete="off" autocorrect="off"
																	autocapitilize="off" spellcheck="false"
																	class="select2-input select2-default"
																	id="s2id_autogen7" style="width: 100%;"></li>
															</ul>
															<div
																class="select2-drop select2-drop-multi select2-display-none">
																<ul class="select2-results">
																	<li class="select2-no-results">No matches found</li>
																</ul>
															</div>
														</div>
													</div>
												</div>
												<div class="form-group">
													<label class="col-md-2 control-label-2">Sr.No<span
														style="color: red">* </span> :
													</label>
													<div class="col-md-7">
														<div
															class="select2-container select2-container-multi col-md-6 select2 full-width-fix required"
															id="s2id_input20" style="width: 90%;">
															<ul class="select2-choices">
																<li class="select2-search-field"><input type="text"
																	autocomplete="off" autocorrect="off"
																	autocapitilize="off" spellcheck="false"
																	class="select2-input select2-default"
																	id="s2id_autogen7" style="width: 100%;"></li>
															</ul>
															<div
																class="select2-drop select2-drop-multi select2-display-none">
																<ul class="select2-results">
																	<li class="select2-no-results">No matches found</li>
																</ul>
															</div>
														</div>
													</div>
												</div>
												<div class="form-group">
													<label class="col-md-2 control-label-2">Active :</label>
													<div class="col-md-7">
														<input type="checkbox" name="chkbox">

													</div>
												</div>
											</div>
											<div class="modal-footer">
												<button type="button"
													class="btn btn-xl btn-success button-submit font13"
													data-dismiss="modal">Cancel</button>
												<a href="admin-projects.html"
													class="btn btn-xl btn-success button-submit font13 float_right">Submit</a>
											</div>
										</div>
									</div>
								</div>
							</div>
							/.modal-content
						</div>
						/.modal-dialog
					</div> -->
					<!-- /.modal -->
				</div>

				<!--=== Page Content ===-->
				<!--=== Managed Tables ===-->

				<!--=== Horizontal Scrolling ===-->

				<!-- /Horizontal Scrolling -->
				<!-- /Page Content -->
			</div>
			<!-- /.container -->

		</div>
	</div>

</body>


</html>