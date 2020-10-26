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
public class InforFlight {
    private int aircraft;
    private int flightRoute;
    private String departureTime;
    private String arrivalTime;
    private int seat;

    public int getAircraft() {
        return aircraft;
    }

    public void setAircraft(int aircraft) {
        this.aircraft = aircraft;
    }

    public int getFlightRoute() {
        return flightRoute;
    }

    public void setFlightRoute(int flightRoute) {
        this.flightRoute = flightRoute;
    }
    



    public String getDepartureTime() {
        return departureTime;
    }

    public void setDepartureTime(String departureTime) {
        this.departureTime = departureTime;
    }

    public String getArrivalTime() {
        return arrivalTime;
    }

    public void setArrivalTime(String arrivalTime) {
        this.arrivalTime = arrivalTime;
    }

    public int getSeat() {
        return seat;
    }

    public void setSeat(int seat) {
        this.seat = seat;
    }

    public InforFlight() {
    }
}
