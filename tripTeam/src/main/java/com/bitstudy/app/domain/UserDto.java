package com.bitstudy.app.domain;

import org.springframework.format.annotation.DateTimeFormat;

import javax.xml.crypto.Data;

public class UserDto {
    private Integer userNo;

    private String userId;
    private String userPw;
    private String userName;
    private String userGender;
    /*@DateTimeFormat(pattern = "yyyy-MM-dd")*/
    private String userBirth;

    private String userPhoneNo;
    private String userEmail;

//    private String userSns;

    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private Data userRegDate;



    public UserDto() {
    }

    public UserDto(String userId, String userPw, String userName, String userGender, String userBirth, String userPhoneNo, String userEmail/*String userSns*/) {
        this.userId = userId;
        this.userPw = userPw;
        this.userName = userName;
        this.userGender = userGender;
        this.userBirth = userBirth;
        this.userPhoneNo = userPhoneNo;
        this.userEmail = userEmail;
//        this.userSns = userSns;
    }

    public Integer getUserNo() {
        return userNo;
    }

    public void setUserNo(Integer userNo) {
        this.userNo = userNo;
    }

    public String getUserId() {
        return userId;
    }

    public void setUserId(String userId) {
        this.userId = userId;
    }

    public String getUserPw() {
        return userPw;
    }

    public void setUserPw(String userPw) {
        this.userPw = userPw;
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public String getUserGender() {
        return userGender;
    }

    public void setUserGender(String userGender) {
        this.userGender = userGender;
    }

    public String getUserBirth() {
        return userBirth;
    }

    public void setUserBirth(String userBirth) {
        this.userBirth = userBirth;
    }

    public String getUserPhoneNo() {
        return userPhoneNo;
    }

    public void setUserPhoneNo(String userPhoneNo) {
        this.userPhoneNo = userPhoneNo;
    }

    public String getUserEmail() {
        return userEmail;
    }

    public void setUserEmail(String userEmail) {
        this.userEmail = userEmail;
    }

    public Data getUserRegDate() {
        return userRegDate;
    }

    public void setUserRegDate(Data userRegDate) {
        this.userRegDate = userRegDate;
    }

    @Override
    public String toString() {
        return "userDto{" +
                "userNo=" + userNo +
                ", userId='" + userId + '\'' +
                ", userPw='" + userPw + '\'' +
                ", userName='" + userName + '\'' +
                ", userGender='" + userGender + '\'' +
                ", userBirth=" + userBirth +
                ", userPhoneNo='" + userPhoneNo + '\'' +
                ", userEmail='" + userEmail + '\'' +
                ", userRegDate=" + userRegDate +
                '}';
    }
}
