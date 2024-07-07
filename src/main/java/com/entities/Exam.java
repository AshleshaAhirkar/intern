package com.entities;

import java.util.Date;
import java.util.Random;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "exams")
public class Exam {
    @Id
    private int id;
    private String name;
    private Date dob;
    private String mobile;
    private String email;
    private String aadharCardNumber;
    private String address;
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

    public Date getDob() {
        return dob;
    }

    public void setDob(Date dob) {
        this.dob = dob;
    }

    public String getMobile() {
        return mobile;
    }

    public void setMobile(String mobile) {
        this.mobile = mobile;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getAadharCardNumber() {
        return aadharCardNumber;
    }

    public void setAadharCardNumber(String aadharCardNumber) {
        this.aadharCardNumber = aadharCardNumber;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
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

    public Exam(String name, Date dob, String mobile, String email, String aadharCardNumber, String address, String city, String state, String course) {
        super();
        this.id = new Random().nextInt(100000);
        this.name = name;
        this.dob = dob;
        this.mobile = mobile;
        this.email = email;
        this.aadharCardNumber = aadharCardNumber;
        this.address = address;
        this.city = city;
        this.state = state;
        this.course = course;
    }

    public Exam() {
        super();

    }
}
