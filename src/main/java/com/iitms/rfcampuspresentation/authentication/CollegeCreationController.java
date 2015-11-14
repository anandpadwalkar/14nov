package com.iitms.rfcampuspresentation.authentication;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.iitms.rfcampusdata.authentication.entity.CollegeCreationModel;
import com.iitms.rfcampusdata.authentication.entity.CollegeMasterEntity;
import com.iitms.rfcampusdata.authentication.entity.ModuleMasterEntity;
import com.iitms.rfcampusdomain.authentication.service.CollegeCreationService;
import com.iitms.rfcampusdomain.authentication.service.ModuleService;

@Controller
public class CollegeCreationController {

    private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
    
    @Autowired
    private CollegeCreationService collegeCreationService;
    @Autowired
    private ModuleService moduleService;
    
    @RequestMapping(value = "/college", method = RequestMethod.GET)
    public ModelAndView getColleges(ModelMap model) {
        ModelAndView modelAndView = new ModelAndView("college-creation");
        List<CollegeMasterEntity> collegeList = collegeCreationService.getCollegeList();
        List<ModuleMasterEntity> moduleList = moduleService.listAuthorisedModule();
        model.addAttribute("collegeList", collegeList);
        model.addAttribute("moduleList", moduleList);
        return modelAndView;
    }
    
    @RequestMapping(value = "/college/add", method = RequestMethod.POST)
    public String addCollege(@ModelAttribute CollegeCreationModel entity, BindingResult result) {
        logger.info("Entity : " + entity);
        collegeCreationService.addCollege(entity);
        return "redirect:/college";
    }
    
    @RequestMapping(value = "/college/update", method = RequestMethod.POST)
    public String updateCollege(@ModelAttribute CollegeCreationModel entity, BindingResult result) {
        logger.info("Entity : " + entity);
        collegeCreationService.updateCollege(entity);
        return "redirect:/college";
    }
    
    
    @RequestMapping(value = "/college/{college-id}", method = RequestMethod.POST)
    public @ResponseBody CollegeCreationModel getCollegeInformation(@PathVariable(value = "college-id") int collegeId){
        CollegeCreationModel entity = collegeCreationService.getCollegeInformation(collegeId);
        return entity;
    }
}
