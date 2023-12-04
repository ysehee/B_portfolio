package com.bitstudy.app.domain;

import java.time.LocalDate;
import java.util.Date;

public class PackageDto {
    private int packageNo;
    private String packageType;
    private String packageId;
    private String packageCategory;
    private String packageLocation;
    private String packageTheme;
    private String packageStartDate;
    private String packagePrice;
    private Date packageRegDate;
    private Date packageUpdate;

    public PackageDto() {
    }

    public PackageDto(String packageCategory, String packageLocation, String packageStartDate) {
        this.packageCategory = packageCategory;

        this.packageStartDate = packageStartDate;
    }

    public PackageDto(String packageId, String packageCategory, String packageLocation, String packageStartDate, String packagePrice) {
        this.packageId = packageId;
        this.packageCategory = packageCategory;
        this.packageLocation = packageLocation;
        this.packageStartDate = packageStartDate;
        this.packagePrice = packagePrice;
    }

    public int getPackageNo() {
        return packageNo;
    }

    public void setPackageNo(int packageNo) {
        this.packageNo = packageNo;
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

    public Date getPackageRegDate() {
        return packageRegDate;
    }

    public void setPackageRegDate(Date packageRegDate) {
        this.packageRegDate = packageRegDate;
    }

    public Date getPackageUpdate() {
        return packageUpdate;
    }

    public void setPackageUpdate(Date packageUpdate) {
        this.packageUpdate = packageUpdate;
    }

    @Override
    public String toString() {
        return "PackageDto{" +
                "packageNo=" + packageNo +
                ", packageId='" + packageId + '\'' +
                ", packageCategory='" + packageCategory + '\'' +
                ", packageLocation='" + packageLocation + '\'' +
                ", packageStartDate=" + packageStartDate +
                ", packagePrice=" + packagePrice +
                ", packageRegDate=" + packageRegDate +
                ", packageUpdate=" + packageUpdate +
                '}';
    }
}
