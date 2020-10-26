/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.controller;

import com.mycompany.entity.Aircaft;
import com.mycompany.entity.AirlineBrand;
import com.mycompany.entity.Airport;
import com.mycompany.entity.Flight;
import com.mycompany.entity.FlightRoute;
import com.mycompany.object.InforAircraft;
import com.mycompany.object.InforFlight;
import com.mycompany.object.InforFlightRoute;
import com.mycompany.service.AircraftService;
import com.mycompany.service.AirlineBrandService;
import com.mycompany.service.AirportService;
import com.mycompany.service.FlightRouteService;
import com.mycompany.service.FlightService;
import java.security.Principal;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
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
    
    @Autowired
    FlightRouteService flightRouteService;
    
    @Autowired
    FlightService flightService;
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

    @GetMapping("/addAirroute")
    public String addAirroute(@ModelAttribute("result") String result, Model model) {
        List<Airport> airportList = airportService.getAllAirport();
        model.addAttribute("flightRoute", new InforFlightRoute());
        model.addAttribute("result", result);
        model.addAttribute(airportList);
        return "admin/addAirroute";
    }

    @GetMapping("/addFlight")
    public String addFlight(@ModelAttribute("result") String result, Model model) {
        List<FlightRoute> flightRouteList = flightRouteService.getAllFlightRoute();
        List<Aircaft> aircraftList = aircraftService.getAllAircaft();
        model.addAttribute("result", result);
        model.addAttribute("flightRouteList",flightRouteList);
        model.addAttribute("aircraftList",aircraftList);
        model.addAttribute("flight", new InforFlight());
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
        model.addAttribute("result", "Thêm máy bay thành công");
        return "redirect:/admin/addAircraft";
    }
    
    @PostMapping("/addAirrouteProcess")
    public String addAirrouteProcess(@ModelAttribute("flightRoute") InforFlightRoute inforFlightRoute, Model model) {
        FlightRoute flightRoute = new FlightRoute();
        Airport from = airportService.getAirportById(inforFlightRoute.getDeparturePlace());
        Airport to = airportService.getAirportById(inforFlightRoute.getArrivalPlace());
        flightRoute.setStandardPrice(inforFlightRoute.getStandardPrice());
        flightRoute.setDeparturePlace(from);
        flightRoute.setArrivalPlace(to);
        flightRouteService.saveFlightRoute(flightRoute);
        model.addAttribute("result", "Thêm đường bay thành công");
        return "redirect:/admin/addAirroute";
    }
    
    @PostMapping("/addFlightProcess")
    public String addFlightProcess(@ModelAttribute("flight") InforFlight inforFlight, Model model) throws ParseException {
        FlightRoute flightRoute =  flightRouteService.getFlightRouteById(inforFlight.getFlightRoute());
        Aircaft aircraft = aircraftService.getAircaftById(inforFlight.getAircraft());
        Flight flight = new Flight();
        flight.setAircaft(aircraft);
        flight.setFlightRoute(flightRoute);
        
        String date1 = inforFlight.getDepartureTime().substring(0, 10);
        String time1 = inforFlight.getDepartureTime().substring(11, 16);
        String date2 = inforFlight.getArrivalTime().substring(0, 10);
        String time2 = inforFlight.getArrivalTime().substring(11, 16);
        
        Date departureTime=new SimpleDateFormat("yyyy-MM-dd HH:mm").parse(date1+" "+time1);  
        Date arrivalTime=new SimpleDateFormat("yyyy-MM-dd HH:mm").parse(date2+" "+time2);  
        
        flight.setDepartureTime(departureTime);
        flight.setArrivalTime(arrivalTime);
        
        flight.setTotalSeat(inforFlight.getSeat());
        flight.setAvailableSeat(inforFlight.getSeat());
        flight.setOrderSeat(0);
        flightService.saveFlight(flight);
        model.addAttribute("result", "Thêm chuyến bay thành công");
        return "redirect:/admin/addFlight";
    }
}
