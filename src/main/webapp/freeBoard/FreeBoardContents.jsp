<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.6.4.js"></script>
<!-- CSS only -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65"
	crossorigin="anonymous">
<!-- JavaScript Bundle with Popper -->
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4"
	crossorigin="anonymous"></script>




<style>
* {
	box-sizing: border-box;
	border: 1px solid grey;
}

.header {
	position: relative;
}

.navi {
	position: sticky;
	top: 0;
	background-color: white;
	z-index: 999;
}

.margin {
	height: 20px;
}
</style>

</head>

<body>
	<div class="container">
		<!-- 헤더 -->
		<div class="row navi">
			<div class="col-12">
				<div class="row">

					<div class="col-6 col-lg-2 order-2 order-lg-first">logo</div>
					<div class="col-lg-4 d-none d-lg-block order-lg-1">여백</div>
					<div class="col-4 d-block d-lg-none order-1">
						<div class="row">
							<div class="col-6">
								<div class="row">
									<div class="col-12">네비햄버거</div>
									<div class="col-12">회원가입</div>
								</div>
							</div>
							<div class="col-6">
								<div class="row">
									<div class="col-12 subsearch">검색</div>
								</div>
							</div>
						</div>
					</div>
					<div class="col-lg-1 d-none d-lg-block order-lg-2">
						<button type="button" class="btn btn-primary btn-lg">hi</button>
					</div>
					<div class="col-lg-1 d-none d-lg-block order-lg-3">
						<button type="button" class="btn btn-primary btn-lg">hi</button>
					</div>
					<div class="col-lg-1 d-none d-lg-block order-lg-4">
						<button type="button" class="btn btn-primary btn-lg">hi</button>
					</div>
					<div class="col-lg-1 d-none d-lg-block order-lg-5">
						<button type="button" class="btn btn-primary btn-lg">hi</button>
					</div>
					<div class="col-lg-2 d-none d-lg-block  order-lg-last">ㅎㅇ</div>
					<div class="col-2 d-block d-lg-none order-last">
						<div class="row">
							<div class="col-12">공백</div>
							<div class="col-12">로그인</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<!-- 바디 -->

		<div class="row">
			<div class="col margin">여백</div>
		</div>
		<div class="row rowTitle">
			<div class="col colTitle">
			<input type="text" placeholder="제목을 입력해주세요" id="titleInput"
							name="title" value="${list.title}" readonly>
			</div>
		</div>
		<div class="row">
			<div class="col">
				<div>${list.writer}</div>
				<div>${list.write_date}</div>
			</div>
		</div>
		<!--파일 첨부 출력 -->
		<c:choose>
			<c:when test="${fileResult!=null}">
				<div class="row">
					<div class="col">
						<a
							href="/download.file?sysName=${fileResult.sysName}&oriName=${fileResult.oriName}">${fileResult.oriName}</a>
					</div>
				</div>
			</c:when>
		</c:choose>
		
		<!-- 게시글 출력 -->
		<div class="row">
		<div contenteditable="false" id="content" name="content" placeholder="내용을 입력해주세요" style="height:500px">
		${list.content}
		</div>
		</div>

		<!-- 수정, 삭제하기 버튼 -->
	<%-- 	<c:choose>
		<c:when test="${sessionScope.loginID eq list.writer}"> --%>
		<div class="row updateBoardRow">
		<div class="col updateBoardCol">
		<a href="/contentList.freeBoard"><input type="button" value="돌아가기"></a>
		<input type="button" value="수정" id="updateBtn">
		<input type="button" value="삭제">
		<inpyt type="button" value="수정완료">
		</div>
		</div>
	<%-- 	</c:when>
		</c:choose> --%>

		<!-- 댓글출력 -->
		<div class="row">
			<div class="col reply_area">
				<div class="reply_area">
					<c:forEach var="i" items="${replyResult}">
						<div class="nickname">${i.writer}</div>
						<div class="reply_text">${i.contents}</div>
						<div class="reply_info">
							<span class="reply_date">${i.write_date}</span> 
						</div>
					</c:forEach>
				</div>
			</div>
		</div>
		<!-- 댓글입력 -->
		<div class="row rowReplyInput">

			<div class="col colReplyInput">
				<div id="nick_name">${list.writer}</div>
				<input type="text" name="replyContent" id="replyContent"
					placeholder="댓글을 입력해주세요"> <input type=button value="등록"
					id="replyInsert">
			</div>

		</div>
	</div>


	<script>
	/* 댓글 입력 */
		$("#replyInsert").on("click", function() {
			location.href = "/insert.reply?seq=" + ${list.seq}
			+"&replyContent=" + $('#replyContent').val();
		})
		
		
		/* 수정하기, 수정 버튼 숨기기*/
		$("#updateBtn").on("click", function(){
			$("#titleInput").removeAttr("readonly");
			alert("title readonly 지움");
			$("#content").attr("contenteditable", true);
			alert("content의 속성값 true 줌");
			$("#updateBtn").hide();
		})
		
		
		
	</script>
</body>

</html>