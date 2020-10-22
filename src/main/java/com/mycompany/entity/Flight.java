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
@Table(name="Flight")
public class Flight implements Serializable {
    @Id    
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name="flightId")        
    private int flightID;
    
    @Column(name = "departureTime", columnDefinition="DATETIME")
    @Temporal(TemporalType.TIMESTAMP)
    private Date departureTime;
    
    
    @Column(name = "arrivalTime", columnDefinition="DATETIME")
    @Temporal(TemporalType.TIMESTAMP)
    private Date arrivalTime;
    
    @Column(name="totalSeat")
    private int totalSeat;
    
    @Column(name="orderedSeat")
    private int orderSeat;
    
    @Column(name="availableSeat")
    private int availableSeat;
    
    @Column(name="duration")
    private double duration;
    
    
     // relationship with table Aircaft
    @ManyToOne
    @JoinColumn(name ="airCraftId")
    private Aircaft aircaft;
    
    
     // relationship with table FlightRoute
    @ManyToOne
    @JoinColumn(name = "routeId")
    private FlightRoute flightRoute;
    
     // relationship with table Ticket
    @OneToMany(mappedBy = "flight", fetch = FetchType.LAZY)
    private List<Ticket> listTicket;

    public Flight() {
    }

    public Flight(int flightID, Date departureTime, Date arrivalTime, int totalSeat, int orderSeat, int availableSeat, double duration, Aircaft aircaft, FlightRoute flightRoute, List<Ticket> listTicket) {
        this.flightID = flightID;
        this.departureTime = departureTime;
        this.arrivalTime = arrivalTime;
        this.totalSeat = totalSeat;
        this.orderSeat = orderSeat;
        this.availableSeat = availableSeat;
        this.duration = duration;
        this.aircaft = aircaft;
        this.flightRoute = flightRoute;
        this.listTicket = listTicket;
    }

    public int getFlightID() {
        return flightID;
    }

    public void setFlightID(int flightID) {
        this.flightID = flightID;
    }

    public Date getDepartureTime() {
        return departureTime;
    }

    public void setDepartureTime(Date departureTime) {
        this.departureTime = departureTime;
    }

    public Date getArrivalTime() {
        return arrivalTime;
    }

    public void setArrivalTime(Date arrivalTime) {
        this.arrivalTime = arrivalTime;
    }

    public int getTotalSeat() {
        return totalSeat;
    }

    public void setTotalSeat(int totalSeat) {
        this.totalSeat = totalSeat;
    }

    public int getOrderSeat() {
        return orderSeat;
    }

    public void setOrderSeat(int orderSeat) {
        this.orderSeat = orderSeat;
    }

    public int getAvailableSeat() {
        return availableSeat;
    }

    public void setAvailableSeat(int availableSeat) {
        this.availableSeat = availableSeat;
    }

    public double getDuration() {
        return duration;
    }

    public void setDuration(double duration) {
        this.duration = duration;
    }

    public Aircaft getAircaft() {
        return aircaft;
    }

    public void setAircaft(Aircaft aircaft) {
        this.aircaft = aircaft;
    }

    public FlightRoute getFlightRoute() {
        return flightRoute;
    }

    public void setFlightRoute(FlightRoute flightRoute) {
        this.flightRoute = flightRoute;
    }

    public List<Ticket> getListTicket() {
        return listTicket;
    }

    public void setListTicket(List<Ticket> listTicket) {
        this.listTicket = listTicket;
    }
    
    
    
}
