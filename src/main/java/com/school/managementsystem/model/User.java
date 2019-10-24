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
public class User {

    private String role;
    private String usertypename;
    private String urlmapping;
     private String username;
    private String password;
    private String complain;
    


    public String getComplain() {
        return complain;
    }

    public void setComplain(String complain) {
        this.complain = complain;
    }
    
    
    

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getLabeltitle() {
        return labeltitle;
    }

    public void setLabeltitle(String labeltitle) {
        this.labeltitle = labeltitle;
    }

    public String getFirstname() {
        return firstname;
    }

    public void setFirstname(String firstname) {
        this.firstname = firstname;
    }

    public String getSurname() {
        return surname;
    }

    public void setSurname(String surname) {
        this.surname = surname;
    }

    public String getPhonenumber() {
        return phonenumber;
    }

    public void setPhonenumber(String phonenumber) {
        this.phonenumber = phonenumber;
    }

    public String getDate() {
        return date;
    }

    public void setDate(String date) {
        this.date = date;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getPageid() {
        return pageid;
    }

    public void setPageid(String pageid) {
        this.pageid = pageid;
    }
    private String label;
    private String labelicon;
    private String labeltitle;
    private String firstname, surname, phonenumber, date, id , lastname, sex, department,classassigned;
    private String pageid;

    public String getLastname() {
        return lastname;
    }

    public void setLastname(String lastname) {
        this.lastname = lastname;
    }

    public String getSex() {
        return sex;
    }

    public void setSex(String sex) {
        this.sex = sex;
    }

    public String getDepartment() {
        return department;
    }

    public void setDepartment(String department) {
        this.department = department;
    }

    public String getClassassigned() {
        return classassigned;
    }

    public void setClassassigned(String classassigned) {
        this.classassigned = classassigned;
    }

    
    
    
    public String getRole() {
        return role;
    }

    public void setRole(String role) {
        this.role = role;
    }

    public String getUsertypename() {
        return usertypename;
    }

    public void setUsertypename(String usertypename) {
        this.usertypename = usertypename;
    }

    public String getUrlmapping() {
        return urlmapping;
    }

    public void setUrlmapping(String urlmapping) {
        this.urlmapping = urlmapping;
    }

    public String getLabel() {
        return label;
    }

    public void setLabel(String label) {
        this.label = label;
    }

    public String getLabelicon() {
        return labelicon;
    }

    public void setLabelicon(String labelicon) {
        this.labelicon = labelicon;
    }

}
