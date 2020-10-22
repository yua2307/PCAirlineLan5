/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.service;

import com.mycompany.dao.TicketClassDAOIF;
import com.mycompany.entity.Flight;
import com.mycompany.entity.TicketClass;
import java.util.List;
import java.util.Optional;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 *
 * @author macbookpro
 */
@Service
public class TicketClassService {
    @Autowired
    TicketClassDAOIF ticketClassDAO;
    
    
    public List<TicketClass> getAllTicketClass(){
        return (List<TicketClass>) ticketClassDAO.findAll();
    }
    
    public double getRateByTicketClassName(String name ){
       
        List<TicketClass> list = getAllTicketClass();
        for (TicketClass ticketClass : list) {
            if(ticketClass.getClassName().equalsIgnoreCase(name)){
                return ticketClass.getRate();
            }
        }
        return 0;
    }
    
    public TicketClass getTicketClassById(int id){
        Optional<TicketClass> ticketClassOpt = ticketClassDAO.findById(id);
	return ticketClassOpt.isPresent() ? ticketClassOpt.get() : null;
    }

}
