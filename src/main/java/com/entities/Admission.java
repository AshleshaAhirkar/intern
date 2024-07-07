package com.entities;

import java.util.Date;
import java.util.Random;


import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "admissions")
public class Admission {
    @Id
    private int id;
    private String name;
    private String address;
    private String mobile;
    private Date dob;
    private String education;
    private String email;
    private String city;
    private String state;
    private String course;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getMobile() {
        return mobile;
    }

    public void setMobile(String mobile) {
        this.mobile = mobile;
    }

    public Date getDob() {
        return dob;
    }

    public void setDob(Date dob) {
        this.dob = dob;
    }

    public String getEducation() {
        return education;
    }

    public void setEducation(String education) {
        this.education = education;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getCity() {
        return city;
    }

    public void setCity(String city) {
        this.city = city;
    }

    public String getState() {
        return state;
    }

    public void setState(String state) {
        this.state = state;
    }

    public String getCourse() {
        return course;
    }

    public void setCourse(String course) {
        this.course = course;
    }

    public Admission(String name, String address, String mobile, Date dob, String education, String email, String city, String state, String course) {
        super();
        this.id = new Random().nextInt(100000);
        this.name = name;
        this.address = address;
        this.mobile = mobile;
        this.dob = dob;
        this.education = education;
        this.email = email;
        this.city = city;
        this.state = state;
        this.course = course;
    }

    public Admission() {
        super(); 
}
}