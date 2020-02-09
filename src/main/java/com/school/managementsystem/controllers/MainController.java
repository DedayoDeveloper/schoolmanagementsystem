/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.school.managementsystem.controllers;

import com.school.managementsystem.model.Classess;
import com.school.managementsystem.model.Message;
import com.school.managementsystem.model.NonTeaching;
import com.school.managementsystem.model.ParentModel;
import com.school.managementsystem.model.Student;
import com.school.managementsystem.model.StudentRecords;
import com.school.managementsystem.model.Subject;
import com.school.managementsystem.model.Teacher;
import com.school.managementsystem.model.TimeTable;
import com.school.managementsystem.model.User;
import com.school.managementsystem.service.EmailSenderImpl;
import com.school.managementsystem.service.ParentService;
import com.school.managementsystem.service.TeacherInterface;
import com.school.managementsystem.service.UserInterface;
import com.school.managementsystem.util.Pagination;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.sql.DataSource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mobile.device.Device;

import org.springframework.security.core.Authentication;
import org.springframework.security.core.AuthenticationException;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.web.authentication.logout.SecurityContextLogoutHandler;
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
    
    @Autowired
    EmailSenderImpl emailsender;

    private static final Logger logger = LoggerFactory.getLogger(MainController.class);
    
      @RequestMapping(value = "/index", method = RequestMethod.GET)
    public ModelAndView LandingPage(Device device,ModelAndView model )throws AuthenticationException  {

        model.addObject("title", "SMS");
        String deviceType = "browser";
        String platform = "browser";
         
//        Device currentDevice = DeviceUtils.getCurrentDevice(servletRequest);s
        if (device.isNormal()) {
            deviceType = "browser";
        } else if (device.isMobile()) {
            deviceType = "mobile";
        } else if (device.isTablet()) {
            deviceType = "tablet";
        }
          logger.info("DEVICETYPE " + deviceType);
        platform = device.getDevicePlatform().name();
         
        if (platform.equalsIgnoreCase("UNKNOWN")) {
            platform = "browser";
        }
         model.setViewName("landingpage");
        return model;
    }
    
   

    @ResponseBody
    @RequestMapping(value = "/registerparentuser", method = {RequestMethod.POST})
    public String RegisterParent(HttpServletRequest request, HttpSession session,
                                 @RequestParam("firstname") String firstname,
                                 @RequestParam("lastname") String lastname,
                                 @RequestParam("username") String username,
                                 @RequestParam("email") String email,
                                 @RequestParam("phonenumber") String phonenumber,
                                 @RequestParam("password") String password,ModelAndView model) {
            logger.info("WE ARE HERE!");
        String alertMessage = "failed";
        logger.info("GOT HERE");
        boolean RegisterParent = parent.RegsiterParentUser(firstname, lastname, username, email, phonenumber, password);
        logger.info("RegisterParent = " + RegisterParent);
        if (RegisterParent = true) {

//            String toAddress = "Schoomanagement@gmail.com";
            String subject = "A secure guide on how to use this application";
            String msgBody = "welcome to School management system";

//            emailsender.sendEmailMessage(email, subject, msgBody);
            System.out.println("USER HAS BEEN REGISTERED");
            alertMessage = "GUARDIAN SUCCESSFULLY CREATED";
        }
        return alertMessage;
    }

    @RequestMapping(value = "/welcome", method = {RequestMethod.GET, RequestMethod.POST})
    public ModelAndView WelcomePage() {
        ModelAndView model = new ModelAndView();
         model.addObject("title", "SMS");
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

    @RequestMapping(value = "/signin", method = {RequestMethod.POST, RequestMethod.GET})
    public ModelAndView login(@RequestParam(value = "error", required = false) String error, @RequestParam(value = "logout", required = false) String logout) {
        ModelAndView model = new ModelAndView();
        model.addObject("title", "SMS");

        if (error != null) {
            model.addObject("error", "Invalid username and password!");
        }

        if (logout != null) {
            model.addObject("msg", "You've been logged out successfully.");
        }

        model.setViewName("landingpage");

        return model;
    }

    @RequestMapping(value = "/searchstudent", method = {RequestMethod.GET, RequestMethod.POST})
    public ModelAndView SearchStudentPage() {
        ModelAndView model = new ModelAndView();
        model.addObject("title", "SMS");
        model.setViewName("SearchStudent");
        return model;
    }

    @RequestMapping(value = "/myclass", method = {RequestMethod.GET, RequestMethod.POST})
    public ModelAndView MyClassPage(@RequestParam(defaultValue = "1") int page_num) {
        Authentication auth = SecurityContextHolder.getContext().getAuthentication();
        String name = auth.getName();
        ModelAndView model = new ModelAndView();
        String TeacherClass = teacher.getTeacherClass(name);
        model.addObject("title", "SMS");
        List<Student> getClassStudent = teacher.GetClassStudents(TeacherClass, "");
        int total = getClassStudent.size();
        String link = "/managementsystem/myclass" + "?page_num=";
        Pagination pg = new Pagination(page_num, total);
        String limit = pg.getLimit();
        List<Student> getClassStudents = teacher.GetClassStudents(TeacherClass, limit);
        pg.setLink(link);
        String pages = pg.getControls();
        model.addObject("pagination", pages);
        model.addObject("getClassStudents", getClassStudents);
        model.addObject("TeacherClass", TeacherClass);
        model.addObject("username", name);
        model.setViewName("myclass");
        return model;
    }

    @RequestMapping(value = "/teachermanagement", method = {RequestMethod.GET, RequestMethod.POST})
    public ModelAndView CreateTeacherPage(@RequestParam(defaultValue = "1") int page_num) {
        ModelAndView model = new ModelAndView();
        model.addObject("title", "SMS");
        List<Classess> getSchoolClassess = userinterface.getAllSchoolClassess();
        List<Teacher> getAllTeacher = teacher.GetAllTeachers("");
        int total = getAllTeacher.size();
        String link = "/managementsystem/teachermanagement" + "?page_num=";
        Pagination pg = new Pagination(page_num, total);
        String limit = pg.getLimit();
        List<Teacher> getAllTeachers = teacher.GetAllTeachers(limit);
        pg.setLink(link);
        String pages = pg.getControls();
        model.addObject("pagination", pages);
        model.addObject("getAllTeachers", getAllTeachers);
        model.addObject("getSchoolClassess", getSchoolClassess);
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
        boolean CreateTeacher = teacher.CreateTeacher(firstname, lastname, classassigned, department, sex, phonenumber, username, password);
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
    public ModelAndView getAllParentUsers(@RequestParam(defaultValue = "1") int page_num) {
        ModelAndView model = new ModelAndView();
        model.addObject("title", "SMS");
        List<ParentModel> getAllParentUser = parent.getAllParentUsers("");
        int total = getAllParentUser.size();
        String link = "/managementsystem/studentattendance" + "?page_num=";
        Pagination pg = new Pagination(page_num, total);
        String limit = pg.getLimit();
        List<ParentModel> getAllParentUsers = parent.getAllParentUsers(limit);
        pg.setLink(link);
        String pages = pg.getControls();
        model.addObject("pagination", pages);
        model.addObject("getAllParentUsers", getAllParentUsers);
        model.setViewName("parentmanagement");
        return model;
    }

    @RequestMapping(value = "/studentattendance", method = {RequestMethod.GET, RequestMethod.POST})
    public ModelAndView StudentAttendance(HttpSession session, HttpServletRequest request, @RequestParam(defaultValue = "1") int page_num) {
        Authentication auth = SecurityContextHolder.getContext().getAuthentication();
        String name = auth.getName();
        ModelAndView model = new ModelAndView();
        model.addObject("title", "SMS");
        List<Student> StudentAttendance = teacher.StudentAttendance(name, "");
        int total = StudentAttendance.size();
        String link = "/managementsystem/studentattendance" + "?page_num=";
        Pagination pg = new Pagination(page_num, total);
        String limit = pg.getLimit();
        List<Student> StudentAttendanceList = teacher.StudentAttendance(name, limit);
        pg.setLink(link);
        String pages = pg.getControls();
        model.addObject("pagination", pages);
        LocalDate localDate = LocalDate.now();
        String currentdate = DateTimeFormatter.ofPattern("yyy/MM/dd").format(localDate);
        model.addObject("currentdate", currentdate);
//        model.addObject("studentlistsize", studentlistsize);
        model.addObject("StudentAttendanceList", StudentAttendanceList);
        model.addObject("name", name);
        model.setViewName("studentattendance");
        return model;
    }

    @RequestMapping(value = "/markattendance/{firstname}/{lastname}/{sex}", method = {RequestMethod.GET, RequestMethod.POST})
    public ModelAndView MarkAttendancePresent(@PathVariable String firstname, @PathVariable String lastname, @PathVariable String sex) {
        Authentication auth = SecurityContextHolder.getContext().getAuthentication();
        String name = auth.getName();
        ModelAndView model = new ModelAndView();
        model.addObject("title", "SMS");
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
        model.addObject("title", "SMS");
        List<Teacher> GetSubjectForTeacher = teacher.GetAllTeacherSubjects(name);
        List<Classess> getSchoolClassess = userinterface.getAllSchoolClassess();
        model.addObject("getSchoolClassess", getSchoolClassess);
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
        model.addObject("title", "SMS");
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

        if (day.equals("monday")) {
            boolean monday = teacher.TimetableMonday(details, name);
            model.setViewName("timetablepage");
            System.out.println("MONDAY " + monday);
            value = "success";
        } else if (day.equals("tuesday")) {
            boolean tuesday = teacher.TimetableTuesday(details, name);
            model.setViewName("timetablepage");
            System.out.println("TUESDAY " + tuesday);
            value = "success";
        } else if (day.equals("wednesday")) {
            boolean wednesday = teacher.TimetableWednesday(details, name);
            model.setViewName("timetablepage");
            System.out.println("WEDNESDAY " + wednesday);
            value = "success";
        } else if (day.equals("thursday")) {
            boolean thursday = teacher.TimetableThursday(details, name);
            model.setViewName("timetablepage");
            System.out.println("THURSDAY " + thursday);
            value = "success";
        } else if (day.equals("friday")) {
            boolean friday = teacher.TimetableFriday(details, name);
            model.setViewName("timetablepage");
            System.out.println("FRIDAY " + friday);
            value = "success";
        }

        return value;
    }

    @RequestMapping(value = "/messages", method = {RequestMethod.GET, RequestMethod.POST})
    public ModelAndView Page() {
        Authentication auth = SecurityContextHolder.getContext().getAuthentication();
        String name = auth.getName();
        ModelAndView model = new ModelAndView();
        model.addObject("title", "SMS");
        List<Message> getMessages = parent.getAllMessagesSentByParent(name);
        model.addObject("getMessages", getMessages);
        model.setViewName("MessagePage");
        return model;
    }

    @RequestMapping(value = "/searchteacherforparent", method = {RequestMethod.GET, RequestMethod.POST})
    public ModelAndView SearchTeacherForParentPage(String subject, HttpServletRequest request) {
        ModelAndView model = new ModelAndView();
        model.addObject("title", "SMS");
        subject = request.getParameter("subject");
        List<Teacher> getTeacherDetails = parent.searchTeacherForParent(subject);
        model.addObject("getTeacherDetails", getTeacherDetails);
        model.setViewName("MeetTeacherPageTwo");
        return model;
    }

    @ResponseBody
    @RequestMapping(value = "/complain", method = {RequestMethod.GET, RequestMethod.POST})
    public String ComplainsPage(HttpServletRequest request, String complain) {
        Authentication auth = SecurityContextHolder.getContext().getAuthentication();
        String name = auth.getName();
        String value = "failed";
        ModelAndView model = new ModelAndView();
        model.addObject("title", "SMS");
        complain = request.getParameter("complain");
        boolean sendParentComplain = parent.SendComplainToAdmin(name, complain);
        if (sendParentComplain = true) {
            value = "success";
            model.setViewName("complainspage");
        }

        return value;
    }

    @ResponseBody
    @RequestMapping(value = "/searchstudentforteacherattendance", method = {RequestMethod.GET, RequestMethod.POST})
    public ModelAndView SearchStudentForTeacherAttendance(HttpServletRequest req) {
        Authentication auth = SecurityContextHolder.getContext().getAuthentication();
        String name = auth.getName();
        ModelAndView model = new ModelAndView();
        model.addObject("title", "SMS");
        String TeacherClass = teacher.getTeacherClass(name);
        model.addObject("TeacherClass", TeacherClass);
        String firstname = req.getParameter("firstname");
        System.out.println("FIRSTNAME + " + firstname);
        List<Student> StudentAttendanceList = teacher.searchStudentForTeacherClassAttendance(firstname);

        model.addObject("StudentAttendanceList", StudentAttendanceList);

        model.setViewName("studentattendance");
        return model;
    }

    @ResponseBody
    @RequestMapping(value = "/searchstudentforteacherrecord", method = {RequestMethod.GET, RequestMethod.POST})
    public ModelAndView SearchStudentForTeacherRecording(HttpServletRequest req) {
        Authentication auth = SecurityContextHolder.getContext().getAuthentication();
        String name = auth.getName();
        ModelAndView model = new ModelAndView();
        model.addObject("title", "SMS");
        String TeacherClass = teacher.getTeacherClass(name);
        model.addObject("TeacherClass", TeacherClass);
        String firstname = req.getParameter("firstname");
        System.out.println("FIRSTNAME + " + firstname);
        List<Student> getClassStudents = teacher.searchStudentForTeacherClassRecord(firstname);

        model.addObject("getClassStudents", getClassStudents);

        model.setViewName("StudentRecordPage");
        return model;
    }

    @ResponseBody
    @RequestMapping(value = "/searchstudentforteacher", method = {RequestMethod.GET, RequestMethod.POST})
    public ModelAndView SearchStudentForTeacher(HttpServletRequest req) {
        Authentication auth = SecurityContextHolder.getContext().getAuthentication();
        String name = auth.getName();
        ModelAndView model = new ModelAndView();
        model.addObject("title", "SMS");
        String TeacherClass = teacher.getTeacherClass(name);
        model.addObject("TeacherClass", TeacherClass);
        String firstname = req.getParameter("firstname");
        System.out.println("FIRSTNAME + " + firstname);
        List<Student> getClassStudents = teacher.searchStudentForTeacherClass(firstname);

        model.addObject("getClassStudents", getClassStudents);

        model.setViewName("myclass");
        return model;
    }

    @ResponseBody
    @RequestMapping(value = "/searchParentStudent", method = {RequestMethod.GET, RequestMethod.POST})
    public ModelAndView SearchParentStudentPage(@RequestParam String table_name, @RequestParam String search_by, @RequestParam String search_string) {
        ModelAndView model = new ModelAndView();
        model.addObject("title", "SMS");
        List<Student> SearchStudent = parent.searchStudent(table_name, search_by, search_string);
        model.addObject("SearchStudent", SearchStudent);
        model.setViewName("SearchStudent");
        return model;
    }

    @RequestMapping(value = "/meetteachers", method = {RequestMethod.GET, RequestMethod.POST})
    public ModelAndView meetTeachersPage() {
        ModelAndView model = new ModelAndView();
        model.addObject("title", "SMS");
        List<Teacher> getAllTeachers = parent.GetAllTeachersForParents();
        model.addObject("getAllTeachers", getAllTeachers);
        model.setViewName("MeetTeachersPage");
        return model;
    }

    @RequestMapping(value = "/sendTeachermessage/{firstname}/{lastname}/{phonenumber}", method = {RequestMethod.GET, RequestMethod.POST})
    public ModelAndView TeacherDetailsPage(@PathVariable String firstname, @PathVariable String lastname, @PathVariable String phonenumber) {
        Authentication auth = SecurityContextHolder.getContext().getAuthentication();
        String name = auth.getName();
        ModelAndView model = new ModelAndView();
        model.addObject("title", "SMS");
//    String getTeachername = parent.getTeacherUsername(phonenumber);
//        System.out.println("TEACHER USERNAME IS = " + getTeachername);
//    List<Teacher> getAllTeacher = parent.GetAllTeacherParentSubjects(getTeachername);
//    model.addObject("getAllTeacher", getAllTeacher);
        model.addObject("firstname", firstname);
        model.addObject("lastname", lastname);
        model.setViewName("teacherdetails");
        return model;
    }

    @RequestMapping(value = "/complains", method = {RequestMethod.GET, RequestMethod.POST})
    public ModelAndView ComplainsPage() {
        ModelAndView model = new ModelAndView();
        model.addObject("title", "SMS");
        model.setViewName("complainspage");
        return model;
    }

    @RequestMapping(value = "/getStudentDetails/{firstname}/{lastname}/{sex}", method = {RequestMethod.GET, RequestMethod.POST})
    public ModelAndView StudentDetailsPage(@PathVariable String firstname, @PathVariable String lastname, @PathVariable String sex) {
        ModelAndView model = new ModelAndView();
        model.addObject("title", "SMS");
        List<Student> getStudentDetails = parent.getStudentDetails(firstname, lastname);
        model.addObject("getStudentDetails", getStudentDetails);
        model.setViewName("studentdetails");
        return model;
    }

    @RequestMapping(value = "/complainmessages", method = {RequestMethod.GET, RequestMethod.POST})
    public ModelAndView ComplainsMessagesPage() {
        ModelAndView model = new ModelAndView();
        model.addObject("title", "SMS");
        List<User> getComplain = parent.getParentComplain();
        model.addObject("getComplain", getComplain);
        model.setViewName("ComplainMessagesAdmin");
        return model;
    }

    @ResponseBody
    @RequestMapping(value = "/teachermessage", method = {RequestMethod.GET, RequestMethod.POST})
    public String ParentToAdminMessagesPage(ModelAndView model, HttpServletRequest request) {
        Authentication auth = SecurityContextHolder.getContext().getAuthentication();
        String name = auth.getName();
        String value = "failed";
        String firstname = request.getParameter("firstname");
        String lastname = request.getParameter("lastname");
        String teacher = parent.getTeacherName(firstname, lastname);
        System.out.println("TEACHER NAME = " + teacher);
        String message = request.getParameter("messagetoteacher");
        int messagetoteacher = parent.SendMessageToTeacher(name, message, teacher);
        System.out.println(messagetoteacher);
        if (messagetoteacher > 0) {
            value = "success";
            model.setViewName("teacherdetails");
        }
        return value;
    }

    @ResponseBody
    @RequestMapping(value = "/refreshattendance", method = {RequestMethod.GET, RequestMethod.POST})
    public String SubmitAttendanceButton() {
        String value = "failed";
        ModelAndView model = new ModelAndView();
        boolean RefreshAttendance = teacher.RefreshAttendance();
        if (RefreshAttendance = true) {
            value = "success";
            model.setViewName("studentattendance");
        }
        return value;
    }

    @RequestMapping(value = "/studentrecords", method = {RequestMethod.POST, RequestMethod.GET})
    public ModelAndView GetStudentRecordPage(ModelAndView model, @RequestParam(defaultValue = "1") int page_num) {
        Authentication auth = SecurityContextHolder.getContext().getAuthentication();
        String name = auth.getName();
        String TeacherClass = teacher.getTeacherClass(name);
        model.addObject("title", "SMS");
        List<Student> getClassStudent = teacher.GetClassStudents(TeacherClass, "");
        int total = getClassStudent.size();
        String link = "/managementsystem/studentrecords" + "?page_num=";
        Pagination pg = new Pagination(page_num, total);
        String limit = pg.getLimit();
        List<Student> getClassStudents = teacher.GetClassStudents(TeacherClass, limit);
        pg.setLink(link);
        String pages = pg.getControls();
        model.addObject("pagination", pages);
        model.addObject("getClassStudents", getClassStudents);
        model.addObject("TeacherClass", TeacherClass);
        model.addObject("username", name);
        model.setViewName("StudentRecordPage");
        return model;
    }

    @RequestMapping(value = "/seerecords/{firstname}/{lastname}/{sex}", method = {RequestMethod.GET, RequestMethod.POST})
    public ModelAndView SeeRecordPage(ModelAndView model, @PathVariable String firstname, @PathVariable String lastname, @PathVariable String sex) {
        model.addObject("firstname", firstname);
        model.addObject("title", "SMS");
        model.addObject("lastname", lastname);
        model.addObject("sex", sex);
        List<StudentRecords> getStudentRecords = teacher.getStudentRecords(firstname, lastname);
        String[] subject = {"mathematics", "english", "french", "finearts", "economics", "biology", "civiceducation", "geography", "history", "agriculturalscience"};
        model.addObject("subject", subject);
        model.addObject("getStudentRecords", getStudentRecords);
        model.setViewName("SeeRecordsPage");
        return model;
    }

    @RequestMapping(value = "/updaterecord/{firstname}/{lastname}", method = {RequestMethod.GET, RequestMethod.POST})
    public ModelAndView UpdateRecordPage(ModelAndView model, @PathVariable String firstname, @PathVariable String lastname) {
        model.addObject("firstname", firstname);
        model.addObject("lastname", lastname);
        model.addObject("title", "SMS");
        model.setViewName("UpdateRecordPage");
        return model;
    }

    @ResponseBody
    @RequestMapping(value = "/updatestudentrecord", method = {RequestMethod.GET, RequestMethod.POST})
    public String UpdateRecordPage(ModelAndView model, String assessment, String result, String firstname,
            String lastname, String subject, HttpServletRequest request) {

        Authentication auth = SecurityContextHolder.getContext().getAuthentication();
        String name = auth.getName();
        String TeacherClass = teacher.getTeacherClass(name);
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

        if (assessment.contains("total")) {
            int score = Integer.parseInt(result);
            System.out.println("RESULT = " + score);
            String teacher = userinterface.getTeacherForSubject(subject, TeacherClass);
            if (score > 50) {
                
                System.out.println("TEACHER FOR MY COURSE IS " + teacher);
                boolean setScoreAboveAverage = userinterface.UpdateAboveAverage(subject, TeacherClass, teacher);
            } else if (score <= 50) {
               
                System.out.println("TEACHER FOR MY COURSE IS " + teacher);
                boolean setScoreBelowAverage = userinterface.UpadetBelowAverage(subject, TeacherClass, teacher);
            }

        }

        boolean UpdateResult = teacher.UpdateResult(assessment, result, firstname, lastname, subject);
        if (UpdateResult = true) {
            System.out.println("UPDATERESULT " + UpdateResult);
            System.out.println("RESULT UPDATE!");
            value = "success";
            model.setViewName("StudentRecordPage");
        }

        return value;
    }

    @RequestMapping(value = "/mystudent", method = {RequestMethod.GET, RequestMethod.POST})
    public ModelAndView ParentStudentPage(ModelAndView model) {
        Authentication auth = SecurityContextHolder.getContext().getAuthentication();
        String name = auth.getName();
        List<Student> getMyChild = parent.getMyChildList(name);
         List<Classess> getSchoolClassess = userinterface.getAllSchoolClassess();
        model.addObject("getSchoolClassess", getSchoolClassess);
        model.addObject("title", "SMS");
        model.addObject("getMyChild", getMyChild);
        model.setViewName("MyStudent");
        return model;
    }

    @ResponseBody
    @RequestMapping(value = "/addmychild", method = {RequestMethod.GET, RequestMethod.POST})
    public String AddMyChildForm(ModelAndView model, HttpServletRequest request, String firstname, String lastname, String sex, String age) {
        Authentication auth = SecurityContextHolder.getContext().getAuthentication();
        String name = auth.getName();
        String value = "failed";
        firstname = request.getParameter("firstname");
        lastname = request.getParameter("lastname");
        sex = request.getParameter("sex");
        age = request.getParameter("age");
        String studentclass = request.getParameter("studentclass");

        boolean getMyChild = parent.getMyChild(firstname, lastname, sex, age, name,studentclass);
        if (getMyChild == true) {
            value = "success";
            model.setViewName("MyStudent");
        }
        return value;
    }

    @ResponseBody
    @RequestMapping(value = "/deleteStudent", method = {RequestMethod.GET, RequestMethod.POST})
    public String DeleteStudent(HttpServletRequest req) {
        Authentication auth = SecurityContextHolder.getContext().getAuthentication();
        String usernm = auth.getName();
        String message = "failed";
        String getFilesArray = req.getParameter("array");
        String myArray[] = getFilesArray.split(",");
        int arry[] = teacher.deleteStudent(myArray);
        System.out.println(">>>>>>>>>>>?????????????? " + arry.length);
        if (arry.length > 0) {
            message = "success";

        }

        return message;
    }

    @ResponseBody
    @RequestMapping(value = "/deleteSubject", method = {RequestMethod.GET, RequestMethod.POST})
    public String DeleteTeacherSubject(HttpServletRequest req) {
        Authentication auth = SecurityContextHolder.getContext().getAuthentication();
        String usernm = auth.getName();
        String message = "failed";
        String getFilesArray = req.getParameter("array");
        String myArray[] = getFilesArray.split(",");
        int arry[] = teacher.deleteSubject(myArray);
        System.out.println(">>>>>>>>>>>?????????????? " + arry.length);
        if (arry.length > 0) {
            message = "success";

        }

        return message;
    }

    @ResponseBody
    @RequestMapping(value = "/deleteStudentforparent", method = {RequestMethod.GET, RequestMethod.POST})
    public String DeleteStudentForParent(HttpServletRequest req) {
        Authentication auth = SecurityContextHolder.getContext().getAuthentication();
        String usernm = auth.getName();
        String message = "failed";
        String getFilesArray = req.getParameter("array");
        String myArray[] = getFilesArray.split(",");
        int arry[] = parent.deleteStudentForParent(myArray);
        System.out.println(">>>>>>>>>>>?????????????? " + arry.length);
        if (arry.length > 0) {
            message = "success";

        }

        return message;
    }
    
    
    
    @RequestMapping(value = "/myprofile", method = {RequestMethod.GET, RequestMethod.POST})
    public ModelAndView MyProfilePage(ModelAndView model) {
        Authentication auth = SecurityContextHolder.getContext().getAuthentication();
        String name = auth.getName();
        List<ParentModel> getParentProfile = parent.getAllParentUsersForProfile(name);
        List<Student> getMyChild = parent.getMyChildList(name);
        model.addObject("title", "SMS");
        model.addObject("getMyChild", getMyChild);
        model.addObject("getParentProfile", getParentProfile);
        model.setViewName("MyProfilePage");
        return model;
    }
    
    

    @ResponseBody
    @RequestMapping(value = "/updateprofile", method = {RequestMethod.GET, RequestMethod.POST})
    public String UpdateParentProfile(ModelAndView model, HttpServletRequest request, HttpSession session) {
        Authentication auth = SecurityContextHolder.getContext().getAuthentication();
        String name = auth.getName();
        String value = "false";
        String firstname = request.getParameter("firstname");
        String lastname = request.getParameter("lastname");
        String email = request.getParameter("email");
        String phonenumber = request.getParameter("phonenumber");
        String emergencycontact = request.getParameter("emergencycontact");

        boolean updateProfile = parent.UpdateParentProfile(firstname, lastname, email, phonenumber,emergencycontact, name);
        if (updateProfile == true) {
            value = "success";
        }
        return value;
    }

    @RequestMapping(value = "/meesagesforteacher", method = {RequestMethod.GET, RequestMethod.POST})
    public ModelAndView MessagesPageForTeacher(ModelAndView model) {
        Authentication auth = SecurityContextHolder.getContext().getAuthentication();
        String name = auth.getName();
        System.out.println("WE GOT HERE");
        List<Message> getTeacherMessages = teacher.getAllMessagesSentByParent();
        model.addObject("title", "SMS");
        model.addObject("getTeacherMessages", getTeacherMessages);
        model.setViewName("MessagesTeacherPage");
        return model;
    }

    @RequestMapping(value = "/searchteacherforadmin", method = {RequestMethod.GET, RequestMethod.POST})
    public ModelAndView SearchTeacherPage(HttpServletRequest request, String username) {
        ModelAndView model = new ModelAndView();
        model.addObject("title", "SMS");
        username = request.getParameter("username");
        List<User> searchTeacher = userinterface.searchTeacherForAdmin(username);
        model.addObject("searchTeacher", searchTeacher);
        model.setViewName("teachermanagementtwo");
        return model;
    }
    
    

    @ResponseBody
    @RequestMapping(value = "/deleteteacher", method = {RequestMethod.GET, RequestMethod.POST})
    public String DeleteTeacherForAdmin(HttpServletRequest req) {
        Authentication auth = SecurityContextHolder.getContext().getAuthentication();
        String usernm = auth.getName();
        String message = "failed";
        String getFilesArray = req.getParameter("array");
        String myArray[] = getFilesArray.split(",");
        int arry[] = userinterface.deleteTeacherForAdmin(myArray);
        System.out.println(">>>>>>>>>>>?????????????? " + arry.length);
        if (arry.length > 0) {
            message = "success";

        }

        return message;
    }

    
    
    @RequestMapping(value = "/teacherattendance", method = {RequestMethod.GET, RequestMethod.POST})
    public ModelAndView TeacherAttendancePage(ModelAndView model, @RequestParam(defaultValue = "1") int page_num) {
        model.addObject("title", "SMS");
        List<Teacher> getAllTeacher = teacher.getAllTeachersForAttendance("");
        int total = getAllTeacher.size();
        String link = "/managementsystem/teacherattendance" + "?page_num=";
        Pagination pg = new Pagination(page_num, total);
        String limit = pg.getLimit();
        List<Teacher> getAllTeachers = teacher.getAllTeachersForAttendance(limit);
        pg.setLink(link);
        String pages = pg.getControls();

        LocalDate localDate = LocalDate.now();
        String currentdate = DateTimeFormatter.ofPattern("yyy/MM/dd").format(localDate);
        model.addObject("currentdate", currentdate);
        model.addObject("pagination", pages);
        model.addObject("getAllTeachers", getAllTeachers);
        model.setViewName("TeacherAttendancePage");
        return model;
    }

    
    
    @RequestMapping(value = "/markattendanceforteacher/{firstname}/{lastname}/{sex}/{username}", method = {RequestMethod.GET, RequestMethod.POST})
    public ModelAndView MarkTeacherAttendance(ModelAndView model, @PathVariable String firstname, @PathVariable String lastname,
            @PathVariable String sex, @PathVariable String username, HttpServletRequest request) {
        model.addObject("firstname", firstname);
        model.addObject("lastname", lastname);
        model.addObject("sex", sex);
        model.addObject("username", username);
        model.addObject("title", "SMS");
        model.setViewName("TeacherAttendanceMarkingPage");
        return model;
    }
    
    
    
    
    
    
    

    @RequestMapping(value = "/searchteacherforattendance", method = {RequestMethod.POST, RequestMethod.GET})
    public ModelAndView searchteacherforattendance(HttpServletRequest request, ModelAndView model) {
        String username = request.getParameter("username");
        List<Teacher> SearchTeacherAttendance = teacher.searchTeacherForAttendance(username);
        if (SearchTeacherAttendance == null) {
            model.addObject("error", "NO TEACHER FOUND");
            model.setViewName("TeacherAttendancePage");
        }
        LocalDate localDate = LocalDate.now();
        String currentdate = DateTimeFormatter.ofPattern("yyy/MM/dd").format(localDate);
        model.addObject("title", "SMS");
        model.addObject("currentdate", currentdate);
        model.addObject("SearchTeacherAttendance", SearchTeacherAttendance);
        model.setViewName("TeacherAttendancePageTwo");

        return model;
    }
    
    
    
    
    
    

    @ResponseBody
    @RequestMapping(value = "/markteacherattendance", method = {RequestMethod.POST, RequestMethod.GET})
    public String MarkAttendance(HttpServletRequest request, ModelAndView model) {

        String value = "failed";
        String firstname = request.getParameter("firstname");
        System.out.println("FIRSTNAME " + firstname);
        String lastname = request.getParameter("lastname");
        String sex = request.getParameter("sex");
        String attendance = request.getParameter("attendance");
        String username = request.getParameter("username");

        boolean markattendance = teacher.MarkTeacherAttendance(firstname, lastname, sex, attendance, username);
        if (markattendance == true) {
            value = "success";
            System.out.println(markattendance);
            model.setViewName("TeacherAttendancePage");

        }
        return value;
    }
    
    
    

    @RequestMapping(value = "/teacherreviews", method = {RequestMethod.GET, RequestMethod.POST})
    public ModelAndView TeacheReviewsPage(ModelAndView model, @RequestParam(defaultValue = "1") int page_num) {
        model.addObject("title", "SMS");
        List<Teacher> getAllTeacher = teacher.GetAllTeachers("");
        int total = getAllTeacher.size();
        String link = "/managementsystem/teacherreviews" + "?page_num=";
        Pagination pg = new Pagination(page_num, total);
        String limit = pg.getLimit();
        List<Teacher> getAllTeachers = teacher.GetAllTeachers(limit);
        pg.setLink(link);
        String pages = pg.getControls();
        model.addObject("pagination", pages);
        model.addObject("getAllTeachers", getAllTeachers);
        model.setViewName("TeacherReviews");
        return model;
    }
    
    
    
    
    

    @RequestMapping(value = "/teacherreviewpage/{username}", method = {RequestMethod.GET})
    public ModelAndView ReviewPage(ModelAndView model, @PathVariable String username) {
        String presentattendance = teacher.SelectAttendanceCount(username);
        String absentattendance = teacher.SelectAttendanceCountForAbsent(username);
        String complaincount = userinterface.getMessagesSentForTeacher(username);
        String commentcount = userinterface.getCommentsSentForTeacher(username);
        List<Subject> getTeacherAverage = userinterface.getAverageForTeacher(username);
        model.addObject("getTeacherAverage", getTeacherAverage);
        model.addObject("title", "SMS");
        model.addObject("commentcount", commentcount);
        model.addObject("complaincount", complaincount);
        model.addObject("absentattendance", absentattendance);
        model.addObject("presentattendance", presentattendance);
        model.addObject("username", username);
        model.setViewName("ReviewsPage");
        return model;
    }
    
    
    

    @RequestMapping(value = "/commentmessage/{firstname}/{lastname}/{username}", method = {RequestMethod.GET})
    public ModelAndView CommentPage(ModelAndView model, @PathVariable String firstname, @PathVariable String lastname, @PathVariable String username) {
        model.addObject("firstname", firstname);
        model.addObject("lastname", lastname);
        model.addObject("username", username);
        model.addObject("title", "SMS");
        model.setViewName("CommentPage");
        return model;
    }

    @ResponseBody
    @RequestMapping(value = "/comments", method = {RequestMethod.GET, RequestMethod.POST})
    public String CommentFormPage(ModelAndView model, HttpServletRequest request) {
        Authentication auth = SecurityContextHolder.getContext().getAuthentication();
        String username = auth.getName();
        String value = "false";
        String message = request.getParameter("message");
        String aboutwho = request.getParameter("username");

        boolean notecomments = teacher.NoteComments(username, message, aboutwho);
        if (notecomments == true) {
            value = "success";
        }
        model.setViewName("CommentPage");
        return value;
    }
    
    

    @ResponseBody
    @RequestMapping(value = "/deleteparent", method = {RequestMethod.GET, RequestMethod.POST})
    public String DeleteParentForAdmin(HttpServletRequest req) {
        Authentication auth = SecurityContextHolder.getContext().getAuthentication();
        String usernm = auth.getName();
        String message = "failed";
        String getFilesArray = req.getParameter("array");
        String myArray[] = getFilesArray.split(",");
        int arry[] = parent.deleteParentForAdmin(myArray);
        System.out.println(">>>>>>>>>>>?????????????? " + arry.length);
        if (arry.length > 0) {
            message = "success";

        }

        return message;
    }

    @ResponseBody
    @RequestMapping(value = "/submitteacherattendance", method = {RequestMethod.GET, RequestMethod.POST})
    public String SubmitTeacherAttendance() {
        String value = "failed";
        ModelAndView model = new ModelAndView();
        boolean RefreshAttendance = userinterface.UpdateTeacherAttendance();
        if (RefreshAttendance = true) {
            value = "success";
            model.setViewName("TeacherAttendancePage");
        }
        return value;
    }

    @RequestMapping(value = "/nonteaching", method = {RequestMethod.GET})
    public ModelAndView NonTeachingStaffRegisterPage(ModelAndView model,@RequestParam(defaultValue = "1") int page_num) {
        List<NonTeaching> getAllNonTeachingStaffs = userinterface.getAllNonTeachingStaff("");
         int total = getAllNonTeachingStaffs.size();
        String link = "/managementsystem/nonteaching" + "?page_num=";
        Pagination pg = new Pagination(page_num, total);
        String limit = pg.getLimit();
        List<NonTeaching> getAllNonTeachingStaff = userinterface.getAllNonTeachingStaff(limit);
        pg.setLink(link);
        String pages = pg.getControls();
        model.addObject("title", "SMS");
        model.addObject("pagination", pages);
        model.addObject("getAllNonTeachingStaff", getAllNonTeachingStaff);
        model.setViewName("NonTeachingPage");
        return model;
    }

    @ResponseBody
    @RequestMapping(value = "/addnewstaff", method = {RequestMethod.GET, RequestMethod.POST})
    public String NonTeachingStaffRegisteration(ModelAndView model, HttpServletRequest request) {
        String value = "failed";
        String firstname = request.getParameter("firstname");
        String lastname = request.getParameter("lastname");
        String department = request.getParameter("department");
        String position = request.getParameter("position");
        String Age = request.getParameter("age");
        String datejoined = request.getParameter("datejoined");
        String sex = request.getParameter("sex");

        boolean RegisterStaff = userinterface.RegisterNonTeaching(firstname, lastname, department, position, Age, datejoined, sex);
        if (RegisterStaff == true) {
            value = "success";

        }
        model.setViewName("NonTeachingPage");
        return value;
    }
    
    
    
    
    
    

    @ResponseBody
    @RequestMapping(value = "/deletestaff", method = {RequestMethod.GET, RequestMethod.POST})
    public String DeleteNonTeachingStaffForAdmin(HttpServletRequest req) {
        Authentication auth = SecurityContextHolder.getContext().getAuthentication();
        String usernm = auth.getName();
        String message = "failed";
        String getFilesArray = req.getParameter("array");
        String myArray[] = getFilesArray.split(",");
        int arry[] = userinterface.deleteNonTeachingStaffForAdmin(myArray);
        System.out.println(">>>>>>>>>>>?????????????? " + arry.length);
        if (arry.length > 0) {
            message = "success";

        }

        return message;
    }

    @ResponseBody
    @RequestMapping(value = "/addnewclass", method = {RequestMethod.GET, RequestMethod.POST})
    public String StaffDetailsManagementPage(ModelAndView model, HttpServletRequest request) {
        String value = "failed";
        String classname = request.getParameter("classname");
        boolean createclass = userinterface.CreateSchoolClass(classname);
        if (createclass == true) {
            value = "success";
        }
        model.setViewName("ClassManagement");
        return value;
    }
    
    
    

    @RequestMapping(value = "/classmanagement", method = {RequestMethod.GET, RequestMethod.POST})
    public ModelAndView ClassManagementPage(ModelAndView model) {
        List<Classess> getAllClassess = userinterface.getAllSchoolClassess();
        model.addObject("getAllClassess", getAllClassess);
        model.addObject("title", "SMS");
        model.setViewName("ClassManagement");
        return model;
    }
    
    
    
    
    
    

    @ResponseBody
    @RequestMapping(value = "/deleteclass", method = {RequestMethod.GET, RequestMethod.POST})
    public String DeleteStudentClassForAdmin(HttpServletRequest req) {
        Authentication auth = SecurityContextHolder.getContext().getAuthentication();
        String usernm = auth.getName();
        String message = "failed";
        String getFilesArray = req.getParameter("array");
        String myArray[] = getFilesArray.split(",");
        int arry[] = userinterface.deleteClassForAdmin(myArray);
        System.out.println(">>>>>>>>>>>?????????????? " + arry.length);
        if (arry.length > 0) {
            message = "success";

        }

        return message;
    }

    
    
    
    
    
    
      @RequestMapping(value = "/getclassdetails/{classname}", method = RequestMethod.GET)
    public ModelAndView GetClassDetailsForAdmin(@PathVariable String classname) {
        ModelAndView model = new ModelAndView();
        String classteacher = userinterface.getClassTeacherForAdmin(classname);
        List<Student>  getClassStudents = userinterface.getClassStudentsForAdmin(classname);
          System.out.println("getClassStudents + " + getClassStudents);
        if(getClassStudents.isEmpty()){
        model.addObject("error", "No Student or Teacher registered to class");
        }
        model.addObject("getClassStudents", getClassStudents);
        model.addObject("classteacher", classteacher);
        model.addObject("classname", classname);
        model.addObject("title", "SMS");
        model.setViewName("ClassDetailsPage");
        return model;

    }
    
    
    
    
    
    
      @RequestMapping(value = "/logout", method = {RequestMethod.GET})
    public String logoutPage(HttpServletRequest request, HttpServletResponse response) {
        Authentication auth = SecurityContextHolder.getContext().getAuthentication();

        
        if (auth != null) {
            new SecurityContextLogoutHandler().logout(request, response, auth);
            System.out.println("DEBUGGING!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!");
            String username = auth.getName();
            System.out.println("USERNAME!!!!!!!!!!!!!!!!!!!!!" + username);
           
        }

        return "redirect:/logout";
    }
    
    
   
    
    
    
    
    
    
    @RequestMapping(value="/searchparentforadmin",method={RequestMethod.POST,RequestMethod.GET})
    public ModelAndView SearchParentForAdmin(HttpServletRequest request,ModelAndView model){
    String value = "failed";
    String email = request.getParameter("email");
        System.out.println("GOT HERE!!");
    List<ParentModel> SearchParent = userinterface.searchParentForAdmin(email);
    model.addObject("SearchParent", SearchParent);
    model.setViewName("ParentManagementTwo");
    return model;
    }
    
    
    
    
    
    
    
    
      @RequestMapping(value = "/viewchildren/{firstname}/{lastname}/{username}/{email}", method = {RequestMethod.GET, RequestMethod.POST})
       public ModelAndView ViewChildrenPage(ModelAndView model,@PathVariable String firstname,
               @PathVariable String lastname,@PathVariable String username,@PathVariable String email) {
           
           List<Student> getChildList = parent.getMyChildList(username);
           model.addObject("getChildList", getChildList);
           model.addObject("firstname", firstname);
           model.addObject("lastname", lastname);
           model.addObject("username", username);
           model.addObject("email", email);
        model.setViewName("ViewChildren");
        return model;
    }
    
//       
//       @RequestMapping(value="/studentreport/{firstname}/{lastname}/{studentclass}",method={RequestMethod.GET,RequestMethod.POST})
//       public ModelAndView StudentReportPageForAdmin(ModelAndView model,@PathVariable String firstname,
//               @PathVariable String lastname,@PathVariable String studentclass){
//           
//           model.setViewName("StudentAdminReport");
//       return model;
//       }
       
       
       
       
       @RequestMapping(value="/parentforum",method={RequestMethod.GET})
       public ModelAndView ParentForumPage(ModelAndView model) {
       
       model.setViewName("ParentForumPage");
       return model;
       }
    
       
            
       @RequestMapping(value="/newlanding",method={RequestMethod.GET})
       public ModelAndView NewIndexPage(ModelAndView model) {
       
       model.setViewName("newlanding");
       return model;
       }
       
  
    
}
