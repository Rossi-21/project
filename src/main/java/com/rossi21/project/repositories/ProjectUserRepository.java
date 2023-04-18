package com.rossi21.project.repositories;

import java.util.List;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.rossi21.project.models.ProjectUser;

@Repository
public interface ProjectUserRepository extends CrudRepository<ProjectUser, Long> {
	List<ProjectUser> findAll();
}
