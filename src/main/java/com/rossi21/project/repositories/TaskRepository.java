package com.rossi21.project.repositories;

import java.util.List;

import org.springframework.data.repository.CrudRepository;

import com.rossi21.project.models.Task;

public interface TaskRepository extends CrudRepository<Task, Long>{
	List<Task> findAll();
	

}
