package com.bitstudy.app.service;

import com.bitstudy.app.dao.ReviewDao;
import com.bitstudy.app.domain.ReviewDto;
import com.bitstudy.app.domain.ReviewPageDto;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service

public class ReviewService {
    @Autowired
    private ReviewDao reviewDao;
    //    글작성
    public int save(ReviewDto reviewDto) {
        return reviewDao.save(reviewDto);
    }
    //    글 목록 작성일 순으로 전체조회
    public List<ReviewDto> findAll() {
        return reviewDao.findAll();
    }
    //메인에 8개만 보여주기
    public List<ReviewDto> findMainPage() {
       return reviewDao.findMainPage();
    }
    //    글 상세 조회
    public ReviewDto findById(Long id) {
        return reviewDao.findById(id);
    }
    //    최근 생성된 아이디 조회
    public long Id() {
        return reviewDao.Id();
    }
    //    메인 이미지 경로  조회
    public String findMain(Long id){
        return reviewDao.findMain(id);
    }
    //    메인 이미지 경로  조회
    public String findDetail(Long id){
        return reviewDao.findDetail(id);
    }

    //    글 조회수 증가
    public void updateHits(Long id) {
        reviewDao.updateHits(id);
    }
    //    게시물 삭제
    public void delete(Long id) {
        reviewDao.delete(id);
    }
    //    게시물 수정
    public void update(ReviewDto reviewDto) {
        reviewDao.update(reviewDto);
    }
    //내가 쓴 게시글 찾기
    public List<ReviewDto> findBoardsByUserId(String userId){
        return reviewDao.findBoardsByUserId(userId);
    }


//    페이징 리스트 조회

    int pageLimit = 20; // 한 페이지당 보여줄 글 갯수
    int blockLimit = 5; // 하단에 보여줄 페이지 번호 갯수
    //최근순
    public List<ReviewDto> pagingList(int page) {
/*
    1페이지당 보여지는 글 갯수 6
        1page => 0
        2page => 3
        3page => 6
*/
        int pagingStart = (page - 1) * pageLimit;
        Map<String, Integer> pagingParams = new HashMap<>();
        pagingParams.put("start", pagingStart);
        pagingParams.put("limit", pageLimit);
        return reviewDao.pagingList(pagingParams);
    }
    //조회순.
    public List<ReviewDto> findPopularPostsPaged(int page) {
        int pageLimit = 20; // 페이지당 보여줄 글 갯수
        int blockLimit = 5; // 하단에 보여줄 페이지 번호 갯수

        // 인기순으로 페이징 처리된 글 가져오기
        int pagingStart = (page - 1) * pageLimit;
        Map<String, Integer> pagingParams = new HashMap<>();
        pagingParams.put("start", pagingStart);
        pagingParams.put("limit", pageLimit);

        return reviewDao.findPopularPostsPaged(pagingParams);
    }
    public ReviewPageDto pagingParam(int page) {
        // 전체 글 갯수 조회
        int boardCount = reviewDao.boardCount();
        // 전체 페이지 갯수 계산(10/3=3.33333 => 4)
        int maxPage = (int) (Math.ceil((double) boardCount / pageLimit));
        // 시작 페이지 값 계산(1, 4, 7, 10, ~~~~)
        int startPage = (((int) (Math.ceil((double) page / blockLimit))) - 1) * blockLimit + 1;
        // 끝 페이지 값 계산(3, 6, 9, 12, ~~~~)
        int endPage = startPage + blockLimit - 1;
        if (endPage > maxPage) {
            endPage = maxPage;
        }
        ReviewPageDto pageDTO = new ReviewPageDto();
        pageDTO.setPage(page);
        pageDTO.setMaxPage(maxPage);
        pageDTO.setStartPage(startPage);
        pageDTO.setEndPage(endPage);
        return pageDTO;
    }


}
