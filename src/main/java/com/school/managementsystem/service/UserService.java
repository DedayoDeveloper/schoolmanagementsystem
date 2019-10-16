/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.school.managementsystem.service;

import com.school.managementsystem.model.User;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.List;
import javax.sql.DataSource;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.PreparedStatementCreator;
import org.springframework.stereotype.Service;

/**
 *
 * @author oreoluwa
 */
@Service
public class UserService implements UserInterface{
    
    @Autowired
    DataSource datasource;
    
    @Autowired
    JdbcTemplate jdbcTemplate;
    
    
    
    
    
    
    
    
    
       @Override
        public String getUserRoles(String username) {
        String sql = "SELECT role from user_roles WHERE username = ?";
        String getRole = "";

        try {
            getRole = (String) jdbcTemplate.queryForObject(
                    sql, new Object[]{username}, String.class);
        } catch (DataAccessException ex) {
            System.out.println("error:" + ex.getMessage());
        }
        return getRole;

    }
        
        
        
            @Override
    public List<User> getUserByRole(String userrole) {
        String sql = "SELECT tbl_pages.id,tbl_usertypes.usertypename,tbl_pages.label,tbl_pages.urlmapping,tbl_pages.labelicon,tbl_pages.labeltitle "
                + "FROM tbl_usertypes LEFT JOIN tbl_usertype_page_mappings "
                + "ON tbl_usertypes.id = tbl_usertype_page_mappings.usertypeid "
                + "LEFT JOIN tbl_pages on tbl_usertype_page_mappings.pageid = tbl_pages.id "
                + "WHERE usertypename=?";
        final PreparedStatementCreator psc = (final Connection connection) -> {
            final PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, userrole);
            return ps;
        };

        return jdbcTemplate.query(psc, (ResultSet rs, int rownumber) -> {
            User user = new User();
            user.setUsertypename(rs.getString("usertypename"));
            user.setUrlmapping(rs.getString("urlmapping"));
            user.setLabel(rs.getString("label"));
            user.setPageid(rs.getString("id"));
            user.setLabelicon(rs.getString("labelicon"));
            user.setLabeltitle(rs.getString("labeltitle"));

            return user;
        });

    }
    
    @Override
    public String SelectUsertypeName(String username){
        
    String sql = "select usertypename from users where username = ?";
    String getUserTypeName = (String)jdbcTemplate.queryForObject(
                    sql, new Object[]{username}, String.class);
    return getUserTypeName;
    }
    
}
