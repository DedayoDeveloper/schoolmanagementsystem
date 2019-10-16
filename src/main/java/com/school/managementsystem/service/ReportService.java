/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.school.managementsystem.service;

import java.util.List;
import java.util.Map;
import javax.sql.DataSource;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Service;

/**
 *
 * @author oreoluwa
 */
@Service
public class ReportService {
    
     @Autowired
    DataSource dataSource;

    @Autowired
    JdbcTemplate jdbcTemplate;
    
    public List<Map<String, Object>> getRecords(String sql, int noOfCols, String[] placeHolders) {
        List<Map<String, Object>> reports = null;
        
        try{
           reports = jdbcTemplate.queryForList(sql, (Object[]) placeHolders);
        }catch(DataAccessException ee){
            System.out.println("Exception on insertion:"+ee.getMessage());
            
        }
        
        return reports;
    }
    
    
//    
    public List<Map<String, Object>> getSearchedRecords(String sql, int noOfCols) {
        List<Map<String, Object>> reports = null;
        
        try{
           reports = jdbcTemplate.queryForList(sql);
        }catch(DataAccessException ee){
            System.out.println("Exception on insertion:"+ee.getMessage());
            
        }
        
        return reports;
    }
    
    
}
