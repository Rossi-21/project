package com.rossi21.project.services;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.rossi21.project.models.Task;
import com.rossi21.project.repositories.TaskRepository;

@Service
public class TaskService {

	@Autowired
	private TaskRepository taskRepo;
	// Creates a task
	public Task createTask(Task t) {
		return taskRepo.save(t);
	}
	// retrieves a task
	public Task getOneById(Long id) {
		Optional<Task> task = taskRepo.findById(id);
		if (task.isEmpty()) {
			return null;
		}
		return task.get();
	}
	// returns all the task's
    public List<Task> allTasks() {
        return taskRepo.findAll();
    }
    // update the task info
    public Task  updateProject (Task t) {
		return taskRepo.save(t);
	}
    // delete a task
	public void deleteTask (Long id) {
		taskRepo.deleteById(id);
	}
}
