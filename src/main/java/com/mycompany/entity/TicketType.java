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
@Table(name="TicketType")
public class TicketType implements Serializable {
    
    @Id   
    @GeneratedValue(strategy = GenerationType.IDENTITY) 
    @Column(name="ticketTypeId")
    private int ticketTypeID;
    
    @Column(name = "ticketTypeName")
    private String ticketTypeName;
    
    @Column(name = "rate    ")
    private double rate;
    
    
    // relationship with table Ticket
    @OneToMany(mappedBy = "ticketType",fetch = FetchType.LAZY)
    private List<Ticket> listTicket;

    public TicketType() {
    }

    
    
    public TicketType(int ticketTypeID, String ticketTypeName, double rate, List<Ticket> listTicket) {
        this.ticketTypeID = ticketTypeID;
        this.ticketTypeName = ticketTypeName;
        this.rate = rate;
        this.listTicket = listTicket;
    }

    public int getTicketTypeID() {
        return ticketTypeID;
    }

    public void setTicketTypeID(int ticketTypeID) {
        this.ticketTypeID = ticketTypeID;
    }

    public String getTicketTypeName() {
        return ticketTypeName;
    }

    public void setTicketTypeName(String ticketTypeName) {
        this.ticketTypeName = ticketTypeName;
    }

    public double getRate() {
        return rate;
    }

    public void setRate(double rate) {
        this.rate = rate;
    }

    public List<Ticket> getListTicket() {
        return listTicket;
    }

    public void setListTicket(List<Ticket> listTicket) {
        this.listTicket = listTicket;
    }

   
}
