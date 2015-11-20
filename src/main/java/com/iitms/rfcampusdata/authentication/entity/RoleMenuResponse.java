package com.iitms.rfcampusdata.authentication.entity;

import java.io.Serializable;
import java.util.List;

public class RoleMenuResponse implements Serializable {

    private int moduleId;

    private String moduleName;

    private transient List<MenuMasterEntity> mainMenu; // serialized or transient

    public int getModuleId() {
        return moduleId;
    }

    public void setModuleId(int moduleId) {
        this.moduleId = moduleId;
    }

    public String getModuleName() {
        return moduleName;
    }

    public void setModuleName(String moduleName) {
        this.moduleName = moduleName;
    }

    public List<MenuMasterEntity> getMainMenu() {
        return mainMenu;
    }

    public void setMainMenu(List<MenuMasterEntity> mainMenu) {
        this.mainMenu = mainMenu;
    }

}
