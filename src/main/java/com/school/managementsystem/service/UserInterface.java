/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.school.managementsystem.service;

import com.school.managementsystem.model.Classess;
import com.school.managementsystem.model.NonTeaching;
import com.school.managementsystem.model.Student;
import com.school.managementsystem.model.Subject;
import com.school.managementsystem.model.User;
import java.util.List;

/**
 *
 * @author oreoluwa
 */
public interface UserInterface {
    
       public String getUserRoles(String username);
       public List<User> getUserByRole(String userrole);
       public String SelectUsertypeName(String username);
        public List<User> searchTeacherForAdmin(String username);
        public int[] deleteTeacherForAdmin(String array[]);
        public String getMessagesSentForTeacher(String teacherusername);
        public String getCommentsSentForTeacher(String teacherusername);
        public boolean UpdateTeacherAttendance();
        public boolean RegisterNonTeaching(String firstname,String lastname,String department,String position,String age,String datejoined,String sex);
        public List<NonTeaching> getAllNonTeachingStaff(String limit);
        public int[] deleteNonTeachingStaffForAdmin(String array[]);
        public String getTeacherForSubject(String subjectname,String classteaching);
         public boolean UpdateAboveAverage(String subject,String classteaching,String teacher);
         public boolean UpadetBelowAverage(String subject,String classteaching,String teacher);
         public List<Subject> getAverageForTeacher(String username);
         public boolean CreateSchoolClass(String classname);
         public List<Classess> getAllSchoolClassess();
         public int[] deleteClassForAdmin(String array[]);
         public String getClassTeacherForAdmin(String classassigned);
         public List<Student> getClassStudentsForAdmin(String studentclass);
}
