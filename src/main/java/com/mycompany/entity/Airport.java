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
@Table(name="Airport")
public class Airport implements Serializable {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "airportId")
    private int airportId;
    
    @Column(name = "airportName")
    private String airportName;
    
    @Column(name = "cityName")
    private String cityName;
    
    
    // relationship with table FlightRoute
    @OneToMany(mappedBy = "departurePlace",fetch = FetchType.LAZY)
    private List<FlightRoute> listDepartureFlightRoute;
    
    
    // relationship with table FlightRoute
    @OneToMany(mappedBy = "arrivalPlace",fetch = FetchType.LAZY)
    private List<FlightRoute> listArrivalFlightRoute;

    public Airport() {
    }

    public Airport(int airportId, String airportName, String cityName, List<FlightRoute> listDepartureFlightRoute, List<FlightRoute> listArrivalFlightRoute) {
        this.airportId = airportId;
        this.airportName = airportName;
        this.cityName = cityName;
        this.listDepartureFlightRoute = listDepartureFlightRoute;
        this.listArrivalFlightRoute = listArrivalFlightRoute;
    }

    public int getAirportId() {
        return airportId;
    }

    public void setAirportId(int airportId) {
        this.airportId = airportId;
    }

    public String getAirportName() {
        return airportName;
    }

    public void setAirportName(String airportName) {
        this.airportName = airportName;
    }

    public String getCityName() {
        return cityName;
    }

    public void setCityName(String cityName) {
        this.cityName = cityName;
    }

    public List<FlightRoute> getListDepartureFlightRoute() {
        return listDepartureFlightRoute;
    }

    public void setListDepartureFlightRoute(List<FlightRoute> listDepartureFlightRoute) {
        this.listDepartureFlightRoute = listDepartureFlightRoute;
    }

    public List<FlightRoute> getListArrivalFlightRoute() {
        return listArrivalFlightRoute;
    }

    public void setListArrivalFlightRoute(List<FlightRoute> listArrivalFlightRoute) {
        this.listArrivalFlightRoute = listArrivalFlightRoute;
    }
    
    
}
