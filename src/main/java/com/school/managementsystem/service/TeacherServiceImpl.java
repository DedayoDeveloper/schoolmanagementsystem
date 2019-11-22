/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.school.managementsystem.service;

import com.school.managementsystem.model.Message;
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
public class TeacherServiceImpl implements TeacherInterface {

    @Autowired
    DataSource datasource;

    @Autowired
    JdbcTemplate jdbcTemplate;

    @Autowired
    PasswordEncoder passwordencoder;

    @Override
    public boolean CreateTeacher(String firstname, String lastname, String classassigned, String department, String sex, String phonenumber, String username, String password) {
        boolean isChanged = false;
        String EncryptedPassword = passwordencoder.encode(password);
        String usertypename = "teacher";
        String sql = "insert into users (firstname,lastname,classassigned,department,sex,phonenumber,username,password,usertypename) values (?,?,?,?,?,?,?,?,?)";
        int CreateTeacher = jdbcTemplate.update(sql, new Object[]{firstname, lastname, classassigned, department, sex, phonenumber, username, EncryptedPassword, usertypename});
        if (CreateTeacher == 1) {
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
            teacher.setId(rs.getString("id"));
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
    public List<Teacher> GetAllTeachers(String limit) {
        String sql = "select id,firstname,lastname,classassigned,department,phonenumber,sex,username from users where usertypename = 'teacher' " + limit;
        List<Teacher> getAllTeachers = jdbcTemplate.query(sql, new teacherMapper());
        return getAllTeachers;
    }

    @Override
    public String getTeacherClass(String username) {
        String sql = "select classassigned from users where username = ?";
        String getClass = jdbcTemplate.queryForObject(
                sql, new Object[]{username}, String.class);
        return getClass;
    }

    @Override
    public int AddNewStudent(String firstname, String lastname, String studentclass, String age, String sex, String classteacher) {
        int value = 0;
        String[] subject = {"mathematics", "english", "french", "finearts", "economics", "biology", "civiceducation", "geography", "history", "agriculturalscience"};
        String sql = "insert into tbl_students (firstname,lastname,studentclass,age,sex,classteacher) values (?,?,?,?,?,?)";
        int addNewStudent = jdbcTemplate.update(sql, new Object[]{firstname, lastname, studentclass, age, sex, classteacher});
        if (addNewStudent == 1) {
            try {
                System.out.println("NEW STUDENT = " + addNewStudent);
                for (int i = 0; i <= subject.length; i++) {
                    String sql1 = "insert into tbl_resultrecords (firstname,lastname,sex,subject) value (?,?,?,?)";
                    int addStudentNameRecord = jdbcTemplate.update(sql1, new Object[]{firstname, lastname, sex, subject[i]});
                    value = 1;
                }

            } catch (ArrayIndexOutOfBoundsException A) {

            }

        }
        return value;
    }

    @Override
    public List<Student> searchStudentForTeacherClass(String firstname) {
        String sql = "";
        List<Student> searchMyStudent;
        sql = "SELECT id,firstname,lastname,sex,age,studentclass FROM tbl_students WHERE firstname = ?";

        System.out.println("sqqq:" + sql);

        searchMyStudent = jdbcTemplate.query(sql, new Object[]{firstname}, new studentMapper());

        return searchMyStudent.size() > 0 ? searchMyStudent : null;
    }

    @Override
    public List<Student> searchStudentForTeacherClassAttendance(String firstname) {
        String sql = "";
        List<Student> searchMyStudent;
        sql = "select id,firstname,lastname,sex,attendancedate,attendance from tbl_students where firstname = ?";

        System.out.println("sqqq:" + sql);

        searchMyStudent = jdbcTemplate.query(sql, new Object[]{firstname}, new studentAttendanceMapper());

        return searchMyStudent.size() > 0 ? searchMyStudent : null;
    }

    @Override
    public List<Student> searchStudentForTeacherClassRecord(String firstname) {
        String sql = "";
        List<Student> searchMyStudent;
        sql = "select id,firstname,lastname,sex from tbl_students where firstname = ?";

        System.out.println("sqqq:" + sql);

        searchMyStudent = jdbcTemplate.query(sql, new Object[]{firstname}, new studentRecordingMapper());

        return searchMyStudent.size() > 0 ? searchMyStudent : null;
    }

    class studentRecordingMapper implements RowMapper<Student> {

        public Student mapRow(ResultSet rs, int arg1) throws SQLException {
            Student student = new Student();
            student.setId(rs.getString("id"));
            student.setFirstname(rs.getString("firstname"));
            student.setLastname(rs.getString("lastname"));
            student.setSex(rs.getString("sex"));

            return student;
        }
    }

    class studentMapper implements RowMapper<Student> {

        public Student mapRow(ResultSet rs, int arg1) throws SQLException {
            Student student = new Student();
            student.setId(rs.getString("id"));
            student.setFirstname(rs.getString("firstname"));
            student.setLastname(rs.getString("lastname"));
            student.setStudentclass(rs.getString("studentclass"));
            student.setAge(rs.getString("age"));
            student.setSex(rs.getString("sex"));

            return student;
        }
    }

    @Override
    public List<Student> GetClassStudents(String studentclass, String limit) {
        String sql = "select id,firstname,lastname,studentclass,age,sex from tbl_students where studentclass = ? " + limit;
        List<Student> getClassStudents = jdbcTemplate.query(sql, new Object[]{studentclass}, new studentMapper());
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
    public List<Student> StudentAttendance(String classteacher, String limit) {
        String sql = "select id,firstname,lastname,sex,attendancedate,attendance from tbl_students where classteacher = ? " + limit;
        List<Student> StudentAttendance = jdbcTemplate.query(sql, new Object[]{classteacher}, new studentAttendanceMapper());
        return StudentAttendance;
    }

    @Override
    public int SaveAttendance(String firstname, String lastname, String sex, String attendance, String date, String studentclass, String classteacher) {
        String sql = "insert into tbl_attendance (firstname,lastname,sex,attendance,date,class,classteacher) values (?,?,?,?,?,?,?)";
        int SaveAttendance = jdbcTemplate.update(sql, new Object[]{firstname, lastname, sex, attendance, date, studentclass, classteacher});
        if (SaveAttendance > 0) {

            String attendancedate = "marked";
            String sql1 = "update tbl_students  set attendancedate = ? where firstname = ? and lastname = ?";
            int MarkAttendancedate = jdbcTemplate.update(sql1, new Object[]{attendancedate, firstname, lastname});
            String sql2 = "update tbl_students set attendance = ? where firstname = ? and lastname = ?";
            int Registerattendance = jdbcTemplate.update(sql2, new Object[]{attendance, firstname, lastname});
        }
        return SaveAttendance;
    }

    class teacherSubjectMapper implements RowMapper<Teacher> {

        public Teacher mapRow(ResultSet rs, int arg1) throws SQLException {
            Teacher teacher = new Teacher();
            teacher.setId(rs.getString("id"));
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
    public boolean SaveTeacherSubject(String subjectname, String classteaching, String teacher, String department) {
        boolean value = false;
        String sql = "insert into tbl_subjects (subjectname,classteaching,teacher,department) values (?,?,?,?)";
        int RegisterSubject = jdbcTemplate.update(sql, new Object[]{subjectname, classteaching, teacher, department});
        if (RegisterSubject == 1) {
            value = true;
        }

        return value;
    }

    @Override
    public List<Teacher> GetAllTeacherSubjects(String teacher) {
        String sql = "select id,subjectname,classteaching,department from tbl_subjects where teacher = ?";
        List<Teacher> GetAllTeacherSubject = jdbcTemplate.query(sql, new Object[]{teacher}, new teacherSubjectMapper());
        return GetAllTeacherSubject;
    }

    @Override
    public boolean TimetableMonday(String details, String teacher) {
        boolean value = false;
        String sql = "insert into tbl_timetable (monday,teacher) values (?,?)";
        int CreateTable = jdbcTemplate.update(sql, new Object[]{details, teacher});
        if (CreateTable == 1) {
            value = true;
        }
        return value;
    }

    @Override
    public boolean TimetableTuesday(String details, String teacher) {
        boolean value = false;
        String sql = "insert into tbl_timetable (tuesday,teacher) values (?,?)";
        int CreateTable = jdbcTemplate.update(sql, new Object[]{details, teacher});
        if (CreateTable == 1) {
            value = true;
        }
        return value;
    }

    @Override
    public boolean TimetableWednesday(String details, String teacher) {
        boolean value = false;
        String sql = "insert into tbl_timetable (wednesday,teacher) values (?,?)";
        int CreateTable = jdbcTemplate.update(sql, new Object[]{details, teacher});
        if (CreateTable == 1) {
            value = true;
        }
        return value;
    }

    @Override
    public boolean TimetableThursday(String details, String teacher) {
        boolean value = false;
        String sql = "insert into tbl_timetable (thursday,teacher) values (?,?)";
        int CreateTable = jdbcTemplate.update(sql, new Object[]{details, teacher});
        if (CreateTable == 1) {
            value = true;
        }
        return value;
    }

    @Override
    public boolean TimetableFriday(String details, String teacher) {
        boolean value = false;
        String sql = "insert into tbl_timetable (friday,teacher) values (?,?)";
        int CreateTable = jdbcTemplate.update(sql, new Object[]{details, teacher});
        if (CreateTable == 1) {
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
    public List<TimeTable> getTimeTable(String teacher) {
        String sql = "select monday,tuesday,wednesday,thursday,friday from tbl_timetable where teacher = ?";
        List timetable = jdbcTemplate.query(sql, new Object[]{teacher}, new timeTableMapper());
        return timetable;
    }

    @Override
    public boolean RefreshAttendance() {
        boolean value = false;

        String sql = "update tbl_students set attendancedate = 'unmarked'";
        int RefreshAttButton = jdbcTemplate.update(sql);
        if (RefreshAttButton > 0) {
            value = true;
        }
        return value;
    }

    @Override
    public boolean UpdateResult(String assessment, String result, String firstname, String lastname, String subject) {
        boolean value = false;
        String sql = "update tbl_resultrecords set " + assessment + " = ? where firstname = ? and lastname = ? and subject = ?";
        int UpdateResult = jdbcTemplate.update(sql, new Object[]{result, firstname, lastname, subject});
        if (UpdateResult > 0) {
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
    public List<StudentRecords> getStudentRecords(String firstname, String lastname) {
        String sql = "select assessmentone,assessmenttwo,assessmentthree,finalexam,total,grade,subject from tbl_resultrecords where firstname = ? and lastname = ?";
        List<StudentRecords> getStudentRecord = jdbcTemplate.query(sql, new Object[]{firstname, lastname}, new studentrecordMapper());
        return getStudentRecord;

    }

    @Override
    public int[] deleteStudent(String array[]) {
        String sql = "DELETE FROM tbl_students WHERE id =";

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
    public int[] deleteSubject(String array[]) {
        String sql = "DELETE FROM tbl_subjects WHERE id =";

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
    public List<Message> getAllMessagesSentByParent() {
        String sql = "select id,username,message,teacher,datesent from tbl_message where complain = 'received'";
        List<Message> getMessages = jdbcTemplate.query(sql, new messagesMapper());
        return getMessages;
    }

    @Override
    public boolean MarkTeacherAttendance(String firstname, String lastname, String sex, String attendance, String username) {
        boolean value = false;
        String sql = "insert into tbl_teacherattendance (firstname,lastname,sex,attendance,username,date) values (?,?,?,?,?,now())";
        System.out.println(sql);
        int markattendance = jdbcTemplate.update(sql, new Object[]{firstname, lastname, sex, attendance, username});
        if (markattendance > 0) {
            String sql1 = "update users set attendancemark = 'marked' where firstname = ? and lastname = ? and username = ?";
            int updateattendance = jdbcTemplate.update(sql1, new Object[]{firstname,lastname,username});
            value = true;
        }
        return value;
    }

    class teacherAttendanceMapper implements RowMapper<Teacher> {

        public Teacher mapRow(ResultSet rs, int arg1) throws SQLException {
            Teacher teacher = new Teacher();
            teacher.setId(rs.getString("id"));
            teacher.setFirstname(rs.getString("firstname"));
            teacher.setLastname(rs.getString("lastname"));
//             teacher.setClassassigned(rs.getString("classassigned"));
//             teacher.setDepartment(rs.getString("department"));
            teacher.setSex(rs.getString("sex"));
            teacher.setUsername(rs.getString("username"));
//             teacher.setPhonenumber(rs.getString("phonenumber"));
             teacher.setAttendancemark(rs.getString("attendancemark"));
//             teacher.setAttendance(rs.getString("attendance"));
            return teacher;
        }
    }

    @Override
    public List<Teacher> getAllTeachersForAttendance(String limit) {
        String sql = "select id,firstname,lastname,sex,username,attendancemark from users where usertypename = 'teacher' " + limit;
        List<Teacher> getAllTeachers = jdbcTemplate.query(sql, new teacherAttendanceMapper());
        return getAllTeachers;
    }

    @Override
    public List<Teacher> searchTeacherForAttendance(String username) {
        String sql = "";
        List<Teacher> searchMyTeacher;
        sql = "select id,firstname,lastname,sex,username,attendancemark from users where username = ? and usertypename = 'teacher'";

        System.out.println("sqqq:" + sql);

        searchMyTeacher = jdbcTemplate.query(sql, new Object[]{username}, new teacherAttendanceMapper());

        return searchMyTeacher.size() > 0 ? searchMyTeacher : null;
    }

//                @Override
//        public List<Teacher> GetAllTeachersForAttendance(String limit){
//        String sql = "select users.id,users.firstname,users.lastname,users.classassigned,users.department,users.phonenumber,users.sex,users.username,tbl_teacherattendance.attendance from users,tbl_teacherattendance where users.usertypename = 'teacher' "  + limit;
//        List<Teacher> getAllTeachers = jdbcTemplate.query(sql, new teacherAttendanceMapper());
//        return getAllTeachers;
//        }
    @Override
    public String SelectAttendanceCount(String username) {
        String sql = "select count(*) from tbl_teacherattendance where attendance = 'present' and username = ?";
        String count = jdbcTemplate.queryForObject(
                sql, new Object[]{username}, String.class);
        System.out.println("COUNT = " + count);
        return count;
    }

    @Override
    public String SelectAttendanceCountForAbsent(String username) {
        String sql = "select count(*) from tbl_teacherattendance where attendance = 'absent' and username = ?";
        String count = jdbcTemplate.queryForObject(
                sql, new Object[]{username}, String.class);
        System.out.println("COUNT = " + count);
        return count;
    }
    
    
    
    
    @Override
    public boolean NoteComments(String sender,String message,String aboutwho){
        boolean value = false;
    String sql = "insert into tbl_comments (sender,message,aboutwho) values (?,?,?)";
    int notecomments = jdbcTemplate.update(sql, new Object[]{sender,message,aboutwho});
    if(notecomments > 0){
    value = true;
    }
    return value;
    }

    
    
    
    
    
    
    
    
    
    
}
