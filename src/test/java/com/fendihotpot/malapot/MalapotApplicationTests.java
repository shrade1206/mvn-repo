package com.fendihotpot.malapot;

import javax.persistence.PersistenceContext;

import org.hibernate.Session;
import org.junit.jupiter.api.Test;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.transaction.annotation.Transactional;

@SpringBootTest
class MalapotApplicationTests {

	@PersistenceContext
	private Session session;
	
	@Test
	void contextLoads() {
	}
	
	@Test
	@Transactional
	void sessionTest() {
		Object[] product = (Object[])session.createNativeQuery("select * from product where id=1").uniqueResult();
		System.out.println("product="+product[0]+":"+product[1]);
	}

}
