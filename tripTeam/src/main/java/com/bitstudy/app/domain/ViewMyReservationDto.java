package com.bitstudy.app.domain;

public class ViewMyReservationDto {
    private int packageNo;
    private String packageId;
    private String packageTheme;
    private String packageStartDate;
    private String packagePrice;

    public ViewMyReservationDto() {
    }

    public int getPackageNo() {
        return packageNo;
    }

    public void setPackageNo(int packageNo) {
        this.packageNo = packageNo;
    }

    public String getPackageId() {
        return packageId;
    }

    public void setPackageId(String packageId) {
        this.packageId = packageId;
    }

    public String getPackageTheme() {
        return packageTheme;
    }

    public void setPackageTheme(String packageTheme) {
        this.packageTheme = packageTheme;
    }

    public String getPackageStartDate() {
        return packageStartDate;
    }

    public void setPackageStartDate(String packageStartDate) {
        this.packageStartDate = packageStartDate;
    }

    public String getPackagePrice() {
        return packagePrice;
    }

    public void setPackagePrice(String packagePrice) {
        this.packagePrice = packagePrice;
    }


    @Override
    public String toString() {
        return "ViewMyReservaionDto{" +
                "packageNo=" + packageNo +
                ", packageId='" + packageId + '\'' +
                ", packageTheme='" + packageTheme + '\'' +
                ", packageStartDate='" + packageStartDate + '\'' +
                ", packagePrice='" + packagePrice + '\'' +
                '}';
    }
}
