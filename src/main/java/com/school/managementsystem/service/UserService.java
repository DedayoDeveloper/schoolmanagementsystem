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
import java.sql.SQLException;
import java.util.List;
import javax.sql.DataSource;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.PreparedStatementCreator;
import org.springframework.jdbc.core.RowMapper;
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
    
    
    
    
        
      class adminUserMapper implements RowMapper<User> {
        public User mapRow(ResultSet rs, int arg1) throws SQLException {
             User user = new User();
            user.setId(rs.getString("id"));
            user.setFirstname(rs.getString("firstname"));
            user.setLastname(rs.getString("lastname"));
            user.setClassassigned(rs.getString("classassigned"));
            user.setDepartment(rs.getString("department"));
            user.setPhonenumber(rs.getString("phonenumber"));
            user.setSex(rs.getString("sex"));
            user.setUsername(rs.getString("username"));
            return user;
        }
    }
    
    
    
         @Override
        public List<User> searchTeacherForAdmin(String username) {
        String sql = "";
        List<User> searchMyStudent;
            sql = "select id,firstname,lastname,classassigned,phonenumber,department,sex,username from users where username = ? and usertypename = 'teacher'";
      
        System.out.println("sqqq:" + sql);

        searchMyStudent = jdbcTemplate.query(sql, new Object[]{username},new adminUserMapper());

        return searchMyStudent.size() > 0 ? searchMyStudent : null;
    }
    
    
    
        
        
             @Override
     public int[] deleteTeacherForAdmin(String array[]){
     String sql = "DELETE FROM users WHERE id =";
     
        String query[] = new String[array.length];
        StringBuilder sb = new StringBuilder();
        for (int i = 0; i < array.length; i++) {

            sb.append(sql).append("");
            sb.append("'").append(array[i]).append("'");
            query[i] = sb.toString();
            System.out.println("sqllll:" + sb.toString());
            sb.setLength(0);
        }
      int[] result = jdbcTemplate.batchUpdate(query);
        System.out.println("");

        System.out.println("deleted:" + result.length);

        return result;
     }
    
    
    
}
