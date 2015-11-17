package com.iitms.rfcampusdata.authentication.entity;

import java.io.Serializable;
import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "ua_main_menu_master")
public class MainMenuEntity implements Serializable {

    @Id
    @Column(name = "menu_id")
    private int menuId;

    @Column(name = "menu_name")
    private String menuName;

    @Column(name = "mod_id")
    private int moduleId;

    @Column(name = "menu_tooltip")
    private String menuTooltip;

    // private String pageName;
    @Column(name = "menu_link")
    private String menuLink;

    @Column(name = "menu_srno")
    private String menuSerialNumber;

    @Column(name = "menu_status")
    private int menuStatus;

    @Column(name = "ipaddress")
    private String ipAddress;

    @Column(name = "macaddress")
    private String macAddress;

    @Column(name = "created_by")
    private String createdBy;

    @Column(name = "create_dt")
    private Date createdDate;

    @Column(name = "modified_by")
    private String modifiedBy;

    @Column(name = "modified_dt")
    private String modifiedDate;

    /*
     * @OneToMany(fetch = FetchType.EAGER)
     * @JoinColumn(name = "\"P_MENU_ID\"", referencedColumnName = "menu_id", insertable = false, updatable = false,
     * nullable = false) private List<SubMenuEntity> subMenus;
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

    public String getIpAddress() {
        return ipAddress;
    }

    public void setIpAddress(String ipAddress) {
        this.ipAddress = ipAddress;
    }

    public String getMacAddress() {
        return macAddress;
    }

    public void setMacAddress(String macAddress) {
        this.macAddress = macAddress;
    }

    public String getCreatedBy() {
        return createdBy;
    }

    public void setCreatedBy(String createdBy) {
        this.createdBy = createdBy;
    }

    public Date getCreatedDate() {
        return createdDate;
    }

    public void setCreatedDate(Date createdDate) {
        this.createdDate = createdDate;
    }

    public String getModifiedBy() {
        return modifiedBy;
    }

    public void setModifiedBy(String modifiedBy) {
        this.modifiedBy = modifiedBy;
    }

    public String getModifiedDate() {
        return modifiedDate;
    }

    public void setModifiedDate(String modifiedDate) {
        this.modifiedDate = modifiedDate;
    }
    /*
     * public List<SubMenuEntity> getSubMenus() { return subMenus; } public void setSubMenus(List<SubMenuEntity>
     * subMenus) { this.subMenus = subMenus; }
     */

}
