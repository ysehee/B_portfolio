package com.bitstudy.app.domain;

public class PackageCardDto {
    private int packageNo;
    private String packageId;
    private String packageType;
    private String packageCategory;
    private String packageLocation;
    private String packageImg;
    private String packageTitle;
    private String packagePrice;
    private String packageStartDate;

    public PackageCardDto() {
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

    public String getPackageType() {
        return packageType;
    }

    public void setPackageType(String packageType) {
        this.packageType = packageType;
    }

    public String getPackageCategory() {
        return packageCategory;
    }

    public void setPackageCategory(String packageCategory) {
        this.packageCategory = packageCategory;
    }

    public String getPackageLocation() {
        return packageLocation;
    }

    public void setPackageLocation(String packageLocation) {
        this.packageLocation = packageLocation;
    }

    public String getPackageImg() {
        return packageImg;
    }

    public void setPackageImg(String packageImg) {
        this.packageImg = packageImg;
    }

    public String getPackageTitle() {
        return packageTitle;
    }

    public void setPackageTitle(String packageTitle) {
        this.packageTitle = packageTitle;
    }

    public String getPackagePrice() {
        return packagePrice;
    }

    public void setPackagePrice(String packagePrice) {
        this.packagePrice = packagePrice;
    }

    public String getPackageStartDate() {
        return packageStartDate;
    }

    public void setPackageStartDate(String packageStartDate) {
        this.packageStartDate = packageStartDate;
    }

    @Override
    public String toString() {
        return "PackageCardDto{" +
                "packageNo=" + packageNo +
                ", packageId='" + packageId + '\'' +
                ", packageType='" + packageType + '\'' +
                ", packageCategory='" + packageCategory + '\'' +
                ", packageLocation='" + packageLocation + '\'' +
                ", packageImg='" + packageImg + '\'' +
                ", packageTitle='" + packageTitle + '\'' +
                ", packagePrice='" + packagePrice + '\'' +
                ", packageStartDate='" + packageStartDate + '\'' +
                '}';
    }
}
