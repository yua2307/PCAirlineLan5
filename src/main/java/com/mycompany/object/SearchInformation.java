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
/**
 *
 * @author macbookpro
 */
public class SearchInformation {
    
    private String departure;
    private String arrival;
    private String date;

    public SearchInformation() {
    }

    public SearchInformation(String departure, String arrival, String date) {
        this.departure = departure;
        this.arrival = arrival;
        this.date = date;
    }

    

    public String getDeparture() {
        return departure;
    }

    public void setDeparture(String departure) {
        this.departure = departure;
    }

    public String getArrival() {
        return arrival;
    }

    public void setArrival(String arrival) {
        this.arrival = arrival;
    }

    public String getDate() {
        return date;
    }

    public void setDate(String date) {
        this.date = date;
    }
    
    
}

