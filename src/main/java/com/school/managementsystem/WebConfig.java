/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.school.managementsystem;

import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.jdbc.datasource.DriverManagerDataSource;
import org.springframework.web.servlet.ViewResolver;
import org.springframework.web.servlet.config.annotation.EnableWebMvc;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;
import org.springframework.web.servlet.view.InternalResourceViewResolver;
import org.springframework.web.servlet.view.JstlView;

/**
 *
 * @author oreoluwa
 */
@EnableWebMvc
@Configuration
@ComponentScan("com.school.managementsystem")
public class WebConfig implements WebMvcConfigurer{
    
    
    @Bean
    public ViewResolver internalResourceViewResolver() {
        InternalResourceViewResolver bean = new InternalResourceViewResolver();
        bean.setViewClass(JstlView.class);
        bean.setPrefix("/WEB-INF/jsp/");
        bean.setSuffix(".jsp");
        return bean;
    }
    
//      @Bean
//    public DriverManagerDataSource getDataSource() {
//        DriverManagerDataSource dataSourceBuilder = new DriverManagerDataSource();
//
//        dataSourceBuilder.setDriverClassName("com.mysql.cj.jdbc.Driver");
//        dataSourceBuilder.setUrl("jdbc:mysql://localhost:3306/sms?useSSL=false");
////            dataSourceBuilder.getConnection("jdbc:mysql://localhost:3306/sms","root@localhost");
//        dataSourceBuilder.setUsername("root");
//        dataSourceBuilder.setPassword("");
//        return dataSourceBuilder;
//
//    }

   
    
    @Override
    public void addResourceHandlers(ResourceHandlerRegistry registry) 
{
        registry.addResourceHandler("/resources/**").addResourceLocations("/resources/");
        registry.addResourceHandler("/js/**").addResourceLocations("classpath:/static/js/");
        registry.addResourceHandler("/css/**").addResourceLocations("classpath:/static/css/");
}
    
    
    
}
