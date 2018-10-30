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
 
    <c:set var="project" value="/Webp/view/"/>

    <!-- (관리자/사용자)회원관리 -->
    <c:set var="str_id" value="아이디"/>
    <c:set var="str_passwd" value="비밀번호"/>
    <c:set var="str_name" value="이름"/>
    <c:set var="str_tel" value="전화번호"/>
    <c:set var="str_email" value="이메일"/>
    <c:set var="str_adr" value="주소"/>
    <c:set var="str_orderList" value="주문내역"/>
    <c:set var="str_dept" value="부서"/>
    <c:set var="str_join" value="회원가입"/>
    <c:set var="str_mypage" value="마이 페이지"/>
    <c:set var="str_goodSearch" value="상품 검색"/>

    <c:set var="str_nim" value=" 님"/>
	<c:set var="str_admList" value="사원목록"/>
    <c:set var="str_userList" value="회원목록"/>
    <c:set var="str_goodList" value="상품목록"/>
    <c:set var="str_boardList" value="게시판 관리"/>
    <c:set var="str_QnA" value="Q & A"/>
    <c:set var="str_review" value="Review"/>
    <c:set var="str_dealView" value="발주관리"/>
    <c:set var="str_chat" value="실시간 상담"/>
    <c:set var="str_totalEmpl" value="총 사원수"/>
    <c:set var="str_totalUser" value="총 회원수"/>
    <c:set var="str_productCode" value="상품번호"/>
    <c:set var="str_productName" value="상품명"/>
    <c:set var="str_salePercent" value="할인율"/>
    <c:set var="str_price" value="가격"/>
    <c:set var="str_var" value="현재수량"/>
    <c:set var="str_admOrderFind" value="주문관리"/>
    <c:set var="str_admGoodList" value="상품관리"/>
    <c:set var="str_goodInput" value="상품등록"/>
    <c:set var="str_varPlus" value="추가할 수량"/>
	<c:set var="str_goodModify" value="상품수정"/>

    <c:set var="str_num" value="글번호"/>
    <c:set var="str_title" value="제목"/>
    <c:set var="str_write" value="글쓰기"/>
    <c:set var="str_writer" value="작성자"/>
    <c:set var="str_writeTime" value="작성일"/>
    <c:set var="str_readCount" value="조회수"/>
    <c:set var="str_writeNotice" value="공지사항 작성"/>
    <c:set var="str_viewNotice" value="공지사항 내용"/>
	<c:set var="str_modNotice" value="공지사항 수정"/>
	<c:set var="str_writeQA" value="문의 작성"/>
	<c:set var="str_viewQA" value="문의 내용"/>
	<c:set var="str_modQA" value="문의 수정"/>
	<c:set var="str_writeRv" value="리뷰 작성"/>
	<c:set var="str_viewRv" value="리뷰 내용"/>
	<c:set var="str_modRv" value="리뷰 수정"/>
	<c:set var="str_score" value="평점"/>
	<c:set var="str_uploadimg" value="이미지 첨부"/>
	<c:set var="str_searchCount" value="검색 결과"/>
    
	<c:set var="str_buyerName" value="거래처명"/>
    <c:set var="str_dealCode" value="발주번호"/>
    <c:set var="str_buyerCode" value="거래처"/>
    <c:set var="str_status" value="상태"/>
	<c:set var="str_dealInput" value="발주하기"/>

    <c:set var="str_orderFind" value="주문관리"/>
    <c:set var="str_orderCode" value="주문번호"/>
    <c:set var="str_orderId" value="주문자"/>
    <c:set var="str_orderDetail" value="주문 상세내역"/>
    <c:set var="str_address" value="주소"/>
	<c:set var="str_zipcode" value="우편번호"/>
    <c:set var="str_invoiceCode" value="송장번호"/>
    <c:set var="str_totalPrice" value="합계"/>
	<c:set var="str_content" value="내용"/>
    <c:set var="str_orderDelivery" value="주문/배송조회"/>
    <c:set var="str_cart" value="장바구니"/>
    
    <c:set var="str_size" value="사이즈"/>
    <c:set var="str_sizeS" value="SS"/>
    <c:set var="str_sizeM" value="MM"/>
    <c:set var="str_sizeL" value="LL"/>
    <c:set var="str_sizeXL" value="XL"/>
    <c:set var="str_sizeF" value="Free"/>
    <c:set var="str_color" value="색상"/>
    <c:set var="str_white" value="WHITE"/>
    <c:set var="str_black" value="BLACK"/>
    <c:set var="str_red" value="RED"/>
    <c:set var="str_orange" value="ORANGE"/>
    <c:set var="str_yellow" value="YELLOW"/>
    <c:set var="str_green" value="GREEN"/>
    <c:set var="str_blue" value="BLUE"/>
    <c:set var="str_sky" value="SKY"/>
    <c:set var="str_navy" value="NAVY"/>
    <c:set var="str_purple" value="PURPLE"/>
    <c:set var="str_brown" value="BROWN"/>
    <c:set var="str_gray" value="GRAY"/>
    <c:set var="str_beige" value="BEIGE"/>
    <c:set var="str_pink" value="PINK"/>
    
    <c:set var="str_style" value="스타일"/>
	<c:set var="str_height" value="키"/>
	<c:set var="str_weight" value="몸무게"/>
	<c:set var="str_casual" value="캐주얼"/>
	<c:set var="str_dandy" value="댄디"/>
	<c:set var="str_manual" value="직접입력"/>
	<c:set var="str_choose" value="선택하세요"/>
	<c:set var="str_orderDate" value="주문일자"/>
	<c:set var="str_product_info" value="상품정보"/>
	<c:set var="str_price" value="금액"/>
	<c:set var="str_orderStatus" value="주문상태"/>
	<c:set var="str_order" value="주문"/>
	<c:set var="str_won" value="원"/>
	<c:set var="str_gae" value="개"/>
	<c:set var="str_newPasswd" value="새 비밀번호"/>
	<c:set var="str_repasswd" value="비밀번호 확인"/>
	<c:set var="str_orderPay" value="주문/결제"/>
	<c:set var="str_insertAddress" value="배송지 정보 입력"/>
	<c:set var="str_defaultAdr" value="기본배송지"/>
	<c:set var="str_insertAdr" value="직접입력"/>
	<c:set var="str_selectAdr" value="배송지 선택"/>
	
	<c:set var="str_paymentMtd" value="결제방법"/>
	<c:set var="str_paymentMtd" value="결제방법"/>
	<c:set var="str_kmbank" value="국민은행"/>
	<c:set var="str_shbank" value="신한은행"/>
	<c:set var="str_refundApply" value="교환/반품 신청"/>
	<c:set var="str_seller" value="판매자"/>
	<c:set var="str_customer" value="구매자"/>
	<c:set var="str_refund1" value="색상 및 사이즈 변경"/>
	<c:set var="str_refund2" value="서비스 및 상품 불만족"/>
	<c:set var="str_refund3" value="상품 하자"/>
	<c:set var="str_refund4" value="오배송"/>
	<c:set var="str_refundBcs" value="취소책임"/>
	<c:set var="str_fare" value="배송비"/>
	<c:set var="str_2500" value="2,500"/>
	<c:set var="str_payInfo" value="결제 정보"/>
	<c:set var="str_orderDetail" value="주문상세"/>
	<c:set var="str_total" value="총 결제금액"/>
	<c:set var="str_orderProduct" value="주문 상품 정보"/>
	<c:set var="str_addressInfo" value="배송지 정보"/>
	<c:set var="str_total" value="총 결제금액"/>

	<c:set var="str_good" value="공감"/>
	<c:set var="str_goodDetail" value="상품 상세정보"/>
	<c:set var="str_searchBuyer" value="거래처 검색"/>
	<c:set var="str_category" value="카테고리"/>
	<c:set var="str_teamPro" value="상품팀"/>
	<c:set var="str_teamCs" value="CS팀"/>
	<c:set var="str_teamManage" value="총괄팀"/>
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
	<c:set var="str_add" value="추가"/>
	<c:set var="str_reviewWrite" value="리뷰쓰기"/>

    <c:set var="msg_hello" value="안녕하세요!"/>
    <c:set var="msg_admLogin" value="관리자 로그인을 해 주세요."/>
    <c:set var="msg_admGrant" value="관리자 권한 위임 후 주어집니다."/>
    <c:set var="msg_mailconfirm" value="메일로 전송된 코드를 입력하세요."/>
    <c:set var="msg_confirm_x" value = "는 사용할 수 없는 아이디입니다."/>
    <c:set var="msg_confirm_o" value = "는 사용할 수 있는 아이디입니다."/>
	<c:set var="msg_list_x" value="목록이 존재하지 않습니다."/>
	<c:set var="msg_onlynum" value="숫자만 입력하세요."/>
	<c:set var="msg_rewritepw" value="수정 시 비밀번호 재입력이 필요합니다."/>

	<c:set var="msg_del_confirm" value="이 게시물을 정말 삭제하시겠습니까?"/>
	<c:set var="msg_del_x" value="게시물 삭제 권한이 없습니다."/>
	<c:set var="msg_mod_x" value="게시물 수정 권한이 없습니다."/>
	<c:set var="msg_good" value="명이 공감한 게시물입니다."/>
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
	 <c:set var="msg_changeProd" value="*상품수량 및 옵션변경은 상품상세 또는 장바구니에서 가능합니다."/>
	<c:set var="msg_insertadr" value="동을 입력해 주세요"/>
	<c:set var="msg_searchBuyer" value="거래처 명을 입력하세요."/>
	<c:set var="msg_noSearchResult" value="에 해당하는 검색결과가 없습니다."/>
	<c:set var="msg_searchGood" value="상품 검색 페이지입니다. <br> 검색어를 입력하세요."/>
	
    <c:set var="btn_myPage" value="내 정보"/>
    <c:set var="btn_login" value="로그인"/>
    <c:set var="btn_join" value="회원가입"/>
    <c:set var="btn_findPw" value="비밀번호 찾기"/>
    <c:set var="btn_logout" value="로그아웃"/>
	<c:set var="btn_goodInput" value="상품등록"/>
    <c:set var="btn_goodDel" value="상품삭제"/>
    <c:set var="btn_goodMod" value="상품수정"/>
    <c:set var="btn_confirmmail" value="이메일 확인"/>
    <c:set var="btn_confirm" value="확인"/>
    <c:set var="btn_resend" value="재전송"/>
    <c:set var="btn_overlap" value="중복확인"/>
	<c:set var="btn_save" value="저장"/>
    <c:set var="btn_dealInput" value="발주"/>
    <c:set var="btn_mod" value="수정"/>
    <c:set var="btn_cancel" value="취소"/>
    <c:set var="btn_membermod" value="내정보 수정"/>
    <c:set var="btn_orderCancel" value="주문취소"/>
    <c:set var="btn_back" value="이전화면"/>
    <c:set var="btn_write" value="작성"/>
    <c:set var="btn_list" value="목록"/> 
    <c:set var="btn_buy" value="구매"/>
    <c:set var="btn_inputCart" value="장바구니"/>
    <c:set var="btn_add" value="등록"/>
    <c:set var="btn_goodup" value="나도 공감하기"/>
	<c:set var="btn_add" value="추가"/>

	<c:set var="btn_search" value="검색"/>
	<c:set var="btn_checkemail" value="인증받기"/>
	<c:set var="btn_style" value="스타일"/>
	<c:set var="btn_height" value="키"/>
	<c:set var="btn_weight" value="몸무게"/>
	<c:set var="btn_modify" value="수정"/>
	<c:set var="btn_deleteMb" value="회원탈퇴"/>
	<c:set var="btn_select" value="선택"/>
	<c:set var="btn_checkDelivery" value="배송조회"/>
	<c:set var="btn_refund" value="교환/반품 신청"/>
	<c:set var="btn_confirmGet" value="수취확인"/>
	<c:set var="btn_orderDetail" value="상세보기"/>
	<c:set var="btn_order" value="주문하기"/>
	<c:set var="btn_delete" value="삭제하기"/>
	<c:set var="btn_x" value="삭제"/>
	
	<c:set var="btn_searchZip" value="주소찾기"/>
	<c:set var="btn_deposit" value="무통장입금"/>
	<c:set var="btn_pay" value="결제하기"/>
	<c:set var="btn_changePlz" value="교환신청"/>
	<c:set var="btn_refundPlz" value="반품신청"/>
	<c:set var="btn_sign" value="가입하기"/>
	<c:set var="btn_buy" value="구매"/>
	<c:set var="btn_inputCart" value="장바구니"/>
	<c:set var="btn_sign" value="가입"/>
	<c:set var="btn_fold" value="접기"/>
	<c:set var="btn_goodcancel" value="공감취소"/>
	<c:set var="btn_reply" value="답글"/>

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
	
	<c:set var="url_pageNum" value="?pageNum="/>
	<c:set var="url_searchType" value="&searchType="/>
	<c:set var="url_searchWord" value="&searchWord="/>
	
	
	<c:set var="str_messagebox" value="쪽지함"/>
	<c:set var="str_sender" value="보낸 사람"/>
	<c:set var="btn_reply" value="답장하기"/>
	<c:set var="btn_golist" value="목록으로"/>
	<c:set var="btn_send" value="전송"/>
	
	<c:set var="msg_SearchResult" value="의 검색결과입니다."/>
   <c:set var="msg_selectedColors" value="입력한 색상 : "/>
   <c:set var="msg_searchWithWord" value="색상은  검색어와 함께 입력해주세요."/>
    <c:set var="msg_searchResult" value="개의 검색결과가 있습니다. 검색어 : "/>
	