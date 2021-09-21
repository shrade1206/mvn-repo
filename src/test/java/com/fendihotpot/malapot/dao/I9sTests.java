package com.fendihotpot.malapot.dao;
import java.util.List;
import java.util.Optional;

import javax.persistence.PersistenceContext;

import org.hibernate.Session;
import org.junit.jupiter.api.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.junit4.SpringRunner;
import org.springframework.transaction.annotation.Transactional;

import com.fendihotpot.malapot.domain.I9sBean;



@RunWith(SpringRunner.class)
@SpringBootTest
public class I9sTests {

	@PersistenceContext
	private Session session;
	
	@Test
	@Transactional
	public void test() {
		List<?> result = session.createNativeQuery("select * from ingredients").list();
		for (Object obj : result) {
			Object[] array = (Object[]) obj;
			System.out.println(array[0] + ":" + array[1] + ":" + array[2]+ ":" + array[3] + ":" + array[4]);
		}
		
	}
	

}
