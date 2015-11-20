package com.iitms.rfcampusdata.authentication.entity;

import java.io.Serializable;
import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Entity
@Table(name = "ua_sub_menu_master")
// @JsonIdentityInfo(generator=ObjectIdGenerators.IntSequenceGenerator.class)
/*
 * @FetchProfiles(
 * @FetchProfile(name = "module", fetchOverrides = @FetchProfile.FetchOverride(association = "module", entity =
 * MenuMasterEntity.class, mode = FetchMode.JOIN )) )
 */
public class MenuMasterEntity implements Serializable {

    @Id
    @Column(name = "menu_id")
    private int menuId;

    @Column(name = "menu_name")
    private String menuName;

    @Column(name = "mod_id")
    private int moduleId;

    @Column(name = "menu_tooltip")
    private String menuTooltip;

    @Column(name = "p_menu_id")
    private int parentMenuId;

    // private String pageName;
    @Column(name = "menu_link")
    private String menuLink;

    @Column(name = "menu_srno")
    private String menuSerialNumber;

    @Column(name = "menu_status")
    private int menuStatus;
    /*
     * @Column(name = "\"IPADDRESS\"") private String ipAddress;
     * @Column(name = "\"MACADDRESS\"") private String macAddress;
     * @Column(name = "\"CREATED_BY\"") private String createdBy;
     * @Column(name = "\"CREATE_DT\"") private Date createdDate;
     * @Column(name = "\"MODIFIED_BY\"") private String modifiedBy;
     * @Column(name = "\"MODIFIED_DT\"") private String modifiedDate;
     */

    // @ManyToOne
    // @JsonManagedReference
    // private SubMenuEntity mainMenu;
    @ManyToOne(fetch = FetchType.LAZY, optional = true)
    @JoinColumn(name = "mod_id", referencedColumnName = "mod_id", insertable = false, updatable = false, nullable = false)
    private ModuleMasterEntity module;

    // @Transient
    private transient List<MenuMasterEntity> subMenu;

    /*
     * @ManyToOne(cascade={CascadeType.ALL}, fetch = FetchType.EAGER, optional = true)
     * @JoinColumn(name = "\"P_MENU_ID\"", insertable = false, updatable = false, nullable = false) private
     * MenuMasterEntity mainMenu;
     * @OneToMany(mappedBy="mainMenu", fetch = FetchType.EAGER) private Set<MenuMasterEntity> subMenus = new
     * HashSet<MenuMasterEntity>();
     */

    public int getMenuId() {
        return menuId;
    }

    public void setMenuId(int menuId) {
        this.menuId = menuId;
    }

    public String getMenuName() {
        return menuName;
    }

    public void setMenuName(String menuName) {
        this.menuName = menuName;
    }

    public int getModuleId() {
        return moduleId;
    }

    public void setModuleId(int moduleId) {
        this.moduleId = moduleId;
    }

    public String getMenuTooltip() {
        return menuTooltip;
    }

    public void setMenuTooltip(String menuTooltip) {
        this.menuTooltip = menuTooltip;
    }

    /*
     * public int getParentMenuId() { return parentMenuId; } public void setParentMenuId(int parentMenuId) {
     * this.parentMenuId = parentMenuId; }
     */

    public String getMenuLink() {
        return menuLink;
    }

    public void setMenuLink(String menuLink) {
        this.menuLink = menuLink;
    }

    public String getMenuSerialNumber() {
        return menuSerialNumber;
    }

    public void setMenuSerialNumber(String menuSerialNumber) {
        this.menuSerialNumber = menuSerialNumber;
    }

    public int getMenuStatus() {
        return menuStatus;
    }

    public void setMenuStatus(int menuStatus) {
        this.menuStatus = menuStatus;
    }

    /*
     * public SubMenuEntity getMainMenu() { return mainMenu; } public void setMainMenu(SubMenuEntity mainMenu) {
     * this.mainMenu = mainMenu; }
     */

    public List<MenuMasterEntity> getSubMenu() {
        return subMenu;
    }

    public void setSubMenu(List<MenuMasterEntity> subMenu) {
        this.subMenu = subMenu;
    }

    @Override
    public int hashCode() {
        final int prime = 31;
        int result = 1;
        result = prime * result + ((menuName == null) ? 0 : menuName.hashCode());
        return result;
    }

    @Override
    public boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (obj == null) {
            return false;
        }
        if (getClass() != obj.getClass()) {
            return false;
        }
        MenuMasterEntity other = (MenuMasterEntity) obj;
        if (menuName == null) {
            if (other.menuName != null) {
                return false;
            }
        } else if (!menuName.equals(other.menuName)) {
            return false;
        }
        return true;
    }

    public ModuleMasterEntity getModule() {
        return module;
    }

    public void setModule(ModuleMasterEntity module) {
        this.module = module;
    }

    @Override
    public String toString() {
        return "MenuMasterEntity [menuName=" + menuName + ", moduleId=" + moduleId + ", parentMenuId=" + parentMenuId
            + "]";
    }

    public int getParentMenuId() {
        return parentMenuId;
    }

    public void setParentMenuId(int parentMenuId) {
        this.parentMenuId = parentMenuId;
    }

}
