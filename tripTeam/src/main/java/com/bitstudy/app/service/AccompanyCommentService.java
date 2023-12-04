package com.bitstudy.app.service;

import com.bitstudy.app.dao.AccompanyCommentDao;
import com.bitstudy.app.dao.AccompanyDao;
import com.bitstudy.app.domain.AccompanyCommentDto;
import com.bitstudy.app.domain.AccompanyDto;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

@Service
public class AccompanyCommentService {
    @Autowired
    AccompanyCommentDao accompanyCommentDao;

    /***************** INSERT *****************/

    // 댓글 입력
    public int createCmt(AccompanyCommentDto accompanyCommentDto){
        return accompanyCommentDao.insertCmt(accompanyCommentDto);
    }


    /***************** SELECT *****************/

    // 해당 동행의 댓글 전체 불러오기
    public List<AccompanyCommentDto> getCmtList(int accompanyNo){
        return accompanyCommentDao.selectCmtAll(accompanyNo);
    }

    // 해당 동행글의 전체 댓글 수 뽑기
    public int getCount(int accompanyNo){
        return accompanyCommentDao.countCmt(accompanyNo);
    }

    // [마이페이지] 내가 쓴 동행 댓글 보기
    public List<AccompanyCommentDto> showMyCmtAll(String userId){
        System.out.println("서비스 있어 "+ userId);
        System.out.println("서비스 내장 출력: "+accompanyCommentDao.selectAccCmtIWrote(userId));
        return accompanyCommentDao.selectAccCmtIWrote(userId);
    }


    /***************** UPDATE *****************/

    // 댓글 수정
    public int modifyCmt(Map<String , Object> paramMap){
        return accompanyCommentDao.updateCmt(paramMap);
    }

    // 댓글 삭제
    /***************** DELETE *****************/
    public int removeCmt(int accompanyCommentNo){
        return accompanyCommentDao.deleteCmt(accompanyCommentNo);
    }


}
