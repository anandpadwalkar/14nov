package com.iitms.rfcampuspresentation.authentication;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.iitms.rfcampusdata.authentication.entity.RoleMenuResponse;
import com.iitms.rfcampusdata.authentication.entity.TestSession;
import com.iitms.rfcampusdomain.authentication.service.MenuService;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	@Autowired
	private MenuService menuService;
	
	@Autowired
	private TestSession testSession;
	
	@RequestMapping(value = { "/", "/welcome**" }, method = RequestMethod.GET)
	public ModelAndView welcomePage() {

		ModelAndView model = new ModelAndView();
		model.addObject("title", "Spring Security Hello World");
		model.addObject("message", "This is welcome page!");
		model.setViewName("hello");
		// testSession.setUsername("roshan");
		return model;

	}

	@RequestMapping(value = "/admin**", method = RequestMethod.GET)
	public ModelAndView adminPage()
	{
		/*logger.info("Admin: " );
		SessionUser user=(SessionUser)SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		List<Roles> roles=user.getRoles();
		logger.info("Role.....................size: " +roles.size());
		for (Iterator iterator = roles.iterator(); iterator.hasNext();) {
			Roles roles2 = (Roles) iterator.next();
			int id= roles2.getId();
			logger.info("Role.....................Id: " +id);	
		}
		*/
		ModelAndView model = new ModelAndView();
		model.addObject("title", "Spring Security Hello World");
		model.addObject("message", "This is protected page!");
		/*List<RoleMenuAllocation> menus =menuService.getMenuOfRole(testSession.getRoleId());
		model.addObject("menus", menus);*/
		/*List<Roles> list=menuService.getMenuOfRole(testSession.getRoleId());
		
		model.addObject("menuList",list.get(0).getMenus());
		Roles r = new Roles();r.setId(2);
		model.addObject("t",r);*/
		model.setViewName("admin");
		//sessionUser.setUsername("Updateed");
		//int id=testSession.getRoleId();
		//List<Menu> list=menuService.getMenuOfRole(id);
		//logger.info("Login : " + id);
	//	logger.info("menu list : " +list);
	//	model.addObject("menuList" ,list);
		return model;

	}
	
	   @RequestMapping(value = { "/role-link" }, method = RequestMethod.GET)
	    public String roleLinkAllotment() throws IOException {
	        return "role-links-allotment";

	    }
	   
	@RequestMapping(value = { "/menu-list" }, method = RequestMethod.GET)
	public @ResponseBody List<RoleMenuResponse> welcomePage1(HttpServletRequest rquest) throws IOException {
		List<RoleMenuResponse> role =menuService.getMenuList(0);
		logger.info("Menus : " + role.size());
		return role;

	}
	
	@RequestMapping(value = { "/test" }, method = RequestMethod.GET)
	public String test(HttpServletRequest rquest) throws IOException {
		
		return "new-group-add-staf-list";

	}
}
