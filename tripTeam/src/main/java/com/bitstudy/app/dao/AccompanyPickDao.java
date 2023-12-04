package com.bitstudy.app.dao;

import com.bitstudy.app.domain.AccompanyConnectionDto;
import com.bitstudy.app.domain.AccompanyDto;
import com.bitstudy.app.domain.AccompanyPickDto;
import com.bitstudy.app.service.AccompanyPickService;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.List;
import java.util.Map;

@Repository
public class AccompanyPickDao {
    @Autowired
    SqlSession session;
    String namespace="com.bitstudy.app.dao.accompanyPickMapper.";

    /***************** INSERT *****************/

    // 동행신청 보내기
    public int insertPick(Map<String, Object> paramMap){
        return session.insert(namespace+"insertPick",paramMap);
    }

    // 동행하기 [수락], [거절] 누르면 해당 DB 에 저장
    public int insertPickConnection(Map<String, Object> paramMap){
        return session.insert(namespace+"insertPickConnection",paramMap);
    }


    /***************** SELECT *****************/

    // 내가 쓴 동행글 보기
    public List<AccompanyDto> selectAccIWrote(String userId){
        return session.selectList(namespace+"selectAccIWrote",userId);
    }

    // 내가 보낸 동행신청
    public List<AccompanyPickDto> selectPickSpendList(String userId){
        return session.selectList(namespace+"selectPickSpendList",userId);
    }

    // 내가 받은 동행신청
    public List<AccompanyPickDto> selectPickReceiveList(String userId){
        return session.selectList(namespace+"selectPickReceiveList",userId);
    }

    // 나의 동행 확정내역 확인하기
    public List<AccompanyConnectionDto> selectConnectionList(String userId){
        System.out.println("다오 : "+userId);
        return session.selectList(namespace+"selectConnectionList",userId);
    }

    /***************** UPDATE *****************/

    // 보낸 메세지 수정
    public int updatePickMessage(Map<String, Object> paramMap){
        return session.update(namespace+"updatePickMessage",paramMap);
    }

    /***************** DELETE *****************/
    // 동행 신청 삭제
    public int deletePick(int accompanyPickNo){
        return session.delete(namespace+"deletePick",accompanyPickNo);
    }

    // 동행 신청 삭제(테스트용)
    public int deletePickAll(){
        return session.delete(namespace+"deletePickAll");
    }

    // 동행 확정 내역 삭제 (테스트용)-
    public int deletePickConnnectionAll(){
        return session.delete(namespace+"deletePickConnnectionAll");
    }

    // 받은 동행신청에서 수락/거절 누르면 해당 내역에서 삭제하기
    public int deletePickReceive(int accompanyPickNo){
        return session.delete(namespace+"deletePickReceive",accompanyPickNo);
    }

    // 받은 동행신청에서 [신청취소] 누르면 해당 내역에서 삭제하기
    public int deletePickSpendCancel(int accompanyPickNo){
        System.out.println("다오 픽넘버: "+accompanyPickNo);
        return session.delete(namespace+"deletePickSpendCancel",accompanyPickNo);
    }


}
