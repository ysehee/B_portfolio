package com.bitstudy.app.dao;

import com.bitstudy.app.domain.PackageCardDto;
import com.bitstudy.app.domain.PackageContentDto;
import com.bitstudy.app.domain.PackageDto;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Date;
import java.util.List;

import static java.time.LocalDate.now;
import static org.junit.Assert.*;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"file:src/main/webapp/WEB-INF/spring/**/root-context.xml"})
public class SearchPackageDaoTest {
    @Autowired
    SearchPackageDao searchPackageDao;

//    @Test
//    public void selectAllPackage() {
//        List<PackageCardDto> list = searchPackageDao.selectAllPackage("2023-11-22");
//        System.out.println(list);
//
//        assertTrue(list != null);
//    }

//    @Test
//    public void selectSearchPackage() {
//        List<PackageDto> list = searchPackageDao.selectSearchPackage("South Korea", "Seoul", "2023-11-22");
//        System.out.println(list);
//
//        assertTrue(list != null);
//    }

    @Test
    public void insertAllPackage() {
        List<List<String>> packageList = Arrays.asList(
                Arrays.asList("그룹투어", "국내", "서울", "광화문 투어", "100000"),
                Arrays.asList("그룹투어", "국내", "서울", "북촌 한옥 마을", "200000"),
                Arrays.asList("자유여행", "국내", "서울", "명동 맛집 투어", "300000"),
                Arrays.asList("자유여행", "국내", "서울", "강남 쇼핑의 성지", "100000"),
                Arrays.asList("그룹투어", "국내", "서울", "서울 야경 투어", "250000"),
                Arrays.asList("자유여행", "국내", "서울", "한강에서 치맥을!", "100000"),
                Arrays.asList("자유여행", "국내", "서울", "한강에서 자전거타기", "120000"),
                Arrays.asList("그룹투어", "국내", "서울", "경복궁 투어", "100000"),
                Arrays.asList("그룹투어", "국내", "서울", "대한민국 역사 박물관", "200000"),
                Arrays.asList("그룹투어", "국내", "서울", "서대문 형무소 역사관", "300000"),
                Arrays.asList("그룹투어", "국내", "서울", "전쟁 기념관", "100000"),
                Arrays.asList("자유여행", "국내", "부산", "자갈치 시장", "250000"),
                Arrays.asList("자유여행", "국내", "부산", "재래시장 투어", "100000"),
                Arrays.asList("자유여행", "국내", "부산", "해운대와 광안대교 탐방", "120000"),
                Arrays.asList("자유여행", "국내", "제주", "성산일출봉과 흑돼지", "100000"),
                Arrays.asList("자유여행", "국내", "제주", "새별오름과 노을 감상", "200000"),
                Arrays.asList("자유여행", "국내", "동해", "한국의 캘리포니아! 서핑의 성지", "300000"),
                Arrays.asList("자유여행", "국내", "대구", "빵에 진심인 도시! 대구 빵집 투어", "100000"),
                Arrays.asList("그룹투어", "국내", "제주", "한라산 하이킹", "250000"),
                Arrays.asList("자유여행", "국내", "담양", "대나무 숲과 대나무 밥", "100000"),
                Arrays.asList("그룹투어", "국내", "보성", "보성녹차 밭 체험하기", "120000"),
                Arrays.asList("그룹투어", "국내", "부산", "태종대 투어", "100000"),
                Arrays.asList("그룹투어", "국내", "제주", "감귤농장 체험", "200000"),
                Arrays.asList("그룹투어", "국내", "동해", "정동진 해돋이", "300000"),
                Arrays.asList("그룹투어", "아시아", "몽골", "테를지 국립공원", "300000"),
                Arrays.asList("그룹투어", "아시아", "몽골", "홍고린엘스 모래언덕", "400000"),
                Arrays.asList("그룹투어", "아시아", "몽골", "욜링암 트래킹", "500000"),
                Arrays.asList("그룹투어", "아시아", "몽골", "홉스굴 호수", "250000"),
                Arrays.asList("그룹투어", "아시아", "몽골", "몽골의 수도 울란바토르", "350000"),
                Arrays.asList("자유여행", "유럽", "영국", "영국의 수도 런던", "300000"),
                Arrays.asList("그룹투어", "유럽", "영국", "스코틀랜드의 에든버러", "400000"),
                Arrays.asList("그룹투어", "유럽", "영국", "옥스퍼드 탐방", "500000"),
                Arrays.asList("자유여행", "유럽", "영국", "레이크 디스트릭트 국립공원", "250000"),
                Arrays.asList("그룹투어", "유럽", "영국", "축구의 본고장 맨체스터", "350000"),
                Arrays.asList("그룹투어", "아시아", "중국", "중국의 수도 베이징", "300000"),
                Arrays.asList("자유여행", "아시아", "중국", "상하이의 샤오롱바오 맛집투어", "400000"),
                Arrays.asList("그룹투어", "아시아", "중국", "만리장성 투어", "500000"),
                Arrays.asList("그룹투어", "아시아", "중국", "진시황릉과 병마용 관람", "250000"),
                Arrays.asList("그룹투어", "아시아", "중국", "상하이 디즈니랜드", "350000"),
                Arrays.asList("그룹투어", "북아메리카", "미국", "그랜드캐니언 탐방", "800000"),
                Arrays.asList("자유여행", "북아메리카", "미국", "미국의 수도 뉴욕시티", "400000"),
                Arrays.asList("자유여행", "북아메리카", "미국", "피자 먹으러 시카고", "500000"),
                Arrays.asList("그룹투어", "북아메리카", "미국", "뉴올리언스의 재즈거리", "250000"),
                Arrays.asList("그룹투어", "북아메리카", "미국", "서핑의 도시 캘리포니아", "350000"),
                Arrays.asList("자유여행", "아시아", "일본", "일본의 수도 도쿄", "300000"),
                Arrays.asList("그룹투어", "아시아", "일본", "유니버셜 스튜디오", "400000"),
                Arrays.asList("그룹투어", "아시아", "일본", "사슴공원 체험", "500000"),
                Arrays.asList("자유여행", "아시아", "일본", "훗카이도 료칸과 전통여관 체험", "250000"),
                Arrays.asList("자유여행", "아시아", "일본", "후쿠오카 쇼핑 즐기기", "350000")
        );

//        System.out.println(packageList.get(20).get(3));

        List<PackageDto> list = new ArrayList<>();

        for (List<String> packItem : packageList) {
            for (int i = 0; i < 10; i++) {
                // 오늘 날짜
                LocalDate today = LocalDate.now().plusDays(i);
                // 원하는 형식의 문자열로 변환
                DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");
                String date = today.format(formatter);

                PackageDto packageInfo = new PackageDto();

                packageInfo.setPackageType(packItem.get(0));
                packageInfo.setPackageCategory(packItem.get(1));
                packageInfo.setPackageLocation(packItem.get(2));
                packageInfo.setPackageTheme(packItem.get(3));
                packageInfo.setPackageStartDate(date);
                packageInfo.setPackagePrice(packItem.get(4));


//            System.out.println(packItem.get(0));
                list.add(packageInfo);
            }
        }


//        System.out.println(list);
        searchPackageDao.insertAllPackage(list);
    }

    @Test
    public void insertContent() {
        List<List<String>> packageList = Arrays.asList(
                Arrays.asList("그룹투어", "국내", "서울", "광화문 투어", "100000"),
                Arrays.asList("그룹투어", "국내", "서울", "북촌 한옥 마을", "200000"),
                Arrays.asList("자유여행", "국내", "서울", "명동 맛집 투어", "300000"),
                Arrays.asList("자유여행", "국내", "서울", "강남 쇼핑의 성지", "100000"),
                Arrays.asList("그룹투어", "국내", "서울", "서울 야경 투어", "250000"),
                Arrays.asList("자유여행", "국내", "서울", "한강에서 치맥을!", "100000"),
                Arrays.asList("자유여행", "국내", "서울", "한강에서 자전거타기", "120000"),
                Arrays.asList("그룹투어", "국내", "서울", "경복궁 투어", "100000"),
                Arrays.asList("그룹투어", "국내", "서울", "대한민국 역사 박물관", "200000"),
                Arrays.asList("그룹투어", "국내", "서울", "서대문 형무소 역사관", "300000"),
                Arrays.asList("그룹투어", "국내", "서울", "전쟁 기념관", "100000"),
                Arrays.asList("자유여행", "국내", "부산", "자갈치 시장", "250000"),
                Arrays.asList("자유여행", "국내", "부산", "재래시장 투어", "100000"),
                Arrays.asList("자유여행", "국내", "부산", "해운대와 광안대교 탐방", "120000"),
                Arrays.asList("자유여행", "국내", "제주", "성산일출봉과 흑돼지", "100000"),
                Arrays.asList("자유여행", "국내", "제주", "새별오름과 노을 감상", "200000"),
                Arrays.asList("자유여행", "국내", "동해", "한국의 캘리포니아! 서핑의 성지", "300000"),
                Arrays.asList("자유여행", "국내", "대구", "빵에 진심인 도시! 대구 빵집 투어", "100000"),
                Arrays.asList("그룹투어", "국내", "제주", "한라산 하이킹", "250000"),
                Arrays.asList("자유여행", "국내", "담양", "대나무 숲과 대나무 밥", "100000"),
                Arrays.asList("그룹투어", "국내", "보성", "보성녹차 밭 체험하기", "120000"),
                Arrays.asList("그룹투어", "국내", "부산", "태종대 투어", "100000"),
                Arrays.asList("그룹투어", "국내", "제주", "감귤농장 체험", "200000"),
                Arrays.asList("그룹투어", "국내", "동해", "정동진 해돋이", "300000"),
                Arrays.asList("그룹투어", "아시아", "몽골", "테를지 국립공원", "300000"),
                Arrays.asList("그룹투어", "아시아", "몽골", "홍고린엘스 모래언덕", "400000"),
                Arrays.asList("그룹투어", "아시아", "몽골", "욜링암 트래킹", "500000"),
                Arrays.asList("그룹투어", "아시아", "몽골", "홉스굴 호수", "250000"),
                Arrays.asList("그룹투어", "아시아", "몽골", "몽골의 수도 울란바토르", "350000"),
                Arrays.asList("자유여행", "유럽", "영국", "영국의 수도 런던", "300000"),
                Arrays.asList("그룹투어", "유럽", "영국", "스코틀랜드의 에든버러", "400000"),
                Arrays.asList("그룹투어", "유럽", "영국", "옥스퍼드 탐방", "500000"),
                Arrays.asList("자유여행", "유럽", "영국", "레이크 디스트릭트 국립공원", "250000"),
                Arrays.asList("그룹투어", "유럽", "영국", "축구의 본고장 맨체스터", "350000"),
                Arrays.asList("그룹투어", "아시아", "중국", "중국의 수도 베이징", "300000"),
                Arrays.asList("자유여행", "아시아", "중국", "상하이의 샤오롱바오 맛집투어", "400000"),
                Arrays.asList("그룹투어", "아시아", "중국", "만리장성 투어", "500000"),
                Arrays.asList("그룹투어", "아시아", "중국", "진시황릉과 병마용 관람", "250000"),
                Arrays.asList("그룹투어", "아시아", "중국", "상하이 디즈니랜드", "350000"),
                Arrays.asList("그룹투어", "북아메리카", "미국", "그랜드캐니언 탐방", "800000"),
                Arrays.asList("자유여행", "북아메리카", "미국", "미국의 수도 뉴욕시티", "400000"),
                Arrays.asList("자유여행", "북아메리카", "미국", "피자 먹으러 시카고", "500000"),
                Arrays.asList("그룹투어", "북아메리카", "미국", "뉴올리언스의 재즈거리", "250000"),
                Arrays.asList("그룹투어", "북아메리카", "미국", "서핑의 도시 캘리포니아", "350000"),
                Arrays.asList("자유여행", "아시아", "일본", "일본의 수도 도쿄", "300000"),
                Arrays.asList("그룹투어", "아시아", "일본", "유니버셜 스튜디오", "400000"),
                Arrays.asList("그룹투어", "아시아", "일본", "사슴공원 체험", "500000"),
                Arrays.asList("자유여행", "아시아", "일본", "훗카이도 료칸과 전통여관 체험", "250000"),
                Arrays.asList("자유여행", "아시아", "일본", "후쿠오카 쇼핑 즐기기", "350000")
        );

        List<PackageContentDto> list = new ArrayList<>();

        for (List<String> packContent : packageList) {

            PackageContentDto packageInfo = new PackageContentDto();

            packageInfo.setPackageType(packContent.get(0));
            packageInfo.setPackageId(packContent.get(1)+"_"+packContent.get(2)+"_"+packContent.get(3));
            packageInfo.setPackageTitle(packContent.get(3));
            packageInfo.setPackageContent(packContent.get(3));

//            System.out.println(packItem.get(0));
            list.add(packageInfo);

        }

//        System.out.println(list);
        searchPackageDao.insertPackageContent(list);
    }
}
