package com.bitstudy.app.domain;

public class AccompanyLikeDto {
    private int accompanyLikeNo;
    private int accompanyNo;
    private String accompanyLikeUser;

    public int getAccompanyLikeNo() {
        return accompanyLikeNo;
    }

    public void setAccompanyLikeNo(int accompanyLikeNo) {
        this.accompanyLikeNo = accompanyLikeNo;
    }

    public int getAccompanyNo() {
        return accompanyNo;
    }

    public void setAccompanyNo(int accompanyNo) {
        this.accompanyNo = accompanyNo;
    }

    public String getAccompanyLikeUser() {
        return accompanyLikeUser;
    }

    public void setAccompanyLikeUser(String accompanyLikeUser) {
        this.accompanyLikeUser = accompanyLikeUser;
    }

    public AccompanyLikeDto() {
    }

    public AccompanyLikeDto(int accompanyNo, String accompanyLikeUser) {
        this.accompanyNo = accompanyNo;
        this.accompanyLikeUser = accompanyLikeUser;
    }

    @Override
    public String toString() {
        return "AccompanyLikeDto{" +
                "accompanyLikeNo=" + accompanyLikeNo +
                ", accompanyNo=" + accompanyNo +
                ", accompanyLikeUser='" + accompanyLikeUser + '\'' +
                '}';
    }
}
