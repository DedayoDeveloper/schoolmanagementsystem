/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.school.managementsystem.model;

/**
 *
 * @author oreoluwa
 */
public class Subject {
    
    private String subjectname;
    private String classteaching;
    private String aboveaverage;
    private String belowaverage;
    private String department;
    private String teacher;

    public String getSubjectname() {
        return subjectname;
    }

    public void setSubjectname(String subjectname) {
        this.subjectname = subjectname;
    }

    public String getClassteaching() {
        return classteaching;
    }

    public void setClassteaching(String classteaching) {
        this.classteaching = classteaching;
    }

    public String getAboveaverage() {
        return aboveaverage;
    }

    public void setAboveaverage(String aboveaverage) {
        this.aboveaverage = aboveaverage;
    }

    public String getBelowaverage() {
        return belowaverage;
    }

    public void setBelowaverage(String belowaverage) {
        this.belowaverage = belowaverage;
    }

    public String getDepartment() {
        return department;
    }

    public void setDepartment(String department) {
        this.department = department;
    }

    public String getTeacher() {
        return teacher;
    }

    public void setTeacher(String teacher) {
        this.teacher = teacher;
    }
    
    
    
    
}
