/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.controller;

import com.mycompany.entity.Customer;
import com.mycompany.object.ChangePassInfo;
import com.mycompany.service.CustomerService;
import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;

/**
 *
 * @author DELL
 */
@Controller
public class InforController {
    @Autowired
    CustomerService customerService;

    @PostMapping(value = "/updateInformation")
    public String update(@ModelAttribute("customer") Customer customer, Model model, Customer updateCus, Customer customer2) {
        updateCus = customerService.getCustomerByUsername(customer.getUsername());

        updateCus.setPhoneNumber(customer.getPhoneNumber());
        updateCus.setIdentifyNumber(customer.getIdentifyNumber());
        updateCus.setEmail(customer.getEmail());
        updateCus.setName(customer.getName());
        updateCus.setAddress(customer.getAddress());
        customerService.saveCustomer(updateCus);

        customer = customerService.getCustomerByUsername(updateCus.getUsername());
        model.addAttribute("ms", "");
        model.addAttribute(customer);
        return "userInformation";
    }

    @PostMapping(value = "/changePassProcess")
    public String changePassProcess(@ModelAttribute("changePassInfo") ChangePassInfo changePassInfo, HttpSession session, Model model) {
        String username = session.getAttribute("username").toString();
        Customer customer = customerService.getCustomerByUsername(username);
        if (customer.getPassword().toString().equals(changePassInfo.getCurrentPassword())) {
            customer.setPassword(changePassInfo.getNewPassword());
            customerService.saveCustomer(customer);
            return "redirect:/userInformation";
        } else {
            model.addAttribute("ms", "Nhập sai mật khẩu cũ");
            return "changePassword";
        }
    }
}
