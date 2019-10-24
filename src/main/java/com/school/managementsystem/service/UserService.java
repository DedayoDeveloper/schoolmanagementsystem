/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.school.managementsystem.service;

import com.school.managementsystem.model.Classess;
import com.school.managementsystem.model.Message;
import com.school.managementsystem.model.NonTeaching;
import com.school.managementsystem.model.Student;
import com.school.managementsystem.model.Subject;
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
    
     
     
              class messagesMapper implements RowMapper<Message> {
        public Message mapRow(ResultSet rs, int arg1) throws SQLException {
            Message message = new Message();
             message.setId(rs.getString("id"));
            message.setUsername(rs.getString("username"));
            message.setMessage(rs.getString("message"));
            message.setTeacher(rs.getString("teacher"));
            message.setDatesent(rs.getString("datesent"));
            return message;
        }
    }
    
     @Override
     public String getMessagesSentForTeacher(String teacherusername){
     String sql = "select count(*) from tbl_message where teacher = ?";
     String getCount = jdbcTemplate.queryForObject(
                sql, new Object[]{teacherusername}, String.class);
     return getCount;
     }
     
     
     
     
     
       @Override
     public String getCommentsSentForTeacher(String teacherusername){
     String sql = "select count(*) from tbl_comments where aboutwho = ?";
     String getCount = jdbcTemplate.queryForObject(
                sql, new Object[]{teacherusername}, String.class);
     return getCount;
     }
    
     
     
     
     
     
     @Override
     public boolean UpdateTeacherAttendance(){
     boolean value = false;
     String sql = "update users set attendancemark = 'unmarked'";
     int update = jdbcTemplate.update(sql);
     if(update > 0){
     value = true;
     }
     return value;
     }
     
     
     @Override
     public boolean RegisterNonTeaching(String firstname,String lastname,String department,String position,String age,String datejoined,String sex){
     boolean value = false;
     String sql = "insert into tbl_nonteaching (firstname,lastname,department,position,age,datejoined,sex) value (?,?,?,?,?,?,?)";
     int CreateStaff = jdbcTemplate.update(sql, new Object[]{firstname,lastname,department,position,age,datejoined,sex});
     if(CreateStaff > 0){
     value = true;
     }
     return value;
     }
     
     
       class nonteachingMapper implements RowMapper<NonTeaching> {

        public NonTeaching mapRow(ResultSet rs, int arg1) throws SQLException {
            NonTeaching nonteaching = new NonTeaching();
            nonteaching.setId(rs.getString("id"));
            nonteaching.setFirstname(rs.getString("firstname"));
            nonteaching.setLastname(rs.getString("lastname"));
            nonteaching.setDepartment(rs.getString("department"));
            nonteaching.setPosition(rs.getString("position"));
            nonteaching.setAge(rs.getString("age"));
            nonteaching.setDatejoined(rs.getString("datejoined"));
            nonteaching.setSex(rs.getString("sex"));
            
            return nonteaching;
        }
    }
     
       
       @Override
       public List<NonTeaching> getAllNonTeachingStaff(String limit){
       String sql = "select id,firstname,lastname,department,position,age,datejoined,sex from tbl_nonteaching order by datejoined " + limit;
       List<NonTeaching> getAllStaff = jdbcTemplate.query(sql, new nonteachingMapper());
       return getAllStaff;
       
       }
     
     
       
       
       
              @Override
     public int[] deleteNonTeachingStaffForAdmin(String array[]){
     String sql = "DELETE FROM tbl_nonteaching WHERE id =";
     
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
    
     
     
     
     
     @Override
     public String getTeacherForSubject(String subjectname,String classteaching){
     String sql = "select teacher from tbl_subjects where subjectname = ? and classteaching = ?";
     String getTeacherTeaching = jdbcTemplate.queryForObject(
                sql, new Object[]{subjectname,classteaching}, String.class);
     return getTeacherTeaching;
     }
     
     
     
     @Override
     public boolean UpdateAboveAverage(String subject,String classteaching,String teacher){
     boolean value = false;
     String sql = "update tbl_subjects set aboveaverage = aboveaverage + 1 where subjectname = ? and classteaching = ? and teacher =?";
     int update = jdbcTemplate.update(sql, new Object[]{subject,classteaching,teacher});
     if(update > 0){
     value = true;
     }
     return value;
     }
     
     
     
        @Override
     public boolean UpadetBelowAverage(String subject,String classteaching,String teacher){
     boolean value = false;
     String sql = "update tbl_subjects set belowaverage = belowaverage + 1 where subjectname = ? and classteaching = ? and teacher =?";
     int update = jdbcTemplate.update(sql, new Object[]{subject,classteaching,teacher});
     if(update > 0){
     value = true;
     }
     return value;
     }
     
     
        @Override
        public List<Subject> getAverageForTeacher(String username){
        String sql = "select subjectname,classteaching,aboveaverage,belowaverage from tbl_subjects where teacher = ?";
        List<Subject> getAverage = jdbcTemplate.query(sql, new Object[]{username}, new subjectMapper());
        return getAverage;
        }
     
     
        class subjectMapper implements RowMapper<Subject> {

        public Subject mapRow(ResultSet rs, int arg1) throws SQLException {
            Subject subject = new Subject();
            subject.setSubjectname(rs.getString("subjectname"));
            subject.setClassteaching(rs.getString("classteaching"));
            subject.setAboveaverage(rs.getString("aboveaverage"));
            subject.setBelowaverage(rs.getString("belowaverage"));
            return subject;
        }   }
     
     
        
          
        
        
        
        @Override
        public boolean CreateSchoolClass(String classname){
            boolean value = false;
        String sql = "insert into tbl_class (classname) values (?)";
        int createclass = jdbcTemplate.update(sql, new Object[]{classname});
        if (createclass > 0){
        value = true;
        }
        return value;
        }
      
        
        
          class classMapper implements RowMapper<Classess> {

        public Classess mapRow(ResultSet rs, int arg1) throws SQLException {
            Classess classess = new Classess();
            classess.setId(rs.getString("id"));
            classess.setClassname(rs.getString("classname"));
            return classess;
        }   }
     
     
          
          @Override
          public List<Classess> getAllSchoolClassess(){
          String sql = "select id,classname from tbl_class";
          List<Classess> getclass = jdbcTemplate.query(sql, new classMapper());
          return getclass;
           }
     
     
          
          
          
          
                  @Override
     public int[] deleteClassForAdmin(String array[]){
     String sql = "DELETE FROM tbl_class WHERE id =";
     
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
    
     
     @Override
   public String getClassTeacherForAdmin(String classassigned){
   String sql = "select username from users where classassigned = ?";
   String classteacher = jdbcTemplate.queryForObject(
                sql, new Object[]{classassigned}, String.class);
   return classteacher;
   }
          
   
     class studentMapper implements RowMapper<Student> {
        public Student mapRow(ResultSet rs, int arg1) throws SQLException {
             Student student = new Student();
            student.setId(rs.getString("id"));
            student.setFirstname(rs.getString("firstname"));
            student.setLastname(rs.getString("lastname"));
            student.setSex(rs.getString("sex"));
        
            return student;
        }
    }
   
   
   
   @Override
   public List<Student> getClassStudentsForAdmin(String studentclass){
   String sql = "select id,firstname,lastname,sex from tbl_students where studentclass = ?";
   List<Student> getStudentClass = jdbcTemplate.query(sql, new Object[]{studentclass}, new studentMapper());
   return getStudentClass;
   }
   
   
   
          
}
