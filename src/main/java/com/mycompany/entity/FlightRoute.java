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
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;

/**
 *
 * @author macbookpro
 */
@Entity
@Table(name="FlightRoute")
public class FlightRoute implements Serializable {
    
    @Id   
    @GeneratedValue(strategy = GenerationType.IDENTITY) 
    @Column(name="routeId")        
    private int routeID;
    
    @Column(name="standardPrice")    
    private double standardPrice;
    
    
     // relationship with table Airport
    @ManyToOne
    @JoinColumn(name = "departurePlaceId")
    private Airport departurePlace;
    
    
    // relationship with table Airport
    @ManyToOne
    @JoinColumn(name = "arrivalPlaceId")
    private Airport arrivalPlace;
    
    // relationship with table Flight
    @OneToMany(mappedBy = "flightRoute",fetch = FetchType.LAZY)
    private List<Flight> listFlight;

    public FlightRoute() {
    }

    public FlightRoute(int routeID, double standardPrice, Airport departurePlace, Airport arrivalPlace, List<Flight> listFlight) {
        this.routeID = routeID;
        this.standardPrice = standardPrice;
        this.departurePlace = departurePlace;
        this.arrivalPlace = arrivalPlace;
        this.listFlight = listFlight;
    }

    public int getRouteID() {
        return routeID;
    }

    public void setRouteID(int routeID) {
        this.routeID = routeID;
    }

    public double getStandardPrice() {
        return standardPrice;
    }

    public void setStandardPrice(double standardPrice) {
        this.standardPrice = standardPrice;
    }

    public Airport getDeparturePlace() {
        return departurePlace;
    }

    public void setDeparturePlace(Airport departurePlace) {
        this.departurePlace = departurePlace;
    }

    public Airport getArrivalPlace() {
        return arrivalPlace;
    }

    public void setArrivalPlace(Airport arrivalPlace) {
        this.arrivalPlace = arrivalPlace;
    }

    public List<Flight> getListFlight() {
        return listFlight;
    }

    public void setListFlight(List<Flight> listFlight) {
        this.listFlight = listFlight;
    }
    
    
}
