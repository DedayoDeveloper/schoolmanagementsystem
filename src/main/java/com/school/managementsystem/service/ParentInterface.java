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
import java.util.List;

/**
 *
 * @author oreoluwa
 */
public interface ParentInterface{
    
    public boolean RegsiterParentUser(String firstname,String lastname, String username, String email, String phonenumber, String password);
    public List<ParentModel> getAllParentUsers(String limit);
    public List<Student> searchStudent(String table_name, String search_by, String search_details);
     public List<Teacher> GetAllTeachersForParents();
     public String getTeacherUsername(String phonenumber);
     public List<Teacher> GetAllTeacherParentSubjects(String teacher);
     public List<Student>getStudentDetails(String firstname,String lastname);
      public List<Teacher> searchTeacherForParent(String subjectname);
      public boolean SendComplainToAdmin(String username,String complain);
      public List<User> getParentComplain();
      public boolean getMyChild(String firstname,String lastname,String sex,String age,String username);
      public List<Student> getMyChildList(String username);
      public String getTeacherName(String firstname,String lastname);
      public List<Message> getAllMessagesSentByParent(String username);
      public int[] deleteStudentForParent(String array[]);
       public List<ParentModel> getAllParentUsersForProfile(String username);
        public boolean UpdateParentProfile(String firstname,String lastname,String email,String phonenumber,String name);
//        public void SendEmail(String toAddress, String fromAddress, String subject, String msgBody);

}
