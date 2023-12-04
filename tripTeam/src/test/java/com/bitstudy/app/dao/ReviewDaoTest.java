package com.bitstudy.app.dao;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import static org.junit.Assert.*;
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"file:src/main/webapp/WEB-INF/spring/**/root-context.xml"})


public class ReviewDaoTest {

    @Autowired
    ReviewDao reviewDao;
    @Test
    public void save() {
    }

    @Test
    public void findMainPage() {
        reviewDao.findMainPage();
    }

    @Test
    public void name() {
    }

    @Test
    public void findById() {
    }

    @Test
    public void id() {
    }

    @Test
    public void testFindMain() {
    }

    @Test
    public void findDetail() {
    }

    @Test
    public void updateHits() {
    }

    @Test
    public void delete() {
    }

    @Test
    public void update() {
    }

    @Test
    public void pagingList() {
    }

    @Test
    public void findPopularPostsPaged() {
    }

    @Test
    public void boardCount() {
    }

    @Test
    public void findBoardsByUserId() {
    }
}