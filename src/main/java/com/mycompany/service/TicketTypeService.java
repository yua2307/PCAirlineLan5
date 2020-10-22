/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.service;

import com.mycompany.dao.TicketTypeDAOIF;
import com.mycompany.entity.TicketType;
import com.mycompany.entity.TicketType;
import java.util.List;
import java.util.Optional;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 *
 * @author macbookpro
 */
@Service
public class TicketTypeService {
    @Autowired
    TicketTypeDAOIF ticketTypeDAO;
    
    public List<TicketType> getAllTicketType(){
        return (List<TicketType>) ticketTypeDAO.findAll();
    }
    
    
    public double getRateByTicketTypeName(String name ){
       List<TicketType> list = getAllTicketType();
        for (TicketType ticketType : list) {
            if(ticketType.getTicketTypeName().equalsIgnoreCase(name)){
                return ticketType.getRate();
            }
        }
        return 0;
    }
    
     public TicketType getTicketTypeById(int id){
        Optional<TicketType> ticketTypeOpt = ticketTypeDAO.findById(id);
	return ticketTypeOpt.isPresent() ? ticketTypeOpt.get() : null;
    }
}
