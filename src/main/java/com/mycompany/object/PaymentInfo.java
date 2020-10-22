/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.object;

import java.util.List;

/**
 *
 * @author macbookpro
 */
public class PaymentInfo {
    private List<Integer> listTicketId;
    private int bookingId;
    private String creditCardNumber;
    private String type;
    private String nameOnCard;
    private String month;
    private String year;
    private String password;

    public PaymentInfo(List<Integer> listTicketId, int bookingId, String creditCardNumber, String type, String nameOnCard, String month, String year, String password) {
        this.listTicketId = listTicketId;
        this.bookingId = bookingId;
        this.creditCardNumber = creditCardNumber;
        this.type = type;
        this.nameOnCard = nameOnCard;
        this.month = month;
        this.year = year;
        this.password = password;
    }
   
   
    
    
    public PaymentInfo() {
    }

    public List<Integer> getListTicketId() {
        return listTicketId;
    }

    public void setListTicketId(List<Integer> listTicketId) {
        this.listTicketId = listTicketId;
    }

    public int getBookingId() {
        return bookingId;
    }

    public void setBookingId(int bookingId) {
        this.bookingId = bookingId;
    }

    

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    public String getNameOnCard() {
        return nameOnCard;
    }

    public void setNameOnCard(String nameOnCard) {
        this.nameOnCard = nameOnCard;
    }

    public String getMonth() {
        return month;
    }

    public void setMonth(String month) {
        this.month = month;
    }

    public String getYear() {
        return year;
    }

    public void setYear(String year) {
        this.year = year;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getCreditCardNumber() {
        return creditCardNumber;
    }

    public void setCreditCardNumber(String creditCardNumber) {
        this.creditCardNumber = creditCardNumber;
    }
    
    
}
