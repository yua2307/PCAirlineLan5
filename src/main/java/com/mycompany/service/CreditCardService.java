/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.service;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.mycompany.dao.*; 
import com.mycompany.entity.CreditCard;
import org.springframework.transaction.annotation.Transactional;
import java.util.Optional;
/**
 *
 * @author macbookpro
 */
@Service
public class CreditCardService {
    @Autowired
    CreditCardDAOIF creditCardDAO;
    
    @Transactional(rollbackFor={Exception.class})
    public void save(CreditCard creditCard){
        creditCardDAO.save(creditCard);
    }
    
    public CreditCard getCreditCardBy(String creditCardNumber , String nameOnCard , int CCV){
        Optional<CreditCard> creditCardOpt = creditCardDAO.findByCreditCardNumberAndNameOnCardAndCCV(creditCardNumber,nameOnCard,CCV);
	return creditCardOpt.isPresent() ? creditCardOpt.get() : null;
    }
}
