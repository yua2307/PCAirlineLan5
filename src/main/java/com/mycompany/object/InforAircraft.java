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
public class InforAircraft {
    private String aircraftName;
    private String model;
    private int seatNumber;
    private int airlineBrand;
    private String airlineBrandStr;

    public String getAirlineBrandStr() {
        return airlineBrandStr;
    }

    public void setAirlineBrandStr(String airlineBrandStr) {
        this.airlineBrandStr = airlineBrandStr;
    }

    public InforAircraft(String aircraftName, String model, int seatNumber, int airlineBrand, String airlineBrandStr) {
        this.aircraftName = aircraftName;
        this.model = model;
        this.seatNumber = seatNumber;
        this.airlineBrand = airlineBrand;
        this.airlineBrandStr = airlineBrandStr;
    }
    public InforAircraft() {
    }



    public String getAircraftName() {
        return aircraftName;
    }

    public void setAircraftName(String aircraftName) {
        this.aircraftName = aircraftName;
    }

    public String getModel() {
        return model;
    }

    public void setModel(String model) {
        this.model = model;
    }

    public int getSeatNumber() {
        return seatNumber;
    }

    public void setSeatNumber(int seatNumber) {
        this.seatNumber = seatNumber;
    }

    public int getAirlineBrand() {
        return airlineBrand;
    }

    public void setAirlineBrand(int airlineBrand) {
        this.airlineBrand = airlineBrand;
    }
    
    
}
