/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.school.managementsystem;

import javax.sql.DataSource;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.builders.WebSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.security.web.util.matcher.AntPathRequestMatcher;

/**
 *
 * @author oreoluwa
 */
@Configuration
@EnableWebSecurity
public class SpringSecurityConfig extends WebSecurityConfigurerAdapter{
    
    
    
        @Autowired
	private PasswordEncoder passwordEncoder;

	@Autowired
	private DataSource dataSource;
 
        @Bean
	public PasswordEncoder passwordEncoder() {
		return new BCryptPasswordEncoder();
	}
        
        
        String users_query = "select username,password, enabled from users where username=?";

	String roles_query = "select username, role from user_roles where username =?";
        
        
        
        @Override
	protected void configure(AuthenticationManagerBuilder auth) throws Exception {
		auth.jdbcAuthentication().dataSource(dataSource)
		.authoritiesByUsernameQuery(users_query).authoritiesByUsernameQuery(roles_query)
				.passwordEncoder(passwordEncoder);

	}
        
        
       

        @Override
	public void configure(WebSecurity web) throws Exception {

	}

	@Override
	protected void configure(HttpSecurity http) throws Exception {
		http.authorizeRequests().antMatchers("/*" , "/index").permitAll()
				.antMatchers("/resources/**").permitAll()
				.antMatchers("/user/**").access("hasRole('ROLE_USER')").anyRequest().authenticated().and().formLogin()
				.loginPage("/")
				.loginProcessingUrl("/signin")
				.defaultSuccessUrl("/welcome",true)
				.failureUrl("/signin?error=true")
				.usernameParameter("username")
				.passwordParameter("password").and()
				.logout().logoutRequestMatcher(new AntPathRequestMatcher("/logout")).logoutSuccessUrl("/index").and()
				.exceptionHandling().accessDeniedPage("/access-denield").and().csrf().disable();
	}
        
        
        
        
    @Bean
    @Override
    public AuthenticationManager authenticationManagerBean() throws Exception        
    {
        return super.authenticationManagerBean();
    }

}
