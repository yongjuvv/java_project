<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원관리 페이지</title>

<link rel="stylesheet" href="/resources/css/reset.css">
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.15.4/css/all.css"
		integrity="sha384-DyZ88mC6Up2uqS4h/KRgHuoeGwBcD4Ng9SiP4dIRy0EXTlnuz47vAwmeGwVChigm" crossorigin="anonymous">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet"
		integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<link rel="stylesheet" href="/resources/css/main.css">

<script src="https://code.jquery.com/jquery-3.6.0.min.js"
		integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>

<style>

.pagination {
	list-style: none;
	padding-left: 0px;
	width:60%;
	margin:20px auto;
	display: flex;
	justify-content: center;
	
}

.pagination li {
	margin: 0 10px;
}

.pagination li a {
	text-decoration: none;
	color: rgb(216, 190, 157);
}

</style>

</head>
<body>

	<div class="wrap" id="wrap">
	<%@ include file="../../headerFooter/adminHeader.jsp"%>
		<section class="admin size-all bg-dg pd-20">
               <div class="size15 admin-title bg-main3 font-noto">
                   <h3>관리자화면</h3>
                   <h5>Administrator</h5>
               </div>
               <div class="size15 admin-box bg-dg">
                   <div class="admin-tab">
                       <div class="member-tab tab">회원 관리</div>
                       <div class="product-tab ad-untab">상품 관리</div>
                   </div>

					<script>
					$(document).ready(function(){
						$('.member-tab').on('click', function(){
							location.href = "/admin/member/list";
						});
						$('.product-tab').on('click', function(){
							location.href = "/admin/product/list";
						});
					});
				</script>

				<div class="adminList-box ad-memberList">
                   		<div class="adminList-search">
							<form id="searchForm" action="/admin/member/list" method="get" >
						  		<select name='type' class="adminList-search-select pd-5">						  				
						  			<option value=""  <c:out  value="${pageMaker.cri.type==null?'selected':''}"/>>----</option>
					  				<option value="T" <c:out value="${pageMaker.cri.type eq 'T'?'selected':''}"/>>아이디
					  				<option value="C" <c:out value="${pageMaker.cri.type eq 'C'?'selected':''}"/>>이름</option>
					  	    		<option value="W" <c:out value="${pageMaker.cri.type eq 'W'?'selected':''}"/>>주소</option>
					  				<option value="TC" <c:out value="${pageMaker.cri.type eq 'TC'?'selected':''}"/>>아이디 or 이름</option>
					  				<option value="TW" <c:out value="${pageMaker.cri.type eq 'TW'?'selected':''}"/>>아이디 or 주소</option>
					  				<option value="TCW" <c:out value="${pageMaker.cri.type eq 'TCW'?'selected':''}"/> >아이디 or 이름 or 주소</option>
						 		</select>
						 		<input name='keyword' placeholder="검색" class="pd-5" type="text" value='<c:out value="${pageMaker.cri.keyword}"/>'>
						  		<input type='hidden' name='pageNum' value='${pageMaker.cri.pageNum}'>
						  		<input type='hidden' name='amount'' value='${pageMaker.cri.amount}'>
						  		<button class="adminList-search-button pd-5 bg-dg main-color2">Search</button>
						  	</form>
						</div>
                       	<div class="adminList-table-title main-color2">
                           <div><h5 class="text-c">번호</h5></div>
                           <div><h5 class="text-c">아이디</h5></div>
                           <div><h5 class="text-c">이름</h5></div>
                           <div><h5 class="text-c">주소</h5></div>
                           <div><h5 class="text-c">가입일자</h5></div>
                           <div><h5 class="text-c">회원관리</h5></div>
                       	</div>
                       	<div class="adminList-table-content">
                       		<c:forEach items="${list }" var="member">
	                            <div><p class="text-c"><c:out value="${member.member_no }"></c:out></p></div>
	                            <div><p class="text-c"><c:out value="${member.member_id }"></c:out></p></div>
	                            <div><p class="text-c"><c:out value="${member.member_username }"></c:out></p></div>
	                            <div><p class="text-c"><c:out value="${member.member_address }"></c:out></p></div>
	                            <div><p class="text-c"><fmt:formatDate value="${member.member_regDate }" pattern="yyyy-MM-dd" /></p></div>
	                            <div class="text-c adminList-button" >
	                            <button class="white-button member_view" value="조회" onclick="javascript:location.href='/admin/member/view?member_no=${member.member_no}'">조회</button>
	                            <button class="red-button" value="삭제" onclick="javascript: location.href='/admin/member/remove?member_no=${member.member_no}'">삭제</button></div>
	                       	</c:forEach>
                       	</div>
                       	
                       	<ul class="pagination">
				  	      <c:if test="${pageMaker.prev}">
				  	      	<li class="paginate_button previous" aria-controls="dataTables-example" tabindex="0" id="dataTables-example_previous">
				  		  	<a href="${pageMaker.startPage -1}">이전</a></li>
				  	      </c:if>
				  	       
				  	      <c:if test="!${pageMaker.prev}">
				  	      	<li class="paginate_button previous disabled" aria-controls="dataTables-example" tabindex="0" id="dataTables-example_previous">
				  	      	<a href="${pageMaker.startPage -1}">이전</a></li>
				  	      </c:if>
				  		      
				          <c:forEach var="num"  begin="${pageMaker.startPage}" end="${pageMaker.endPage}">
					  	  	<c:if test="${num==pageMaker.cri.pageNum}">
					  	       <li class="paginate_button active" aria-controls="dataTables-example" tabindex="0">
					  	       <a href="${num}">${num}</a></li>
					 	    </c:if>
					 	    <c:if test="${num!=pageMaker.cri.pageNum}">
					 	       <li class="paginate_button" aria-controls="dataTables-example" tabindex="0">
					  	       <a href="${num}">${num}</a></li>
					  	   </c:if>
				  	     </c:forEach>
				  		      
				  	     <c:if test="${pageMaker.next}">
				        	<li class="paginate_button next" aria-controls="dataTables-example" tabindex="0" id="dataTables-example_next">
				        	<a href="${pageMaker.endPage + 1}">다음</a></li>
				        </c:if>
			         </ul>
                       	
                   </div>
                   <!-- 상품관리 -->
                   <div class="adminList-box ad-productList ad-off">
                   </div>
               </div>
           </section>

           <!-- <script>
               $(document).ready(function (){
                   $('.member-tab').on('click',function (){
                       $('.ad-memberList').removeClass('ad-off');
                       $('.ad-productList').addClass('ad-off');
                       $('.member-tab').removeClass('ad-untab');
                       $('.product-tab').addClass('ad-untab');
                   });
                  $('.product-tab').on('click',function (){
                       $('.ad-memberList').addClass('ad-off');
                       $('.ad-productList').removeClass('ad-off');
                       $('.member-tab').addClass('ad-untab');
                       $('.product-tab').removeClass('ad-untab');
                   });
               })
           </script> -->	
           <%@ include file="../../headerFooter/footer.jsp"%>
           
        </div>

	<!-- 정보를 controller에 전달하기 위한 <form>태그 -->
	<form id="actionForm" action="/admin/member/list" method="get">
 		<input type='hidden' name='pageNum' value='${pageMaker.cri.pageNum }'>
 		<input type='hidden' name='amount' value='${pageMaker.cri.amount }'>
 		<input type='hidden' name='type' value='<c:out value="${pageMaker.cri.type}"/>'>
 		<input type='hidden' name='keyword' value='<c:out value="${pageMaker.cri.keyword}"/>'>
	</form>
	

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>

<script>

$(document).ready(function(e){
	
	var actionForm = $("#actionForm");
	
	/* 페이지 네비게이션 버튼 클릭시 */
	$('.paginate_button a').on("click",function(e){
		e.preventDefault();
		
		console.log('click');
		/* 클릭한 <a>태그의 페이지번호를 actionForm의 input tage 에 설정 val(값); */
		actionForm.find("input[name='pageNum']").val($(this).attr("href"));
		actionForm.submit();//action으로 전송처리
		
	});
});

//검색 기능 구현을 위한 JS문
$(document).ready(function(){
	var searchForm=$("#searchForm");

	$("#searchForm button").on("click",function(e){
		if(!searchForm.find("option:selected").val()){
			alert("검색 조건을 선택하세요");
			return false;
		}
		
		if(!searchForm.find("input[name='keyword']").val()){
			alert("검색 키워드를 입력하세요");
			return false;
		}
		
		searchForm.find("input[name='pageNum']").val("1");
		e.preventDefault();
		
		searchForm.submit();
		
	});
	
});

</script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
            integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
            crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
		crossorigin="anonymous"></script>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"
		integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
</body>
</html>
