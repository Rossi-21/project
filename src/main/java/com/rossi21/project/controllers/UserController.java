package com.rossi21.project.controllers;

import java.util.List;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;

import com.rossi21.project.models.LoginUser;
import com.rossi21.project.models.Project;
import com.rossi21.project.models.User;
import com.rossi21.project.services.ProjectService;
import com.rossi21.project.services.UserService;

@Controller

public class UserController {
	@Autowired
    private UserService userServ;
	@Autowired
    private ProjectService projectServ;
	// Login or Register Page
	@GetMapping("/")
    public String index(Model model) {
		// Bind empty User and LoginUser objects to the JSP
        // to capture the form input
        model.addAttribute("newUser", new User());
        model.addAttribute("newLogin", new LoginUser());
        return "index.jsp";
	}
	// Registration Method
	@PostMapping("/register")
    public String register(@Valid @ModelAttribute("newUser") User newUser, 
            BindingResult result, Model model, HttpSession session) {
        // call a register method in the service 
    	userServ.register(newUser, result);
        // to do some extra validations and create a new user!
        if(result.hasErrors()) {
            // Be sure to send in the empty LoginUser before 
            // re-rendering the page.
            model.addAttribute("newLogin", new LoginUser());
            return "index.jsp";
        }
        // No errors! 
        // Store their ID from the DB in session, 
        // in other words, log them in.
        User createdUser = userServ.create(newUser);
        session.setAttribute("userId", createdUser.getId());
        return "redirect:/projects";
    }
    //Login Method
    @PostMapping("/login")
    public String login(@Valid @ModelAttribute("newLogin") LoginUser newLogin, 
		BindingResult result, Model model, HttpSession session) {
        User user = userServ.login(newLogin, result);
        if (user == null) {
        	model.addAttribute("newUser", new User());
        	return "index.jsp";
        }
        session.setAttribute("userId", user.getId());
        return "redirect:/projects";
    }
    // Home Page
    @GetMapping("/projects")
    public String home(Model model, HttpSession session) {
    	if (session.getAttribute("userId") == null) {
    		return "redirect:/";
    	}
    	
    	Long userId = (Long)session.getAttribute("userId");
    	model.addAttribute("user", userServ.getOneById(userId));
    	List<Project> projects = projectServ.allProjects();
        model.addAttribute("projects", projects);
    	return "dashboard.jsp";
    }
    // Logout Method
    @GetMapping("/logout")
    public String logout(HttpSession session) {
    	session.removeAttribute("userId");
    	return "redirect:/";
    }
    
}
