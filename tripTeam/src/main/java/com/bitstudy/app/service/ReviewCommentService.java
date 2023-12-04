package com.bitstudy.app.service;

import com.bitstudy.app.dao.ReviewCommentDao;
import com.bitstudy.app.domain.ReviewCommentDto;
import lombok.RequiredArgsConstructor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service

public class ReviewCommentService {
    @Autowired
    private ReviewCommentDao reviewCommentDao;
    //    댓글 작성
    public void save(ReviewCommentDto reviewCommentDto){
        reviewCommentDao.save(reviewCommentDto);
    }

    // 댓글 목록 조회
    public List<ReviewCommentDto> findAll(long boardId) {
        return reviewCommentDao.findAll(boardId);
    }

    //새로운 댓글 하나만 가져오기
    public ReviewCommentDto  findNewComment(long id) {
        return reviewCommentDao.findNewComment(id);
    }
    //    댓글 삭제
    public int delete(long id) {
        return reviewCommentDao.delete(id);
    }

    //내가 쓴 댓글 보기 마이페이지 기능
    public List<ReviewCommentDto> findCommentsByUserId(String userId){
        return reviewCommentDao.findCommentsByUserId(userId);
    }

}
