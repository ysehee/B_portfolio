package com.bitstudy.app.dao;

import com.bitstudy.app.domain.AccompanyDto;
import com.bitstudy.app.domain.AccompanyLikeDto;
import com.bitstudy.app.service.AccompanyService;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;

@Repository
public class AccompanyDao {
    @Autowired
    SqlSession session;

    String namespace="com.bitstudy.app.dao.accompanyMapper.";

    /***************** INSERT *****************/
    
    // 동행글 새 글 작성
    public int insert(AccompanyDto accompanyDto){
        return session.insert(namespace+"insert" , accompanyDto);
    }

    // 찜하기 누르면 [글 넘버], [유저id] 저장하기
    public int insertLikeInfo(Map<String, Object> paramMap){
        return session.insert(namespace+"insertLikeInfo",paramMap);
    }



    /***************** SELECT *****************/

    // 동행글 전체 불러오기
    public List<AccompanyDto> selectAll(){
        return session.selectList(namespace+"selectAll");
    }

    // 원하는 동행글 불러오기
    public AccompanyDto selectOne(int accompanyNo){
        return session.selectOne(namespace+"selectOne", accompanyNo);
    }

    // 동행글 최신순으로 정렬
    public List<AccompanyDto> selectRecent(){
        return session.selectList(namespace+"selectRecent");
    }

    // 동행글 인기순으로 정렬
    public List<AccompanyDto> selectLikeCnt(){
        return session.selectList(namespace+"selectLikeCnt");
    }

    // 동행글 많이 본 순으로 정렬
    public List<AccompanyDto> selectViewCnt(){
        return session.selectList(namespace+"selectViewCnt");
    }

    // 전체 글 수 뽑기
    public int count(){
        return session.selectOne(namespace+"count");
    }

    // 동행하기 버튼 누르면 정보 띄우기
    public AccompanyDto selectOne2(int accompanyNo){
        return session.selectOne(namespace+"selectOne2", accompanyNo);
    }

    // 현재 로그인된 유저가 찜하기 눌렀을 때, 해당 글 넘버에 유저 정보가 이미 있는지 확인하기
    public AccompanyLikeDto chkLikeUser(Map<String, Object> paramMap){
        return session.selectOne(namespace+"chkLikeUser", paramMap);
    }

    // 동행글 검색해서 해당되는 글만 보여지기
    public List<AccompanyDto> showAboutSearchText(String accompanySearchText){
        System.out.println("dao : " + accompanySearchText);
        return session.selectList(namespace+"showAboutSearchText",accompanySearchText);
    }

    // 페이지네이션
    public List<AccompanyDto> pagingList(Map<String, Integer> pagingParams) {
        return session.selectList(namespace + "pagingList", pagingParams);
    }

    // 동행글 메인페이지로 보내기
    public List<AccompanyDto> accompanyToMain(){
        return session.selectList(namespace+"accompanyToMain");
    }


    /***************** UPDATE *****************/

    // 동행글 수정하기
    public int update(Map<String, Object> paramMap){
        return session.update(namespace+"update",paramMap);
    }

    // 불러오면서 조회수 1씩 증가
    public int increaseViewCnt(int accompanyNo){
        return session.update(namespace+"increaseViewCnt",accompanyNo);
    }

    // 찜하기 누르면 1씩 증가
    public int increaseLikeCnt(Map<String, Object> paramMap){
        return session.update(namespace+"increaseLikeCnt",paramMap);
    }

    // 찜하기 다시 1 감소
    public int decreaseLikeCnt(Map<String, Object> paramMap){
        return session.update(namespace+"decreaseLikeCnt",paramMap);
    }



    /***************** DELECT *****************/
    
    // 동행글 삭제
    public int delete(int accompanyNo){
        return session.delete(namespace+"delete", accompanyNo);
    }


    // 동행글 전체삭제 (테스트용)
    public int deleteAll(){
        return session.delete(namespace+"deleteAll");
    }

    // 찜하기 삭제
    public int deleteLike(Map<String, Object> paramMap){
        return session.delete(namespace+"deleteLike",paramMap);
    }
    
    // 찜하기 테이블 전체삭제 (테스트용)
    public int deleteLikeAll(){
        return session.delete(namespace+"deleteLikeAll");
    }

    public List<AccompanyLikeDto> getLikeBtnUserList(String loginUserId) {
        return session.selectList(namespace+"getLikeBtnUserList", loginUserId);
    }

}
