
package com.mycompany.controller;

import com.mycompany.entity.Customer;
import com.mycompany.entity.UserRole;
import com.mycompany.object.SearchInformation;
import com.mycompany.service.CustomerService;
import com.mycompany.service.FlightService;
import com.mycompany.service.UserRoleService;
import java.security.Principal;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class LoginController {
    
     @Autowired
    CustomerService customerService;
        
    @Autowired
    UserRoleService userRoleService;
    
    @GetMapping(value = "/login")
    public ModelAndView login(@RequestParam(value = "error", required = false) String error,
                              @RequestParam(value = "logout", required = false) String logout) {
        
        ModelAndView model = new ModelAndView();
        if (error != null) {
            model.addObject("error", "Invalid username and password!");
            model.setViewName("login");
        }
        
        if (logout != null) {
            model.addObject("msg", "You've been logged out successfully.");
            model.addObject("searchInformation",new SearchInformation());
            model.setViewName("redirect:/index");
        }
        //model.setViewName("login");
        return model;
    }
    
    @RequestMapping(value = "/userInfo", method = RequestMethod.GET)
   public String userInfo(Model model, Principal principal) {
  
       // Sau khi user login thanh cong se co principal
       String userName = principal.getName();
       System.out.println("User Name: "+ userName);
       model.addAttribute("message", userName);
       return "userInfoPage";
   }
   
   @GetMapping("/signupPage")
    public String toSignupPage(Model model){
        model.addAttribute("customer", new Customer());
        return "signUp";
    }
   
        
    @PostMapping("/signup")
    public String signup(@ModelAttribute("customer") Customer customer, UserRole userRole, Customer check,Model model){
        check = customerService.getCustomerByUsername(customer.getUsername());
        if (check!=null){
        model.addAttribute("exist","Tên đăng nhập đã có người sử dụng");
        return "signUp";
        }
        customer.setEnabled(true);
        customerService.saveCustomer(customer);
        userRole.setCustomer(customer);
        userRole.setUserName(customer.getUsername());
        userRole.setUserRole("ROLE_USER");
        userRoleService.saveUserRole(userRole);
        return "aftersignup";
    }
}
