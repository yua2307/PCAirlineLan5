/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.controller;

import com.mycompany.entity.Flight;
import com.mycompany.object.SearchInformation;
import com.mycompany.object.TicketBooked;
import com.mycompany.service.FlightService;
import com.mycompany.service.TicketClassService;
import com.mycompany.service.TicketTypeService;
import java.text.ParseException;
import java.util.List;
import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;


/**
 *
 * @author macbookpro
 */
@Controller
public class FlightController {
    @Autowired
    FlightService flightService;
    
    @Autowired
    TicketClassService ticketClassService;
    
    @Autowired
    TicketTypeService ticketTypeService;
    
    
    @PostMapping(value = "searchFlight")
    public String searchFlight(@ModelAttribute("searchInformation") SearchInformation searchInformation, Model model) throws ParseException{
        
        List<Flight> listSearch = flightService.searchFlight(searchInformation);
        
        model.addAttribute("listSearch",listSearch);
        model.addAttribute("Date", searchInformation.getDate());
        return "searchFlight";
    }
    
    
    @GetMapping(value="showInfoTicket")
    public String showInfoTicket(@RequestParam("flightId") int flightId,Model model,HttpSession session){
        
        Flight flight = flightService.getFlightById(flightId);
        model.addAttribute("flight",flight);
        session.setAttribute("flight", flight);
        model.addAttribute("ticketBooked", new TicketBooked());
        model.addAttribute("rateBusiness", ticketClassService.getRateByTicketClassName("Business Class"));
        model.addAttribute("rateFirst", ticketClassService.getRateByTicketClassName("First Class"));
        model.addAttribute("rateEconomy", ticketClassService.getRateByTicketClassName("Economy Class"));
        model.addAttribute("rateAdult", ticketTypeService.getRateByTicketTypeName("Adult"));
        model.addAttribute("rateChildren", ticketTypeService.getRateByTicketTypeName("Children"));
        return "ticketInfo";
    }
   
}







