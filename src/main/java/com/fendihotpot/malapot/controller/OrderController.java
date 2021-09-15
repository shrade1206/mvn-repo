package com.fendihotpot.malapot.controller;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Set;

import org.json.JSONArray;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.CookieValue;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fendihotpot.malapot.domain.I9sBean;
import com.fendihotpot.malapot.domain.OrderItemBean;
import com.fendihotpot.malapot.domain.OrderListBean;
import com.fendihotpot.malapot.domain.SetMealBean;
import com.fendihotpot.malapot.service.I9sService;
import com.fendihotpot.malapot.service.OrderService;
import com.fendihotpot.malapot.service.SetMealService;

@Controller
public class OrderController {
	@Autowired
	private OrderService orderService;
	@Autowired
	private I9sService i9sService;
	@Autowired
	private SetMealService setMealService;
// 轉訂單
	@PostMapping(path = { "/orders" })
	@ResponseBody
	public String newOrder(@CookieValue(name = "cart") String cart,
			@CookieValue(name = "user") String user,
			@RequestBody String data) {
		JSONObject takeOut = new JSONObject(data);
		String pickupTime = (String) takeOut.get("pickupTime");
		String branch = (String) takeOut.get("branch");
		// 取餐時間
		Date orderDate = null;
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy/MM/dd HH:mm");
		try {
			orderDate = sdf.parse(pickupTime);
		} catch (ParseException e) {
			e.printStackTrace();
		}
		
		// 客戶手機
		JSONObject userInfo = new JSONObject(user);
		String userMobile = (String) userInfo.get("mobile");
		String userEmail = (String) userInfo.get("email");
		
		// 購物車
		JSONArray shopCart = new JSONArray(cart);
		JSONArray cartList = (JSONArray) shopCart.get(0);
		JSONObject cartTotal = (JSONObject) shopCart.get(1);
		Integer totalAmount = (Integer) cartTotal.getInt("totalAmount");
		for (int i = 0; i < cartList.length(); i++) {
			System.out.println(cartList.get(i));
		}
		// 設定訂單的屬性值
		OrderListBean orderList = new OrderListBean();
		orderList.setUserMobile(userMobile);
		orderList.setUserEmail(userEmail);
		orderList.setTakeoutStore(branch);
		orderList.setTotalAmount(totalAmount);
		orderList.setOrderDate(orderDate);
		// 把訂單品項加入List
		List<OrderItemBean> orderItems = new ArrayList<OrderItemBean>();
		System.out.println(cartList.length());
		OrderItemBean orderItem = null;
		for (int i = 0; i < cartList.length(); i++) {
			orderItem = new OrderItemBean();
			JSONObject cartItem = (JSONObject) cartList.get(i);
			Integer itemQty = (Integer) cartItem.get("qty");
			orderItem.setOrderQty(itemQty);
			Integer itemId = (Integer) cartItem.get("itemId");
			Integer typeId = (Integer) cartItem.get("typeId");
			if (typeId.equals(2)) {
				// 如果是套餐就setSetId(itemId)
				orderItem.setSetId(itemId);
				Integer soupId = (Integer) cartItem.get("soupId");
				// 把鍋底也加進去
				orderItem.setItemId(soupId);
				System.out.println("orderItem=" + orderItem);
			} else {
				// 其他就setItemId(itemId)
				orderItem.setItemId(itemId);
			}
			orderItems.add(orderItem);
		}
		try {
			boolean result = orderService.insert(orderList, orderItems);
			if (result) {
				return "下單成功！";
			}
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println(e.toString());
		}
		return "下單失敗！";
	}

// 用戶查詢所有歷史訂單
	@GetMapping(path = { "/orders/page{currentPage}" })
	public void historyOrders(@PathVariable Integer currentPage, @CookieValue(name = "user") String user, Model model) {
		JSONObject userInfo = new JSONObject(user);
		String userMobile = (String) userInfo.get("mobile");
		// 建立Map放 歷史訂單 & 訂單品項
		Map<String, Object> orders = new HashMap<String, Object>();
		model.addAttribute("orders", orders);
		OrderListBean orderList = new OrderListBean();
		orderList.setUserMobile(userMobile);
		List<OrderListBean> historyOrders = orderService.select(orderList, currentPage);
		orders.put("historyOrders", historyOrders);
		List<Set<OrderItemBean>> orderDetails = new ArrayList<Set<OrderItemBean>>();
		for (OrderListBean historyOrder : historyOrders) {
			Set<OrderItemBean> orderItems = historyOrder.getOrderItems();
			orderDetails.add(orderItems);
		}
		// return 歷史訂單頁面
	}

// 用戶查詢單筆訂單詳細內容
	@GetMapping(path = { "/orders/{orderId}" })
	public void historyOrder(@PathVariable(name = "orderId") Integer orderId, @CookieValue(name = "user") String userId,
			Model model) {
		// 建立Map放 歷史訂單 & 訂單品項
		Map<String, Object> orders = new HashMap<String, Object>();
		model.addAttribute("orders", orders);
		OrderListBean orderList = new OrderListBean();
		orderList.setId(orderId);
		List<OrderListBean> historyOrders = orderService.select(orderList, null);
		orders.put("historyOrder", historyOrders);
		List<Set<OrderItemBean>> orderDetails = new ArrayList<Set<OrderItemBean>>();
		for (OrderListBean historyOrder : historyOrders) {
			Set<OrderItemBean> orderItems = historyOrder.getOrderItems();
			orderDetails.add(orderItems);
		}
		// return 單筆訂單詳細資訊
	}

// 後台刪除單筆訂單
	@DeleteMapping(path = { "/orders/{orderId}" })
	@ResponseBody
	public String deleteOrders(@PathVariable(name = "orderId") Integer orderId) {
		// AJAX處理
		// 刪除訂單
		OrderListBean orderList = new OrderListBean();
		orderList.setId(orderId);
		String delete = "";
		try {
			boolean result = orderService.delete(orderList, null);
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

// 購物清單內容
	@GetMapping(path = { "/cartlist" })
	public String checkCart(@CookieValue(name = "cart") String cart, Model model) {
		// 購物車
		JSONArray shopCart = new JSONArray(cart);
		JSONArray cartList = (JSONArray) shopCart.get(0);
		for (int i = 0; i < cartList.length(); i++) {
			System.out.println(cartList.get(i));
		}
		JSONObject cartTotal = (JSONObject) shopCart.get(1);
		Map<String, List<?>> cartDetail = new HashMap<String, List<?>>();
		List<List<?>> i9sList = new ArrayList<List<?>>();
		List<List<?>> setMealList = new ArrayList<List<?>>();
		List<Integer> total = new ArrayList<Integer>();
		total.add((Integer) cartTotal.getInt("totalAmount"));
		total.add((Integer) cartTotal.getInt("totalKcal"));
		model.addAttribute("cartDetail", cartDetail);
		cartDetail.put("i9sList", i9sList);
		cartDetail.put("setMealList", setMealList);
		cartDetail.put("total", total);
		for (int i = 0; i < cartList.length(); i++) {
			JSONObject cartItem = (JSONObject) cartList.get(i);
			Integer itemQty = (Integer) cartItem.get("qty");
			Integer itemId = (Integer) cartItem.get("itemId");
			Integer typeId = (Integer) cartItem.get("typeId");
			if (typeId.equals(2)) {
				// 如果是套餐就setSetId(itemId)
				List<Object> setBean = new ArrayList<Object>();
				SetMealBean setMealBean = new SetMealBean();
				setMealBean.setId(itemId);
				SetMealBean setMeal = setMealService.select(setMealBean).get(0);
				setBean.add(setMeal);
				// 還要再把鍋底也放進來
				Integer soupId = (Integer) cartItem.get("soupId");
				I9sBean i9sBean = new I9sBean();
				i9sBean.setI9sId(soupId);
				String soupName = i9sService.select(i9sBean, null).get(0).getI9sName();
				setBean.add(soupName);
				setBean.add(itemQty);
				setMealList.add(setBean);
			} else {
				// 其他就setItemId(itemId)
				List<Object> i9sSet = new ArrayList<Object>();
				I9sBean i9sBean = new I9sBean();
				i9sBean.setI9sId(itemId);
				I9sBean i9s = i9sService.select(i9sBean, null).get(0);
				i9sSet.add(i9s);
				i9sSet.add(itemQty);
				i9sList.add(i9sSet);
			}
		}
		return "/pages/cart";
	}

// 購物車AJAX
	@GetMapping(path = { "/cartdetail" })
	@ResponseBody
	public Map<String, List<?>> refreshCart(@CookieValue(name = "cart", required = false) String cart) {
		if (cart != null) {
			// 購物車
			JSONArray shopCart = new JSONArray(cart);
			JSONArray cartList = (JSONArray) shopCart.get(0);
			for (int i = 0; i < cartList.length(); i++) {
				System.out.println(cartList.get(i));
			}
			Map<String, List<?>> cartDetail = new HashMap<String, List<?>>();
			List<List<?>> i9sList = new ArrayList<List<?>>();
			List<List<?>> setMealList = new ArrayList<List<?>>();
			cartDetail.put("i9sList", i9sList);
			cartDetail.put("setMealList", setMealList);
			for (int i = 0; i < cartList.length(); i++) {
				JSONObject cartItem = (JSONObject) cartList.get(i);
				Integer itemQty = (Integer) cartItem.get("qty");
				Integer itemId = (Integer) cartItem.get("itemId");
				Integer typeId = (Integer) cartItem.get("typeId");
				if (typeId.equals(2)) {
					// 如果是套餐就setSetId(itemId)
					List<Object> setBean = new ArrayList<Object>();
					SetMealBean setMealBean = new SetMealBean();
					setMealBean.setId(itemId);
					SetMealBean setMeal = setMealService.select(setMealBean).get(0);
					setBean.add(setMeal.getName());
					setBean.add(itemQty);
					setMealList.add(setBean);
				} else {
					// 其他就setItemId(itemId)
					List<Object> i9sSet = new ArrayList<Object>();
					I9sBean i9sBean = new I9sBean();
					i9sBean.setI9sId(itemId);
					I9sBean i9s = i9sService.select(i9sBean, null).get(0);
					i9sSet.add(i9s.getI9sName());
					i9sSet.add(itemQty);
					i9sList.add(i9sSet);
				}
			}
			return cartDetail;
		} else {
			return null;
		}
	}

// 後台查詢所有訂單 {還有依分店查詢}
	@GetMapping(path = { "/cms/orders/page/{currentPage}" })
	public String cmsOrders(@PathVariable Integer currentPage,@RequestParam(required = false) String branch, Model model) {
		Integer totalPage = orderService.totalPage(branch);
		List<OrderListBean> orderLists = null;
		if (branch!=null) {
			OrderListBean orderList = new OrderListBean();
			orderList.setTakeoutStore(branch);
			orderLists = orderService.select(orderList, currentPage);
		} else {
			orderLists = orderService.select(null, currentPage);
		}
		model.addAttribute("orderList", orderLists);
		model.addAttribute("currentPage", currentPage);
		model.addAttribute("totalPage", totalPage);
		model.addAttribute("branch", branch);
		return "/backend/order";
	}

// 後台查詢單筆訂單詳細內容
	@GetMapping(path = { "/cms/orders/{orderId}" })
	public String cmsOrderDetail(@PathVariable Integer orderId, Model model) {
		Map<String, List<Object>> orderDetails = new HashMap<String, List<Object>>();
		Map<String, List<Integer>> orderQtys = new HashMap<String, List<Integer>>();
		List<Object> orderSetMeal = new ArrayList<>();
		List<Integer> orderSetMealQty = new ArrayList<>();
		List<Object> orderI9s = new ArrayList<>();
		List<Integer> orderI9sQty = new ArrayList<>();
		orderDetails.put("orderSetMeal", orderSetMeal);
		orderDetails.put("orderI9s", orderI9s);
		orderQtys.put("orderSetMealQty", orderSetMealQty);
		orderQtys.put("orderI9sQty", orderI9sQty);
		OrderListBean select = new OrderListBean();
		select.setId(orderId);
		OrderListBean orderList = orderService.select(select, null).get(0);
		Set<OrderItemBean> orderItems = orderList.getOrderItems();
		for (OrderItemBean orderItem : orderItems) {
			if (orderItem.getSetId() != null) {
				SetMealBean setMealBean = orderItem.getSetMealBeans();
				orderSetMeal.add(setMealBean);
				orderSetMealQty.add(orderItem.getOrderQty());
			} else {
				I9sBean i9sBean = orderItem.getI9sBean();
				orderI9s.add(i9sBean);
				orderI9sQty.add(orderItem.getOrderQty());
			}
		}
		model.addAttribute("orderList", orderList);
		model.addAttribute("orderDetails", orderDetails);
		model.addAttribute("orderQtys", orderQtys);
		return "/backend/orderdetail";
	}

// 後台查詢業績 --> 折線圖用
	@GetMapping(path = { "/cms/salesfigures" })
	@ResponseBody
	public Map<String, List<Map<String, Object>>> sales(String branch) {
		return orderService.salesFigure(branch);
	}
// 後台查詢各分店業績 --> 圓餅圖用
	@GetMapping(path = { "/cms/salesforbranches" })
	@ResponseBody
	public List<Object[]> salesForBranches() {
		return orderService.salesForBranches();
	}
}
