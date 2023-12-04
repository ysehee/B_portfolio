package com.bitstudy.app.dao;

import com.bitstudy.app.domain.PackageCardDto;
import com.bitstudy.app.domain.PackageContentDto;
import com.bitstudy.app.domain.PackageDto;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import javax.sql.DataSource;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Repository
public class SearchPackageDao {
    @Autowired
    DataSource ds;

    @Autowired
    SqlSession session;

    String namespace="com.bitstudy.app.dao.searchPackageMapper.";

    /* ************ select  ************ */
    /* 모든 패키지 정보 및 검색 조건에 맞는 패키지 정보 가져오기 - 두가지를 한번에 처리하자 */
    public List<PackageCardDto> selectAllPackage(PackageCardDto packageCardDto) {
        Map map = new HashMap();
        map.put("category", packageCardDto.getPackageCategory());
        map.put("location", packageCardDto.getPackageLocation());
        map.put("startDate", packageCardDto.getPackageStartDate());

        List<PackageCardDto> list = session.selectList(namespace+"selectAll", map);
        return list;
    }

    /* 메인페이지에 패키지 8개 보여주기 */
    public List<PackageCardDto> packageForHome(String startDate) {
        return session.selectList(namespace+"packageForHome", startDate);
    }


    /* ************ insert 데이터 넣는 용  ************ */
    /* 모든 패키지 정보 및 검색 조건에 맞는 패키지 정보 가져오기 - 두가지를 한번에 처리하자 */
    public int insertAllPackage(List<PackageDto> list) {
        return session.insert(namespace + "insertAll", list);
    }

    public int insertPackageContent(List<PackageContentDto> list) {
        return session.insert(namespace+"insertContent", list);
    }

}
