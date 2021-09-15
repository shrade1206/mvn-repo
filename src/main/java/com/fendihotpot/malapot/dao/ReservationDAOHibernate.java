package com.fendihotpot.malapot.dao;

import java.util.List;

import javax.persistence.PersistenceContext;

import org.hibernate.Session;
import org.springframework.stereotype.Repository;

import com.fendihotpot.malapot.domain.ReservationBean;

@Repository
public class ReservationDAOHibernate implements ReservationDAO {

	@PersistenceContext
	private Session session;

	public Session getSession() {
		return session;
	}

	// 查詢會員資料
	@Override
	public ReservationBean select(String uid) {
		if (uid != null) {
			String hql = "FROM ReservationBean WHERE uid=:uid ORDER BY id DESC";
			System.out.println("ttt="+this.getSession().createQuery(hql, ReservationBean.class).setParameter("uid", uid).setMaxResults(1)
					.uniqueResult());
			return this.getSession().createQuery(hql, ReservationBean.class).setParameter("uid", uid).setMaxResults(1)
					.uniqueResult();
		}
		return null;
	}

	// 依分店查詢
	@Override
	public List<ReservationBean> selectOne(String brench, Integer currentPage, Integer pageSize) {
		if (brench != null) {
			String hql = "FROM ReservationBean WHERE brench=:brench ORDER BY id DESC";
			List<ReservationBean> beans = session.createQuery(hql, ReservationBean.class)
					.setParameter("brench", brench)
					.setFirstResult((currentPage - 1) * pageSize)
					.setMaxResults(pageSize)
					.list();
			return beans;
		}
		return null;
	}

	// 查詢所有訂單
	@Override
	public List<ReservationBean> selectAll(Integer currentPage, Integer pageSize) {
		List<ReservationBean> beans = session
				.createQuery("from ReservationBean ORDER BY ID DESC", ReservationBean.class)
				.setFirstResult((currentPage - 1) * pageSize)
				.setMaxResults(pageSize)
				.list();
		return beans;
	}

	// 新增訂單
	@Override
	public ReservationBean insert(ReservationBean bean) {
		if (bean != null) {
			this.getSession().save(bean);
			return bean;
		}
		return null;
	}

	// 刪除訂單
	@Override
	public boolean delete(Integer rId) {
		if (rId != null && !rId.equals(0)) {
			ReservationBean bean = this.getSession().get(ReservationBean.class, rId);
			if (bean != null) {
				this.getSession().delete(bean);
				return true;
			}
		}
		return false;
	}
	
	// 查詢總比數
	@Override
	public Integer totalRows() {
		String hql = "SELECT COUNT(r.id) FROM ReservationBean as r";
		return session.createQuery(hql, Long.class).uniqueResult().intValue();
	}
	@Override
	public Integer totalRowsByBranch(String brench) {
		String hql = "SELECT COUNT(r.id) FROM ReservationBean as r WHERE r.brench=:brench";
		return session.createQuery(hql, Long.class)
				.setParameter("brench", brench)
				.uniqueResult()
				.intValue();
	}

}
