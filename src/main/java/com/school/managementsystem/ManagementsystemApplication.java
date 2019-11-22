package com.school.managementsystem;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.builder.SpringApplicationBuilder;
import org.springframework.boot.web.servlet.support.SpringBootServletInitializer;
import org.springframework.context.annotation.Bean;
import org.springframework.mobile.device.view.LiteDeviceDelegatingViewResolver;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.web.servlet.view.InternalResourceViewResolver;

@SpringBootApplication
public class ManagementsystemApplication extends SpringBootServletInitializer{

    
 
    
        @Override
    protected SpringApplicationBuilder configure(SpringApplicationBuilder application) {
        return application.sources(ManagementsystemApplication.class);
    }
    
    
	public static void main(String[] args) {
		SpringApplication.run(ManagementsystemApplication.class, args);
	}

        
        
         @Bean
	public PasswordEncoder passwordEncoder() {
		return new BCryptPasswordEncoder();
	}
        
        
        
    @Bean
    public LiteDeviceDelegatingViewResolver liteDeviceAwareViewResolver() {
        InternalResourceViewResolver delegate = new InternalResourceViewResolver();
        delegate.setPrefix("/WEB-INF/jsp/");
        delegate.setSuffix(".jsp");
        LiteDeviceDelegatingViewResolver resolver = new LiteDeviceDelegatingViewResolver(delegate);
        resolver.setMobilePrefix("mobile/");
        resolver.setTabletPrefix("tablet/");
        resolver.setOrder(1);
        return resolver;
    }
        

    
        
        
        
}
