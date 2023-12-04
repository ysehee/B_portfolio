package com.bitstudy.app.domain;

public class PackageContentDto {
    private int packageContentNo;
    private String packageType;
    private String packageId;
    private String packageImg;
    private String packageTitle;
    private String packageContent;

    public PackageContentDto() {
    }

    public int getPackageContentNo() {
        return packageContentNo;
    }

    public void setPackageContentNo(int packageContentNo) {
        this.packageContentNo = packageContentNo;
    }

    public String getPackageType() {
        return packageType;
    }

    public void setPackageType(String packageType) {
        this.packageType = packageType;
    }

    public String getPackageId() {
        return packageId;
    }

    public void setPackageId(String packageId) {
        this.packageId = packageId;
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

    public String getPackageContent() {
        return packageContent;
    }

    public void setPackageContent(String packageContent) {
        this.packageContent = packageContent;
    }
}
