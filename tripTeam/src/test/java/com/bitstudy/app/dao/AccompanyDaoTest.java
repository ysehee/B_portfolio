package com.bitstudy.app.dao;

import com.bitstudy.app.domain.AccompanyDto;
import com.bitstudy.app.domain.AccompanyLikeDto;
import org.apache.ibatis.jdbc.SQL;
import org.apache.ibatis.session.SqlSession;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import java.time.LocalDate;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import static org.junit.Assert.*;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"file:src/main/webapp/WEB-INF/spring/**/root-context.xml"})
public class AccompanyDaoTest {
    @Autowired
    AccompanyDao accompanyDao;


//    @Test
//    public void insert() {
////        accompanyDao.deleteAll();
//
//        AccompanyDto accompanyDto = new AccompanyDto("타이틀1", "동행글1", 2, "서울");
//        assertTrue(accompanyDao.insert(accompanyDto) == 1);
//    }

//    @Test
//    public void insertLikeInfo() {
////        for (int i = 0; i < 10; i++) {
//            HashMap<String, Object> insertLikeMap = new HashMap<>();
//
//            insertLikeMap.put("accompanyNo",50);
//            insertLikeMap.put("accompanyLikeUser","회원");
//
////            HashMap<String, Object>  insertPickMap= new AccompanyPickDto(50, "작성자"+ +(i+1), "동행메세지"+ +(i+1), new Date(2023 - 1900, 11, 21+i));
//            accompanyDao.insertLikeInfo(insertLikeMap);
////        }
//    }



    @Test
    public void selectAll() {
        assertTrue(accompanyDao.selectAll() != null);

        List<AccompanyDto> list = accompanyDao.selectAll();

        for (AccompanyDto tmp : list) {
            System.out.println(tmp);
        }
        assertTrue(list.size() > 0);
    }


    @Test
    public void selectRecent() throws Exception {
//        insert50();
        List<AccompanyDto> list = accompanyDao.selectAll();
        for (AccompanyDto tmp : list) {
            System.out.println(tmp);
        }
        assertTrue(list.size() > 0);
    }

    @Test
    public void selectLikeCnt() {
        List<AccompanyDto> list = accompanyDao.selectLikeCnt();
        for (AccompanyDto tmp : list) {
            System.out.println(tmp);
        }
        assertTrue(list.size() > 0);

    }

    @Test
    public void selectViewCnt() {
        List<AccompanyDto> list = accompanyDao.selectViewCnt();
        for (AccompanyDto tmp : list) {
            System.out.println(tmp);
        }
        assertTrue(list.size() > 0);
    }


    @Test
    public void showAboutSearchText() {
        List<AccompanyDto> list = accompanyDao.showAboutSearchText("5");
        System.out.println(list);
    }
    

    @Test
    public void count() {
        assertTrue(accompanyDao.count() == 52);
    }

    @Test
    public void selectOne2() {
    }
    @Test
    public void update() {

    }
    @Test
    public void chkLikeUser() {
//        for (int i = 0; i < 10; i++) {
        HashMap<String, Object> chkLikeMap = new HashMap<>();

        chkLikeMap.put("accompanyNo",50);
        chkLikeMap.put("accompanyLikeUser","회원");

        AccompanyLikeDto result = accompanyDao.chkLikeUser(chkLikeMap);
        System.out.println(result);
//        }
    }
    @Test
    public void increaseViewCnt() {
        assertTrue(accompanyDao.increaseViewCnt(2) == 1);
    }

    @Test
    public void increaseLikeCnt() {
//        assertTrue(accompanyDao.increaseLikeCnt(2) == 1);

        HashMap<String, Object> likeUpMap = new HashMap<>();

        likeUpMap.put("accompanyNo",50);
        accompanyDao.increaseLikeCnt(likeUpMap);
    }

    @Test
    public void decreaseLikeCnt() {
//        assertTrue(accompanyDao.decreaseLikeCnt(2) == 1);
        HashMap<String, Object> likeDownMap = new HashMap<>();

        likeDownMap.put("accompanyNo",50);
        accompanyDao.decreaseLikeCnt(likeDownMap);


    }

    @Test
    public void delete() {
        accompanyDao.delete(2);
    }

    @Test
    public void deleteAll() {
        accompanyDao.deleteAll();
    }
    @Test
    public void deleteLikeAll() {
        accompanyDao.deleteLikeAll();
    }



    @Test
    // 50 줄 넣기
    public void insert50() throws Exception {
//        deleteAll();
        for (int i = 0; i < 50; i++) {
            AccompanyDto accompanyDto = new AccompanyDto("타이틀" + +(i+1), "동행글" + +(i+1), +(i+1), "서울" + +(i+1), "작성자" + +(i+1));
            accompanyDao.insert(accompanyDto);

//            AccompanyDto accompanyDto = new AccompanyDto("타이틀","동행글",1,"서울","작성자");

        }
    }
}


