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
@Table(name="TicketClass")
public class TicketClass implements Serializable {
    
    @Id   
    @GeneratedValue(strategy = GenerationType.IDENTITY) 
    @Column(name="ticketClassId")
    private int ticketClassId;
    
    @Column(name="ticketClassName")
    private String className;
    
    @Column(name="rate")
    private double rate;
    
    // relationship with table Ticket
    @OneToMany(mappedBy = "ticketClass",fetch = FetchType.LAZY)
    private List<Ticket> listTicket;

    public TicketClass() {
    }

    public TicketClass(int ticketClassId, String className, double rate, List<Ticket> listTicket) {
        this.ticketClassId = ticketClassId;
        this.className = className;
        this.rate = rate;
        this.listTicket = listTicket;
    }

    public int getTicketClassId() {
        return ticketClassId;
    }

    public void setTicketClassId(int ticketClassId) {
        this.ticketClassId = ticketClassId;
    }

    public String getClassName() {
        return className;
    }

    public void setClassName(String className) {
        this.className = className;
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
