package com.bitstudy.app.dao;

import com.bitstudy.app.domain.AccompanyCommentDto;
import com.bitstudy.app.domain.AccompanyDto;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import static org.junit.Assert.*;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"file:src/main/webapp/WEB-INF/spring/**/root-context.xml"})
public class AccompanyCommentDaoTest {
    @Autowired
    AccompanyCommentDao accompanyCommentDao;

    @Test
    public void insertCmt() {
        AccompanyCommentDto accompanyCommentDto = new AccompanyCommentDto(5,"작성자99","댓글test",new Date(2023-1900,11,18));
        assertTrue(accompanyCommentDao.insertCmt(accompanyCommentDto)==1);
    }

    @Test
    public void selectCmtAll() {
        List<AccompanyCommentDto> list = accompanyCommentDao.selectCmtAll(50);
        for(AccompanyCommentDto tmp : list){
            System.out.println(tmp);
        }
        assertTrue(list.size()>0);
    }

    @Test
    public void countCmt() {
        int countCmt = accompanyCommentDao.countCmt(50);
        System.out.println(countCmt);
    }

//`    @Test
//    public void selecMyCmtAll() {
//        List<AccompanyCommentDto> comments  = accompanyCommentDao.selecMyCmtAll("댓글작성자11");
//        System.out.println(comments);
//    }`

    @Test
    public void updateCmt() {

    }

    @Test
    public void deleteCmt() {
        accompanyCommentDao.deleteCmt(50);
    }

    @Test
    public void deleteCmtAll() {
        accompanyCommentDao.deleteCmtAll();
    }


    @Test
    // 50 줄 넣기
    public void insert10() throws Exception {
//        deleteAll();
        for(int i=0; i<10; i++) {
            AccompanyCommentDto accompanyCommentDto = new AccompanyCommentDto(50,"작성자"+ +(1+i),"동행글댓글"+ +(1+i),new Date(2023-1900,11,01+i));
            accompanyCommentDao.insertCmt(accompanyCommentDto);
        }

    }
}