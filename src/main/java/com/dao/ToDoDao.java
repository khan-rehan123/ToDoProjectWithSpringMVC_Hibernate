package com.dao;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.hibernate5.HibernateTemplate;
import org.springframework.stereotype.Component;

import com.entity.ToDo;

@Component
public class ToDoDao {
	@Autowired
	HibernateTemplate hibernateTemplate;
	
	@Transactional
	public int sava(ToDo t) {
		Integer i=(Integer) this.hibernateTemplate.save(t);
		return i;
		
	}
	public List<ToDo> getAll(){
		
		List<ToDo> todo= this.hibernateTemplate.loadAll(ToDo.class);
		return  todo;
	}
	

}
