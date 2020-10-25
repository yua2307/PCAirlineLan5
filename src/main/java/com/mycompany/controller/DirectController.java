/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.controller;

import com.mycompany.entity.Customer;
import com.mycompany.object.ChangePassInfo;
import com.mycompany.object.SearchInformation;
import com.mycompany.service.AirportService;
import com.mycompany.service.CustomerService;
import com.mycompany.service.FlightRouteService;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

/**
 *
 * @author macbookpro
 */
@Controller
public class DirectController {

    @Autowired
    FlightRouteService flightRouteService;

    @Autowired
    CustomerService customerService;

    @GetMapping(value = "/index")
    public String toIndexPage(Model model, HttpSession session) {

        Customer customer = new Customer();
        String username = (String) session.getAttribute("username");
        if (username == null) {
            List<String> listPlace = flightRouteService.getAllPlace();
            model.addAttribute("listPlace", listPlace);
            model.addAttribute("searchInformation", new SearchInformation());
            return "index";
        } else {
            customer = customerService.getCustomerByUsername(username);
            if (customer.getListUserRole().get(0).getUserRole().equals("ROLE_ADMIN")) {
                return "redirect:/admin/index";
            } else {
                List<String> listPlace = flightRouteService.getAllPlace();
                model.addAttribute("listPlace", listPlace);
                model.addAttribute("searchInformation", new SearchInformation());
                return "redirect:/customer/index";
            }
        }
    }

    @GetMapping(value = "/userInformation")
    public String toInforPage(HttpSession session, Customer customer, Model model) {
        String username = session.getAttribute("username").toString();
        customer = customerService.getCustomerByUsername(username);
        model.addAttribute(customer);
        return "userInformation";
    }

    @GetMapping(value = "/changePassword")
    public String toChangePassPage(Model model) {
        model.addAttribute("changePassInfo", new ChangePassInfo());
        return "changePassword";
    }

}
