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
import java.util.Optional;
/**
 *
 * @author macbookpro
 */
@Entity
@Table(name="CreditCard")
public class CreditCard implements Serializable {
    
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)  
    @Column(name="creditCardId") 
    private int creditCardId;
    
    @Column(name="type") 
    private String type;
    
    @Column(name="creditCardNumber") 
    private String creditCardNumber;
    
    @Column(name="balance") 
    private double balance;
    
    @Column(name="nameOnCard") 
    private String nameOnCard;
    
    @Column(name ="CCV")
    private int CCV;
    
    // relationship with table Booking
    @OneToMany(mappedBy = "creditCard", fetch = FetchType.LAZY)
    private List<Booking> listBooking;

    public CreditCard() {
    }

    public CreditCard(int creditCardId, String type, String creditCardNumber, double balance, String nameOnCard, int CCV, List<Booking> listBooking) {
        this.creditCardId = creditCardId;
        this.type = type;
        this.creditCardNumber = creditCardNumber;
        this.balance = balance;
        this.nameOnCard = nameOnCard;
        this.CCV = CCV;
        this.listBooking = listBooking;
    }

    public int getCCV() {
        return CCV;
    }

    public void setCCV(int CCV) {
        this.CCV = CCV;
    }


    public int getCreditCardId() {
        return creditCardId;
    }

    public void setCreditCardId(int creditCardId) {
        this.creditCardId = creditCardId;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    public String getCreditCardNumber() {
        return creditCardNumber;
    }

    public void setCreditCardNumber(String creditCardNumber) {
        this.creditCardNumber = creditCardNumber;
    }

    public double getBalance() {
        return balance;
    }

    public void setBalance(double balance) {
        this.balance = balance;
    }

    public String getNameOnCard() {
        return nameOnCard;
    }

    public void setNameOnCard(String nameOnCard) {
        this.nameOnCard = nameOnCard;
    }

    public List<Booking> getListBooking() {
        return listBooking;
    }

    public void setListBooking(List<Booking> listBooking) {
        this.listBooking = listBooking;
    }
    
    
}
