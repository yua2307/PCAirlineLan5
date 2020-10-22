/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.controller;

import com.mycompany.entity.Booking;
import com.mycompany.entity.CreditCard;
import com.mycompany.entity.Customer;
import com.mycompany.entity.Flight;
import com.mycompany.entity.Ticket;
import com.mycompany.object.PaymentInfo;
import com.mycompany.object.SearchInformation;
import com.mycompany.object.TicketBooked;
import com.mycompany.object.TicketInfo;
import com.mycompany.service.BookingService;
import com.mycompany.service.CreditCardService;
import com.mycompany.service.CustomerService;
import com.mycompany.service.FlightRouteService;
import com.mycompany.service.FlightService;
import com.mycompany.service.TicketClassService;
import com.mycompany.service.TicketService;
import com.mycompany.service.TicketTypeService;
import java.security.Principal;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import javax.servlet.http.HttpSession;
import org.hibernate.Session;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

/**
 *
 * @author DELL
 */
@Controller
@RequestMapping("/customer")
public class CustomerController {

    @Autowired
    FlightRouteService flightRouteService;

    @Autowired
    CreditCardService creditCardService;

    @Autowired
    BookingService bookingService;

    @Autowired
    TicketService ticketService;

    @Autowired
    FlightService flightService;

    @Autowired
    TicketClassService ticketClassService;

    @Autowired
    TicketTypeService ticketTypeService;

    @Autowired
    CustomerService customerService;

    @GetMapping("/index")
    public String loginProcess(Model model, Principal principal, HttpSession session) {
        String userName = principal.getName();
        System.out.println("User Name: " + userName);
        model.addAttribute("message", userName);
        List<String> listPlace = flightRouteService.getAllPlace();
        model.addAttribute("listPlace", listPlace);
        model.addAttribute("searchInformation", new SearchInformation());
        session.setAttribute("username", userName);
        //login processing here
        return "index";
    }

    @PostMapping(value = "bookTicket")
    public String showFormAddInfo(@ModelAttribute("ticketBooked") TicketBooked t, Model model, HttpSession session) throws ParseException {
        Booking booking = new Booking();
        Flight flight = flightService.getFlightById(t.getFlightId());
        int availableSeat = flight.getAvailableSeat();
        flight.setAvailableSeat(availableSeat - t.getNumberAdult() - t.getNumberChildren());
        flight.setOrderSeat(t.getNumberAdult() + t.getNumberChildren());
        booking.setNumberTicketBuy(t.getNumberAdult() + t.getNumberChildren());

        booking.setTotalMoney(t.getNumberAdult() * t.getPriceAdultUnit() + t.getNumberChildren() * t.getPriceChildrenUnit());

        // set current date for booking
        Date date = new Date();
        SimpleDateFormat fmt = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");

        Customer customerFind = customerService.getCustomerByUsername((String) session.getAttribute("username"));
        booking.setCustomer(customerFind);
        
        booking.setPaymentDate(fmt.parse(fmt.format(date)));
        session.setAttribute("booking", booking);
        model.addAttribute("ticketInfo", new TicketInfo());
        session.setAttribute("flight", flight);
        session.setAttribute("seatClassId", t.getSeatClassId());
        session.setAttribute("customerId", t.getCustomerID());
        session.setAttribute("numberAdult", t.getNumberAdult());
        session.setAttribute("numberChildren", t.getNumberChildren());
        session.setAttribute("bookingId", booking.getBookingId());
        session.setAttribute("ticketClassId", t.getSeatClassId());
        session.setAttribute("priceChildrenUnit", t.getPriceChildrenUnit());
        session.setAttribute("priceAdultUnit", t.getPriceAdultUnit());
        return "bookTicket";
    }

    @PostMapping(value = "ticketInfo")
    public String ticketInfo(@ModelAttribute("ticketInfo") TicketInfo t, Model model, HttpSession session) throws ParseException {
        
        Flight flight = (Flight) session.getAttribute("flight");
        Booking booking = (Booking) session.getAttribute("booking");
        List<Ticket> listTicketSession = new ArrayList<>();
        // save ticket adult
        if (t.getListNameAdultGo() != null) {
            for (int i = 0; i < t.getListNameAdultGo().size(); i++) {
                Ticket ticket = new Ticket();

                ticket.setBooking(booking);
                ticket.setPrice(t.getPriceUnitAdult());
                ticket.setFlight(flightService.getFlightById(t.getFlightId()));
                ticket.setTicketClass(ticketClassService.getTicketClassById(t.getTicketClassId()));
                // set current Date
                Date date = new Date();
                SimpleDateFormat fmt = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
                ticket.setDateBuyTicket(date);
                // set current Date

                // set ticket type Adult
                ticket.setTicketType(ticketTypeService.getTicketTypeById(2));

                ticket.setNamePersonBuyTicket(t.getListNameAdultGo().get(i));
                ticket.setIdentify(t.getListIdentify().get(i));
                listTicketSession.add(ticket);
                // ticketService.saveTicket(ticket);
            }
        }
        // save ticket Children
        if (t.getListNameChildrenGo() != null) {
            for (int i = 0; i < t.getListNameChildrenGo().size(); i++) {
                Ticket ticket = new Ticket();
                ticket.setBooking(booking);
                ticket.setPrice(t.getPriceUnitChildren());
                ticket.setFlight(flightService.getFlightById(t.getFlightId()));
                ticket.setTicketClass(ticketClassService.getTicketClassById(t.getTicketClassId()));
                // set current Date
                Date date = new Date();
                SimpleDateFormat fmt = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
                ticket.setDateBuyTicket(fmt.parse(fmt.format(date)));
                // set current Date

                // set ticket type Children
                ticket.setTicketType(ticketTypeService.getTicketTypeById(1));

                ticket.setNamePersonBuyTicket(t.getListNameChildrenGo().get(i));
                listTicketSession.add(ticket);
                //   ticketService.saveTicket(ticket);
            }
        }
        session.setAttribute("booking", booking);
        session.setAttribute("flight", flight);
        session.setAttribute("listTicket", listTicketSession);
        model.addAttribute("paymentInfo", new PaymentInfo());
        return "payment";
    }

    @PostMapping(value = "payTicket")
    public String payTicket(@ModelAttribute("paymentInfo") PaymentInfo payInfo, Model model, HttpSession session) {
        Booking booking = (Booking) session.getAttribute("booking");
        Flight flight = (Flight) session.getAttribute("flight");
        flightService.saveFlight(flight);
        List<Ticket> listTicket = (List<Ticket>) session.getAttribute("listTicket");

        CreditCard creditCard = new CreditCard();
        creditCard.setNameOnCard(payInfo.getNameOnCard());
        creditCard.setType("VISA");
        creditCard.setCreditCardNumber(payInfo.getCreditCardNumber());
        creditCardService.save(creditCard);

        booking.setCreditCard(creditCard);
        bookingService.saveBooking(booking);
        for (Ticket ticket : listTicket) {
            ticketService.saveTicket(ticket);
        }
       
        model.addAttribute("listTicket", listTicket);
        model.addAttribute("booking", booking);
        session.removeAttribute("flight");
        session.removeAttribute("booking");
        session.removeAttribute("listTicket");
        return "paymentReceipt";
    }

    @GetMapping("/redirectCustomer")
    public String redirectCustomer(Principal principal, HttpSession session) {
        String userName = principal.getName();
        Flight flight = new Flight();
        flight = (Flight) session.getAttribute("flight");
        if (flight != null) {
            session.setAttribute("username", userName);
            return "redirect:/customer/bookTicket";
        } else {
            return "redirect:/customer/index";
        }
    }

    @GetMapping(value = "history")
    public String showHistory(Model model, HttpSession session) {
        // String userName = (String) session.getAttribute("username");
        Customer customerFind = customerService.getCustomerByUsername("yua2307");
        List<Booking> listBooking = customerFind.getListBooking();
        model.addAttribute("listBooking", listBooking);
        return "transactionHistory";
    }
}
