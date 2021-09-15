package com.fendihotpot.malapot.service;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.fendihotpot.malapot.dao.ReservationDAO;
import com.fendihotpot.malapot.domain.ReservationBean;

@Service
@Transactional
public class ReservationService {

	@Autowired
	private ReservationDAO reservationDAO;
	
	private final Integer pageSize = 10;

	// 查詢會員歷史訂位紀錄
	public ReservationBean hasHistory(String uid) {
		if (uid != null) {		
			ReservationBean history = reservationDAO.select(uid);
			System.out.println("history="+history);
			return history;
		}
		return null;
	}
	
	// 依分店或全部查詢
	public List<ReservationBean> select(ReservationBean bean, Integer currentPage){
		List<ReservationBean> result = null;
		if(bean != null) {
			result = reservationDAO.selectOne(bean.getBrench(), currentPage, this.pageSize);
		}else {
			result = reservationDAO.selectAll(currentPage, this.pageSize);
		}
		return result;
	}
	
	public Integer totalPage(String brench) {
		Integer result = null;
		if (brench!=null && brench.length()>0) {
			result = (reservationDAO.totalRowsByBranch(brench)+this.pageSize-1)/this.pageSize;
		} else {
			result = (reservationDAO.totalRows()+this.pageSize-1)/this.pageSize;
		}
		return result;
	}
	
	// 新增訂單
	public ReservationBean newReservation(ReservationBean bean) {
		if (bean != null) {
			return reservationDAO.insert(bean);
		}
		return null;
	}

	// 刪除訂單
	public boolean deleteReservation(Integer rId) {
		boolean result = false;
		if (rId != null) {
			result = reservationDAO.delete(rId);
		}
		return result;
	}
}