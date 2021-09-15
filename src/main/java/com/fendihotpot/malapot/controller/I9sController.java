package com.fendihotpot.malapot.controller;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

import javax.persistence.PersistenceContext;
import javax.servlet.http.HttpSession;

import org.hibernate.Session;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.fendihotpot.malapot.domain.I9sBean;
import com.fendihotpot.malapot.domain.TypeBean;
import com.fendihotpot.malapot.service.I9sService;

@Controller
public class I9sController {

	@Autowired
	private I9sService i9sService;

	@PersistenceContext
	private Session session;

//	@RequestMapping(path = { "/pages/i9s.controller" })
//	public String select(Model model) {
//		List<I9sBean> result = i9sService.select(null);
//		model.addAttribute("select", result);
//		return "/backend/i9s";
//	}
	
	@RequestMapping(path = { "/pages/i9s/{currentPage}" })
	public String select(@PathVariable Integer currentPage, Model model) {
		Integer totalPage = i9sService.totalPage();
		List<I9sBean> result = i9sService.select(null,currentPage);
		List<String> nameType= new ArrayList<String>();
		
		for(I9sBean type1:result) {
			Integer i9sType = type1.getI9sType();
			TypeBean typeBean = session.get(TypeBean.class, i9sType);
			String name = typeBean.getName();
			nameType.add(name);
		}
		
		model.addAttribute("nameType",nameType);
		model.addAttribute("select", result);	
		model.addAttribute("currentPage",currentPage);
		model.addAttribute("totalPage", totalPage);
		return "/backend/i9s";
	}
		
	
	@RequestMapping(path = { "/pages/i9sUpdate/{id}" })
	public String selectThis(Model model,@PathVariable Integer id) {
		I9sBean bean = session.get(I9sBean.class, id);
		model.addAttribute("selectThis", bean);
		return "/backend/i9sUpdate";
	}
	
	@ModelAttribute
	public void addimage(Model model,HttpSession session) {
		String path = session.getServletContext().getRealPath("/upload/picture");
			model.addAttribute("path",path);
	}

	@PostMapping(path = { "/pages/i9sInsert" })
	@ResponseBody
	public I9sBean insert(I9sBean bean,MultipartFile multipart,Model model) {
		String path = (String)model.getAttribute("path");
		String fileName = UUID.randomUUID().toString() + multipart.getOriginalFilename().substring(multipart.getOriginalFilename().lastIndexOf('.'));
		bean.setI9sPicture(fileName);
		
		try {
			multipart.transferTo(new File(path,fileName));
		} catch (IOException e) {
			e.printStackTrace();
		} 
		I9sBean result = i9sService.insert(bean);
		return result;
	}


	@RequestMapping(path = { "/pages/i9sDate" })
	@ResponseBody
	public I9sBean update(I9sBean bean) {
		I9sBean result = i9sService.update(bean);
		System.out.println(result);
		return result;
	}

	@RequestMapping(path = { "/pages/i9sDelete" })
	@ResponseBody
	public boolean delete(I9sBean bean) {
		boolean result = i9sService.delete(bean);
		return result;
	}
	


}
