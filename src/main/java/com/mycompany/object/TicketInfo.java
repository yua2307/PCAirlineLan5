/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.object;

import java.util.List;

/**
 *
 * @author macbookpro
 */
public class TicketInfo {
    
    private List<Integer> listId;
    private List<String> listNameAdultGo;
    private List<String> listNameChildrenGo;
    private List<String> listIdentify;
    private int bookingId;
    private int flightId;
    private int ticketClassId;
    private double priceUnitAdult;
    private double priceUnitChildren;

    public TicketInfo(List<Integer> listId, List<String> listNameAdultGo, List<String> listNameChildrenGo, List<String> listIdentify, int bookingId, int flightId, int ticketClassId, double priceUnitAdult, double priceUnitChildren) {
        this.listId = listId;
        this.listNameAdultGo = listNameAdultGo;
        this.listNameChildrenGo = listNameChildrenGo;
        this.listIdentify = listIdentify;
        this.bookingId = bookingId;
        this.flightId = flightId;
        this.ticketClassId = ticketClassId;
        this.priceUnitAdult = priceUnitAdult;
        this.priceUnitChildren = priceUnitChildren;
    }

    public TicketInfo() {
    }

    public List<Integer> getListId() {
        return listId;
    }

    public void setListId(List<Integer> listId) {
        this.listId = listId;
    }

    public List<String> getListNameAdultGo() {
        return listNameAdultGo;
    }

    public void setListNameAdultGo(List<String> listNameAdultGo) {
        this.listNameAdultGo = listNameAdultGo;
    }

    public List<String> getListNameChildrenGo() {
        return listNameChildrenGo;
    }

    public void setListNameChildrenGo(List<String> listNameChildrenGo) {
        this.listNameChildrenGo = listNameChildrenGo;
    }

    public List<String> getListIdentify() {
        return listIdentify;
    }

    public void setListIdentify(List<String> listIdentify) {
        this.listIdentify = listIdentify;
    }

    public int getBookingId() {
        return bookingId;
    }

    public void setBookingId(int bookingId) {
        this.bookingId = bookingId;
    }

    public int getFlightId() {
        return flightId;
    }

    public void setFlightId(int flightId) {
        this.flightId = flightId;
    }

    public int getTicketClassId() {
        return ticketClassId;
    }

    public void setTicketClassId(int ticketClassId) {
        this.ticketClassId = ticketClassId;
    }

    public double getPriceUnitAdult() {
        return priceUnitAdult;
    }

    public void setPriceUnitAdult(double priceUnitAdult) {
        this.priceUnitAdult = priceUnitAdult;
    }

    public double getPriceUnitChildren() {
        return priceUnitChildren;
    }

    public void setPriceUnitChildren(double priceUnitChildren) {
        this.priceUnitChildren = priceUnitChildren;
    }
    
    
    
}