/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.entity;


import javax.persistence.Entity;
import java.io.Serializable;
import java.util.List;
import javax.persistence.Column;
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
@Table(name = "AirCraft")
public class Aircaft implements Serializable {
    
    @Id    
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name ="airCraftId")        
    private int airCraftId;
    
    @Column(name ="airCraftName")
    private String aircraftName;
    
    @Column(name ="model")
    private String model;
    
    @Column(name ="seatNumber") 
    private int seatNumber;
    
    // relationship with table Flight
    @OneToMany(mappedBy = "aircaft",fetch = FetchType.LAZY)
    private List<Flight> listFlight;
    
    
    // relationship with table AirlineBrand
    @ManyToOne
    @JoinColumn(name = "airBrandId")
    private AirlineBrand airlineBrand;

    public Aircaft() {
    }

    public Aircaft(int airCraftId, String aircraftName, String model, int seatNumber, List<Flight> listFlight, AirlineBrand airlineBrand) {
        this.airCraftId = airCraftId;
        this.aircraftName = aircraftName;
        this.model = model;
        this.seatNumber = seatNumber;
        this.listFlight = listFlight;
        this.airlineBrand = airlineBrand;
    }

    public int getAirCraftId() {
        return airCraftId;
    }

    public void setAirCraftId(int airCraftId) {
        this.airCraftId = airCraftId;
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

    public List<Flight> getListFlight() {
        return listFlight;
    }

    public void setListFlight(List<Flight> listFlight) {
        this.listFlight = listFlight;
    }

    public AirlineBrand getAirlineBrand() {
        return airlineBrand;
    }

    public void setAirlineBrand(AirlineBrand airlineBrand) {
        this.airlineBrand = airlineBrand;
    }
    
    
    
}
