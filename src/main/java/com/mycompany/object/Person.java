/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.object;

/**
 *
 * @author DELL
 */
public class Person {
    private String name;
    private String phonenumber;
    private String indentify;
    private String email;
    private String username;
    private String password;
    private String address;

    public Person() {
    }

    public Person(String name, String phonenumber, String indentify, String email, String username, String password, String address) {
        this.name = name;
        this.phonenumber = phonenumber;
        this.indentify = indentify;
        this.email = email;
        this.username = username;
        this.password = password;
        this.address = address;
    }
    
}
