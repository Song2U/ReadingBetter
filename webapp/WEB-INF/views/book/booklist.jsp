<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>ReadingBetter</title>
<link href="/readingbetter/assets/dist/css/bootstrap.min.css" rel="stylesheet" type="text/css">
<link href="/readingbetter/assets/css/book.css" rel="stylesheet" type="text/css">
</head>
<body>
	<div class="container-fluid">
		<c:import url='/WEB-INF/views/include/header.jsp' />
		<div class="row asideWrap">
			<div id="navigation" class="col-lg-2">
				<c:import url='/WEB-INF/views/include/navi_book.jsp' />
			</div>
			<div id="content" class="col-lg-10">
				<div id="list">
					<div class="small-menu">
						<a href="/readingbetter/main">홈</a> > 
						<a href="/readingbetter/book/booklist">독서활동</a> > 책목록
					</div>
					<p class="menu-title">책 목록</p>
					
					<form id="search_form" action="/readingbetter/book/booklist" method="post">
						<input type="text" id="Bkwd" name="bkwd" value="${bkwd }">
						<input type="submit" value="찾기">
					</form>
					<br>
					
					<c:set var="countList" value="${fn:length(list)}"/>
	  				<c:forEach var='vo' items='${list}' varStatus='s'>					
						<table id="book-table">
							<colgroup>
								<col width="30%" />
								<col width="10%" />
								<col width="20%" />
								<col width="40%" />
							</colgroup>					 
							<tr>
								<td rowspan="4">
									<img class="img-thumbnail" src="${vo.cover }">
								</td>
								<td colspan="3">${vo.title }</td>
							</tr>
							<tr>
								<td class="table-right">작가</td>
								<td class="table-left">${vo.authorName }</td>
								<td></td>
							</tr>
							<tr>
								<td class="table-right">출판사</td>
								<td class="table-left">${vo.publisherTitle }</td>
								<td></td>
							</tr>
							<tr>
								<td class="table-right">추천학년</td>
								<td class="table-left">${vo.recommend }</td>
								<td>
									<a class="btn btn-default" href="/readingbetter/book/review/${vo.no}" role="button">리뷰보기</a>
									<a class="btn btn-default" href="/readingbetter/book/solvequizform?no=${vo.no }" role="button">문제풀기</a>
									<a class="btn btn-default" href="/readingbetter/book/makequizform/${vo.no}" role="button">문제내기</a>
								</td>
							</tr>					
						</table>
						<br>
					</c:forEach>
					
					<br>
					<!-- begin:paging -->
					<div class="pager">
						<ul>
							<li>
								<li><a href="">◀</a></li>
								<li><a href="">1</a></li>
								<li><a href="">2</a></li>
								<li><a href="">3</a></li>
								<li><a href="">4</a></li>
								<li><a href="">5</a></li>
								<li><a href="">▶</a></li>
						</ul>
					</div>
					<!-- end:paging -->
				</div>
			</div>
		</div>
		<c:import url='/WEB-INF/views/include/footer.jsp' />
	</div>
</body>
</html>