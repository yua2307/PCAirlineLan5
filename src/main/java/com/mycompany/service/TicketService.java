/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.service;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.mycompany.dao.*; 
import com.mycompany.entity.Ticket;
import java.util.ArrayList;
import java.util.List;
import java.util.Optional;
import org.springframework.transaction.annotation.Transactional;
/**
 *
 * @author macbookpro
 */
@Service
public class TicketService {
    @Autowired
    TicketDAOIF ticketDAO;
    
    
    @Transactional(rollbackFor={Exception.class})
    public void saveTicket(Ticket t){
         ticketDAO.save(t);
    }
    
    
    public List<Ticket> getAllTicket(){
        return  (List<Ticket>) ticketDAO.findAll();
    }
    public List<Ticket> getTicketListByBookingId(int id){
        
        List<Ticket> listTicketById = new ArrayList<Ticket>();
        for (Ticket ticket : getAllTicket()) {
            if(ticket.getBooking().getBookingId() == id){
                listTicketById.add(ticket);
            }
        }
        return listTicketById;
    }
    
    public Ticket getTicketById(int id){
        Optional<Ticket> ticketOpt = ticketDAO.findById(id);
	return ticketOpt.isPresent() ? ticketOpt.get() : null;
    } 
    
    @Transactional(rollbackFor={Exception.class})
    public void deleteTicket (Ticket t ){
         ticketDAO.delete(t);
    }
}
