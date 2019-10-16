/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.school.managementsystem.service;

import com.school.managementsystem.model.Student;
import com.school.managementsystem.model.StudentRecords;
import com.school.managementsystem.model.Teacher;
import com.school.managementsystem.model.TimeTable;
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
public class TeacherServiceImpl implements TeacherInterface{
    
    
        @Autowired
        DataSource datasource;
        
        @Autowired
        JdbcTemplate jdbcTemplate;
        
        @Autowired
        PasswordEncoder passwordencoder;
        
        
        @Override
        public boolean CreateTeacher(String firstname,String lastname,String classassigned,String department,String sex,String phonenumber,String username,String password){
            boolean isChanged = false;
            String EncryptedPassword = passwordencoder.encode(password);
           String usertypename = "teacher";
        String sql = "insert into users (firstname,lastname,classassigned,department,sex,phonenumber,username,password,usertypename) values (?,?,?,?,?,?,?,?,?)";
        int CreateTeacher = jdbcTemplate.update(sql, new Object[]{firstname,lastname,classassigned,department,sex,phonenumber,username,EncryptedPassword,usertypename});
        if(CreateTeacher == 1){
            System.out.println("CREATE TEACHER = " + CreateTeacher);
            String sql1 = "insert into user_roles (username) values (?)";
            int registerRole = jdbcTemplate.update(sql1, new Object[]{username});
            System.out.println("ROLE ASSIGNED");
            System.out.println("TEACHER HAS BEEN DROPPED IN DATABASE");
            isChanged = true;
        }
        return isChanged;
        }
        
        
        
        
      class teacherMapper implements RowMapper<Teacher> {
        public Teacher mapRow(ResultSet rs, int arg1) throws SQLException {
            Teacher teacher = new Teacher();
             teacher.setFirstname(rs.getString("firstname"));
             teacher.setLastname(rs.getString("lastname"));
             teacher.setClassassigned(rs.getString("classassigned"));
             teacher.setDepartment(rs.getString("department"));
             teacher.setSex(rs.getString("sex"));
             teacher.setUsername(rs.getString("username"));
             teacher.setPhonenumber(rs.getString("phonenumber"));
            return teacher;
        }
    }
        
        @Override
        public List<Teacher> GetAllTeachers(){
        String sql = "select firstname,lastname,classassigned,department,phonenumber,sex,username from users where usertypename = 'teacher'";
        List<Teacher> getAllTeachers = jdbcTemplate.query(sql, new teacherMapper());
        return getAllTeachers;
        }
        
        @Override
        public String getTeacherClass(String username){
        String sql = "select classassigned from users where username = ?";
        String getClass = jdbcTemplate.queryForObject(
                    sql, new Object[]{username}, String.class);
        return getClass;
        }
        
        @Override
        public int AddNewStudent(String firstname,String lastname,String studentclass,String age,String sex,String classteacher){
            int value = 0;
        String[] subject = {"mathematics","english","french","finearts","economics","biology","civiceducation","geography","history","agriculturalscience"};
        String sql = "insert into tbl_students (firstname,lastname,studentclass,age,sex,classteacher) values (?,?,?,?,?,?)";
        int addNewStudent = jdbcTemplate.update(sql, new Object[]{firstname,lastname,studentclass,age,sex,classteacher});
        if(addNewStudent == 1){
            try{
            System.out.println("NEW STUDENT = " + addNewStudent);
           for(int i = 0; i <= subject.length; i++){
            String sql1 = "insert into tbl_resultrecords (firstname,lastname,sex,subject) value (?,?,?,?)";
            int addStudentNameRecord = jdbcTemplate.update(sql1, new Object[]{firstname,lastname,sex,subject[i]});
            value = 1;
        }
          
        } catch(ArrayIndexOutOfBoundsException A){
           
        }
          
        }
        return value;
        }
        
        
          class studentMapper implements RowMapper<Student> {
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
          public List<Student> GetClassStudents(String studentclass){
          String sql = "select firstname,lastname,studentclass,age,sex from tbl_students where studentclass = ?";
          List<Student> getClassStudents = jdbcTemplate.query(sql, new Object[]{studentclass},new studentMapper());
          return getClassStudents;
          }
        
          
         class studentAttendanceMapper implements RowMapper<Student> {
        public Student mapRow(ResultSet rs, int arg1) throws SQLException {
            Student student = new Student();
            student.setId(rs.getString("id"));
             student.setFirstname(rs.getString("firstname"));
             student.setLastname(rs.getString("lastname"));
             student.setSex(rs.getString("sex"));
              student.setAttendancedate(rs.getString("attendancedate"));
              student.setAttendance(rs.getString("attendance"));
            return student;
        }
    }
          
         
         @Override
         public List<Student> StudentAttendance(String classteacher){
         String sql = "select id,firstname,lastname,sex,attendancedate,attendance from tbl_students where classteacher = ?";
         List<Student> StudentAttendance = jdbcTemplate.query(sql, new Object[]{classteacher}, new studentAttendanceMapper());
         return StudentAttendance;
         }
         
         
         
         @Override
         public int SaveAttendance(String firstname,String lastname,String sex,String attendance,String date,String studentclass,String classteacher){
         String sql = "insert into tbl_attendance (firstname,lastname,sex,attendance,date,class,classteacher) values (?,?,?,?,?,?,?)";
         int SaveAttendance = jdbcTemplate.update(sql, new Object[]{firstname,lastname,sex,attendance,date,studentclass,classteacher});
         if(SaveAttendance > 0){
         
         String attendancedate = "marked";
         String sql1 = "update tbl_students  set attendancedate = ? where firstname = ? and lastname = ?";
         int MarkAttendancedate = jdbcTemplate.update(sql1, new Object[]{attendancedate,firstname,lastname});
         String sql2 = "update tbl_students set attendance = ? where firstname = ? and lastname = ?";
         int Registerattendance = jdbcTemplate.update(sql2, new Object[]{attendance,firstname,lastname});
         }
         return SaveAttendance;
         }
        
         
         
         class teacherSubjectMapper implements RowMapper<Teacher> {
        public Teacher mapRow(ResultSet rs, int arg1) throws SQLException {
            Teacher teacher = new Teacher();
             teacher.setSubjectname(rs.getString("subjectname"));
             teacher.setClassteaching(rs.getString("classteaching"));
             teacher.setDepartment(rs.getString("department"));
            return teacher;
        }
    }
         
         
//         
//         @Override
//         public List<Student> GetAttendanceList(){
//         String sql = "select attendance from tbl_attendance";
//         List<Student> getStudentAttendance = jdbcTemplate.query(sql, new studentMarkAttendanceMapper());
//         return getStudentAttendance;
//         }
//         
         
         
         
         
         
         @Override
         public boolean SaveTeacherSubject(String subjectname,String classteaching,String teacher,String department){
             boolean value = false;
         String sql = "insert into tbl_subjects (subjectname,classteaching,teacher,department) values (?,?,?,?)";
         int RegisterSubject = jdbcTemplate.update(sql, new Object[]{subjectname,classteaching,teacher,department});
         if(RegisterSubject == 1){
         value = true;
         }
         
         return value;
         }
         
         
         @Override
         public List<Teacher> GetAllTeacherSubjects(String teacher){
         String sql = "select subjectname,classteaching,department from tbl_subjects where teacher = ?";
         List<Teacher> GetAllTeacherSubject = jdbcTemplate.query(sql, new Object[]{teacher}, new teacherSubjectMapper());
         return GetAllTeacherSubject;
         }
         
         
         
         @Override
         public boolean TimetableMonday(String details,String teacher){
             boolean value = false;
         String sql = "insert into tbl_timetable (monday,teacher) values (?,?)";
         int CreateTable = jdbcTemplate.update(sql, new Object[]{details,teacher});
         if(CreateTable == 1){
         value = true;
         }
         return value;
         }
         
         
              @Override
         public boolean TimetableTuesday(String details,String teacher){
             boolean value = false;
         String sql = "insert into tbl_timetable (tuesday,teacher) values (?,?)";
         int CreateTable = jdbcTemplate.update(sql, new Object[]{details,teacher});
         if(CreateTable == 1){
         value = true;
         }
         return value;
         }
         
         
         
              @Override
         public boolean TimetableWednesday(String details,String teacher){
             boolean value = false;
         String sql = "insert into tbl_timetable (wednesday,teacher) values (?,?)";
         int CreateTable = jdbcTemplate.update(sql, new Object[]{details,teacher});
         if(CreateTable == 1){
         value = true;
         }
         return value;
         }
         
         
         
         
              @Override
         public boolean TimetableThursday(String details,String teacher){
             boolean value = false;
         String sql = "insert into tbl_timetable (thursday,teacher) values (?,?)";
         int CreateTable = jdbcTemplate.update(sql, new Object[]{details,teacher});
         if(CreateTable == 1){
         value = true;
         }
         return value;
         }
         
         
         
         
         
              @Override
         public boolean TimetableFriday(String details,String teacher){
             boolean value = false;
         String sql = "insert into tbl_timetable (friday,teacher) values (?,?)";
         int CreateTable = jdbcTemplate.update(sql, new Object[]{details,teacher});
         if(CreateTable == 1){
         value = true;
         }
         return value;
         }
         
         
         
            
         class timeTableMapper implements RowMapper<TimeTable> {
        public TimeTable mapRow(ResultSet rs, int arg1) throws SQLException {
            TimeTable table = new TimeTable();
             table.setMonday(rs.getString("monday"));
             table.setTuesday(rs.getString("tuesday"));
             table.setWednesday(rs.getString("wednesday"));
             table.setThursday(rs.getString("thursday"));
             table.setFriday(rs.getString("friday"));
            return table;
        }
    }
         
         
         
         @Override
         public List<TimeTable> getTimeTable(String teacher){
         String sql = "select monday,tuesday,wednesday,thursday,friday from tbl_timetable where teacher = ?";
         List timetable = jdbcTemplate.query(sql, new Object[]{teacher}, new timeTableMapper());
         return timetable;
         }
         
         
         
         @Override
         public boolean RefreshAttendance(){
             boolean value = false;
             
         String sql = "update tbl_students set attendancedate = 'unmarked'";
         int RefreshAttButton = jdbcTemplate.update(sql);
         if (RefreshAttButton > 0){
         value = true;
         }
         return value;
         }
         
         
         @Override
       public boolean UpdateResult(String assessment,String result,String firstname,String lastname,String subject){
           boolean value = false;
       String sql = "update tbl_resultrecords set " + assessment + " = ? where firstname = ? and lastname = ? and subject = ?";
       int UpdateResult = jdbcTemplate.update(sql, new Object[]{result,firstname,lastname,subject});
       if(UpdateResult > 0){
           System.out.println("UPDATERESULT = " + UpdateResult);
           System.out.println("ASSESSMENT VALUE = " + assessment);
           System.out.println("RESULT VALUE = " + result);
       value = true;
       }
       return value;
       }
         
       
       
       
        class studentrecordMapper implements RowMapper<StudentRecords> {
        public StudentRecords mapRow(ResultSet rs, int arg1) throws SQLException {
            StudentRecords record = new StudentRecords();
             record.setAssessmentone(rs.getString("assessmentone"));
             record.setAssessmenttwo(rs.getString("assessmenttwo"));
             record.setAssessmentthree(rs.getString("assessmentthree"));
             record.setFinalexam(rs.getString("finalexam"));
             record.setTotal(rs.getString("total"));
             record.setGrade(rs.getString("grade"));
             record.setSubject(rs.getString("subject"));
             return record;
        }
    }

       
        @Override
        public List<StudentRecords> getStudentRecords(String firstname,String lastname){
        String sql = "select assessmentone,assessmenttwo,assessmentthree,finalexam,total,grade,subject from tbl_resultrecords where firstname = ? and lastname = ?";
        List<StudentRecords> getStudentRecord = jdbcTemplate.query(sql, new Object[]{firstname,lastname}, new studentrecordMapper());
        return getStudentRecord;
        
        }
       
         
}
