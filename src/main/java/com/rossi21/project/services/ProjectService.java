package com.rossi21.project.services;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.rossi21.project.models.Project;
import com.rossi21.project.repositories.ProjectRepository;

@Service
public class ProjectService {
	
	@Autowired
	private ProjectRepository projectRepo;
	
	// Creates a project
	public Project createProject(Project p) {
		
		return projectRepo.save(p);
	}
	
	// retrieves a project
	public Project getOneById(Long id) {
		Optional<Project> project = projectRepo.findById(id);
		if (project.isEmpty()) {
			return null;
		}
		
		return project.get();
	}
	// returns all the project's
    public List<Project> allProjects() {
    	
        return projectRepo.findAll();
    }
    
    // update the project info
    public Project  updateProject (Project p) {
    	
		return projectRepo.save(p);
	}
    
    // delete a project
	public void deleteProject (Long id) {
		projectRepo.deleteById(id);
	}

}
