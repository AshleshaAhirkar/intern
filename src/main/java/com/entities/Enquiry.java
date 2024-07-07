package com.entities;

import java.util.Date;
import java.util.Random;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "enquiry")
public class Enquiry {
    @Id
    private int id;
    private String name;
    private String mobile;
    private String email;
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

    public String getCourse() {
        return course;
    }

    public void setCourse(String course) {
        this.course = course;
    }

    public Enquiry(String name, String mobile, String email, String course) {
        super();
        this.id = new Random().nextInt(100000);
        this.name = name;
        this.mobile = mobile;
        this.email = email;
        this.course = course;
    }

    public Enquiry() {
        super();
}
}

