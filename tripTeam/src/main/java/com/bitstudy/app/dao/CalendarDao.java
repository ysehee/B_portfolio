package com.bitstudy.app.dao;

import com.bitstudy.app.domain.PackageDto;
import org.springframework.ui.Model;

import java.time.LocalDate;
import java.util.Date;
import java.util.List;
import java.util.Map;

public interface CalendarDao {
    /* ************ select 시작 ************ */
    // category, location, startdate를 입력하면 그에 맞는 정보 불러오기
    // 일단 2023.11.15 09:19 현재 category, startdate 만 입력하게 해놓음
    PackageDto selectPackage(String packageCategory, String packageLocation, String packageStartDate);

    public  List<PackageDto> selectPriceList(String packageId);

    public int insertPackage(PackageDto packageDto);
}
