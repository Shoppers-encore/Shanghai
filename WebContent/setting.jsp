<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<script src="script.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"></script>

<c:set var="project" value="/Shanghai/user/"/>
 
<!-- Page --> 
<c:set var="page_input" value="회원가입"/> 
<c:set var="page_login" value="로그인"/> 
<c:set var="head_basketList" value="장바구니 상세페이지"/>


<!-- String -->
<c:set var="str_review" value="Review"/>
<c:set var="str_productName" value="상품명"/>
<c:set var="str_title" value="글제목"/>
<c:set var="str_writer" value="작성자"/>
<c:set var="str_reviewDate" value="작성일"/>
<c:set var="str_id" value="아이디"/>
<c:set var="str_passwd" value="비밀번호"/>
<c:set var="str_nim" value=" 님"/>
<c:set var="str_dept" value="부서"/>
<c:set var="str_userList" value="회원목록"/>
<c:set var="str_goodList" value="상품목록"/>
<c:set var="str_boardList" value="게시판 관리"/>
<c:set var="str_admOrderFind" value="주문관리"/>
<c:set var="str_admGoodList" value="상품관리"/>
<c:set var="str_chat" value="실시간 상담"/>
<c:set var="str_mypage" value="마이 페이지"/>
<c:set var="str_name" value="이름"/>
<c:set var="str_tel" value="전화번호"/>
<c:set var="str_email" value="이메일"/>
<c:set var="str_goodInput" value="상품등록"/>
<c:set var="str_productCode" value="상품번호"/>
<c:set var="str_size" value="사이즈"/>
<c:set var="str_sizeS" value="SS"/>
<c:set var="str_sizeM" value="MM"/>
<c:set var="str_sizeL" value="LL"/>
<c:set var="str_sizeXL" value="XL"/>
<c:set var="str_sizeF" value="Free"/>
<c:set var="str_style" value="스타일"/>
<c:set var="str_height" value="키"/>
<c:set var="str_weight" value="몸무게"/>
<c:set var="str_casual" value="캐주얼"/>
<c:set var="str_dandy" value="댄디"/>
<c:set var="str_buyerCode" value="거래처"/>
<c:set var="str_color" value="색상"/>
<c:set var="msg_color_wht" value="WHITE, IVORY"/>
<c:set var="msg_color_blk" value="BLACK,  CHARCOAL"/>
<c:set var="msg_color_red" value="RED, BURGUNDY"/>
<c:set var="msg_color_blu" value="BLUE, DENIM"/>
<c:set var="msg_color_grn" value="GREEN, KAHKI, OLIVE"/>
<c:set var="msg_color_ylw" value="YELLOW"/>
<c:set var="msg_color_brn" value="BROWN"/>
<c:set var="msg_color_nvy" value="NAVY"/>
<c:set var="msg_color_gry" value="GRAY"/>
<c:set var="msg_color_beg" value="BEIGE, CAMEL"/>
<c:set var="msg_color_sky" value="SKYBLUE"/>
<c:set var="msg_color_org" value="ORANGE"/>
<c:set var="msg_color_ppl" value="PURPLE"/>
<c:set var="msg_color_pnk" value="PINK"/>
<c:set var="msg_color_etc" value="PURPLE, PINK, ORANGE, ETC"/>
<c:set var="str_price" value="금액"/>
<c:set var="str_salePercent" value="할인율"/>
<c:set var="str_category" value="카테고리"/>
<c:set var="str_top" value="상의"/>
<c:set var="str_bottom" value="하의"/>
<c:set var="str_out" value="[아우터]"/>
<c:set var="str_tst" value="[티]"/>
<c:set var="str_sht" value="[셔츠]"/>
<c:set var="str_btm" value="[팬츠]"/>
<c:set var="str_cot" value="코트"/>
<c:set var="str_jkt" value="자켓"/>
<c:set var="str_jpr" value="점퍼/집업"/>
<c:set var="str_cdg" value="가디건"/>
<c:set var="str_lst" value="긴 티"/>
<c:set var="str_sst" value="반팔 티"/>
<c:set var="str_mtm" value="맨투맨"/>
<c:set var="str_hdt" value="후드티"/>
<c:set var="str_lss" value="긴 셔츠"/>
<c:set var="str_sss" value="짧은 셔츠"/>
<c:set var="str_lpt" value="긴 바지"/>
<c:set var="str_spt" value="반바지"/>
<c:set var="str_content" value="내용"/>
<c:set var="str_writeReview" value="Reveiw 작성하기"/>
<c:set var="str_score" value="평점"/>
<c:set var="str_uploading" value="이미지 첨부"/>
<c:set var="str_productQuantity" value="수량"/>
<c:set var="str_itemsTotal" value="전체 상품: 총 "/>
<c:set var="str_productImage" value="상품 이미지"/>
<c:set var="str_quantityUnit" value="개"/>

<!-- color -->
<c:set var="str_color_wht" value="하얀색"/>
<c:set var="str_color_blk" value="검은색"/>
<c:set var="str_color_red" value="빨간색"/>
<c:set var="str_color_blu" value="파란색"/>
<c:set var="str_color_grn" value="초록색"/>
<c:set var="str_color_ylw" value="노란색"/>
<c:set var="str_color_brn" value="갈  색"/>
<c:set var="str_color_nvy" value="네이비"/>
<c:set var="str_color_gry" value="그레이"/>
<c:set var="str_color_beg" value="베이지"/>
<c:set var="str_color_sky" value="하늘색"/>

	
	
	
<!-- Button -->
<c:set var="btn_login" value="로그인"/>
<c:set var="btn_join" value="회원가입"/>
<c:set var="btn_findPw" value="비밀번호 찾기"/>
<c:set var="btn_myPage" value="내 정보"/>
<c:set var="btn_logout" value="로그아웃"/>
<c:set var="btn_confirmmail" value="이메일 확인"/>
<c:set var="btn_membermod" value="내정보 수정"/>
<c:set var="btn_back" value="이전화면"/>
<c:set var="btn_goodInput" value="상품등록"/>
<c:set var="btn_cancel" value="취소"/>
<c:set var="btn_write" value="작성"/>
<c:set var="btn_list" value="목록"/>



<!-- Message -->
<c:set var="msg_list_x" value="목록이 존재하지 않습니다."/>
<c:set var="msg_admLogin" value="관리자 로그인을 해 주세요."/>
<c:set var="msg_hello" value="안녕하세요!"/>
<c:set var="msg_rewritepw" value="수정 시 비밀번호 재입력이 필요합니다."/>
<c:set var="msg_noSearchResult" value="검색 결과가 존재하지 않습니다."/>
<c:set var="msg_searchProduct" value="검색할 내용을 입력하세요."/>
<c:set var="msg_emptyBasket" value="장바구니에 담긴 상품이 없습니다."/>
