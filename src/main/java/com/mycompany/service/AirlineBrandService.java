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
import com.mycompany.entity.AirlineBrand;
import java.util.List;
import java.util.Optional;
/**
 *
 * @author macbookpro
 */
@Service
public class AirlineBrandService {
    @Autowired
    AirlineBrandDAOIF airlineBrandDAO;
    public List<AirlineBrand> getAllAirlineBrand(){
        return (List<AirlineBrand>) airlineBrandDAO.findAll();
    }
    public AirlineBrand getAirlineBrandById(int id) {
        Optional<AirlineBrand> customerOpt = airlineBrandDAO.findById(id);
        return customerOpt.isPresent() ? customerOpt.get() : null;
    }
}
