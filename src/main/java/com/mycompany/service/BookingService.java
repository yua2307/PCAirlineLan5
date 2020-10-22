/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.service;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.mycompany.dao.*; 
import com.mycompany.entity.Booking;
import java.util.List;
import java.util.Optional;
import org.springframework.transaction.annotation.Transactional;
/**
 *
 * @author macbookpro
 */
@Service
public class BookingService {
    @Autowired
    BookingDAOIF bookingDAO;
    
    @Transactional(rollbackFor={Exception.class})
    public void saveBooking(Booking b){
         bookingDAO.save(b);
    }
    
    
     public Booking getBookingById(int id){
        Optional<Booking> bookingOpt = bookingDAO.findById(id);
	return bookingOpt.isPresent() ? bookingOpt.get() : null;
    }
     
   
}
