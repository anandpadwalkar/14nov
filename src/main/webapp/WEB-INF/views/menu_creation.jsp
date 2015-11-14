<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@page session="true"%>

<head>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=0">
	<title>Staff Details | RITENOW Infra</title>

	<jsp:include page="script.jsp" />
	
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
	//});
		
		/* DEPARTMENT ON CHANGE  */
			var tempItemId = '';
		$("#parentMenu").change(function(){
			var Modulavalue = $("#module_id").val();
			var menuId = $("#parentMenu").val();
			
			if(menuId != 0){
				
				$.ajax({
					url:"./get_menu-lists",
					type:"POST",
					data:{"module_id" : Modulavalue, "parentMenuId" : menuId},
					success:function(response){
// 						alert()
						var text2=''
						if(JSON.stringify(response) != '[]'){
							$.each(response, function(index, MainMenuEntityList){
							    text2+=""
							    	+ "<tr class=\"odd\"> "
							    	+ "                          <td class=\" \"> "
							    	+ "                          	<a href=\"#\" onclick=\"updateMenu("+MainMenuEntityList.parentMenuId+",'"+MainMenuEntityList.menuId+"','"+MainMenuEntityList.menuName+"','"+MainMenuEntityList.menuLink+"','"+MainMenuEntityList.menuToolTip+"','"+MainMenuEntityList.menuSrno+"','"+MainMenuEntityList.active+"')\" data-toggle=\"modal\" data-original-title=\"Add to Project\" data-placement=\"top\" style=\"border-radius:40px; padding:4px 6px 2px;\" class=\"btn btn-xl btn-success button-submit font13 bs-tooltip\"> "
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
						//alert(text2);
						$('#menu_table').append(text2);
					//	$('#call').val('update');
// 						$("#submit_button").text('Update');
						/* if(tempItemId != ''){
							$("#menu_id").val(tempItemId);
						} */
						
					},
					error:function(){
						
					}
				});
			}else{
				$('#menu_table').empty();
			}
			
        });
	
		
		/* DEPARTMENT ON CHANGE ENDS */
		
		$("#module_id").change(function(){
			var Modulavalue = $("#module_id").val();
			$("#parentMenu").empty();
			
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
						$("#parentMenu").html(text);
						//alert($("#menu_id").html());
						$('#menu_table').append(text2);
						$('#call').val('update');
// 						$("#submit_button").text('Update');
						if(tempItemId != ''){
							$("#parentMenu").val(tempItemId);
						}
						
					},
					error:function(){
						
					}
				});
			}else{
				$("#parentMenu").empty();
				var text = '';
				text += '<option value="0" selected="selected">Select Module</option>';
				$("#parentMenu").html(text);
				$("#parentMenu").val(0);//.change();
				$("#menu_name").val('');
				$("#menu_link").val('');
				$("#menu_tool_tip").val('');
				$("#menu_srno").val('');
				$('#menu_table').empty();
			}
			
        });

		$("#add-edit-form").validate({
			// Specify the validation rules
			rules : {
				ModuleId : {
					required : true
				},
				menuName : {
					required : true
				},
				menuLink : {
					required : true
				},
				menuSerialNumber : {
					required : true
				}
			},

			// Specify the validation error messages
			messages : {
				ModuleId : {
					required : "Please select Model"//,
				},
				menuName : {
					required : "Please Enter Menu Name"//,
				},
				menuLink : {
					required : "Please Enter Menu Link"//,
				},
				menuSerialNumber : {
					required : "Please Enter Menu Serial Number"//,
				}
			},

			submitHandler : function(form) {
				form.submit();
			}
		});
	  });
		function updateMenu(parent, id, menu_name, menulink, menutooltip, menusrno, status){
		//alert(itemId+" - "+itemCode+ " - "+itemName+ " - "+minStock+ " - "+maxStock+ " - "+currentStock+ " - "+itemUnit + " - "+ deptId + " - " + complaintTypeId);
		
		
		$("#menuId").val(id);
		$("#parentMenu").val(parent);//.change();
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
		$("#add-edit-form").attr('action', './update-menu-creation');
		$("form").valid();
		}
		
		$("#cancel_id").click(function(){
			$("#submit_button").text('Save');
			$("#add-edit-form").attr('action', './add-menu-creation');
		});
    </script>
    
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
      <form:form commandName="menuCreation" action="./add-menu-creation" method="post" id="add-edit-form">
      <div class="second-column one-child-container relative padding-top-75px"> 
       
        
        <div id="my_documents_container" style="margin-left:0px; margin:auto;width:90%" class="column-one clearfixs">
          <div class="">
            <div class="row">
              <div class="create_project_tbl"> 
                <!--<div class="lContentbox_heading relative">
                   	  <h4>Staff Registration Form</h4>
                   	</div>-->
                <form class="form-horizontal" action="#">
                  
                  
                  
                  <!-- jaskirat code start here -->
                  
                  
      <div class="col-md-6">
        
        
        <input type="hidden" id="call" name="call" value="save" />
         <input type="hidden" id="menuId"  name="menuId" value="0" /> 
        
                                <div class="form-horizontal">
                                    <div class="form-group">
                                        <br>
                                        <div class="col-sm-12">
                                            <div class="col-sm-5">

                                                <span id="ContentPlaceHolder1_lblModule" class="control-label">Module  <span style="color: #FF0000; font-weight: bold">*</span></span>
                                               

                                            </div>
                                            <div class="col-sm-7">
                                                <select id="module_id" name="ModuleId" onchange="javascript:setTimeout('__doPostBack(\'ctl00$ContentPlaceHolder1$ddlModule\',\'\')', 0)" id="ContentPlaceHolder1_ddlModule" tabindex="1" class="form-control">
		<option value="0">Disabled select</option>


</select>
                                                <span id="ContentPlaceHolder1_rfvmodule" style="display:none;"></span>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="form-group">
                                        <div class="col-sm-12">
                                            <div class="col-sm-5">

                                                <span id="ContentPlaceHolder1_lblParent" class="control-label">Parent</span>

                                            </div>
                                            <div class="col-sm-7">
                                                <select name="parentMenuId"  id="parentMenu" tabindex="2" class="form-control">
	<option selected="selected" value="0">Please Select</option>
	

</select>

                                            </div>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <div class="col-sm-12">
                                            <div class="col-sm-5">

                                                <span id="ContentPlaceHolder1_lblMenuName" class="control-label">Menu Name  <span style="color: #FF0000; font-weight: bold">*</span></span>
                                               

                                            </div>
                                            <div class="col-sm-7">
                                                <input name="menuName" type="text" maxlength="40" id="menu_name" tabindex="3" class="form-control" onkeypress="return CheckAlphaNumeric(event,this)" placeholder="Enter Menu Name">

                                                
                                                
                                                  
                                                <span id="ContentPlaceHolder1_rfvmenu" style="display:none;"></span>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <div class="col-sm-12">
                                            <div class="col-xs-5">
                                                <span id="ContentPlaceHolder1_lblMenuLink" class="control-label">Menu Link <span style="color: #FF0000; font-weight: bold">*</span></span>
                                                
                                            </div>

                                            <div class="col-sm-7">
                                                <input name="menuLink" type="text" maxlength="100" id="menu_link" tabindex="4" class="form-control" onkeypress="return CheckAlphaNumeric(event,this)" placeholder="Enter Menu Link">
                                                
                                                <span id="ContentPlaceHolder1_rfvMenuLink" style="display:none;"></span>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <div class="col-sm-12">
                                            <div class="col-sm-5">
                                                <span id="ContentPlaceHolder1_lblMenuToolTip" class="control-label">Menu ToolTip</span>
                                            </div>
                                            <div class="col-sm-7">
                                                <input name="menuTooltip" type="text" maxlength="40" id="menu_tool_tip" tabindex="5" class="form-control" onkeypress="return CheckAlphaNumeric(event,this)" placeholder="Enter Menu ToolTip ">

                                                
                                               
                                            </div>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <div class="col-sm-12">
                                            <div class="col-sm-5">

                                                <span id="ContentPlaceHolder1_lblMenusrno" class="control-label">Menu Sr.No. <span style="color: #FF0000; font-weight: bold">*</span></span>
                                               

                                            </div>
                                            <div class="col-sm-7">
                                                <input name="menuSerialNumber" type="text" maxlength="10" id="menu_srno" tabindex="6" class="form-control" onkeypress="return CheckNumeric(event,this)" placeholder="Enter  Menu Sr.Number">
                                                  
                                                <span id="ContentPlaceHolder1_rfvMenusrno" style="display:none;"></span>
                                            </div>
                                        </div>
                                    </div>
                                    
                                    <div class="form-group">
                                        <div class="col-sm-12">
                                            <div class="col-sm-5">
                                                <span id="ContentPlaceHolder1_Label1" class="control-label">Status</span>

                                            </div>
                                            <div class="col-sm-7">
                                                <input id="menu_status" value="1" type="checkbox" name="menuStatus" checked="checked" tabindex="8"><label for="ContentPlaceHolder1_chkActive"> Active</label>
                                            </div>
                                        </div>
                                    </div>
                                    
                                </div>
                                
                              
                            </div>
                            
             
               <div class="col-md-6" style="padding-right:50px">
            
            <div class="grid box-filters" style="height:334px;position:relative;overflow:auto">
               
                      <table id="menu_table" class="table table-bordered  table-checkable table-responsive  "  id="DataTables_Table_0" aria-describedby="DataTables_Table_0_info">
                      <thead>
                    <tr role="row">
                     <th class="sorting" role="columnheader" tabindex="0" aria-controls="DataTables_Table_0" rowspan="1" colspan="1" aria-label="Assign to Project: activate to sort column ascending">Select</th>
                    <th class="sorting" role="columnheader" tabindex="0" aria-controls="DataTables_Table_0" rowspan="1" colspan="1" aria-label="ID: activate to sort column ascending">Srno</th>
                    <th class="sorting" role="columnheader" tabindex="0" aria-controls="DataTables_Table_0" rowspan="1" colspan="1" aria-label="First Name: activate to sort column ascending">Menu</th>
                    <th class="sorting" role="columnheader" tabindex="0" aria-controls="DataTables_Table_0" rowspan="1" colspan="1" aria-label="Last Name: activate to sort column ascending">Menu Link</th>
                    </tr> 
                  </thead>
                      
                    <tbody role="alert" aria-live="polite" aria-relevant="all">
                        
                        </tbody>
                        </table>
              
             
             </div>
                </div>
                 
                  <!-- jaskirat code end here -->
                  
                  
              
                  
                  <div class="">
                    <div class="row">
                      <div class="col-md-12">
                        <div class="form-group action-btn-group">
                          <div class="controls2"> 
                          <span class="left-margin-remove">
                            <a href="quality-control.html">
                            <button id="cancel_id" type=reset class="btn btn-xl btn-default button-submit font13">
                            	<span><span class="" >Cancel</span></span>
                            </button>
                            </a>
                          </span> 
                          <!-- <a href="quality-control.html"> -->
                            <button  type="submit" name="submit_create_edit_team" class="btn btn-xl btn-primary button-submit font13"> <span><span class=""  id="submit_button">Save</span></span> </button>
                            <!-- </a>  -->
                            </div>
                        </div>
                      </div>
                    </div>
                  </div>
                </form>
              </div>
            </div>
          </div>
        </div>
      </div>
        </form:form>
      <!--=== Page Content ===--> 
    </div>
    
    </div></div>
    <!-- /.container --> 
    <!-- /.container --> 
</body>

