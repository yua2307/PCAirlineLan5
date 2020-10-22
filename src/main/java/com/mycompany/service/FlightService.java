/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.service;

import com.mycompany.dao.FlightDAOIF;
import com.mycompany.entity.Flight;
import com.mycompany.object.SearchInformation;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Optional;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
/**
 *
 * @author macbookpro
 */
@Service
public class FlightService {
    @Autowired
    FlightDAOIF flightDAO;
    
    public List<Flight> getAllFlight(){
        return (List<Flight>) flightDAO.findAll();
    }
    @Transactional(rollbackFor={Exception.class})
    public void saveFlight (Flight flight){
         flightDAO.save(flight);
    }
   
    public List<Flight> searchFlight(SearchInformation searchInfo) throws ParseException{
        
        List<Flight> listSearch = new ArrayList<>();
        List<Flight> listFlight = getAllFlight();
        
        SimpleDateFormat sdformat = new SimpleDateFormat("yyyy-MM-dd"); // format theo cung 1 kieu yyyy-MM-dd
        Date searchDate = sdformat.parse(searchInfo.getDate());
        for (Flight flight : listFlight) {
            
            Date dateFlight = sdformat.parse(flight.getDepartureTime().toString());
            
            if(flight.getFlightRoute().getDeparturePlace().getCityName().equalsIgnoreCase(searchInfo.getDeparture())
                    && flight.getFlightRoute().getArrivalPlace().getCityName().equalsIgnoreCase(searchInfo.getArrival())
                    && dateFlight.compareTo(searchDate) == 0
                    ){
              
                listSearch.add(flight);
            }
        }
        return listSearch;
    }         
    
    public Flight getFlightById(int id){
        Optional<Flight> flightOpt = flightDAO.findById(id);
	return flightOpt.isPresent() ? flightOpt.get() : null;
    }
    
    
    
}
