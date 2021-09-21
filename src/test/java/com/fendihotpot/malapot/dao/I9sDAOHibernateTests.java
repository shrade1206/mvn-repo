package com.fendihotpot.malapot.dao;

import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.transaction.annotation.Transactional;

import com.fendihotpot.malapot.domain.I9sBean;
import com.fendihotpot.malapot.i9sDao.I9sDAO;

@SpringBootTest
public class I9sDAOHibernateTests {
	@Autowired
	private I9sDAO i9sDAO;
	@Test
	@Transactional
	public void testSelect() {
		I9sBean pork = i9sDAO.select(1);
		System.out.println("pork="+pork);
	}
}
