package com.bitstudy.app.dao;

import com.bitstudy.app.domain.AccompanyConnectionDto;
import com.bitstudy.app.domain.AccompanyPickDto;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import java.util.Date;
import java.util.HashMap;
import java.util.List;

import static org.junit.Assert.*;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"file:src/main/webapp/WEB-INF/spring/**/root-context.xml"})
public class AccompanyPickDaoTest {
    @Autowired
    AccompanyPickDao accompanyPickDao;


//    @Test
//    public void insertPick() {
//        AccompanyPickDto accompanyPickDto = new AccompanyPickDto(50,"작성자","동행메세지",new Date(2023-1900,11,21));
//        assertTrue(accompanyPickDao.insertPick(accompanyPickDto)==1);
//    }


//    픽 10개 넣기
    @Test
    public void insertPick10() {
        for (int i = 0; i < 10; i++) {
            HashMap<String, Object>  insertPickMap = new HashMap<>();

            insertPickMap.put("accompanyNo",50);
            insertPickMap.put("accompanyWriter","작성자2");
            insertPickMap.put("accompanyPickApyUser","유저"+(1+i));
            insertPickMap.put("accompanyMessage","동행신청 메세지"+ +(1+i));
            insertPickMap.put("accompanyApyDate",new Date(2023-1900,11,22));

//            HashMap<String, Object>  insertPickMap= new AccompanyPickDto(50, "작성자"+ +(i+1), "동행메세지"+ +(i+1), new Date(2023 - 1900, 11, 21+i));
            accompanyPickDao.insertPick(insertPickMap);
        }
    }

  // 동행하기 [수락], [거절] 누르면 해당 DB 에 저장
//    @Test
//    public void insertPickConnection() {
//      for (int i = 0; i < 1; i++) {
//          HashMap<String, Object>  insertPickConnectionMap = new HashMap<>();
//
//          insertPickConnectionMap.put("accompanyNo",50);
//          insertPickConnectionMap.put("accompanyTitle","타이틀5");
//          insertPickConnectionMap.put("accompanyWriter","작성자5");
//          insertPickConnectionMap.put("accompanyPickApyUser","유저5");
////          insertPickConnectionMap.put("accompanyYN",true);
//          insertPickConnectionMap.put("accompanyYN",false);
//
//          accompanyPickDao.insertPickConnection(insertPickConnectionMap);
//      }
//    }



//    @Test
//    public void selectPickList() {
//        List<AccompanyPickDto> result = accompanyPickDao.selectPickList("작성자3");
//        System.out.println(result);
//    }

//    @Test
//    public void updatePickMessage() {
//
//    }


    @Test
    public void selectConnectionList() {
        List<AccompanyConnectionDto> list = accompanyPickDao.selectConnectionList("유저");
        System.out.println(list);
    }

    @Test
    public void deletePick() {
        accompanyPickDao.deletePick(1);
    }

    @Test
    public void deletePickAll() {
        accompanyPickDao.deletePickAll();
    }

    @Test
    public void deletePickConnnectionAll() {
        accompanyPickDao.deletePickConnnectionAll();
    }
}