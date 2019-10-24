/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.school.managementsystem.service;

import com.school.managementsystem.model.Message;
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
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
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
    
//    @Autowired
//     private JavaMailSender mailSender;
//    
//  
//
//      @Autowired
//    private SimpleMailMessage alertMailMessage;
//    public void setMailSender(JavaMailSender mailSender) {  
//        this.mailSender = mailSender;  
//    }
//    
//    
//    
//    
//    @Override
//    public void SendEmail(String toAddress, String fromAddress, String subject, String msgBody) {
// 
//		SimpleMailMessage mailmsg = new SimpleMailMessage();
//		mailmsg.setFrom(fromAddress);
//		mailmsg.setTo(toAddress);
//		mailmsg.setSubject(subject);
//		mailmsg.setText(msgBody);
//		mailSender.send(mailmsg);
//	}
    
    

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
            parent.setId(rs.getInt("id"));
             parent.setFirstname(rs.getString("firstname"));
             parent.setLastname(rs.getString("lastname"));
             parent.setUsername(rs.getString("username"));
             parent.setEmail(rs.getString("email"));
             parent.setPhonenumber(rs.getString("phonenumber"));
            return parent;
        }
    }
    
    
         @Override
         public List<ParentModel> getAllParentUsers(String limit){
         String sql = "select id,firstname,lastname,username,email,phonenumber from users where usertypename = 'parent' " + limit;
         List<ParentModel> getAllParents = jdbcTemplate.query(sql, new parentMapper());
         return getAllParents;
         }
         
         
            @Override
         public List<ParentModel> getAllParentUsersForProfile(String username){
         String sql = "select id,firstname,lastname,username,email,phonenumber from users where usertypename = 'parent' and username = ?";
         List<ParentModel> getAllParents = jdbcTemplate.query(sql, new Object[]{username}, new parentMapper());
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
             teacher.setUsername(rs.getString("username"));
             
             return teacher;
        }
    }
          
          
          
          
          
          
        @Override
        public List<Teacher> searchTeacherForParent(String subjectname) {
        String sql = "";
        List<Teacher> searchMyTeacher;
            sql = "SELECT users.firstname,users.lastname,users.phonenumber,users.classassigned,users.sex,users.username,"
                    + "tbl_subjects.subjectname,tbl_subjects.classteaching FROM users,tbl_subjects WHERE users.username = tbl_subjects.teacher AND tbl_subjects.subjectname = ?";
      
        System.out.println("sqqq:" + sql);

        searchMyTeacher = jdbcTemplate.query(sql, new Object[]{subjectname}, new teacherSearchMapper());

        return searchMyTeacher.size() > 0 ? searchMyTeacher : null;
    }
        
        
        
        
        @Override
        public List<Teacher> GetAllTeachersForParents(){
        String sql = "select id,firstname,lastname,phonenumber,classassigned,sex from users where usertypename = 'teacher'";
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
               
               
               public int SendMessageToTeacher(String username,String message,String teacher){
               String sql = "insert into tbl_message (username,message,teacher,datesent) values (?,?,?,now())";
               int MessageTeacher = jdbcTemplate.update(sql, new Object[]{username,message,teacher});
              
               return MessageTeacher;
               
               }
               
               
               @Override
               public String getTeacherName(String firstname,String lastname){
               String sql = "select username from users where firstname = ? and lastname = ?";
                   System.out.println(sql);
               String getTeachername = (String) jdbcTemplate.queryForObject(sql, new Object[]{firstname,lastname}, String.class);
                   System.out.println("TEACHER NAME = " + getTeachername);
               return getTeachername;
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
            student.setId(rs.getString("id"));
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
               String sql = "select id,firstname,lastname,sex,age from tbl_students where firstname = ? and lastname = ? and sex = ? and age = ?";
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
               String sql = "select id,firstname,lastname,sex,age from tbl_parentchild where username = ?";
               List<Student> myChildren = jdbcTemplate.query(sql, new Object[]{username}, new getMyChildMapper());
               return myChildren;
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
               public List<Message> getAllMessagesSentByParent(String username){
               String sql = "select id,username,message,teacher,datesent from tbl_message where username = ?";
               List<Message> getMessages = jdbcTemplate.query(sql, new Object[]{username},new messagesMapper());
               return getMessages;
               }
               
               
               
               
         @Override
     public int[] deleteStudentForParent(String array[]){
     String sql = "DELETE FROM tbl_parentchild WHERE id =";
     
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
     public boolean UpdateParentProfile(String firstname,String lastname,String email,String phonenumber,String name){
         boolean value = false;
     String sql = "update users set firstname = ?,lastname = ?,email = ?,phonenumber = ? where username = ?";
     int updateProfile = jdbcTemplate.update(sql, new Object[]{firstname,lastname,email,phonenumber,name});
     if(updateProfile > 0){
     value = true;
     }
     return value;
     }
     
     
     
     
     
             @Override
     public int[] deleteParentForAdmin(String array[]){
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
