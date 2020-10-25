/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.mycompany.dao.*;
import java.util.ArrayList;
import java.util.List;
import com.mycompany.entity.*;
import java.util.HashSet;
/**
 *
 * @author macbookpro
 */
@Service
public class FlightRouteService {
    @Autowired
    FlightRouteDAOIF flightRouteDAO;
    
    public List<String> getAllPlace(){
        List<String> listPlace = new ArrayList<>();
        
        List<FlightRoute> listFlightRoutes = (List<FlightRoute>) flightRouteDAO.findAll();
        for (FlightRoute listFlightRoute : listFlightRoutes) {
            listPlace.add(listFlightRoute.getArrivalPlace().getCityName());
            listPlace.add(listFlightRoute.getDeparturePlace().getCityName());
        }
        
        HashSet<String> set = new HashSet<String>(listPlace);
        listPlace.clear();
        listPlace.addAll(set);
        
        return listPlace;
    }

    public List<FlightRoute> getAllFlightRoute() {
        return (List<FlightRoute>) flightRouteDAO.findAll();
    }
}
