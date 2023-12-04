package com.bitstudy.app.controller;

import com.bitstudy.app.domain.ReviewCommentDto;
import com.bitstudy.app.service.ReviewCommentService;
import lombok.RequiredArgsConstructor;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@Controller
@RequiredArgsConstructor

@RequestMapping("/comment")
public class ReviewCommentController {

    private final ReviewCommentService commentService;

    //해당 게시물의 새로운 댓글 하나 가져오기
    @GetMapping("/findNewComment/{boardId}")
    @ResponseBody
    public ResponseEntity<ReviewCommentDto> findNewComment(@PathVariable long boardId) {
        ReviewCommentDto newComment = commentService.findNewComment(boardId);
        if (newComment != null) {
            return new ResponseEntity<>(newComment, HttpStatus.OK);
        } else {
            return new ResponseEntity<>(HttpStatus.NOT_FOUND);
        }
    }

    @PostMapping("/save") //  /comment/save
    @ResponseBody
    public ResponseEntity<List<ReviewCommentDto>> save(@ModelAttribute ReviewCommentDto commentDTO) {
        // 댓글 작성
        System.out.println("commentDTO = " + commentDTO);
        commentService.save(commentDTO);
        //댓글 작성됬으니 id기준으로 findAll해서 해당 게시글에 작성된 댓글 리스트를 가져옴
        List<ReviewCommentDto> commentDTOList = commentService.findAll(commentDTO.getBoardId());
        // 리스트에 리턴하고
        return new ResponseEntity<List<ReviewCommentDto>> (commentDTOList, HttpStatus.OK);
//        return commentDTOList;
    }

    @DeleteMapping("/delete/{id}")
    @ResponseBody
    public ResponseEntity<String> deleteComment(@PathVariable long id) {
        commentService.delete(id);
        System.out.println(id); //그 댓글 번호
        return new ResponseEntity<>(HttpStatus.OK);

    }

}
