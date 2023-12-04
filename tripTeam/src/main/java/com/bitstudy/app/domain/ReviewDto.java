package com.bitstudy.app.domain;


import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;


public class ReviewDto {
    //    아디
    private Long id;
    //    작성자
    private String boardWriter;
    //    비밀번호 게시물 보안올리기위해 *******8
    private String boardPass;
    //    제목
    private String boardTitle;
    //    내용
    private String boardContents;
    //    조회수
    private int boardHits;
    //    작성일
    private Timestamp boardCreatedTime;
    // 이미지 파일 경로 또는 이름을 저장할 필드

    //파일 관련
    private String mainImagePath;
    private String detailImagePath;
    private String mainUnique;
    private String detailUnique;

    public ReviewDto() {
    }

    public ReviewDto(String boardWriter, String boardPass, String boardTitle, String boardContents) {
        this.boardWriter = boardWriter;
        this.boardPass = boardPass;
        this.boardTitle = boardTitle;
        this.boardContents = boardContents;
    }

    @Override
    public String toString() {
        return "ReviewDto{" +
                "id=" + id +
                ", boardWriter='" + boardWriter + '\'' +
                ", boardPass='" + boardPass + '\'' +
                ", boardTitle='" + boardTitle + '\'' +
                ", boardContents='" + boardContents + '\'' +
                ", boardHits=" + boardHits +
                ", boardCreatedTime=" + boardCreatedTime +
                ", mainImagePath='" + mainImagePath + '\'' +
                ", detailImagePath='" + detailImagePath + '\'' +
                ", mainUnique='" + mainUnique + '\'' +
                ", detailUnique='" + detailUnique + '\'' +
                '}';
    }



    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getBoardWriter() {
        return boardWriter;
    }

    public void setBoardWriter(String boardWriter) {
        this.boardWriter = boardWriter;
    }

    public String getBoardPass() {
        return boardPass;
    }

    public void setBoardPass(String boardPass) {
        this.boardPass = boardPass;
    }

    public String getBoardTitle() {
        return boardTitle;
    }

    public void setBoardTitle(String boardTitle) {
        this.boardTitle = boardTitle;
    }

    public String getBoardContents() {
        return boardContents;
    }

    public void setBoardContents(String boardContents) {
        this.boardContents = boardContents;
    }

    public int getBoardHits() {
        return boardHits;
    }

    public void setBoardHits(int boardHits) {
        this.boardHits = boardHits;
    }

    public Timestamp getBoardCreatedTime() {
        return boardCreatedTime;
    }

    public void setBoardCreatedTime(Timestamp boardCreatedTime) {
        this.boardCreatedTime = boardCreatedTime;
    }

    public String getMainImagePath() {
        return mainImagePath;
    }

    public void setMainImagePath(String mainImagePath) {
        this.mainImagePath = mainImagePath;
    }

    public String getdetailImagePath() {
        return detailImagePath;
    }

    public void setdetailImagePath(String detailImagePath) {
        this.detailImagePath = detailImagePath;
    }

    public String getMainUnique() {
        return mainUnique;
    }

    public void setMainUnique(String mainUnique) {
        this.mainUnique = mainUnique;
    }

    public String getDetailUnique() {
        return detailUnique;
    }

    public void setDetailUnique(String detailUnique) {
        this.detailUnique = detailUnique;
    }
}