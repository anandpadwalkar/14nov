package com.iitms.rfcampusdata.authentication.entity;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Id;

/*@Entity
@Table(name="\"UA_MENU_MASTER\"")*/
public class Menu implements Serializable {
    @Id
    @Column(name = "menu_id")
    private int menu_id;

    @Column(name = "menu_name")
    private String menu_name;

    @Column(name = "p_menu_id")
    private int p_menu_id;

    @Column(name = "menu_link")
    private String menu_link;

    public int getMenu_id() {
        return menu_id;
    }

    public void setMenu_id(int menu_id) {
        this.menu_id = menu_id;
    }

    public String getMenu_name() {
        return menu_name;
    }

    public void setMenu_name(String menu_name) {
        this.menu_name = menu_name;
    }

    public int getP_menu_id() {
        return p_menu_id;
    }

    public void setP_menu_id(int p_menu_id) {
        this.p_menu_id = p_menu_id;
    }

    public String getMenu_link() {
        return menu_link;
    }

    public void setMenu_link(String menu_link) {
        this.menu_link = menu_link;
    }

    @Override
    public String toString() {
        return "Menu [menu_id=" + menu_id + ", menu_name=" + menu_name + ", p_menu_id=" + p_menu_id + ", menu_link="
            + menu_link + "]";
    }

}
