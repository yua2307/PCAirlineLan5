/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.service;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.mycompany.dao.*; 
import com.mycompany.entity.Airport;
import java.util.List;
import java.util.Optional;
/**
 *
 * @author macbookpro
 */
@Service
public class AirportService {
    @Autowired
    AirportDAOIF airportDAO;
    public void saveAiport(Airport airport) {
        airportDAO.save(airport);
    }
    public List<Airport> getAllAirport(){
        return (List<Airport>) airportDAO.findAll();
    }
    public Airport getAirportById(int id) {
        Optional<Airport> airportOpt = airportDAO.findById(id);
        return airportOpt.isPresent() ? airportOpt.get() : null;
    }
}
