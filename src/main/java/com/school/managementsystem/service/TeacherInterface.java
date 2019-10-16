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
import java.util.List;

/**
 *
 * @author oreoluwa
 */
public interface TeacherInterface {
    public boolean CreateTeacher(String firstname,String lastname,String classassigned,String department,String sex,String phonenumber,String username,String password);
    public List<Teacher> GetAllTeachers();
    public String getTeacherClass(String username);
     public int AddNewStudent(String firstname,String lastname,String studentclass,String age,String sex,String classteacher);
     public List<Student> GetClassStudents(String studentclass);
     public List<Student> StudentAttendance(String classteacher);
     public int SaveAttendance(String firstname,String lastname,String sex,String attendance,String date,String studentclass,String classteacher);
      public boolean SaveTeacherSubject(String subjectname,String classteaching,String teacher,String department);
       public List<Teacher> GetAllTeacherSubjects(String teacher);
      public boolean TimetableMonday(String details,String teacher);
      public List<TimeTable> getTimeTable(String teacher);
       public boolean TimetableTuesday(String details,String teacher);
       public boolean TimetableWednesday(String details,String teacher);
       public boolean TimetableThursday(String details,String teacher);
       public boolean TimetableFriday(String details,String teacher);
       public boolean RefreshAttendance();
       public boolean UpdateResult(String assessment,String result,String firstname,String lastname,String subject);
       public List<StudentRecords> getStudentRecords(String firstname,String lastname);
//       public boolean InsertStudentWithSubjects();
    
}
