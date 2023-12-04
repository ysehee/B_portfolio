package com.bitstudy.app.controller;

import com.bitstudy.app.dao.SearchPackageDao;
import com.bitstudy.app.domain.PackageCardDto;
import com.bitstudy.app.domain.PackageDto;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.Mapping;
import org.springframework.web.bind.annotation.PostMapping;

import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.Date;
import java.util.List;

@Controller
public class SearchPackageController {
    @Autowired
    SearchPackageDao searchPackageDao;

//    @GetMapping("/")
//    public String mainView(Model model) {
//        // 오늘 날짜 이후의 패키지들을 불러와 리스트에 저장하기
//        Date today = new Date();
//
//        // 날짜를 원하는 형식으로 변환하기 위해 SimpleDateFormat을 사용
//        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
//
//        // 날짜를 문자열로 변환
//        String startDate = sdf.format(today);
//        List<PackageCardDto> list = searchPackageDao.packageForHome(startDate);
//        System.out.println(list);
//
//        // 모델에 저장
//        model.addAttribute("packageForHome", list);
//
//        return "home";
//    }

    @GetMapping("/viewPackage")
    public String viewPackage(PackageCardDto packageCardDto, Model model) {
        // 1. 오늘 날짜 이후의 패키지들을 불러와 리스트에 저장하기 (오늘 날짜 처리는 mapper에서 함)
        List<PackageCardDto> list = searchPackageDao.selectAllPackage(packageCardDto);

        model.addAttribute("allPackageList", list);

        System.out.println(list);

        return "searchPage";
    }
}
