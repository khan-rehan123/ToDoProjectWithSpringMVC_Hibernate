package com.simple;

import java.util.Date;
import java.util.List;

import javax.servlet.ServletContext;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.dao.ToDoDao;
import com.entity.ToDo;

@org.springframework.stereotype.Controller
public class Controller {
	
	
	 @Autowired ServletContext context;
	 
	@Autowired
	ToDoDao toDoDao;
	
	@RequestMapping("/index")
	public String name(Model m) {
		String str="home";
		m.addAttribute("page",str);
		
		List<ToDo> list1=this.toDoDao.getAll();
		m.addAttribute("todo",list1);
		
		return "index";
	}
	@RequestMapping("/add")
	public String addTodo(Model m) {
		ToDo t = new ToDo();
		m.addAttribute("page","add");
		m.addAttribute("todo",t);
		
		return "index";
	}
	@RequestMapping(path ="/savaTodo",method = RequestMethod.POST)
	public String savaToDo(@ModelAttribute ("todo") ToDo t,Model m ) {
//		m.addAttribute("page","home");
		System.out.println(t);
		t.setTodoDate(new Date());
		this.toDoDao.sava(t);
		
		
		m.addAttribute("msg","Successfully added......");
		
		return "index";
	}

}
