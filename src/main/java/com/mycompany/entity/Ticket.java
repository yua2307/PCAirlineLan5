/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.entity;

import java.io.Serializable;
import java.util.Date;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

/**
 *
 * @author macbookpro
 */
@Entity
@Table(name="Ticket")
public class Ticket implements Serializable {
    
    @Id   
    @GeneratedValue(strategy = GenerationType.IDENTITY) 
    @Column(name="ticketId") 
    private int ticketID ;
    
    @Column(name="price") 
    private double price;
    
    @Column(name = "dateBuyTicket", columnDefinition="DATETIME")
    @Temporal(TemporalType.TIMESTAMP)
    private Date dateBuyTicket;
    
    @Column(name="seat") 
    private String seat;
    
    
    @Column(name="namePersonBuyTicket") 
    private String namePersonBuyTicket;
    
    @Column(name="identify") 
    private String identify;
    
    // relationship with table Flight
    @ManyToOne
    @JoinColumn(name="flightId")
    private Flight flight;
    
    // relationship with table Ticket Type
    @ManyToOne
    @JoinColumn(name="ticketTypeId")
    private TicketType ticketType;
    
    // relationship with table Ticket Class
    @ManyToOne
    @JoinColumn(name="ticketClassId")
    private TicketClass ticketClass;
    
    // relationship with table Booking
    @ManyToOne
    @JoinColumn(name="bookingId")
    private Booking booking;

    public Ticket() {
    }

    public Ticket(int ticketID, double price, Date dateBuyTicket, String seat, String namePersonBuyTicket, String identify, Flight flight, TicketType ticketType, TicketClass ticketClass, Booking booking) {
        this.ticketID = ticketID;
        this.price = price;
        this.dateBuyTicket = dateBuyTicket;
        this.seat = seat;
        this.namePersonBuyTicket = namePersonBuyTicket;
        this.identify = identify;
        this.flight = flight;
        this.ticketType = ticketType;
        this.ticketClass = ticketClass;
        this.booking = booking;
    }
    public int getTicketID() {
        return ticketID;
    }

    public void setTicketID(int ticketID) {
        this.ticketID = ticketID;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public Date getDateBuyTicket() {
        return dateBuyTicket;
    }

    public void setDateBuyTicket(Date dateBuyTicket) {
        this.dateBuyTicket = dateBuyTicket;
    }

    public String getSeat() {
        return seat;
    }

    public void setSeat(String seat) {
        this.seat = seat;
    }

    public String getNamePersonBuyTicket() {
        return namePersonBuyTicket;
    }

    public void setNamePersonBuyTicket(String namePersonBuyTicket) {
        this.namePersonBuyTicket = namePersonBuyTicket;
    }

    public String getIdentify() {
        return identify;
    }

    public void setIdentify(String identify) {
        this.identify = identify;
    }

    public Flight getFlight() {
        return flight;
    }

    public void setFlight(Flight flight) {
        this.flight = flight;
    }

    public TicketType getTicketType() {
        return ticketType;
    }

    public void setTicketType(TicketType ticketType) {
        this.ticketType = ticketType;
    }

    public TicketClass getTicketClass() {
        return ticketClass;
    }

    public void setTicketClass(TicketClass ticketClass) {
        this.ticketClass = ticketClass;
    }

    public Booking getBooking() {
        return booking;
    }

    public void setBooking(Booking booking) {
        this.booking = booking;
    }
    
    
    
}
