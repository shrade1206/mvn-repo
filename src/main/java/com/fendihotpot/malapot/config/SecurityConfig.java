package com.fendihotpot.malapot.config;


import java.io.PrintWriter;

import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;

@EnableWebSecurity
public class SecurityConfig extends WebSecurityConfigurerAdapter{

	@Override
	protected void configure(HttpSecurity http) throws Exception {
		http.authorizeRequests()
			.antMatchers("/cms").permitAll()
			.antMatchers("/backend/**").hasRole("admin1");
		
		http.csrf().disable()
			.formLogin()
			.loginPage("/cms")
			.loginProcessingUrl("/login")
			.defaultSuccessUrl("/backend/sales")
			.successHandler((req,res,e) -> {
				res.setContentType("text/html;charset=utf-8");
				PrintWriter out = res.getWriter();
				out.println("<script type=\"text/javascript\">");
				out.println("alert('成功登入');");
				out.println("location='/shabushabu/backend/sales';");
				out.println("</script>");
				out.flush();
				out.close();
            })
			.failureHandler((req,res,e) -> {
				res.setContentType("text/html;charset=utf-8");
				PrintWriter out = res.getWriter();
				out.println("<script type=\"text/javascript\">");
				out.println("alert('帳號密碼輸入錯誤');");
				out.println("location='cms';");
				out.println("</script>");
				out.flush();
				out.close();
            })
			.and()
			.logout()
			.logoutSuccessUrl("/cms")
			.logoutSuccessHandler((req,res,e) -> {
				res.setContentType("text/html;charset=utf-8");
				PrintWriter out = res.getWriter();
				out.println("<script type=\"text/javascript\">");
				out.println("alert('您已登出<奉鍋行後台>');");
				out.println("location='cms';");
				out.println("</script>");
				out.flush();
				out.close();
			});
	}

	@Override
	protected void configure(AuthenticationManagerBuilder auth) throws Exception {
		auth.inMemoryAuthentication().passwordEncoder(new BCryptPasswordEncoder())
			.withUser("admin").password(new BCryptPasswordEncoder().encode("admin")).roles("admin1");
	}
	
}
