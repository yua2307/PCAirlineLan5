/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.entity;

import java.io.Serializable;
import java.util.Date;
import java.util.List;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

/**
 *
 * @author macbookpro
 */
@Entity
@Table(name="Booking")
public class Booking implements Serializable {
    
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)  
    @Column(name="bookingId")        
    private int bookingId;
    
    @Column(name="numberTicketBuy")
    private int numberTicketBuy;
    
    @Column(name="totalMoney")
    private double totalMoney;
    
    @Column(name = "paymentDate", columnDefinition="DATETIME")
    @Temporal(TemporalType.TIMESTAMP)
    private Date paymentDate;
    
    
    // relationship with table Ticket
    @OneToMany(mappedBy = "booking",fetch = FetchType.LAZY)
    private List<Ticket> listTicket;
    
    // relationship with table Customer
    @ManyToOne
    @JoinColumn(name = "customerId")
    private Customer customer;
    
    // relationship with table CreditCard
    @ManyToOne
    @JoinColumn(name = "creditCardId")
    private CreditCard creditCard;

    public Booking() {
    }

    public Booking(int bookingId, int numberTicketBuy, double totalMoney, Date paymentDate, List<Ticket> listTicket, Customer customer, CreditCard creditCard) {
        this.bookingId = bookingId;
        this.numberTicketBuy = numberTicketBuy;
        this.totalMoney = totalMoney;
        this.paymentDate = paymentDate;
        this.listTicket = listTicket;
        this.customer = customer;
        this.creditCard = creditCard;
    }

    public int getBookingId() {
        return bookingId;
    }

    public void setBookingId(int bookingId) {
        this.bookingId = bookingId;
    }

    public int getNumberTicketBuy() {
        return numberTicketBuy;
    }

    public void setNumberTicketBuy(int numberTicketBuy) {
        this.numberTicketBuy = numberTicketBuy;
    }

    public double getTotalMoney() {
        return totalMoney;
    }

    public void setTotalMoney(double totalMoney) {
        this.totalMoney = totalMoney;
    }

    public Date getPaymentDate() {
        return paymentDate;
    }

    public void setPaymentDate(Date paymentDate) {
        this.paymentDate = paymentDate;
    }

    public List<Ticket> getListTicket() {
        return listTicket;
    }

    public void setListTicket(List<Ticket> listTicket) {
        this.listTicket = listTicket;
    }

    public Customer getCustomer() {
        return customer;
    }

    public void setCustomer(Customer customer) {
        this.customer = customer;
    }

    public CreditCard getCreditCard() {
        return creditCard;
    }

    public void setCreditCard(CreditCard creditCard) {
        this.creditCard = creditCard;
    }
    
    
    
    
}
