/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.controller;

import java.security.Principal;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 *
 * @author DELL
 */
@Controller
@RequestMapping("/admin")
public class AdminController {
    @GetMapping("/index")
    public String hello(Model model, Principal principal, HttpSession session,HttpServletRequest request){
       String userName = principal.getName();
       
       model.addAttribute("message", userName);
       
       session.setAttribute("username", userName);
       String uname=(String)request.getSession().getAttribute("uname");
       
       model.addAttribute("session", uname);
       return "admin/adminPage";
    }
    
    @GetMapping("/addAirport")
    public String addAirport(){
        return "admin/addAirport";
    }
    @GetMapping("/addAircraft")
    public String addAircraft(){
        return "admin/addAircraft";
    }
    @GetMapping("/addAirbrand")
    public String addAirbrand(){
        return "admin/addAirbrand";
    }
    @GetMapping("/addAirroute")
    public String addAirroute(){
        return "admin/addAirroute";
    }
    @GetMapping("/addFlight")
    public String addFlight(){
        return "admin/addFlight";
    }
    @GetMapping("/addAdmin")
    public String addAdmin(){
        return "admin/addAdmin";
    }
    @GetMapping("/allAdmin")
    public String allAdmin(){
        return "admin/allAdmin";
    }
    @GetMapping("/allCustomer")
    public String allCustomer(){
        return "admin/allCustomer";
    }
}
