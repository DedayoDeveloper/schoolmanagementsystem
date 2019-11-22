/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.school.managementsystem;

import org.springframework.context.annotation.Configuration;
import org.springframework.web.context.AbstractContextLoaderInitializer;
import org.springframework.web.context.WebApplicationContext;
import org.springframework.web.context.support.AnnotationConfigWebApplicationContext;

/**
 *
 * @author oreoluwa
 */
@Configuration
public class MyWebInitializer extends AbstractContextLoaderInitializer{

      
    protected Class<?>[] getRootConfigClasses() {
        return new Class[]{SpringSecurityConfig.class};
    }

    
    protected Class<?>[] getServletConfigClasses() {
        
        return new Class[]{WebConfig.class};
    }

   
    protected String[] getServletMappings() {
        
        return new String[]{"/*"};
    }

    @Override
    protected WebApplicationContext createRootApplicationContext() {
       AnnotationConfigWebApplicationContext rootContext = new AnnotationConfigWebApplicationContext();
       rootContext.register(WebConfig.class);
       return rootContext;
    }
    
}
