/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.object;

import com.mycompany.entity.Airport;

/**
 *
 * @author DELL
 */
public class InforFlightRoute {
    private double standardPrice;
    private int departurePlace;
    private int arrivalPlace;

    public double getStandardPrice() {
        return standardPrice;
    }

    public void setStandardPrice(double standardPrice) {
        this.standardPrice = standardPrice;
    }

    public int getDeparturePlace() {
        return departurePlace;
    }

    public void setDeparturePlace(int departurePlace) {
        this.departurePlace = departurePlace;
    }

    public int getArrivalPlace() {
        return arrivalPlace;
    }

    public void setArrivalPlace(int arrivalPlace) {
        this.arrivalPlace = arrivalPlace;
    }

    public InforFlightRoute(double standardPrice, int departurePlace, int arrivalPlace) {
        this.standardPrice = standardPrice;
        this.departurePlace = departurePlace;
        this.arrivalPlace = arrivalPlace;
    }

    public InforFlightRoute() {
    }

}