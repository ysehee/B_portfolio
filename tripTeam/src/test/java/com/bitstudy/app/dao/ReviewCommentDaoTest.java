package com.bitstudy.app.dao;

import com.bitstudy.app.domain.ReviewCommentDto;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import java.util.Date;

import static org.junit.Assert.*;
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"file:src/main/webapp/WEB-INF/spring/**/root-context.xml"})

public class ReviewCommentDaoTest {
@Autowired
ReviewCommentDao dao;
    @Test
    public void save() {
        ReviewCommentDto dto = new ReviewCommentDto();
        dao.save(dto);
    }

    @Test
    public void findAll() {
    }

    @Test
    public void delete() {
    }
}