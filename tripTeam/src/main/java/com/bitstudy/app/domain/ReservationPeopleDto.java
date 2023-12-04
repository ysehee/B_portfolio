package com.bitstudy.app.domain;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

/* 프론트에서 요청보낼 때 url
name1=목은빈&gender=여자&birthYear=1990&birthMonth=1&birthDay=1&nationality=대한민국&phone=010-1234-5678&email=aaa%40aaa.com
*/
public class ReservationPeopleDto {
    private Integer packageNo;
    private String userId;
    private String reservationName;
    private String reservationGender;
    private String reservationBirth;
    private String reservationNationality;
    private String reservationPhone;
    private String reservationEmail;
    private String packageStartDate;
    private Integer packagePrice;
    private Integer reservationTotalPrice;
    private String reservationPayMethod;
    private Date reservationPayDate;

//    private List<ReservationPeopleDto> reservationInfoList;

    public ReservationPeopleDto() {
    }

    public ReservationPeopleDto(String reservationName, String reservationGender, String reservationBirth, String reservationNationality, String reservationPhone, String reservationEmail) {
        this.reservationName = reservationName;
        this.reservationGender = reservationGender;
        this.reservationBirth = reservationBirth;
        this.reservationNationality = reservationNationality;
        this.reservationPhone = reservationPhone;
        this.reservationEmail = reservationEmail;
    }

//    public List<ReservationPeopleDto> getReservationInfoList() {
//        return reservationInfoList;
//    }
//
//    public void setReservationInfoList(List<ReservationPeopleDto> reservationInfoList) {
//        this.reservationInfoList = reservationInfoList;
//    }

    public Integer getPackageNo() {
        return packageNo;
    }

    public void setPackageNo(Integer packageNo) {
        this.packageNo = packageNo;
    }

    public String getUserId() {
        return userId;
    }

    public void setUserId(String userId) {
        this.userId = userId;
    }

    public String getReservationName() {
        return reservationName;
    }

    public void setReservationName(String reservationName) {
        this.reservationName = reservationName;
    }

    public String getReservationGender() {
        return reservationGender;
    }

    public void setReservationGender(String reservationGender) {
        this.reservationGender = reservationGender;
    }

    public String getReservationBirth() {
        return reservationBirth;
    }

    public void setReservationBirth(String reservationBirth) {
        this.reservationBirth = reservationBirth;
    }

    public String getReservationNationality() {
        return reservationNationality;
    }

    public void setReservationNationality(String reservationNationality) {
        this.reservationNationality = reservationNationality;
    }

    public String getReservationPhone() {
        return reservationPhone;
    }

    public void setReservationPhone(String reservationPhone) {
        this.reservationPhone = reservationPhone;
    }

    public String getReservationEmail() {
        return reservationEmail;
    }

    public void setReservationEmail(String reservationEmail) {
        this.reservationEmail = reservationEmail;
    }

    public String getPackageStartDate() {
        return packageStartDate;
    }

    public void setPackageStartDate(String packageStartDate) {
        this.packageStartDate = packageStartDate;
    }

    public Integer getPackagePrice() {
        return packagePrice;
    }

    public void setPackagePrice(Integer packagePrice) {
        this.packagePrice = packagePrice;
    }

    public Integer getReservationTotalPrice() {
        return reservationTotalPrice;
    }

    public void setReservationTotalPrice(Integer reservationTotalPrice) {
        this.reservationTotalPrice = reservationTotalPrice;
    }

    public String getReservationPayMethod() {
        return reservationPayMethod;
    }

    public void setReservationPayMethod(String reservationPayMethod) {
        this.reservationPayMethod = reservationPayMethod;
    }

    public Date getReservationPayDate() {
        return reservationPayDate;
    }

    public void setReservationPayDate(Date reservationPayDate) {
        this.reservationPayDate = reservationPayDate;
    }

    @Override
    public String toString() {
        return "ReservationPeopleDto{" +
                "packageNo=" + packageNo +
                ", userId='" + userId + '\'' +
                ", reservationName='" + reservationName + '\'' +
                ", reservationGender='" + reservationGender + '\'' +
                ", reservationBirth='" + reservationBirth + '\'' +
                ", reservationNationality='" + reservationNationality + '\'' +
                ", reservationPhone='" + reservationPhone + '\'' +
                ", reservationEmail='" + reservationEmail + '\'' +
                ", packageStartDate='" + packageStartDate + '\'' +
                ", packagePrice=" + packagePrice +
                ", reservationTotalPrice=" + reservationTotalPrice +
                ", reservationPayMethod='" + reservationPayMethod + '\'' +
                ", reservationPayDate=" + reservationPayDate +
                '}';
    }
}
