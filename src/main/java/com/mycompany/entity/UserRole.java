/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import javax.persistence.UniqueConstraint;

/**
 *
 * @author macbookpro
 */
@Entity
@Table(name = "user_roles", uniqueConstraints = //
           @UniqueConstraint(columnNames = { "role", "username" }))
public class UserRole {
    
    @Id   
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name="user_role_id")
    private int roleId;
    
    @Column(name="role")
    private String userRole;
    
    
    @Column(name = "username")
    private String userName;
    
    
    @ManyToOne
    @JoinColumn(name="customerId")
    private Customer customer;

    public UserRole(int roleId, String userRole, String userName, Customer customer) {
        this.roleId = roleId;
        this.userRole = userRole;
        this.userName = userName;
        this.customer = customer;
    }

    
    

    public UserRole() {
    }

    public int getRoleId() {
        return roleId;
    }

    public void setRoleId(int roleId) {
        this.roleId = roleId;
    }

    public String getUserRole() {
        return userRole;
    }

    public void setUserRole(String userRole) {
        this.userRole = userRole;
    }

    public Customer getCustomer() {
        return customer;
    }

    public void setCustomer(Customer customer) {
        this.customer = customer;
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }
    
    
    
}
