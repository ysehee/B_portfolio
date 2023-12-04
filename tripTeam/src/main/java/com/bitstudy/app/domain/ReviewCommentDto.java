package com.bitstudy.app.domain;



import lombok.Getter;
import lombok.Setter;
import lombok.ToString;
import org.springframework.format.annotation.DateTimeFormat;

import java.sql.Timestamp;
@Getter
@Setter
@ToString

public class ReviewCommentDto {
    private Long id;
    private String commentWriter;
    private String commentContents;
    private Long boardId;
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private Timestamp commentCreatedTime;
}



