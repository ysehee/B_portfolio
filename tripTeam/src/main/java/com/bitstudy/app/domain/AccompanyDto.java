package com.bitstudy.app.domain;

import org.springframework.format.annotation.DateTimeFormat;

import java.util.Date;

public class AccompanyDto {
    private int accompanyNo;
    private String accompanyTitle;
    private String accompanyContent;
    private int accompanyRecruit;
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private Date accompanyTripStartDate;
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private Date accompanyTripEndDate;
    private String accompanyArea;
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private Date accompanyRegDate;
    private int accompanyLikeCnt;
    private int accompanyViewCnt;
    private String accompanyWriter;
    private String accompanyImg;

    public int getAccompanyNo() {
        return accompanyNo;
    }

    public void setAccompanyNo(int accompanyNo) {
        this.accompanyNo = accompanyNo;
    }

    public String getAccompanyTitle() {
        return accompanyTitle;
    }

    public void setAccompanyTitle(String accompanyTitle) {
        this.accompanyTitle = accompanyTitle;
    }

    public String getAccompanyContent() {
        return accompanyContent;
    }

    public void setAccompanyContent(String accompanyContent) {
        this.accompanyContent = accompanyContent;
    }

    public String getAccompanyImg() {
        return accompanyImg;
    }

    public void setAccompanyImg(String accompanyImg) {
        this.accompanyImg = accompanyImg;
    }

    public int getAccompanyRecruit() {
        return accompanyRecruit;
    }

    public void setAccompanyRecruit(int accompanyRecruit) {
        this.accompanyRecruit = accompanyRecruit;
    }

    public Date getAccompanyTripStartDate() {
        return accompanyTripStartDate;
    }

    public void setAccompanyTripStartDate(Date accompanyTripStartDate) {
        this.accompanyTripStartDate = accompanyTripStartDate;
    }

    public Date getAccompanyTripEndDate() {
        return accompanyTripEndDate;
    }

    public void setAccompanyTripEndDate(Date accompanyTripEndDate) {
        this.accompanyTripEndDate = accompanyTripEndDate;
    }

    public String getAccompanyArea() {
        return accompanyArea;
    }

    public void setAccompanyArea(String accompanyArea) {
        this.accompanyArea = accompanyArea;
    }

    public Date getAccompanyRegDate() {
        return accompanyRegDate;
    }

    public void setAccompanyRegDate(Date accompanyRegDate) {
        this.accompanyRegDate = accompanyRegDate;
    }

    public int getAccompanyLikeCnt() {
        return accompanyLikeCnt;
    }

    public void setAccompanyLikeCnt(int accompanyLikeCnt) {
        this.accompanyLikeCnt = accompanyLikeCnt;
    }

    public int getAccompanyViewCnt() {
        return accompanyViewCnt;
    }

    public void setAccompanyViewCnt(int accompanyViewCnt) {
        this.accompanyViewCnt = accompanyViewCnt;
    }

    public String getAccompanyWriter() {
        return accompanyWriter;
    }

    public void setAccompanyWriter(String accompanyWriter) {
        this.accompanyWriter = accompanyWriter;
    }

    public AccompanyDto() {
    }

    public AccompanyDto(String accompanyTitle, String accompanyContent, int accompanyRecruit, Date accompanyTripStartDate, Date accompanyTripEndDate, String accompanyArea, Date accompanyRegDate) {
        this.accompanyTitle = accompanyTitle;
        this.accompanyContent = accompanyContent;
        this.accompanyRecruit = accompanyRecruit;
        this.accompanyTripStartDate = accompanyTripStartDate;
        this.accompanyTripEndDate = accompanyTripEndDate;
        this.accompanyArea = accompanyArea;
        this.accompanyRegDate = accompanyRegDate;
    }

    public AccompanyDto(String accompanyTitle, String accompanyContent, int accompanyRecruit, Date accompanyTripStartDate, String accompanyArea, Date accompanyRegDate, String accompanyImg) {
        this.accompanyTitle = accompanyTitle;
        this.accompanyContent = accompanyContent;
        this.accompanyRecruit = accompanyRecruit;
        this.accompanyTripStartDate = accompanyTripStartDate;
        this.accompanyArea = accompanyArea;
        this.accompanyRegDate = accompanyRegDate;
        this.accompanyImg = accompanyImg;
    }

    public AccompanyDto(String accompanyTitle, String accompanyContent, int accompanyRecruit, String accompanyArea, String accompanyWriter) {
        this.accompanyTitle = accompanyTitle;
        this.accompanyContent = accompanyContent;
        this.accompanyRecruit = accompanyRecruit;
        this.accompanyArea = accompanyArea;
        this.accompanyWriter = accompanyWriter;
    }

    @Override
    public String toString() {
        return "AccompanyDto{" +
                "accompanyNo=" + accompanyNo +
                ", accompanyTitle='" + accompanyTitle + '\'' +
                ", accompanyContent='" + accompanyContent + '\'' +
                ", accompanyRecruit=" + accompanyRecruit +
                ", accompanyTripStartDate=" + accompanyTripStartDate +
                ", accompanyTripEndDate=" + accompanyTripEndDate +
                ", accompanyArea='" + accompanyArea + '\'' +
                ", accompanyRegDate=" + accompanyRegDate +
                ", accompanyLikeCnt=" + accompanyLikeCnt +
                ", accompanyViewCnt=" + accompanyViewCnt +
                ", accompanyWriter='" + accompanyWriter + '\'' +
                ", accompanyImg='" + accompanyImg + '\'' +
                '}';
    }
}
