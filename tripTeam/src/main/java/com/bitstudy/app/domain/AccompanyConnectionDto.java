package com.bitstudy.app.domain;

public class AccompanyConnectionDto {
    private int accompanyConnectionNo;
    private int accompanyNo;
    private String accompanyTitle;
    private String accompanyWriter;
    private String accompanyPickApyUser;
    private boolean accompanyYN;


    public int getAccompanyConnectionNo() {
        return accompanyConnectionNo;
    }

    public void setAccompanyConnectionNo(int accompanyConnectionNo) {
        this.accompanyConnectionNo = accompanyConnectionNo;
    }

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

    public boolean isAccompanyYN() {
        return accompanyYN;
    }

    public void setAccompanyYN(boolean accompanyYN) {
        this.accompanyYN = accompanyYN;
    }

    public AccompanyConnectionDto() {
    }

    public AccompanyConnectionDto(int accompanyNo, String accompanyTitle, String accompanyWriter, String accompanyPickApyUser, boolean accompanyYN) {
        this.accompanyNo = accompanyNo;
        this.accompanyTitle = accompanyTitle;
        this.accompanyWriter = accompanyWriter;
        this.accompanyPickApyUser = accompanyPickApyUser;
        this.accompanyYN = accompanyYN;
    }

    @Override
    public String toString() {
        return "AccompanyConnectionDto{" +
                "accompanyConnectionNo=" + accompanyConnectionNo +
                ", accompanyNo=" + accompanyNo +
                ", accompanyTitle='" + accompanyTitle + '\'' +
                ", accompanyWriter='" + accompanyWriter + '\'' +
                ", accompanyPickApyUser='" + accompanyPickApyUser + '\'' +
                ", accompanyYN=" + accompanyYN +
                '}';
    }
}
