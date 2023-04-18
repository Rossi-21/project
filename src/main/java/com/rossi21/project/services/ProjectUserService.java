package com.rossi21.project.services;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.rossi21.project.models.ProjectUser;
import com.rossi21.project.repositories.ProjectUserRepository;

@Service
public class ProjectUserService {
	
	@Autowired
	private ProjectUserRepository proUserRepo;
	// returns all the project's
    public List<ProjectUser> allProjectUsers() {
        return proUserRepo.findAll();
    }
}
