package com.fendihotpot.malapot.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class PathController {

	@RequestMapping(
			path = "/",
			method = RequestMethod.GET
			)
	public String index() {
		return "/index";
	}
	
	@RequestMapping(path= "/takeout")
	public String takeout() {
		return "/pages/takeout";
	}
	
	@RequestMapping(path= "/order")
	public String order() {
		return "/pages/order";
	}
	
	@RequestMapping(path= "/fmenu")
	public String fmenu() {
		return "/pages/fmenu";
	}
	
	@RequestMapping(path= "/location")
	public String location() {
		return "/pages/location";
	}

	@RequestMapping(path= "/backend/mealadd")
	public String mealadd() {
		return "/backend/mealadd";
	}
	
	@RequestMapping(path= "/backend/i9s/{currentPage}")
	public String i9s() {
		return "/backend/i9s";
	}
	
	@RequestMapping(path= "/backend/i9sInsert")
	public String i9sInsert() {
		return "/backend/i9sInsert";
	}
	
	@RequestMapping(path= "/backend/i9sUpdate")
	public String i9sUpdate() {
		return "/backend/i9sUpdate";
	}
	
	@RequestMapping(path= "/backend/type01")
	public String type01() {
		return "/backend/type01";
	}
	
	@RequestMapping(path= "/cms")
	public String cms() {
		return "/cms";
	}
	
	@RequestMapping(path= {"/pages/menu"})
	public String menu() {
		return "/pages/menu";
	}
	
	@RequestMapping(path = {"/contact"})
	public String contact() {
		return "/pages/contact";
	}

	@RequestMapping(path = {"/reservation"})
	public String reservation() {
		return "/pages/reservation";
	}
	
	@RequestMapping(path = {"/login"})
	public String login() {
		return "/pages/login";
	}
	
	@RequestMapping(path= "/backend/sales")
	public String sales() {
		return "/backend/salesfigure";
	}
	
	@RequestMapping(path="/backend/table")
	public String table() {
		return "/backend/table";
	}
}
