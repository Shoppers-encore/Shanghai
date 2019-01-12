<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<link rel="stylesheet" type="text/css" href="/urPresent/user/urPresent_style.css">

<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"></script>

<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>

<script src="/urPresent/script.js"></script>

<c:set var="project" value="/urPresent/user/" />

<!-- Page -->
<c:set var="page_input" value="회원가입" />
<c:set var="page_login" value="로그인" />
<c:set var="page_findId" value="아이디 찾기" />
<c:set var="page_findPasswd" value="비밀번호 찾기" />
<c:set var="page_manageTag" value="태그 관리" />

<c:set var="head_basketList" value="장바구니 상세 페이지" />
<c:set var="head_userOrderList" value="내 주문 내역 페이지" />
<c:set var="head_userOrderDetail" value="주문 내역 상세 페이지" />
<c:set var="head_orderInputForm" value="주문 결제 페이지" />
<c:set var="head_productModify" value="상품수정" />
<c:set var="head_main" value="지금, 그대." />
<c:set var="head_best" value="BEST 상품 페이지" />


<!-- String -->
<c:set var="str_review" value="Review" />
<c:set var="str_productName" value="상품명" />
<c:set var="str_title" value="글제목" />
<c:set var="str_writer" value="작성자" />
<c:set var="str_reviewDate" value="작성일" />
<c:set var="str_id" value="아이디" />
<c:set var="str_passwd" value="비밀번호" />
<c:set var="str_repasswd" value="비밀번호 재확인" />
<c:set var="str_bday" value="생일" />
<c:set var="str_gender" value="성별" />
<c:set var="str_gender_m" value="남성" />
<c:set var="str_gender_f" value="여성" />
<c:set var="str_zipcode" value="우편번호" />
<c:set var="str_addressPlaceholder" value="검색 버튼을 눌러 주소를 입력해 주세요."/>
<c:set var="str_address" value="주소" />
<c:set var="str_addressDetail" value="상세 주소" />
<c:set var="str_nim" value=" 님" />
<c:set var="str_dept" value="부서" />
<c:set var="str_userList" value="회원목록" />
<c:set var="str_productList" value="상품목록" />
<c:set var="str_boardList" value="게시판 관리" />
<c:set var="str_admOrderList" value="주문관리" />
<c:set var="str_admProductList" value="상품관리" />
<c:set var="str_chat" value="실시간 상담" />
<c:set var="str_myPage" value="회원 정보" />
<c:set var="str_name" value="이름" />
<c:set var="str_tel" value="전화번호" />
<c:set var="str_email" value="이메일" />
<c:set var="str_productInput" value="상품등록" />
<c:set var="str_productCode" value="상품번호" />
<c:set var="str_size" value="사이즈" />
<c:set var="str_sizeS" value="SS" />
<c:set var="str_sizeM" value="MM" />
<c:set var="str_sizeL" value="LL" />
<c:set var="str_sizeXL" value="XL" />
<c:set var="str_sizeF" value="Free" />
<c:set var="str_style" value="스타일" />
<c:set var="str_height" value="키" />
<c:set var="str_weight" value="몸무게" />
<c:set var="str_casual" value="캐주얼" />
<c:set var="str_dandy" value="댄디" />
<c:set var="str_buyerCode" value="거래처" />
<c:set var="str_color" value="색상" />
<c:set var="str_price" value="금액" />
<c:set var="str_salePercent" value="할인율" />
<c:set var="str_category" value="카테고리" />
<c:set var="str_content" value="내용" />
<c:set var="str_writeReview" value="Reveiw 작성하기" />
<c:set var="str_rating" value="평점" />
<c:set var="str_uploading" value="이미지 첨부" />
<c:set var="str_productQuantity" value="수량" />
<c:set var="str_itemsTotal" value="전체 상품: 총 " />
<c:set var="str_productImage" value="상품 이미지" />
<c:set var="str_quantityUnit" value="개" />

<c:set var="str_orderList" value="주문 내역" />
<c:set var="str_totalUser" value="총 회원수" />
<c:set var="str_var" value="현재수량" />
<c:set var="str_varPlus" value="추가할 수량" />
<c:set var="str_num" value="글번호" />
<c:set var="str_reviewList" value="리뷰관리" />
<c:set var="str_searchTitle" value="제목" />
<c:set var="str_searchBoth" value="제목+내용" />
<c:set var="str_orderCode" value="주문번호" />
<c:set var="str_orderId" value="주문자" />
<c:set var="str_orderStatus" value="주문상태" />
<c:set var="str_totalPrice" value="합계" />
<c:set var="str_orderStatus0" value="입금대기중" />
<c:set var="str_orderStatus1" value="배송준비중" />
<c:set var="str_orderStatus2" value="배송중" />
<c:set var="str_orderStatus3" value="배송완료" />
<c:set var="str_orderDetail" value="주문상세" />
<c:set var="str_viewRv" value="리뷰 내용" />
<c:set var="str_writeDate" value="작성일" />
<c:set var="str_modifyReview" value="리뷰 수정" />

<c:set var="str_myOrderList" value="내 주문 내역: 총 " />
<c:set var="str_orderDate" value="주문날짜" />
<c:set var="str_orderCount" value="주문한 상품" />
<c:set var="str_orderUnit" value="건" />
<c:set var="str_orderAddress" value="배송 주소" />
<c:set var="str_productPrice" value="가격" />
<c:set var="str_cart" value="장바구니" />
<c:set var="str_select" value="선택" />
<c:set var="str_currencyUnit" value="원" />
<c:set var="str_saveToBasket" value="장바구니에 저장" />
<c:set var="str_quantityMod" value="재고수정" />
<c:set var="str_lastChat" value="마지막 내용" />
<c:set var="str_chatTime" value="시간" />
<c:set var="str_soldOut" value="품절" />
<c:set var="str_remainingProdQty" value="재고" />
<c:set var="str_discount" value="% 할인 중" />
<c:set var="str_quantityMod" value="추가할 수량" />
<c:set var="str_productCode" value="상품코드" />
<c:set var="str_product" value="PRODUCT" />
<c:set var="str_userOrderList" value="님의 주문 내역" />
<c:set var="str_product_detail" value="상품 상세정보" />
<c:set var="str_order_detail" value="주문 상세정보" />
<c:set var="str_teamName" value="응답하라 8080"/>
<c:set var="str_joinUsLine1" value="지금 그대의 소중한 멤버가 되어주세요!"/>
<c:set var="str_joinUsLine2" value="다양한 할인 혜택이 기다리고 있어요 :)"/>
<c:set var="str_noDash" value="-없이 입력해 주세요."/>
<c:set var="str_reviewIcon" value="리뷰 보기"/>
<c:set var="str_searchIcon" value="상품 검색"/>
<c:set var="str_modifyMyInfo" value="회원 정보 수정"/>
<c:set var="str_companyInfoWarning" value="(하단의 회사 정보는 모두 사실이 아니며 웹 프로젝트를 위해 임의로 만들어 낸 내용임을 적시합니다.)"/>
<c:set var="str_companyName" value="(주) R:8080 스튜디오"/>
<c:set var="str_CEO" value="정원형"/>
<c:set var="str_companyTel" value="080-8080-8080"/>
<c:set var="str_companyAddress" value="(본사) 06643 서울특별시 서초구 효령로 335 104호"/>
<c:set var="str_onlineBusinessLicense" value="제2018-서울서초-0808호"/>
<c:set var="str_webMaster" value="양희윤"/>
<c:set var="str_companyBankAccount" value="808080-808-080808"/>
<c:set var="str_csInfoWarning" value="(하단의 CS 정보는 모두 사실이 아니며 웹 프로젝트를 위해 임의로 만들어 낸 내용임을 적시합니다.)"/>
<c:set var="str_bank" value="엔코아"/>
<c:set var="str_recommendations" value="님을 위한 맞춤 추천"/>
<c:set var="str_recDescription" value="회원님의 구매 이력을 바탕으로 추천해 드리는 상품입니다."/>
<c:set var="str_leaveComment" value="회원님의 소중한 리뷰를 항상 기다리고 있어요 :)"/>

<!-- color -->
<c:set var="msg_color_wht" value="WHITE, IVORY" />
<c:set var="msg_color_blk" value="BLACK,  CHARCOAL" />
<c:set var="msg_color_red" value="RED, BURGUNDY" />
<c:set var="msg_color_blu" value="BLUE, DENIM" />
<c:set var="msg_color_grn" value="GREEN, KAHKI, OLIVE" />
<c:set var="msg_color_ylw" value="YELLOW" />
<c:set var="msg_color_brn" value="BROWN" />
<c:set var="msg_color_nvy" value="NAVY" />
<c:set var="msg_color_gry" value="GRAY" />
<c:set var="msg_color_beg" value="BEIGE, CAMEL" />
<c:set var="msg_color_sky" value="SKYBLUE" />
<c:set var="msg_color_org" value="ORANGE" />
<c:set var="msg_color_ppl" value="PURPLE" />
<c:set var="msg_color_pnk" value="PINK" />
<c:set var="msg_color_etc" value="PURPLE, PINK, ORANGE, ETC" />
<c:set var="str_color_wht" value="하얀색" />
<c:set var="str_color_blk" value="검은색" />
<c:set var="str_color_red" value="빨간색" />
<c:set var="str_color_blu" value="파란색" />
<c:set var="str_color_grn" value="초록색" />
<c:set var="str_color_ylw" value="노란색" />
<c:set var="str_color_brn" value="갈  색" />
<c:set var="str_color_nvy" value="네이비" />
<c:set var="str_color_gry" value="그레이" />
<c:set var="str_color_beg" value="베이지" />
<c:set var="str_color_sky" value="하늘색" />

<!-- (new) category -->
<c:set var="str_cat_OUTER" value="OUTER" />
<c:set var="str_cat_JKnJP" value="JACKET & JUMPER" />
<c:set var="str_cat_COAT" value="COAT" />
<c:set var="str_cat_CARDIGAN" value="CARDIGAN" />
<c:set var="str_cat_DRESS" value="DRESS" />
<c:set var="str_cat_BLnSHIRTS" value="BLOUSE & SHIRTS" />
<c:set var="str_cat_BLOUSE" value="BLOUSE" />
<c:set var="str_cat_SHIRTS" value="SHIRTS" />
<c:set var="str_cat_TnTOP" value="T-SHIRTS & TOP" />
<c:set var="str_cat_TSHIRTS" value="T-SHIRTS" />
<c:set var="str_cat_KNIT" value="KNIT" />
<c:set var="str_cat_SKIRT" value="SKIRT" />
<c:set var="str_cat_PANTS" value="PANTS" />
<c:set var="str_cat_SHOES" value="SHOES" />
<c:set var="str_cat_BAG" value="BAG" />
<c:set var="str_cat_ACCESSORY" value="ACCESSORY" />
<c:set var="str_cat_OUTER_ALL" value="OUTER ALL" />
<c:set var="str_cat_BLnSHIRTS_ALL" value="BLOUSE & SHIRTS ALL" />
<c:set var="str_cat_TnTOP_ALL" value="T-SHIRTS & TOP ALL" />
<c:set var="str_cat_JKnJP_kor" value="자켓&점퍼" />
<c:set var="str_cat_COAT_kor" value="코트" />
<c:set var="str_cat_CARDIGAN_kor" value="가디건" />
<c:set var="str_cat_DRESS_kor" value="드레스" />
<c:set var="str_cat_BLOUSE_kor" value="블라우스" />
<c:set var="str_cat_SHIRTS_kor" value="셔츠" />
<c:set var="str_cat_TSHIRTS_kor" value="티셔츠" />
<c:set var="str_cat_KNIT_kor" value="니트" />
<c:set var="str_cat_SKIRT_kor" value="스커트" />
<c:set var="str_cat_PANTS_kor" value="팬츠" />
<c:set var="str_cat_SHOES_kor" value="슈즈" />
<c:set var="str_cat_BAG_kor" value="가방" />
<c:set var="str_cat_ACCESSORY_kor" value="액세서리" />



<!-- Button -->
<c:set var="btn_login" value="로그인" />
<c:set var="btn_join" value="회원가입" />
<c:set var="btn_cancelJoin" value="가입취소"/>
<c:set var="btn_findPw" value="비밀번호 찾기" />
<c:set var="btn_myPage" value="내 정보" />
<c:set var="btn_logout" value="로그아웃" />
<c:set var="btn_confirmmail" value="이메일 확인" />
<c:set var="btn_membermod" value="내정보 수정" />
<c:set var="btn_back" value="이전화면" />
<c:set var="btn_productInput" value="상품등록" />
<c:set var="btn_cancel" value="취소" />
<c:set var="btn_write" value="작성" />
<c:set var="btn_list" value="목록" />
<c:set var="btn_search" value="검색" />
<c:set var="btn_save" value="저장" />
<c:set var="btn_orderCancel" value="주문취소" />
<c:set var="btn_modify" value="수정" />
<c:set var="btn_productDel" value="상품삭제" />
<c:set var="btn_scoreUp" value="나도 공감하기" />
<c:set var="btn_delete" value="삭제" />
<c:set var="btn_buy" value="구매" />
<c:set var="btn_inputCart" value="장바구니" />
<c:set var="btn_like" value="나도 공감하기" />
<c:set var="btn_likecancel" value="공감취소" />
<c:set var="btn_confirm" value="확인" />
<c:set var="btn_selfConfirm" value="인증" />
<c:set var="btn_resend" value="재전송" />

<c:set var="btn_select" value="선택" />
<c:set var="btn_goodInput" value="상품등록" />
<c:set var="btn_manageTag" value="태그 관리" />
<c:set var="btn_addTag" value="태그 추가" />
<c:set var="btn_delTag" value="태그 삭제" />
<c:set var="btn_writeComment" value="댓글쓰기" />
<c:set var="btn_orderDetails" value="상세보기" />
<c:set var="btn_writeReview" value="리뷰쓰기" />
<c:set var="btn_fold" value="접기" />
<c:set var="btn_userDelete" value="탈퇴" />
<c:set var="btn_x" value="삭제" />
<c:set var="btn_productModify" value="상품수정" />
<c:set var="btn_orderCheckedItems" value="선택 상품 주문" />
<c:set var="btn_continueShopping" value="쇼핑 계속하기" />
<c:set var="btn_order" value="주문하기" />
<c:set var="btn_gotoUserMain" value="사용자메인" />
<c:set var="btn_returnToBasket" value="장바구니 수정" />
<c:set var="btn_send" value="전송" />
<c:set var="btn_orderList" value="주문목록" />
<c:set var="btn_addImage" value="사진추가"/>
<c:set var="btn_exit" value="닫기"/>


<!-- Message -->
<c:set var="msg_list_x" value="목록이 없습니다." />
<c:set var="msg_admLogin" value="관리자 로그인을 해 주세요." />
<c:set var="msg_hello" value="안녕하세요!" />
<c:set var="msg_rewritepw" value="수정 시 비밀번호 재입력이 필요합니다." />
<c:set var="msg_noSearchResult" value="검색 결과가 없습니다." />
<c:set var="msg_searchProduct" value="검색할 내용을 입력하세요." />
<c:set var="msg_copyright"
	value="Copyright &copy; 2018 삼김일정(3Kim1Jeong)" />
<c:set var="msg_reviewScore" value="명이 공감한 게시물입니다." />
<c:set var="msg_emptyBasket" value="장바구니에 담긴 상품이 없습니다." />
<c:set var="msg_like" value="명이 공감한 게시물입니다." />
<c:set var="msg_addTag" value="추가할 태그를 입력하세요." />
<c:set var="msg_insertContent" value="내용을 입력하세요" />
<c:set var="msg_searchResult" value="개의 검색결과가 있습니다. 검색어 : " />

<c:set var="msg_emptyOrderList" value="주문 내역이 없습니다." />
<c:set var="msg_tryLater" value="잠시 후 다시 시도해 주세요." />
<c:set var="msg_success" value="성공" />
<c:set var="msg_failure" value="실패" />
<c:set var="msg_systemFailure" value="시스템 점검 중 입니다. 잠시 후 다시 시도해 주세요." />
<c:set var="msg_selectColor" value="상품 색상을 선택해 주세요." />
<c:set var="msg_selectSize" value="상품 사이즈를 선택해 주세요." />
<c:set var="msg_saveSuccess" value="해당 상품을 장바구니에 저장했습니다." />
<c:set var="msg_confirmAuthKey" value="메일로 전송된 인증번호를 입력하세요." />
<c:set var="msg_main_login" value="님 안녕하세요" />
<c:set var="msg_noPhoto" value="사진을 등록해주세요!" />
<c:set var="msg_gotoProductList" value="상품관리에서 추가 가능합니다." />
<c:set var="msg_selectItemsToOrder" value="주문하실 상품을 선택해 주세요." />
<c:set var="msg_selectedColors" value="입력한 색상 : " />
<c:set var="msg_searchWithWord" value="색상은  검색어와 함께 입력해 주세요." />
<c:set var="msg_emailVerificationNeeded" value="이메일 인증을 해 주세요."/>
<c:set var="msg_findId" value="등록하신 이름과 이메일 주소를 입력해 주세요."/>
<c:set var="msg_findPasswd" value="등록하신 아이디와 이름, 이메일 주소를 입력해 주세요."/>
<c:set var="msg_userDelete" value="탈퇴 후 아이디 복구는 불가능하며 \n재가입을 하셔도 기존의 정보는 되돌릴 수 없습니다.\n정말 탈퇴하시겠습니까?"/>

<!-- url -->
<c:set var="url_pageNum" value="?pageNum=" />
<c:set var="url_searchType" value="&searchType=" />
<c:set var="url_searchWord" value="&searchWord=" />



