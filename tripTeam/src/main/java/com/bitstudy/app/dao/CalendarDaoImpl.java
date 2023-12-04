package com.bitstudy.app.dao;

import com.bitstudy.app.domain.PackageDto;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.ui.Model;

import javax.sql.DataSource;
import java.time.LocalDate;
import java.util.*;

@Repository
public class CalendarDaoImpl implements CalendarDao {

    @Autowired
    DataSource ds;

    @Autowired
    SqlSession session;

    String namespace="com.bitstudy.app.dao.calendarMapper.";

    /* ************ select 시작 ************ */
    // category, location, startdate를 입력하면 그에 맞는 정보 불러오기
    // 일단 2023.11.15 09:19 현재 category, startdate 만 입력하게 해놓음
    @Override
    public PackageDto selectPackage(String packageCategory, String packageLocation, String packageStartDate) {
        try {
            Map map = new HashMap();
            map.put("packageCategory", packageCategory);
            map.put("packageCategory", packageLocation);
            map.put("packageStartDate", packageStartDate);

            return session.selectOne(namespace + "select", map);
        } catch (Exception e) {
            // 예외가 발생하면 테스트 실패
            System.out.println("Exception thrown: " + e.getMessage());
            throw new RuntimeException(e);
        }
    }

    /* ******************************************** */
    /* ********** select-달력에 가격 매칭하기 ********** */
    /* ******************************************** */
    public List<PackageDto> selectPriceList(String packageId) {
        List<PackageDto> resultList = session.selectList("getPriceList", packageId);

        return resultList;
    }


    /* ************ insert 시작 ************ */
    public int insertPackage(PackageDto packageDto) {
        return session.insert(namespace + "insert", packageDto);
    }
}
