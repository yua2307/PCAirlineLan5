/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.entity;

import java.io.Serializable;
import java.util.List;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;

/**
 *
 * @author macbookpro
 */
@Entity
@Table(name="Customer")
public class Customer implements Serializable {
     
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)  
    @Column(name="customerId") 
    private int customerId;
    
    @Column(name="name") 
    private String name;
    
    @Column(name="phoneNumber") 
    private String phoneNumber;
    
    @Column(name="identifyNumber") 
    private String identifyNumber;
    
    @Column(name="email") 
    private String email;
    
    @Column(name="username") 
    private String username;
    
    @Column(name="password") 
    private String password;
    
    @Column(name="address") 
    private String address;
    
    @Column(name="enabled")
    private boolean enabled;
    
    // relationship with table UserRole
    @OneToMany(mappedBy = "customer",fetch = FetchType.LAZY)
    private List<UserRole> listUserRole; 
    
    // relationship with table Booking
    @OneToMany(mappedBy = "customer", fetch = FetchType.LAZY)
    private List<Booking> listBooking;

    public Customer(int customerId, String name, String phoneNumber, String identifyNumber, String email, String username, String password, String address, boolean enabled, List<UserRole> listUserRole, List<Booking> listBooking) {
        this.customerId = customerId;
        this.name = name;
        this.phoneNumber = phoneNumber;
        this.identifyNumber = identifyNumber;
        this.email = email;
        this.username = username;
        this.password = password;
        this.address = address;
        this.enabled = enabled;
        this.listUserRole = listUserRole;
        this.listBooking = listBooking;
    }

    public List<UserRole> getListUserRole() {
        return listUserRole;
    }

    public void setListUserRole(List<UserRole> listUserRole) {
        this.listUserRole = listUserRole;
    }

    

    public Customer() {
    }

    public int getCustomerId() {
        return customerId;
    }

    public void setCustomerId(int customerId) {
        this.customerId = customerId;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getPhoneNumber() {
        return phoneNumber;
    }

    public void setPhoneNumber(String phoneNumber) {
        this.phoneNumber = phoneNumber;
    }

    public String getIdentifyNumber() {
        return identifyNumber;
    }

    public void setIdentifyNumber(String identifyNumber) {
        this.identifyNumber = identifyNumber;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public boolean isEnabled() {
        return enabled;
    }

    public void setEnabled(boolean enabled) {
        this.enabled = enabled;
    }


    public List<Booking> getListBooking() {
        return listBooking;
    }

    public void setListBooking(List<Booking> listBooking) {
        this.listBooking = listBooking;
    }

   
}
