/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.service;

import com.mycompany.dao.UserRoleDAOIF;
import com.mycompany.entity.Customer;
import com.mycompany.entity.UserRole;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
/**
 *
 * @author DELL
 */
@Service
public class UserRoleService {

    @Autowired
    UserRoleDAOIF userRoleDAO;
    
    
    @Transactional(rollbackFor={Exception.class})
    public void saveUserRole(UserRole userRole) {
        userRoleDAO.save(userRole);
    }
}
