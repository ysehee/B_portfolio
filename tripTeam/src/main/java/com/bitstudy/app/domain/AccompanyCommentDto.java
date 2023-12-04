package com.bitstudy.app.domain;


import org.springframework.format.annotation.DateTimeFormat;

import java.util.Date;

public class AccompanyCommentDto {
    private int accompanyCommentNo;
    private int accompanyNo;
    private String accompanyCommentWriter;
    private String accompanyCommentContent;
    private Date accompanyCommentRegDate;

    public AccompanyCommentDto(){}

    public int getAccompanyCommentNo() {
        return accompanyCommentNo;
    }

    public void setAccompanyCommentNo(int accompanyCommentNo) {
        this.accompanyCommentNo = accompanyCommentNo;
    }

    public int getAccompanyNo() {
        return accompanyNo;
    }

    public void setAccompanyNo(int accompanyNo) {
        this.accompanyNo = accompanyNo;
    }

    public String getAccompanyCommentWriter() {
        return accompanyCommentWriter;
    }

    public void setAccompanyCommentWriter(String accompanyCommentWriter) {
        this.accompanyCommentWriter = accompanyCommentWriter;
    }

    public String getAccompanyCommentContent() {
        return accompanyCommentContent;
    }

    public void setAccompanyCommentContent(String accompanyCommentContent) {
        this.accompanyCommentContent = accompanyCommentContent;
    }

    public Date getAccompanyCommentRegDate() {
        return accompanyCommentRegDate;
    }

    public void setAccompanyCommentRegDate(Date accompanyCommentRegDate) {
        this.accompanyCommentRegDate = accompanyCommentRegDate;
    }

    ////////////////////////////////////////////////////////////////////////////

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
    private String accompanyWriter;


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

    public String getAccompanyWriter() {
        return accompanyWriter;
    }

    public void setAccompanyWriter(String accompanyWriter) {
        this.accompanyWriter = accompanyWriter;
    }


    ////////////////////////////////////////////////////////////////////////////

    public AccompanyCommentDto(int accompanyNo, String accompanyCommentWriter, String accompanyCommentContent, Date accompanyCommentRegDate) {
        this.accompanyNo = accompanyNo;
        this.accompanyCommentWriter = accompanyCommentWriter;
        this.accompanyCommentContent = accompanyCommentContent;
        this.accompanyCommentRegDate = accompanyCommentRegDate;
    }

    @Override
    public String toString() {
        return "AccompanyCommentDto{" +
                "accompanyCommentNo=" + accompanyCommentNo +
                ", accompanyNo=" + accompanyNo +
                ", accompanyCommentWriter='" + accompanyCommentWriter + '\'' +
                ", accompanyCommentContent='" + accompanyCommentContent + '\'' +
                ", accompanyCommentRegDate=" + accompanyCommentRegDate +
                '}';
    }
}
