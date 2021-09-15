package com.fendihotpot.malapot.controller;

import java.util.List;

import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.CookieValue;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fendihotpot.malapot.domain.OrderListBean;
import com.fendihotpot.malapot.domain.ReservationBean;
import com.fendihotpot.malapot.service.ReservationService;
import com.sun.istack.localization.LocalizableMessageFactory.ResourceBundleSupplier;


@Controller
public class ReservationController {

	@Autowired
	private ReservationService reservationService;
	
	// 新增訂單
	@RequestMapping(path= {"/pages/contact.controller" } ,method = RequestMethod.POST, consumes="application/json")
	@ResponseBody
	public String onceReservation(@RequestBody ReservationBean bean) {
		System.out.println(bean);
		reservationService.newReservation(bean);

		ReservationBean success = reservationService.newReservation(bean);
		if(success != null ) {
			return "1"; // 成功
		}else {
			return "0"; // 失敗
		}
	
	}

	
	// 取出會員最後一筆資訊
	@RequestMapping(path = {"/pages/login.controller"}, method= RequestMethod.GET)
	public String memberReservation (@CookieValue(name="user") String user, Model model) {
		JSONObject userInfo = new JSONObject(user);
		String uid = (String)userInfo.get("uid");
		System.out.println("uid="+uid);
		ReservationBean bean = reservationService.hasHistory(uid);
		System.out.println("bean="+bean);
		if(bean != null) {
			model.addAttribute("rName",bean.getrName());
			model.addAttribute("mobile",bean.getMobile());
			model.addAttribute("email",bean.getEmail());
			return "/pages/contact";
		}
		return "/pages/contact";
	}
	
	
	// (後台)查詢訂位
	@RequestMapping(path= {"/cms/table.controller/page/{currentPage}"}, method = RequestMethod.GET)
	public String reservationInfo(@PathVariable Integer currentPage, @RequestParam(required = false) String brench, Model model) {
		Integer totalPage = reservationService.totalPage(brench);
		List<ReservationBean> tables = null;
		if(brench != null) {
			ReservationBean bean = new ReservationBean();
			bean.setBrench(brench);
			tables = reservationService.select(bean, currentPage);
		}else {
			tables = reservationService.select(null, currentPage);
		}
		model.addAttribute("tables",tables);
		model.addAttribute("currentPage", currentPage);
		model.addAttribute("totalPage", totalPage);
		model.addAttribute("brench", brench);
		
		return "/backend/table";
	}
	
	// (後台)刪除訂單
	@RequestMapping(path= {"/table/{rId}"}, method = RequestMethod.DELETE)
	@ResponseBody
	public String deleteOrders(@PathVariable(name = "rId") Integer rId) {
		// AJAX處理
		ReservationBean bean = new ReservationBean();
		bean.setrId(rId);
		String delete = "";
		try {
			boolean result = reservationService.deleteReservation(rId);
			if (result) {
				delete = "刪除成功！";
			} else {
				delete = "刪除失敗！";
			}
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println(e.toString());
		}
		return delete;
	}
	
}
