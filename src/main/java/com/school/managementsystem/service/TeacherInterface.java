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
import java.util.List;

/**
 *
 * @author oreoluwa
 */
public interface TeacherInterface {
    public boolean CreateTeacher(String firstname,String lastname,String classassigned,String department,String sex,String phonenumber,String username,String password);
    public List<Teacher> GetAllTeachers(String limit);
    public String getTeacherClass(String username);
     public int AddNewStudent(String firstname,String lastname,String studentclass,String age,String sex,String classteacher);
     public List<Student> GetClassStudents(String studentclass,String limit);
     public List<Student> StudentAttendance(String classteacher,String limit);
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
       public int[] deleteStudent(String array[]);
        public List<Student> searchStudentForTeacherClass(String firstname);
        public List<Student> searchStudentForTeacherClassAttendance(String firstname);
         public int[] deleteSubject(String array[]);
         public List<Student> searchStudentForTeacherClassRecord(String firstname);
         public List<Message> getAllMessagesSentByParent();
         public boolean MarkTeacherAttendance(String firstname,String lastname,String sex,String attendance,String username);
         public List<Teacher> searchTeacherForAttendance(String username);
         public String SelectAttendanceCount(String username);
         public String SelectAttendanceCountForAbsent(String username);
         public List<Teacher> getAllTeachersForAttendance(String limit);
          public boolean NoteComments(String sender,String message,String aboutwho);
//         public List<Teacher> GetAllTeachersForAttendance(String limit);
//       public boolean InsertStudentWithSubjects();
    
}
