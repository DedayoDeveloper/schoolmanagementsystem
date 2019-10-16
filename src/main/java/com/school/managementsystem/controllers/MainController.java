/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.school.managementsystem.controllers;

import com.school.managementsystem.model.ParentModel;
import com.school.managementsystem.model.Student;
import com.school.managementsystem.model.StudentRecords;
import com.school.managementsystem.model.Teacher;
import com.school.managementsystem.model.TimeTable;
import com.school.managementsystem.model.User;
import com.school.managementsystem.service.ParentService;
import com.school.managementsystem.service.TeacherInterface;
import com.school.managementsystem.service.UserInterface;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.sql.DataSource;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

/**
 *
 * @author oreoluwa
 */
@Controller
public class MainController {

    @Autowired
    DataSource datasource;

    @Autowired
    ParentService parent;

    @Autowired
    UserInterface userinterface;

    @Autowired
    TeacherInterface teacher;

    @RequestMapping(value = "/", method = RequestMethod.GET)
    public ModelAndView LandingPage() {
        ModelAndView model = new ModelAndView();
        model.setViewName("landingpage");
        return model;

    }

    @ResponseBody
    @RequestMapping(value = "/registerparentuser", method = {RequestMethod.POST})
    public String RegisterParent(HttpServletRequest request, HttpSession session, String firstname, String lastname, String username,
            String email, String phonenumber, String password) {

        String alertMessage = "failed";
        ModelAndView model = new ModelAndView();
        firstname = request.getParameter("firstname");
        lastname = request.getParameter("lastname");
        username = request.getParameter("username");
        email = request.getParameter("email");
        phonenumber = request.getParameter("phonenumber");
        password = request.getParameter("password");

        boolean RegisterParent = parent.RegsiterParentUser(firstname, lastname, username, email, phonenumber, password);
        if (RegisterParent = true) {
            System.out.println("USER HAS BEEN REGISTERED");
            alertMessage = "GUARDIAN SUCCESSFULLY CREATED";
        }
        return alertMessage;
    }

    @RequestMapping(value = "/welcome", method = {RequestMethod.GET, RequestMethod.POST})
    public ModelAndView WelcomePage() {
        ModelAndView model = new ModelAndView();
        Authentication auth = SecurityContextHolder.getContext().getAuthentication();
        String name = auth.getName();
        System.out.println("USERNAME " + name);
        String theRole = userinterface.getUserRoles(name);
//        request.getSession().setAttribute("userrole", theRole);
        String userrole = userinterface.SelectUsertypeName(name);
        System.out.println("USERROLE = " + userrole);
        System.out.println("role: " + theRole);
        List<User> role = userinterface.getUserByRole(userrole);
        System.out.println("ROLE == " + role);
        role.stream().map((user) -> {
            user.toString();
            return user;
        }).forEachOrdered((user) -> {
            System.out.println("role: " + user.toString());
        });
        model.addObject("username", name);
        model.addObject("role", role);
        model.setViewName("Welcome");

        return model;
    }

    @RequestMapping(value = "/login", method = {RequestMethod.POST, RequestMethod.GET})
    public ModelAndView login(@RequestParam(value = "error", required = false) String error, @RequestParam(value = "logout", required = false) String logout) {
        ModelAndView model = new ModelAndView();
        model.addObject("title", "TAMS");

        if (error != null) {
            model.addObject("error", "Invalid username and password!");
        }

        if (logout != null) {
            model.addObject("msg", "You've been logged out successfully.");
        }

        model.setViewName("login");

        return model;
    }

    @RequestMapping(value = "/searchstudent", method = {RequestMethod.GET, RequestMethod.POST})
    public ModelAndView SearchStudentPage() {
        ModelAndView model = new ModelAndView();
        model.setViewName("SearchStudent");
        return model;
    }

    @RequestMapping(value = "/myclass", method = {RequestMethod.GET, RequestMethod.POST})
    public ModelAndView MyClassPage() {
        Authentication auth = SecurityContextHolder.getContext().getAuthentication();
        String name = auth.getName();
        ModelAndView model = new ModelAndView();
        String TeacherClass = teacher.getTeacherClass(name);

        List<Student> getClassStudents = teacher.GetClassStudents(TeacherClass);
        model.addObject("getClassStudents", getClassStudents);
        model.addObject("TeacherClass", TeacherClass);
        model.addObject("username", name);
        model.setViewName("myclass");
        return model;
    }

    @RequestMapping(value = "/teachermanagement", method = {RequestMethod.GET, RequestMethod.POST})
    public ModelAndView CreateTeacherPage() {
        ModelAndView model = new ModelAndView();
        List<Teacher> getAllTeachers = teacher.GetAllTeachers();
        model.addObject("getAllTeachers", getAllTeachers);
        model.setViewName("TeacherManagement");
        return model;
    }

    @ResponseBody
    @RequestMapping(value = "/addnewteacher", method = RequestMethod.POST)
    public String CreateTeacher(HttpServletRequest request, HttpSession session) {

        Authentication auth = SecurityContextHolder.getContext().getAuthentication();
        String name = auth.getName();
        String alertMessage = "failed";
        ModelAndView model = new ModelAndView();
        String firstname = request.getParameter("firstname");
        String lastname = request.getParameter("lastname");
        String classassigned = request.getParameter("classassigned");
        String department = request.getParameter("department");
        String phonenumber = request.getParameter("phonenumber");
        String sex = request.getParameter("sex");
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        boolean CreateTeacher = teacher.CreateTeacher(firstname, lastname, classassigned, department, sex,phonenumber, username, password);
        if (CreateTeacher = true) {
            System.out.println("TEACHER HAS BEEN REGISTERED");
            alertMessage = "success";
        }
        return alertMessage;
    }

    @ResponseBody
    @RequestMapping(value = "/addnewstudent", method = {RequestMethod.POST})
    public String AddNewToStudentToClass(HttpServletRequest request, HttpSession session) {
        Authentication auth = SecurityContextHolder.getContext().getAuthentication();
        String name = auth.getName();
        String alertMessage = "failed";
        String firstname = request.getParameter("firstname");
        String lastname = request.getParameter("lastname");
        String studentclass = request.getParameter("studentclass");
        request.getSession().setAttribute("studentclass", studentclass);
        String age = request.getParameter("age");
        String sex = request.getParameter("sex");

        int addNewStudent = teacher.AddNewStudent(firstname, lastname, studentclass, age, sex, name);
        if (addNewStudent == 1) {
            System.out.println("NEW STUDENT = " + addNewStudent);
            alertMessage = "success";
        }
        return alertMessage;
    }

//     @RequestMapping(value = "/MarkAttendancePage", method = RequestMethod.GET)
//    public ModelAndView MarkAttendancePage() {
//        ModelAndView model = new ModelAndView();
//        model.setViewName("MarkAttendancePage");
//        return model;
//
//    }
//    
    @RequestMapping(value = "/parentmanagement", method = {RequestMethod.POST, RequestMethod.GET})
    public ModelAndView getAllParentUsers() {
        ModelAndView model = new ModelAndView();
        List<ParentModel> getAllParentUsers = parent.getAllParentUsers();
        model.addObject("getAllParentUsers", getAllParentUsers);
        model.setViewName("parentmanagement");
        return model;
    }

    @RequestMapping(value = "/studentattendance", method = {RequestMethod.GET, RequestMethod.POST})
    public ModelAndView StudentAttendance(HttpSession session, HttpServletRequest request) {
        Authentication auth = SecurityContextHolder.getContext().getAuthentication();
        String name = auth.getName();
        ModelAndView model = new ModelAndView();

        List<Student> StudentAttendanceList = teacher.StudentAttendance(name);
        int studentlistsize = StudentAttendanceList.size();
        LocalDate localDate = LocalDate.now();
        String currentdate = DateTimeFormatter.ofPattern("yyy/MM/dd").format(localDate);
        model.addObject("currentdate", currentdate);
        model.addObject("studentlistsize", studentlistsize);
        model.addObject("StudentAttendanceList", StudentAttendanceList);
        model.setViewName("studentattendance");
        return model;
    }


    @RequestMapping(value = "/markattendance/{firstname}/{lastname}/{sex}", method = {RequestMethod.GET, RequestMethod.POST})
    public ModelAndView MarkAttendancePresent(@PathVariable String firstname, @PathVariable String lastname, @PathVariable String sex) {
        Authentication auth = SecurityContextHolder.getContext().getAuthentication();
        String name = auth.getName();
        ModelAndView model = new ModelAndView();
        model.addObject("firstname", firstname);
        model.addObject("lastname", lastname);
        model.addObject("sex", sex);
        model.setViewName("MarkAttendancePage");
        return model;
    }

    @RequestMapping(value = "/submitattendance", method = {RequestMethod.GET, RequestMethod.POST})
    public String MarkAttendanceAbsent(String firstname, String lastname, String sex, String attendance, HttpServletRequest request, HttpSession session) {
        Authentication auth = SecurityContextHolder.getContext().getAuthentication();
        String name = auth.getName();
        ModelAndView model = new ModelAndView();

        firstname = request.getParameter("firstname");
        request.getSession().setAttribute("firstname", firstname);
        lastname = request.getParameter("lastname");
        request.getSession().setAttribute("lastname", lastname);
        sex = request.getParameter("sex");
        attendance = request.getParameter("attendance");

        LocalDate localDate = LocalDate.now();
        String currentdate = DateTimeFormatter.ofPattern("yyy/MM/dd").format(localDate);
        String TeacherClass = teacher.getTeacherClass(name);

        int saveAttendance = teacher.SaveAttendance(firstname, lastname, sex, attendance, currentdate, TeacherClass, name);
        model.setViewName("studentattendance");
        return "redirect:/studentattendance";
    }

//    @RequestMapping(value = "/studentattendancetwo", method = {RequestMethod.GET, RequestMethod.POST})
//    public ModelAndView StudentAttendanceSecondPage(HttpSession session, HttpServletRequest request) {
//        Authentication auth = SecurityContextHolder.getContext().getAuthentication();
//        String name = auth.getName();
//        ModelAndView model = new ModelAndView();
//
//        String firstname = (String) session.getAttribute("firstname");
//        System.out.println("FIRSTNAME = " + firstname);
//        String lastname = (String) session.getAttribute("lastname");
//        System.out.println("LASTNAME = " + lastname);
//        List<Student> StudentAttendanceList = teacher.StudentAttendance(name);
////        List<Student> getStudentAttendance = teacher.GetAttendanceList();
//        LocalDate localDate = LocalDate.now();
//        String currentdate = DateTimeFormatter.ofPattern("yyy/MM/dd").format(localDate);
//        model.addObject("currentdate", currentdate);
////        model.addObject("getStudentAttendance", getStudentAttendance);
//        model.addObject("StudentAttendanceList", StudentAttendanceList);
//        model.setViewName("studentattendancetwo");
//        return model;
//    }

    @RequestMapping(value = "/mysubjects", method = {RequestMethod.GET, RequestMethod.POST})
    public ModelAndView MySubjectPage() {
        Authentication auth = SecurityContextHolder.getContext().getAuthentication();
        String name = auth.getName();
        ModelAndView model = new ModelAndView();
        List<Teacher> GetSubjectForTeacher = teacher.GetAllTeacherSubjects(name);
        model.addObject("GetSubjectForTeacher", GetSubjectForTeacher);
        model.setViewName("mysubject");
        return model;
    }

    @ResponseBody
    @RequestMapping(value = "/addnewsubject", method = {RequestMethod.GET, RequestMethod.POST})
    public String AddNewSubjectPage(HttpServletRequest request) {
        String alertMessage = "failed";
        Authentication auth = SecurityContextHolder.getContext().getAuthentication();
        String name = auth.getName();
        ModelAndView model = new ModelAndView();

        String subjectname = request.getParameter("subjectname");
        String classteaching = request.getParameter("classteaching");
        String department = request.getParameter("department");

        boolean RegisterNewSubject = teacher.SaveTeacherSubject(subjectname, classteaching, name, department);
        if (RegisterNewSubject = true) {
            alertMessage = "success";
            model.setViewName("mysubject");
        }

        return alertMessage;
    }
    
    
    
    
    
     @RequestMapping(value = "/timetable", method = {RequestMethod.GET, RequestMethod.POST})
    public ModelAndView TeacherTimeTablePage() {
        Authentication auth = SecurityContextHolder.getContext().getAuthentication();
        String name = auth.getName();
        ModelAndView model = new ModelAndView();
        List<TimeTable> gettimetable = teacher.getTimeTable(name);
        model.addObject("gettimetable", gettimetable);
        model.setViewName("timetablepage");
        return model;
    }
    
    
    
    @ResponseBody
        @RequestMapping(value = "/addtimetable", method = {RequestMethod.GET, RequestMethod.POST})
        public String TeacherTimeTableForm(HttpServletRequest request) {
        Authentication auth = SecurityContextHolder.getContext().getAuthentication();
        String name = auth.getName();
        ModelAndView model = new ModelAndView();
        String value = "failed";
            System.out.println("GOT HERE!!");
        
        String details = request.getParameter("details");
        String day = request.getParameter("day");
   
        
        if(day.equals("monday")){
        boolean monday = teacher.TimetableMonday(details,name);
        model.setViewName("timetablepage");
            System.out.println("MONDAY " + monday);
            value = "success";
        }else if(day.equals("tuesday")){
        boolean tuesday = teacher.TimetableTuesday(details, name);
        model.setViewName("timetablepage");
            System.out.println("TUESDAY " + tuesday);
            value = "success";
        }else if(day.equals("wednesday")){
        boolean wednesday = teacher.TimetableWednesday(details, name);
        model.setViewName("timetablepage");
            System.out.println("WEDNESDAY " + wednesday);
            value = "success";
        }else if (day.equals("thursday")){
        boolean thursday = teacher.TimetableThursday(details, name);
        model.setViewName("timetablepage");
            System.out.println("THURSDAY " + thursday);
            value = "success";
        }else if (day.equals("friday")){
            boolean friday = teacher.TimetableFriday(details, name);
            model.setViewName("timetablepage");
            System.out.println("FRIDAY " + friday);
            value = "success";
        }
        
        
        return value;
    }
    
        
        
        
        
    @RequestMapping(value="/messages",method={RequestMethod.GET,RequestMethod.POST})
    public ModelAndView Page(){
    ModelAndView model = new ModelAndView();
    model.setViewName("MessagePage");
    return model;
    }
    
    
    
    @RequestMapping(value="/searchteacherforparent",method={RequestMethod.GET,RequestMethod.POST})
    public ModelAndView SearchTeacherForParentPage(String subject,HttpServletRequest request){
    ModelAndView model = new ModelAndView();
    subject = request.getParameter("subject");
    List<Teacher> getTeacherDetails = parent.searchTeacherForParent(subject);
    model.addObject("getTeacherDetails", getTeacherDetails);
    model.setViewName("MeetTeachersPage");
    return model;
    }
    
    
    
        @ResponseBody
    @RequestMapping(value="/complain",method={RequestMethod.GET,RequestMethod.POST})
    public String ComplainsPage(HttpServletRequest request,String complain){
        Authentication auth = SecurityContextHolder.getContext().getAuthentication();
        String name = auth.getName();
        String value = "failed";
    ModelAndView model = new ModelAndView();
    complain = request.getParameter("complain");
    boolean sendParentComplain = parent.SendComplainToAdmin(name,complain);
    if(sendParentComplain = true){
        value = "success";
        model.setViewName("complainspage");
    }

    return value;
    }
    
    
    
    
            
    @ResponseBody             
    @RequestMapping(value="/searchParentStudent",method={RequestMethod.GET,RequestMethod.POST})
    public ModelAndView SearchParentStudentPage(@RequestParam String table_name, @RequestParam String search_by, @RequestParam String search_string){
    ModelAndView model = new ModelAndView();
    List<Student> SearchStudent = parent.searchStudent(table_name, search_by, search_string);
    model.addObject("SearchStudent",SearchStudent);
    model.setViewName("SearchStudent");
    return model;
    }
    
    
    
    @RequestMapping(value="/meetteachers",method={RequestMethod.GET,RequestMethod.POST})
    public ModelAndView meetTeachersPage(){
    ModelAndView model = new ModelAndView();
    List<Teacher> getAllTeachers = parent.GetAllTeachersForParents();
    model.addObject("getAllTeachers", getAllTeachers);
    model.setViewName("MeetTeachersPage");
    return model;
    }
    

    
    
    @RequestMapping(value="/sendTeachermessage/{firstname}/{lastname}/{phonenumber}",method={RequestMethod.GET,RequestMethod.POST})
    public ModelAndView TeacherDetailsPage(@PathVariable String firstname,@PathVariable String lastname,@PathVariable String phonenumber){
        Authentication auth = SecurityContextHolder.getContext().getAuthentication();
        String name = auth.getName();
    ModelAndView model = new ModelAndView();
//    String getTeachername = parent.getTeacherUsername(phonenumber);
//        System.out.println("TEACHER USERNAME IS = " + getTeachername);
//    List<Teacher> getAllTeacher = parent.GetAllTeacherParentSubjects(getTeachername);
//    model.addObject("getAllTeacher", getAllTeacher);
    model.addObject("firstname", firstname);
    model.addObject("lastname", lastname);
    model.setViewName("teacherdetails");
    return model;
    }
    
    
    
    @RequestMapping(value="/complains",method={RequestMethod.GET,RequestMethod.POST})
    public ModelAndView ComplainsPage(){
    ModelAndView model = new ModelAndView();
    model.setViewName("complainspage");
    return model;
    }
    
    
     @RequestMapping(value="/getStudentDetails/{firstname}/{lastname}/{sex}",method={RequestMethod.GET,RequestMethod.POST})
    public ModelAndView StudentDetailsPage(@PathVariable String firstname, @PathVariable String lastname, @PathVariable String sex){
    ModelAndView model = new ModelAndView();
    List<Student> getStudentDetails = parent.getStudentDetails(firstname, lastname);
    model.addObject("getStudentDetails", getStudentDetails);
    model.setViewName("studentdetails");
    return model;
    }
    
    
    
        
    @RequestMapping(value="/complainmessages",method={RequestMethod.GET,RequestMethod.POST})
    public ModelAndView ComplainsMessagesPage(){
    ModelAndView model = new ModelAndView();
    List<User> getComplain = parent.getParentComplain();
    model.addObject("getComplain", getComplain);
    model.setViewName("ComplainMessagesAdmin");
    return model;
    }
    
    
  
    @ResponseBody
    @RequestMapping(value="/refreshattendance",method={RequestMethod.GET,RequestMethod.POST})
    public String SubmitAttendanceButton(){
        String value = "failed";
    ModelAndView model = new ModelAndView();
    boolean RefreshAttendance = teacher.RefreshAttendance();
    if(RefreshAttendance = true){
        value = "success";
    model.setViewName("studentattendance");
    }
    return value;
    }
    
    
    
    
    
    @RequestMapping(value="/studentrecords",method={RequestMethod.POST,RequestMethod.GET})
    public ModelAndView GetStudentRecordPage(ModelAndView model){
          Authentication auth = SecurityContextHolder.getContext().getAuthentication();
        String name = auth.getName();
        String TeacherClass = teacher.getTeacherClass(name);

        List<Student> getClassStudents = teacher.GetClassStudents(TeacherClass);
        model.addObject("getClassStudents", getClassStudents);
        model.addObject("TeacherClass", TeacherClass);
        model.addObject("username", name);
    model.setViewName("StudentRecordPage");
    return model;
    }
    
    
    
    
    
    @RequestMapping(value="/seerecords/{firstname}/{lastname}/{sex}",method={RequestMethod.GET,RequestMethod.POST})
    public ModelAndView SeeRecordPage(ModelAndView model,@PathVariable String firstname,@PathVariable String lastname,@PathVariable String sex){
        model.addObject("firstname", firstname);
        model.addObject("lastname", lastname);
        model.addObject("sex", sex);
        List<StudentRecords> getStudentRecords = teacher.getStudentRecords(firstname, lastname);
        model.addObject("getStudentRecords", getStudentRecords);
    model.setViewName("SeeRecordsPage");
    return model;
    }
    
    
    
     @RequestMapping(value="/updaterecord/{firstname}/{lastname}",method={RequestMethod.GET,RequestMethod.POST})
    public ModelAndView UpdateRecordPage(ModelAndView model,@PathVariable String firstname,@PathVariable String lastname){
        model.addObject("firstname", firstname);
        model.addObject("lastname", lastname);
    model.setViewName("UpdateRecordPage");
    return model;
    }
    
    
    
    @ResponseBody
     @RequestMapping(value="/updatestudentrecord",method={RequestMethod.GET,RequestMethod.POST})
    public String UpdateRecordPage(ModelAndView model,String assessment,String result,String firstname,
            String lastname,String subject,HttpServletRequest request){
        String value = "failed";
        assessment = request.getParameter("assessment");
         System.out.println(assessment);
        result = request.getParameter("result");
         System.out.println(result);
        firstname = request.getParameter("firstname");
         System.out.println(firstname);
        lastname = request.getParameter("lastname");
         System.out.println(lastname);
        subject = request.getParameter("subject");
         System.out.println(subject);
        
        boolean UpdateResult = teacher.UpdateResult(assessment, result, firstname, lastname, subject);
        if(UpdateResult = true){
            System.out.println("UPDATERESULT " + UpdateResult);
            System.out.println("RESULT UPDATE!");
            value = "success";
            model.setViewName("StudentRecordPage");
        }
    
    return value;
    }
    
    
  
      @RequestMapping(value="/mystudent",method={RequestMethod.GET,RequestMethod.POST})
    public ModelAndView ParentStudentPage(ModelAndView model){
        Authentication auth = SecurityContextHolder.getContext().getAuthentication();
        String name = auth.getName();
        List<Student> getMyChild = parent.getMyChildList(name);
        model.addObject("getMyChild", getMyChild);
    model.setViewName("MyStudent");
    return model;
    }
    
    
    
    
       @RequestMapping(value="/addmychild",method={RequestMethod.GET,RequestMethod.POST})
    public ModelAndView AddMyChildForm(ModelAndView model,HttpServletRequest request,String firstname,String lastname,String sex,String age){
         Authentication auth = SecurityContextHolder.getContext().getAuthentication();
        String name = auth.getName();
        firstname = request.getParameter("firstname");
        lastname = request.getParameter("lastname");
        sex = request.getParameter("sex");
        age = request.getParameter("age");
        
        boolean getMyChild = parent.getMyChild(firstname, lastname, sex,age,name);
    model.setViewName("MyStudent");
    return model;
    }
    
    
}
