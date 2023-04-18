package com.rossi21.project.controllers;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.rossi21.project.models.Project;
import com.rossi21.project.services.ProjectService;
import com.rossi21.project.services.UserService;

@Controller

public class ProjectController {
	
	@Autowired
    private ProjectService projectServ;
	@Autowired
    private UserService userServ;
	// Create a book page
	@GetMapping("/projects/new")
    public String index(Model model, @ModelAttribute("project") Project project,  HttpSession session) {
		Long userId = (Long)session.getAttribute("userId");
    	model.addAttribute("user", userServ.getOneById(userId));
        return "new.jsp";
    }
	// Create a project method
	@PostMapping("/projects/create")
	public String createProject(@Valid @ModelAttribute("project") Project project, BindingResult result) {
        if (result.hasErrors()) {
            return "new.jsp";
        } else {
        	projectServ.createProject(project);
            return "redirect:/projects";
        }	
	}
	// Display book info page
	@GetMapping("/projects/{id}")
    public String show(@PathVariable("id") Long id, Model model, HttpSession session) {
		Project project = projectServ.getOneById(id);
        model.addAttribute("project", project);
        Long userId = (Long)session.getAttribute("userId");
    	model.addAttribute("user", userServ.getOneById(userId));
        return "show.jsp";
    }
	// Edit a book page
	@GetMapping("/projects/{id}/edit")
    public String edit(@PathVariable("id") Long id, Model model) {
		Project project = projectServ.getOneById(id);
        model.addAttribute("project", project);
        return "edit.jsp";
    }
	// Update a book method
	@RequestMapping(value="/projects/{id}", method=RequestMethod.PUT)
    public String update(@Valid @ModelAttribute("project") Project project, BindingResult result) {
        if (result.hasErrors()) {
            return "edit.jsp";
        } else {
        	projectServ.updateProject(project);
            return "redirect:/projects";
        }
    }
	// Borrow a book Method
    @GetMapping("/projects/{id}/join")
    public String joinProject(@PathVariable("id") Long id, HttpSession session) {
    	if(session.getAttribute("userId") == null) {
    		return "redirect:/";
    	}
    	Project project = projectServ.getOneById(id);
    	project.setJoiner(userServ.getOneById((Long)session.getAttribute("userId")));
    	projectServ.updateProject(project);
    	
    	return "redirect:/projects";
    }
    // Return a book Method
    @GetMapping("/books/{id}/leave")
    public String leaveProject(@PathVariable("id") Long id, HttpSession session) {
    	if(session.getAttribute("userId") == null) {
    		return "redirect:/";
    	}
    	Project project = projectServ.getOneById(id);
    	project.setJoiner(null);
    	projectServ.updateProject(project);
    	
    	return "redirect:/projects";
    }
	// Delete a book method
	@DeleteMapping("/projects/{id}/delete")
    public String destroy(@PathVariable("id") Long id) {
		projectServ.deleteProject(id);
        return "redirect:/projects";
    }

}
