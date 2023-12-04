package com.bitstudy.app.dao;

import com.bitstudy.app.domain.ReviewDto;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;

@Repository

public class ReviewDao {


    @Autowired
    SqlSession sql;

    private final String namespace = "com.bitstudy.app.dao.ReviewMapper.";

    //    글작성 // 이미지 까지
    public int save(ReviewDto reviewDto) {
        // ReviewDto에 관한 처리
        return sql.insert(namespace + "save", reviewDto);
    }
    //    다 불러오기
    public List<ReviewDto> findAll() {
        return sql.selectList(namespace + "findAll");
    }
    //메인에 8개만 보여주기
    public List<ReviewDto> findMainPage() {
        return sql.selectList(namespace + "findMainPage");
    }

    public ReviewDto findById(Long id) {
        return sql.selectOne(namespace + "findById", id);
    }
    //    최근 생성된 아이디 조회
    public Long Id() {
        return sql.selectOne(namespace + "Id");
    }

    //    메인 이미지 경로  조회
    public String findMain(Long id) {
        return sql.selectOne(namespace + "findMain",id);
    }
    //    메인 이미지 경로  조회
    public String findDetail(Long id) {
        return sql.selectOne(namespace + "findDetail",id);
    }

    public void updateHits(Long id) {
        sql.update(namespace + "updateHits", id);
    }

    public void delete(Long id) {
        sql.delete(namespace + "delete", id);
    }

    public void update(ReviewDto reviewDto) {
        sql.update(namespace + "update", reviewDto);
    }

    //최근순으로 리스트
    public List<ReviewDto> pagingList(Map<String, Integer> pagingParams) {
        return sql.selectList(namespace + "pagingList", pagingParams);
    }
    //인기순으로 리스트
    public List<ReviewDto> findPopularPostsPaged(Map<String, Integer> pagingParams){
        return sql.selectList(namespace + "findPopularPostsPaged" , pagingParams);
    }

    public int boardCount() {

        return sql.selectOne(namespace + "boardCount");
    }

    //내가 쓴 게시글 찾기
    public List<ReviewDto> findBoardsByUserId(String userId) {
        return sql.selectList(namespace + "findBoardsByUserId", userId);
    }



}

