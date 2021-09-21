package com.fendihotpot.malapot.reservationDAO;

import java.util.List;

import com.fendihotpot.malapot.domain.ReservationBean;

public interface ReservationDAO {

	public ReservationBean select(String uId);

	public ReservationBean insert(ReservationBean bean);
	
	public abstract List<ReservationBean> selectAll(Integer currentPage, Integer pageSize);

	public abstract boolean delete(Integer rId);
	
	public abstract List<ReservationBean> selectOne(String brench, Integer currentPage, Integer pageSize);
	
	// 查詢訂單總比數
	public abstract Integer totalRows();
	// 查詢各分店訂單總比數
	Integer totalRowsByBranch(String brench);
	
}
