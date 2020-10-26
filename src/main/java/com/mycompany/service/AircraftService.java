/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.mycompany.dao.*;
import com.mycompany.entity.Aircaft;
import java.util.List;
import java.util.Optional;
/**
 *
 * @author macbookpro
 */
@Service
public class AircraftService {
    @Autowired
    AircaftDAOIF aircaftDAO;
        public void saveAircraft(Aircaft aircaft) {
        aircaftDAO.save(aircaft);
    }
    public List<Aircaft> getAllAircaft(){
        return (List<Aircaft>) aircaftDAO.findAll();
    }
    public Aircaft getAircaftById(int id) {
        Optional<Aircaft> aircraftOpt = aircaftDAO.findById(id);
        return aircraftOpt.isPresent() ? aircraftOpt.get() : null;
    }
}
