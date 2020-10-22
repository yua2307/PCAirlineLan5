/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.object;

/**
 *
 * @author macbookpro
 */
public class TicketBooked {
    
    private int numberAdult;
    private int numberChildren;
    private double priceAdultUnit;
    private double priceChildrenUnit;
    
    private int customerID;

    private int flightId;
    private int seatClassId;

    public TicketBooked() {
    }

    public TicketBooked(int numberAdult, int numberChildren, double priceAdultUnit, double priceChildrenUnit, int customerID, int flightId, int seatClassId) {
        this.numberAdult = numberAdult;
        this.numberChildren = numberChildren;
        this.priceAdultUnit = priceAdultUnit;
        this.priceChildrenUnit = priceChildrenUnit;
        this.customerID = customerID;
        this.flightId = flightId;
        this.seatClassId = seatClassId;
    }

    public int getNumberAdult() {
        return numberAdult;
    }

    public void setNumberAdult(int numberAdult) {
        this.numberAdult = numberAdult;
    }

    public int getNumberChildren() {
        return numberChildren;
    }

    public void setNumberChildren(int numberChildren) {
        this.numberChildren = numberChildren;
    }

    public double getPriceAdultUnit() {
        return priceAdultUnit;
    }

    public void setPriceAdultUnit(double priceAdultUnit) {
        this.priceAdultUnit = priceAdultUnit;
    }

    public double getPriceChildrenUnit() {
        return priceChildrenUnit;
    }

    public void setPriceChildrenUnit(double priceChildrenUnit) {
        this.priceChildrenUnit = priceChildrenUnit;
    }

    public int getCustomerID() {
        return customerID;
    }

    public void setCustomerID(int customerID) {
        this.customerID = customerID;
    }

    public int getFlightId() {
        return flightId;
    }

    public void setFlightId(int flightId) {
        this.flightId = flightId;
    }

    public int getSeatClassId() {
        return seatClassId;
    }

    public void setSeatClassId(int seatClassId) {
        this.seatClassId = seatClassId;
    }
    
    
    
    
}
    
    
