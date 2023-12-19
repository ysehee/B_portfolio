package com.bitstudy.app.service;

import com.bitstudy.app.dao.AccompanyDao;
import com.bitstudy.app.domain.AccompanyDto;
import com.bitstudy.app.domain.AccompanyLikeDto;
import com.bitstudy.app.domain.ReviewDto;
import com.bitstudy.app.domain.ReviewPageDto;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
public class AccompanyService {
    @Autowired
    AccompanyDao accompanyDao;

    /***************** INSERT *****************/

    /* 동행글 등록 */
    public int create(AccompanyDto accompanyDto){
        return accompanyDao.insert(accompanyDto);
    }

    /* 현재 로그인된 유저가 찜하기 눌렀을 때, 해당 글 넘버에 유저 정보가 이미 있는지 확인하기*/
    public int createLikeInfo(Map<String, Object> paramMap){
        return accompanyDao.insertLikeInfo(paramMap);
    }


    /***************** SELECT *****************/

    /* 동행글 전체 불러오기 */
    public List<AccompanyDto> getList() {
        return accompanyDao.selectAll();
    }

    /* 원하는 동행글 하나 불러오기 (조회 1개)*/
    public AccompanyDto read(int accompanyNo){

        AccompanyDto accompanyDto = accompanyDao.selectOne(accompanyNo);

        return accompanyDto;
    }

    /* 동행글 최신순으로 불러오기 */
    public List<AccompanyDto> getRecentList() {
        return accompanyDao.selectRecent();
    }

    /* 동행글 찜 순으로 불러오기 */
    public List<AccompanyDto> getLikeList() {
        return accompanyDao.selectLikeCnt();
    }

    /* 동행글 많이 본 순으로 불러오기 */
    public List<AccompanyDto> getViewList() {
        return accompanyDao.selectViewCnt();
    }

    /* 전체 글 수 계산 */
    public int getCount() {
        return accompanyDao.count();
    }

    /* 동행하기 버튼 누르면 정보 띄우기*/
    public AccompanyDto plckBtnPush(int accompanyNo){
        return accompanyDao.selectOne2(accompanyNo);
    }

    /* 현재 로그인된 유저가 찜하기 눌렀을 때, 해당 글 넘버에 유저 정보가 이미 있는지 확인하기 */
    public AccompanyLikeDto chkLikeUser(Map<String, Object> paramMap) {
        return accompanyDao.chkLikeUser(paramMap);

    }

    /* 동행글 검색해서 해당되는 글만 보여지기 */
    public List<AccompanyDto> searchList(String accompanySearchText) {
        return accompanyDao.showAboutSearchText(accompanySearchText);
    }

    /* 동행글 메인페이지로 보내기 */
    public List<AccompanyDto> accompanyToMain() {
        return accompanyDao.accompanyToMain();
    }


    /***************** UPDATE *****************/

    /* 동행글 수정 */
    public int modify(Map<String, Object> paramMap) {
        return accompanyDao.update(paramMap);
    }

    /* 조회수 증가 */
    public int viewUp(int accompanyNo){
        return accompanyDao.increaseViewCnt(accompanyNo);
    }

    /* 찜하기 증가 */
    public int likeUp(Map<String, Object> paramMap) {
        return accompanyDao.increaseLikeCnt(paramMap);
    }

    /* 찜하기 감소 */
    public int likeDown(Map<String, Object> paramMap) {
        return accompanyDao.decreaseLikeCnt(paramMap);
    }




    /***************** DELECT *****************/

    /* 동행글 삭제 */
    public int remove(int accompanyNo) {
        return accompanyDao.delete(accompanyNo);
    }


    /* 찜하기 정보 삭제 */
    public int removelike(Map<String, Object> paramMap) {
        return accompanyDao.deleteLike(paramMap);
    }


    public List<AccompanyLikeDto> getLikeBtnUserList(String loginUserId) {
        return accompanyDao.getLikeBtnUserList(loginUserId);
    }

}
