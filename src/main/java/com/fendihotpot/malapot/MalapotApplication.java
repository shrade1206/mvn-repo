package com.fendihotpot.malapot;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.transaction.annotation.EnableTransactionManagement;

@SpringBootApplication
@EnableTransactionManagement
public class MalapotApplication {

	public static void main(String[] args) {
		SpringApplication.run(MalapotApplication.class, args);
	}

}
