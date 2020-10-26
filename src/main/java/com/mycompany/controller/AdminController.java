/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.controller;

import com.mycompany.entity.Aircaft;
import com.mycompany.entity.AirlineBrand;
import com.mycompany.entity.Airport;
import com.mycompany.entity.FlightRoute;
import com.mycompany.object.InforAircraft;
import com.mycompany.object.InforFlightRoute;
import com.mycompany.service.AircraftService;
import com.mycompany.service.AirlineBrandService;
import com.mycompany.service.AirportService;
import com.mycompany.service.FlightRouteService;
import java.security.Principal;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 *
 * @author DELL
 */
@Controller
@RequestMapping("/admin")
public class AdminController {

    @Autowired
    AircraftService aircraftService;
    @Autowired
    AirportService airportService;
    @Autowired
    AirlineBrandService airlineBrandService;

    @GetMapping("/index")
    public String hello(Model model, Principal principal, HttpSession session, HttpServletRequest request) {
        String userName = principal.getName();

        model.addAttribute("message", userName);

        session.setAttribute("username", userName);
        String uname = (String) request.getSession().getAttribute("uname");

        model.addAttribute("session", uname);
        return "admin/adminPage";
    }

    @GetMapping("/addAirport")
    public String addAirport(@ModelAttribute("result") String result, Model model) {
        List<Airport> list = airportService.getAllAirport();
        model.addAttribute("result", result);
        model.addAttribute("list", list);
        model.addAttribute("airport", new Airport());
        return "admin/addAirport";
    }

    @GetMapping("/addAircraft")
    public String addAircraft(@ModelAttribute("result") String result, Model model) {
        List<AirlineBrand> airlinebrandList = airlineBrandService.getAllAirlineBrand();
        List<Aircaft> templistAircraft = aircraftService.getAllAircaft();
        List<InforAircraft> listAircraft = new ArrayList();
//        for (Aircaft a : templistAircraft)
//        {
//            InforAircraft i = new InforAircraft();
//            i.setAircraftName(a.getAircraftName());
//            i.setModel(a.getModel());
//            i.setSeatNumber(a.getSeatNumber());
//            i.setAirlineBrandStr(a.getAirlineBrand().getBrandName().toString());
//            listAircraft.add(i);
//        }
        model.addAttribute("listAircraft", listAircraft);
        model.addAttribute("result", result);
        model.addAttribute("airlinebrandList", airlinebrandList);
        model.addAttribute("aircraft", new InforAircraft());
        return "admin/addAircraft";
    }

    @GetMapping("/addAirbrand")
    public String addAirbrand() {
        return "admin/addAirbrand";
    }
    @Autowired
    FlightRouteService flightRouteService;

    @GetMapping("/addAirroute")
    public String addAirroute(Model model) {
        List<Airport> airportList = airportService.getAllAirport();
        model.addAttribute("flightRoute", new InforFlightRoute());
        model.addAttribute(airportList);
        return "admin/addAirroute";
    }

    @GetMapping("/addFlight")
    public String addFlight() {
        return "admin/addFlight";
    }

    @GetMapping("/addAdmin")
    public String addAdmin() {
        return "admin/addAdmin";
    }

    @GetMapping("/allAdmin")
    public String allAdmin() {
        return "admin/allAdmin";
    }

    @GetMapping("/allCustomer")
    public String allCustomer() {
        return "admin/allCustomer";
    }

    @PostMapping("/addAirportProcess")
    public String addAirportProcess(@ModelAttribute("airport") Airport airport, Model model) {
        airportService.saveAiport(airport);
        model.addAttribute("result", "Them san bay thanh cong");
        return "redirect:/admin/addAirport";
    }

    @PostMapping("/addAircraftProcess")
    public String addAircraftProcess(@ModelAttribute("aircraft") InforAircraft inforAircraft, Model model) {
        Aircaft aircraft = new Aircaft();
        aircraft.setAircraftName(inforAircraft.getAircraftName());
        aircraft.setModel(inforAircraft.getModel());
        aircraft.setSeatNumber(inforAircraft.getSeatNumber());
        AirlineBrand a = airlineBrandService.getAirlineBrandById(inforAircraft.getAirlineBrand());
        aircraftService.saveAircraft(aircraft);
        model.addAttribute("result", "Them san bay thanh cong");
        return "redirect:/admin/addAircraft";
    }
}
