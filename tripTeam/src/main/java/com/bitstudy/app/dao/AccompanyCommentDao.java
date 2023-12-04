package com.bitstudy.app.dao;

import com.bitstudy.app.domain.AccompanyCommentDto;
import com.bitstudy.app.domain.AccompanyDto;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;

@Repository
public class AccompanyCommentDao {
    @Autowired
    SqlSession session;

    String namespace="com.bitstudy.app.dao.accompanyCommentMapper.";

    /***************** INSERT *****************/

    // 댓글 입력
    public int insertCmt(AccompanyCommentDto accompanyCommentDto){
        return session.insert(namespace+"insertCmt" , accompanyCommentDto);
    }

    /***************** SELECT *****************/

    // 해당 동행의 댓글 전체 불러오기
    public List<AccompanyCommentDto> selectCmtAll(int accompanyNo){
        return session.selectList(namespace+"selectCmtAll",accompanyNo);
    }

    // 해당 동행글의 전체 댓글 수 뽑기
    public int countCmt(int accompanyNo){
        return session.selectOne(namespace+"countCmt",accompanyNo);
    }

    // [마이페이지]  내가 쓴 동행 댓글 보기
    public List<AccompanyCommentDto> selectAccCmtIWrote(String userId){
        return session.selectList(namespace+"selectAccCmtIWrote",userId);
    }
    /***************** UPDATE *****************/

    // 댓글 수정
    public int updateCmt(Map<String, Object> paramMap){
        return session.update(namespace+"updateCmt",paramMap);
    }

    /***************** DELETE *****************/

    // 댓글 삭제
    public int deleteCmt(int accompanyCommentNo){
        return session.delete(namespace+"deleteCmt",accompanyCommentNo);
    }

    // 댓글 전체 삭제
    public int deleteCmtAll(){
        return session.delete(namespace+"deleteCmtAll");
    }



}
