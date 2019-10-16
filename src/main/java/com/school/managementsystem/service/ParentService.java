/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.school.managementsystem.service;

import com.school.managementsystem.model.ParentModel;
import com.school.managementsystem.model.Student;
import com.school.managementsystem.model.Teacher;
import com.school.managementsystem.model.User;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;
import javax.sql.DataSource;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

/**
 *
 * @author oreoluwa
 */
@Service
public class ParentService implements ParentInterface {

    @Autowired
    DataSource datasource;

    @Autowired
    JdbcTemplate jdbcTemplate;

    @Autowired
    private PasswordEncoder passwordencoder;

    @Override
    public boolean RegsiterParentUser(String firstname,String lastname, String username, String email, String phonenumber, String password) {
        boolean register = false;
        String sql = "insert into users (firstname,lastname,username,email,phonenumber,password) values (?,?,?,?,?,?)";

        String EncryptedPassword = passwordencoder.encode(password);
        int registerUser = jdbcTemplate.update(sql, new Object[]{firstname,lastname,username, email, phonenumber, EncryptedPassword});
        if (registerUser > 0) {
            System.out.println("USER REGISTERED");
            String sql1 = "insert into user_roles (username) values (?)";
            int registerRole = jdbcTemplate.update(sql1, new Object[]{username});
            System.out.println("ROLE ASSIGNED");
            register = true;
        }
        return register;
    }

    
    
    
         class parentMapper implements RowMapper<ParentModel> {
        public ParentModel mapRow(ResultSet rs, int arg1) throws SQLException {
            ParentModel parent = new ParentModel();
             parent.setFirstname(rs.getString("firstname"));
             parent.setLastname(rs.getString("lastname"));
             parent.setUsername(rs.getString("username"));
             parent.setEmail(rs.getString("email"));
             parent.setPhonenumber(rs.getString("phonenumber"));
            return parent;
        }
    }
    
    
         @Override
         public List<ParentModel> getAllParentUsers(){
         String sql = "select firstname,lastname,username,email,phonenumber from users where usertypename = 'parent'";
         List<ParentModel> getAllParents = jdbcTemplate.query(sql, new parentMapper());
         return getAllParents;
         }
         
         
         
         
         
            class studentSearchMapper implements RowMapper<Student> {
        public Student mapRow(ResultSet rs, int arg1) throws SQLException {
            Student student = new Student();
             student.setFirstname(rs.getString("firstname"));
             student.setLastname(rs.getString("lastname"));
             student.setStudentclass(rs.getString("studentclass"));
             student.setAge(rs.getString("age"));
             student.setSex(rs.getString("sex"));
            
            return student;
        }
    }
         
         
        @Override
        public List<Student> searchStudent(String table_name, String search_by, String search_details) {
        String sql = "";
        List<Student> searchMyStudent;
            sql = "SELECT firstname,lastname,sex,age,studentclass FROM " 
                    + table_name + " WHERE " + search_by + " LIKE '%" + search_details + "%'";
      
        System.out.println("sqqq:" + sql);

        searchMyStudent = jdbcTemplate.query(sql, new studentSearchMapper());

        return searchMyStudent.size() > 0 ? searchMyStudent : null;
    }
         
         
        
          class teacherParentMapper implements RowMapper<Teacher> {
        public Teacher mapRow(ResultSet rs, int arg1) throws SQLException {
            Teacher teacher = new Teacher();
             teacher.setFirstname(rs.getString("firstname"));
             teacher.setLastname(rs.getString("lastname"));
             teacher.setClassassigned(rs.getString("classassigned"));
             teacher.setSex(rs.getString("sex"));
             teacher.setPhonenumber(rs.getString("phonenumber"));
            return teacher;
        }
    }
        
          
          
          
          
             class teacherSearchMapper implements RowMapper<Teacher> {
        public Teacher mapRow(ResultSet rs, int arg1) throws SQLException {
            Teacher teacher = new Teacher();
             teacher.setFirstname(rs.getString("firstname"));
             teacher.setLastname(rs.getString("lastname"));
             teacher.setPhonenumber(rs.getString("phonenumber"));
             teacher.setClassassigned(rs.getString("classassigned"));
             teacher.setSex(rs.getString("sex"));
             teacher.setSubjectname(rs.getString("subjectname"));
             teacher.setClassteaching(rs.getString("classteaching"));
             
             return teacher;
        }
    }
          
          
          
          
          
          
        @Override
        public List<Teacher> searchTeacherForParent(String subjectname) {
        String sql = "";
        List<Teacher> searchMyTeacher;
            sql = "SELECT users.firstname,users.lastname,users.phonenumber,users.classassigned,users.sex,"
                    + "tbl_subjects.subjectname,tbl_subjects.classteaching FROM users,tbl_subjects WHERE users.username = tbl_subjects.teacher AND tbl_subjects.subjectname = ?";
      
        System.out.println("sqqq:" + sql);

        searchMyTeacher = jdbcTemplate.query(sql, new Object[]{subjectname}, new teacherSearchMapper());

        return searchMyTeacher.size() > 0 ? searchMyTeacher : null;
    }
        
        
        
        
        @Override
        public List<Teacher> GetAllTeachersForParents(){
        String sql = "select firstname,lastname,phonenumber,classassigned,sex from users where usertypename = 'teacher'";
        List<Teacher> getTeachers = jdbcTemplate.query(sql, new teacherParentMapper());
        return getTeachers;
        }
        
        
        
          
         class teacherParentSubjectMapper implements RowMapper<Teacher> {
        public Teacher mapRow(ResultSet rs, int arg1) throws SQLException {
            Teacher teacher = new Teacher();
             teacher.setSubjectname(rs.getString("subjectname"));
             teacher.setClassteaching(rs.getString("classteaching"));
            return teacher;
        }
         }
        
         @Override
         public String getTeacherUsername(String phonenumber){
         String sql = "select username from users where phonenumber = ?";
         String getUsername = jdbcTemplate.queryForObject(
                    sql, new Object[]{phonenumber}, String.class);
         return getUsername;
         }
        
         
         @Override
         public List<Teacher> GetAllTeacherParentSubjects(String teacher){
         String sql = "select subjectname,classteaching from tbl_subjects where teacher = ?";
         List<Teacher> GetAllTeacherSubject = jdbcTemplate.query(sql, new Object[]{teacher}, new teacherParentSubjectMapper());
         return GetAllTeacherSubject;
         }
         
    
         
         
         
            class studentDetailsMapper implements RowMapper<Student> {
        public Student mapRow(ResultSet rs, int arg1) throws SQLException {
            Student student = new Student();
             student.setAttendance(rs.getString("attendance"));
             student.setDate(rs.getString("date"));
            return student;
        }
    }
            
            
         @Override
         public List<Student>getStudentDetails(String firstname,String lastname){
         String sql = "select attendance,date from tbl_attendance where firstname = ? and lastname = ?";
         List<Student> getStudentdetails = jdbcTemplate.query(sql, new Object[]{firstname,lastname}, new studentDetailsMapper());
         return getStudentdetails;
         }
         
         
         
         @Override
         public boolean SendComplainToAdmin(String username,String complain){
             boolean value = false;
         String sql = "insert into tbl_complain (username,date,complain) values (?,now(),?)";
         int sendcomplain = jdbcTemplate.update(sql, new Object[]{username,complain});
         if(sendcomplain > 0){
         value = true;
         }
         return value;
         }
         
         
         
               class parentComplainMapper implements RowMapper<User> {
        public User mapRow(ResultSet rs, int arg1) throws SQLException {
            User user = new User();
             user.setDate(rs.getString("date"));
             user.setComplain(rs.getString("complain"));
             user.setUsername(rs.getString("username"));
            return user;
        }
    }
               
               
               
               @Override
               public List<User> getParentComplain(){
               String sql = "select username,date,complain from tbl_complain";
               List<User> getComplain = jdbcTemplate.query(sql,new parentComplainMapper());
               return getComplain;
               }
               
               
               
               
                  
            class getMyChildMapper implements RowMapper<Student> {
        public Student mapRow(ResultSet rs, int arg1) throws SQLException {
            Student student = new Student();
             student.setFirstname(rs.getString("firstname"));
             student.setLastname(rs.getString("lastname"));
             student.setAge(rs.getString("age"));
             student.setSex(rs.getString("sex"));
            
            return student;
        }
    }
         
               @Override
               public boolean getMyChild(String firstname,String lastname,String sex,String age,String username){
                   boolean value = false;
               String sql = "select firstname,lastname,sex,age from tbl_students where firstname = ? and lastname = ? and sex = ? and age = ?";
               List<Student> getmychild = jdbcTemplate.query(sql, new Object[]{firstname,lastname,sex,age}, new getMyChildMapper());
               if(!getmychild.isEmpty()){
               String sql1 = "insert into tbl_parentchild (firstname,lastname,sex,age,username) values (?,?,?,?,?)";
               int RegisterChild = jdbcTemplate.update(sql1, new Object[]{firstname,lastname,sex,age,username});
               value = true;
               }
               return value;
               }
         
               @Override
               public List<Student> getMyChildList(String username){
               String sql = "select firstname,lastname,sex,age from tbl_parentchild where username = ?";
               List<Student> myChildren = jdbcTemplate.query(sql, new Object[]{username}, new getMyChildMapper());
               return myChildren;
               }
         
}
