package com.bitstudy.app.service;

import com.bitstudy.app.dao.CalendarDao;
import com.bitstudy.app.domain.PackageDto;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.time.LocalDate;
import java.util.Date;
import java.util.List;
import java.util.Map;

@Service
public class CalendarService {

    @Autowired
    CalendarDao calendarDao;

    /* 특정 cateogry, startdate를 검색했을 때, 해당하는 패키지 불러오기  */
    public PackageDto getPackage (String packageCategory,String packageLocation, String packageStartDate) {
        return calendarDao.selectPackage(packageCategory, packageLocation, packageStartDate);
    }

    /* 특정 cateogry, startdate를 검색했을 때, 해당하는 패키지 불러오기  */
    public List<PackageDto> getPriceList (String packageId) {
        return calendarDao.selectPriceList(packageId);
    }


    /* 게시글 전체 불러오기 */
//    public List<PackageDto> getList() {
//        return calendarDao.selectAll();
//    }
}
