package com.bitstudy.app.dao;

import com.bitstudy.app.domain.ReviewCommentDto;
import com.bitstudy.app.domain.ReviewDto;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class ReviewCommentDao {

    @Autowired
    SqlSession sql;

    private String namespace = "com.bitstudy.app.dao.ReviewCommentMapper.";

    //    댓글 작성
    public void save(ReviewCommentDto reviewCommentDto) {
        sql.insert(namespace + "save", reviewCommentDto);
    }

    // 댓글 목록 조회
    public List<ReviewCommentDto> findAll(Long boardId) {
        return sql.selectList(namespace + "findAll",boardId);
    }

    //새로운 댓글 하나만 가져오기
    public ReviewCommentDto  findNewComment(long id) {
        return sql.selectOne(namespace+"findNewComment",id);
    }

    //     댓글 삭제
    public int delete(long id) {
        return sql.delete(namespace + "delete", id);
    }

    //내가 쓴 댓글 찾기 마이페이지 기능
    public List<ReviewCommentDto> findCommentsByUserId(String userId) {
        return sql.selectList(namespace + "findCommentsByUserId",userId);
    }

    // 다른 댓글과 관련된 기능 추가 가능...
}