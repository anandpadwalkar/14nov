/*******************************************************************************
 * Copyright (c) 2015 MasterSoft.
 * Team Java
 * All rights reserved.
 *******************************************************************************/

package com.iitms.rfcampusdata.authentication.daoimpl;

import org.springframework.stereotype.Repository;

import com.iitms.rfcampusdata.authentication.dao.DomainDao;

@Repository
public class DomainDaoImpl implements DomainDao {

    @Override
    public String getMessage() {
        return "hi...";
    }

}
