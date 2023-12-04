package com.bitstudy.app.controller;

import com.bitstudy.app.domain.ReviewCommentDto;
import com.bitstudy.app.domain.ReviewDto;
import com.bitstudy.app.domain.ReviewPageDto;
import com.bitstudy.app.service.ReviewCommentService;
import com.bitstudy.app.service.ReviewService;
import kr.co.util.FileUtil;
import lombok.RequiredArgsConstructor;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

@Controller
@RequiredArgsConstructor
@RequestMapping("/board")
public class ReviewController {

    private final ReviewService reviewService; // 게시글용
    private final ReviewCommentService reviewCommentService;
    @GetMapping("/save") //게시물 작성 get
    public String saveForm(Model model, HttpSession httpSession) {
        ReviewDto reviewDto = new ReviewDto();
        model.addAttribute("reviewDto", reviewDto); // id생성을 위해

        //로그인 유효성검사
        String loginId = (String) httpSession.getAttribute("id");
        if (loginId != null) {
            // 로그인 상태이므로 처리
            // ...
            return "save";
        } else {
            // 로그인되지 않은 사용자는 로그인 페이지로 리다이렉트
            return "redirect:/login/login";
        }

    }

    //    파일 업로드
//    private static final String F_PATH = "C:/Users/kim tae young/OneDrive/바탕 화면/1team/tripTeam/src/main/webapp/resources/img/"; // 내경로

    @PostMapping("/save") // 게시물 작성 post
    public ModelAndView save( @ModelAttribute ReviewDto reviewDto,
                              RedirectAttributes rttr,
                              MultipartFile imageFile,
                              MultipartFile[] detailImages,
                              HttpServletRequest request
    ) throws IOException {
        String path = "resources/upload/"; //이미지 넣을 폴더
        String realPath = request.getRealPath(path); //리얼주소
        String fileName = imageFile.getOriginalFilename(); //오리지날 이름
        System.out.println("realPath: " + realPath);
        String defaultImage = "구름이.jpg"; //기본

        //  realPath 경로에 해당하는 폴더가 없으면 폴더 생성
        File uploadDir = new File(realPath);
        if (!uploadDir.exists()) {
            uploadDir.mkdirs();
        }

//         이미지 파일인지 확인
        if (imageFile != null || !imageFile.isEmpty() || !FileUtil.isImageFile(imageFile.getOriginalFilename())) {
            // 이미지 파일이 선택되지 않았거나 선택된 파일이 이미지가 아닌 경우
        }

        if (imageFile!=null&&!imageFile.isEmpty()){
            //저장하려는 파일 시스템의 실제위치와 파일명 찾기
            String saveFileName = FileUtil.checkDuplicate(realPath + fileName);
            //살제적인 파일로 저장
            imageFile.transferTo(new File(saveFileName));
            String uploadFileName = saveFileName.substring(saveFileName.lastIndexOf("\\") + 1); // d이름만 뽑음
            reviewDto.setMainImagePath(uploadFileName);
            reviewDto.setMainUnique(fileName);//오리지널이름
        }
        else {
            reviewDto.setMainImagePath(defaultImage);
        }


        //디테일파일


        // 여러 파일명을 저장할 StringBuilder 생성
        StringBuilder detailImageNamesBuilder = new StringBuilder();

        if (detailImages != null && detailImages.length > 0) {
            for (MultipartFile detailImage : detailImages) {
                if (!FileUtil.isImageFile(detailImage.getOriginalFilename())) {
                    continue;
                }
                String detailFileName = detailImage.getOriginalFilename();
                // 디테일 이미지 파일을 실제 위치에 저장
                String saveDetailFileName = FileUtil.checkDuplicate(realPath + detailFileName);
                detailImage.transferTo(new File(saveDetailFileName));

                String uploadDetailFileName = saveDetailFileName.substring(saveDetailFileName.lastIndexOf("\\") + 1);
                System.out.println(uploadDetailFileName);
                // 파일명을 StringBuilder에 추가
                detailImageNamesBuilder.append(uploadDetailFileName).append(",");
            }
            // 마지막 쉼표 제거
            String detailImageNames = detailImageNamesBuilder.toString();
            if (!detailImageNames.isEmpty() && detailImageNames.endsWith(",")) {
                detailImageNames = detailImageNames.substring(0, detailImageNames.length() - 1);
            }
            // ReviewDto에 디테일 이미지 경로 설정
            reviewDto.setdetailImagePath(detailImageNames);
            reviewDto.setDetailUnique(detailImageNames); // 오리지널 이름
        } else {
            // 파일을 선택하지 않았을 경우
            reviewDto.setdetailImagePath(""); // 경로 비움
            reviewDto.setDetailUnique(""); // 오리지널 이름 비움
        }




        //DB에 정보 저장하기
        reviewService.save(reviewDto);
        //alter
        rttr.addFlashAttribute("processResult", "saveSuccess");

        return new ModelAndView("redirect:/board/paging");
    }

    @GetMapping
    public String findById(@RequestParam("id") Long id,
                           @RequestParam(value = "page", required = false, defaultValue = "1") int page,
                           Model model,
                           HttpSession httpSession) {

        String loginId = (String) httpSession.getAttribute("id");
        Long viewedPostId = (Long) httpSession.getAttribute("viewedPostId");

        // 세션에 저장된 ID와 현재 조회하려는 게시글의 ID가 같지 않은 경우에만 조회수 증가
        if (loginId != null && (viewedPostId == null || !viewedPostId.equals(id))) {
            reviewService.updateHits(id);

            // 현재 조회 중인 게시글의 ID를 세션에 저장
            httpSession.setAttribute("viewedPostId", id);
        }

        // 로그인 여부와 관계없이 게시글 정보를 가져옴
        ReviewDto reviewDto = reviewService.findById(id);

        if (loginId != null) {
            String detailImagePathFromDB = reviewDto.getdetailImagePath();
            // 쉼표(,)로 구분된 파일명들을 배열로 변환
            String[] fileNames = detailImagePathFromDB.split(",");
            // 파일명을 모델에 추가하여 JSP로 전달
            model.addAttribute("fileNames", fileNames);
        }

        model.addAttribute("board", reviewDto);
        model.addAttribute("page", page);
        List<ReviewCommentDto> reviewCommentDtoList = reviewCommentService.findAll(id);
        model.addAttribute("commentList", reviewCommentDtoList);

        if (loginId != null) {
            return "detail";
        } else {
            // 로그인되지 않은 사용자는 로그인 페이지로 리다이렉트
            return "redirect:/login/login";
        }
    }

    @GetMapping("/delete")
    public String delete(@RequestParam("id") Long id,
                         RedirectAttributes rttr,
                         HttpServletRequest request) {



        String img_m = reviewService.findMain(id);
        // 메인 이미지 폴더에서 해당 이미지 파일 삭제
        if (img_m != null){
            String path = "resources/upload/"; //이미지 넣을 폴더
            String realPath = request.getRealPath(path); //리얼주소
            File file_m = new File(realPath+ "\\" + img_m); // 메인 이미지 경로에 대한 File 객체 생성
            System.out.println(file_m);
            if (file_m.exists()) {
                file_m.delete(); // 파일이 존재하면 삭제
            }
        }
        String img_d = reviewService.findDetail(id);
        // DB에 저장된 여러 디테일 이미지 경로 가져오기
        System.out.println("img_d"+img_d);
        // 이미지 폴더에서 디테일 파일들 삭제
        if (img_d != null) {
            String path = "resources/upload/"; // 이미지 넣을 폴더
            String realPath = request.getRealPath(path); // 리얼 주소
            String[] detailImagePath = img_d.split(","); // 콤마(,)로 구분된 이미지 경로들을 배열로 분할
            for (String imagePath : detailImagePath) {
                File file_d = new File(realPath + "\\" + imagePath.trim()); // 각 이미지 경로에 대해 File 객체 생성 (.trim()을 통해 앞뒤 공백 제거)
                if (file_d.exists()) {
                    file_d.delete(); // 파일이 존재하면 삭제
                }
            }
        }
        reviewService.delete(id); // DB에서 해당 게시물 삭제

        return "redirect:/board/paging";
    }

    @GetMapping("/update")
    public String updateForm(@RequestParam("id") Long id, Model model) {
        ReviewDto reviewDto = reviewService.findById(id);
        System.out.println(reviewDto);
        if (id != null) {
            String detailImagePathFromDB = reviewDto.getdetailImagePath();
            // 쉼표(,)로 구분된 파일명들을 배열로 변환
            String[] fileNames = detailImagePathFromDB.split(",");
            // 파일명을 모델에 추가하여 JSP로 전달
            model.addAttribute("fileNames", fileNames);
        }
        model.addAttribute("board", reviewDto);
        return "update";
    }

    @PostMapping("/update")
    public String update(@ModelAttribute ReviewDto reviewDto,
                         @RequestParam("id") Long id,
                         MultipartFile imageFile,
                         HttpServletRequest request,
                         MultipartFile[] detailImages,
                         Model model) throws IOException {
        String path = "resources/upload/"; //이미지 넣을 폴더
        String realPath = request.getRealPath(path); //리얼주소
        String fileName = imageFile.getOriginalFilename(); //오리지날 이름

        //  realPath 경로에 해당하는 폴더가 없으면 폴더 생성
        File uploadDir = new File(realPath);
        if (!uploadDir.exists()) {
            uploadDir.mkdirs();
        }

//         이미지 파일인지 확인
        if (imageFile != null || !imageFile.isEmpty() || !FileUtil.isImageFile(imageFile.getOriginalFilename())) {
            // 이미지 파일이 선택되지 않았거나 선택된 파일이 이미지가 아닌 경우
        }

        if (imageFile!=null&&!imageFile.isEmpty()){
            //저장하려는 파일 시스템의 실제위치와 파일명 찾기
            String saveFileName = FileUtil.checkDuplicate(realPath + fileName);
            //살제적인 파일로 저장
            imageFile.transferTo(new File(saveFileName));
            String uploadFileName = saveFileName.substring(saveFileName.lastIndexOf("\\") + 1); // d이름만 뽑음
            reviewDto.setMainImagePath(uploadFileName);
            reviewDto.setMainUnique(fileName);//오리지널이름
        }else {
            // 이미지 파일이 변경되지 않은 경우
            ReviewDto reviewDto1 = reviewService.findById(id);
            reviewDto.setMainImagePath(reviewDto1.getMainImagePath());
        }

        // 기존 디테일 이미지 삭제
        String img_d = reviewService.findDetail(id);
        if (img_d != null) {
            String[] detailImagePath = img_d.split(",");
            for (String imagePath : detailImagePath) {
                File file_d = new File(realPath + "\\" + imagePath.trim());
                if (file_d.exists()) {
                    file_d.delete();
                }
            }
        }
        // 여러 파일명을 저장할 StringBuilder 생성
        StringBuilder detailImageNamesBuilder = new StringBuilder();

        if (detailImages != null && detailImages.length > 0) {
            for (MultipartFile detailImage : detailImages) {
                if (!FileUtil.isImageFile(detailImage.getOriginalFilename())) {
                    continue;
                }
                String detailFileName = detailImage.getOriginalFilename();
                // 디테일 이미지 파일을 실제 위치에 저장
                String saveDetailFileName = FileUtil.checkDuplicate(realPath + detailFileName);
                detailImage.transferTo(new File(saveDetailFileName));

                String uploadDetailFileName = saveDetailFileName.substring(saveDetailFileName.lastIndexOf("\\") + 1);
                System.out.println(uploadDetailFileName);
                // 파일명을 StringBuilder에 추가
                detailImageNamesBuilder.append(uploadDetailFileName).append(",");
            }
            // 마지막 쉼표 제거
            String detailImageNames = detailImageNamesBuilder.toString();
            if (!detailImageNames.isEmpty() && detailImageNames.endsWith(",")) {
                detailImageNames = detailImageNames.substring(0, detailImageNames.length() - 1);
            }
            // ReviewDto에 디테일 이미지 경로 설정
            reviewDto.setdetailImagePath(detailImageNames);
            reviewDto.setDetailUnique(detailImageNames); // 오리지널 이름
        }else {
            // 파일을 선택하지 않았을 경우, 기존 이미지 정보를 유지
            ReviewDto existingReview = reviewService.findById(id);
            reviewDto.setdetailImagePath(existingReview.getdetailImagePath());
            reviewDto.setDetailUnique(existingReview.getDetailUnique());
        }

        reviewDto.setId(id);
        reviewService.update(reviewDto); // DB 업데이트

        return "redirect:/board?id=" + reviewDto.getId();
    }

    // /board/paging?page=2
    // 처음 페이지 요청은 1페이지를 보여줌
    @GetMapping("/paging") //최근순
    public String paging(Model model,
                         @RequestParam(value = "page", required = false, defaultValue = "1") int page) {

        List<ReviewDto> reviewDtoList = reviewService.pagingList(page);

        ReviewPageDto pageDTO = reviewService.pagingParam(page);
        model.addAttribute("boardList", reviewDtoList);
        model.addAttribute("paging", pageDTO);
        return "paging";
    }

    @GetMapping("/paging2") //인기순
    public String paging2(Model model,
                          @RequestParam(value = "page", required = false, defaultValue = "1") int page){
        //인기순
        List<ReviewDto> reviewDtoList_p = reviewService.findPopularPostsPaged(page);
        ReviewPageDto pageDTO = reviewService.pagingParam(page);
        model.addAttribute("reviewDtoList_p", reviewDtoList_p);
        model.addAttribute("paging", pageDTO);
        return "paging2";
    }







}