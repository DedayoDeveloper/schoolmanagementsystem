package com.school.managementsystem;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.autoconfigure.jdbc.DataSourceAutoConfiguration;
import org.springframework.boot.autoconfigure.jdbc.XADataSourceAutoConfiguration;
import org.springframework.boot.builder.SpringApplicationBuilder;
import org.springframework.boot.web.servlet.support.SpringBootServletInitializer;

@SpringBootApplication
public class ManagementsystemApplication extends SpringBootServletInitializer{

    
    
    
    
        @Override
    protected SpringApplicationBuilder configure(SpringApplicationBuilder application) {
        return application.sources(ManagementsystemApplication.class);
    }
    
    
    
    
    
	public static void main(String[] args) {
		SpringApplication.run(ManagementsystemApplication.class, args);
	}

        
        
        
        
        
        
        
}
