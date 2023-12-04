package com.bitstudy.app.service;

import com.bitstudy.app.dao.AccompanyPickDao;
import com.bitstudy.app.domain.AccompanyConnectionDto;
import com.bitstudy.app.domain.AccompanyDto;
import com.bitstudy.app.domain.AccompanyPickDto;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

@Service
public class AccompanyPickService {
    @Autowired
    AccompanyPickDao accompanyPickDao;

    /***************** INSERT *****************/
    
    // 동행신청 보내기
    public int createPick(Map<String , Object> paramMap){
        return accompanyPickDao.insertPick(paramMap);
    }

    // 동행하기 [수락], [거절] 누르면 해당 DB 에 저장
    public int createPickConnection(Map<String , Object> paramMap){
        return accompanyPickDao.insertPickConnection(paramMap);
    }

    /***************** SELECT *****************/

    // 내가 쓴 동행글 보기
    public List<AccompanyDto> selectAccIWrote(String userId){
        return accompanyPickDao.selectAccIWrote(userId);
    }

    // 내가 보낸 동행신청
    public List<AccompanyPickDto> showPickSpendList(String userId){
        return accompanyPickDao.selectPickSpendList(userId);
    }

    // 내가 받은 동행신청
    public List<AccompanyPickDto> showPickReceiveList(String userId){
        return accompanyPickDao.selectPickReceiveList(userId);
    }

    // 나의 동행 확정내역 확인하기
    public List<AccompanyConnectionDto> selectConnectionList(String userId){
        System.out.println("서비스 : "+userId);
        return accompanyPickDao.selectConnectionList(userId);
    }

    /***************** UPDATE *****************/

    // 보낸 메세지 수정ㅕ
    public int modifyPickMessage(Map<String , Object> paramMap){
        return accompanyPickDao.updatePickMessage(paramMap);
    }

    /***************** DELETE *****************/

    // 동행 신청 삭제
    public int removePick(int accompanyPickNo){
        return accompanyPickDao.deletePick(accompanyPickNo);
    }

    // 동행 신청 전체 삭제(테스트용)
    public int removePickAll(int accompanyPickNo){
        return accompanyPickDao.deletePickAll();
    }

    // 받은 동행신청에서 수락/거절 누르면 해당 내역에서 삭제하기
    public int removePickReceive(int accompanyPickNo){
        return accompanyPickDao.deletePickReceive(accompanyPickNo);
    }

    // 보낸 동핸신청에서 [신청 취소] 누르면 해당 내역에서 삭제하기
    public int removePickSpendCancel(int accompanyPickNo){
        return accompanyPickDao.deletePickSpendCancel(accompanyPickNo);
    }


}
