package com.bitstudy.app.domain;

import org.springframework.format.annotation.DateTimeFormat;

import java.util.Date;

public class AccompanyPickDto {
    private int accompanyPickNo;
    private int accompanyNo;
    private String accompanyWriter;
    private String accompanyPickApyUser;
    private String accompanyMessage;
    private Date accompanyApyDate;
    private Boolean accompanyYN;

    /////////////////////////////////////////////////////
    /* AccompanyDto 복붙*/
    private String accompanyTitle;
    private String accompanyContent;
    private int accompanyRecruit;
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private Date accompanyTripStartDate;
    private String accompanyArea;
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private Date accompanyRegDate;
    private int accompanyLikeCnt;
    private int accompanyViewCnt;

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

    public AccompanyPickDto(int accompanyNo, String accompanyWriter, String accompanyMessage, Date accompanyApyDate, Boolean accompanyYN, String accompanyTitle, String accompanyContent, int accompanyRecruit, Date accompanyTripStartDate, String accompanyArea, Date accompanyRegDate, int accompanyLikeCnt, int accompanyViewCnt) {
        this.accompanyNo = accompanyNo;
        this.accompanyWriter = accompanyWriter;
        this.accompanyMessage = accompanyMessage;
        this.accompanyApyDate = accompanyApyDate;
        this.accompanyYN = accompanyYN;
        this.accompanyTitle = accompanyTitle;
        this.accompanyContent = accompanyContent;
        this.accompanyRecruit = accompanyRecruit;
        this.accompanyTripStartDate = accompanyTripStartDate;
        this.accompanyArea = accompanyArea;
        this.accompanyRegDate = accompanyRegDate;
        this.accompanyLikeCnt = accompanyLikeCnt;
        this.accompanyViewCnt = accompanyViewCnt;
    }

    /////////////////////////////////////////////////////


    public int getAccompanyPickNo() {
        return accompanyPickNo;
    }

    public void setAccompanyPickNo(int accompanyPickNo) {
        this.accompanyPickNo = accompanyPickNo;
    }

    public int getAccompanyNo() {
        return accompanyNo;
    }

    public void setAccompanyNo(int accompanyNo) {
        this.accompanyNo = accompanyNo;
    }

    public String getAccompanyWriter() {
        return accompanyWriter;
    }

    public void setAccompanyWriter(String accompanyWriter) {
        this.accompanyWriter = accompanyWriter;
    }

    public String getAccompanyPickApyUser() {
        return accompanyPickApyUser;
    }

    public void setAccompanyPickApyUser(String accompanyPickApyUser) {
        this.accompanyPickApyUser = accompanyPickApyUser;
    }

    public String getAccompanyMessage() {
        return accompanyMessage;
    }

    public void setAccompanyMessage(String accompanyMessage) {
        this.accompanyMessage = accompanyMessage;
    }

    public Date getAccompanyApyDate() {
        return accompanyApyDate;
    }

    public void setAccompanyApyDate(Date accompanyApyDate) {
        this.accompanyApyDate = accompanyApyDate;
    }

    public Boolean getAccompanyYN() {
        return accompanyYN;
    }

    public void setAccompanyYN(Boolean accompanyYN) {
        this.accompanyYN = accompanyYN;
    }

    public AccompanyPickDto() {
    }

    public AccompanyPickDto(int accompanyNo, String accompanyWriter, String accompanyMessage, Date accompanyApyDate) {
        this.accompanyNo = accompanyNo;
        this.accompanyWriter = accompanyWriter;
        this.accompanyMessage = accompanyMessage;
        this.accompanyApyDate = accompanyApyDate;
    }

    @Override
    public String toString() {
        return "AccompanyPickDto{" +
                "accompanyPickNo=" + accompanyPickNo +
                ", accompanyNo=" + accompanyNo +
                ", accompanyWriter='" + accompanyWriter + '\'' +
                ", accompanyMessage='" + accompanyMessage + '\'' +
                ", accompanyApyDate=" + accompanyApyDate +
                ", accompanyYN=" + accompanyYN +
                '}';
    }
}
