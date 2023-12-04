package com.bitstudy.app.dao;

import com.bitstudy.app.domain.ReservationPeopleDto;
import com.bitstudy.app.domain.ViewMyReservationDto;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import javax.sql.DataSource;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Repository
public class ReservationPeopleDao {
    @Autowired
    DataSource ds;

    @Autowired
    SqlSession session;

    String namespace="com.bitstudy.app.dao.reservationPeopleMapper.";

    /* ************ select 시작 ************ */
    /* 지난 예약 목록 select */
    public List<ViewMyReservationDto> viewMyPrevReservation(String userId) {
        return session.selectList(namespace+"selectPrev", userId);
    }

    /* 예약 목록 select */
    public List<ViewMyReservationDto> viewMyNextReservation(String userId) {
        return session.selectList(namespace+"selectNext", userId);
    }

    /* ************ insert 시작 ************ */
    public int insertReservation(List<ReservationPeopleDto> reservationPeopleDto) {

        return session.insert(namespace + "insertList", reservationPeopleDto);
    }

    /* ************ delete 시작 ************ */
    public int deleteReservation(String userId, int packageNo) {
        Map map = new HashMap();
        map.put("userId", userId);
        map.put("packageNo", packageNo);

        return session.delete(namespace + "delete", map);
    }

}
