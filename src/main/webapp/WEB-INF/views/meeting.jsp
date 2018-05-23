<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:url var="R" value="/" />

<section id="content">
	<div class="container">
		<div class="form">
			<form>
				<div class="form-row">
					<div id="category" class="form-group">
						<select class="form-control" name="category">
							<option value="1">전체</option>
							<option value="2">일정</option>
						</select>
					</div>
					<div id="category-btn" class="form-group">
						<!-- <button class="btn pull-right" data-url="#">모임관리</button>
						<button class="btn pull-right" data-url="#">글쓰기</button> -->
						<p class="pull-right">모임 관리 <i class="ion-android-settings"></i></p>
						<p class="pull-right">글쓰기 <i class="ion-android-create"></i></p>
					</div>
				</div>
			</form>
		</div>
		<div id="more-features" class="row">
			<div class="col-lg-12">
				<div class="box" data-url="#">
					<p class="title"><span class="notice">공지</span>성공회대학교 소프트웨어공학과 캡스톤 디자인 프로젝트 모임 공지사항</p>
					<p class="description">최윤경 / 2018.05.23 10:30</p>
				</div>
			</div>
			<div class="col-lg-12">
				<div class="box" data-url="#">
					<p class="title">[일정] 성공회대학교 소프트웨어공학과 캡스톤 디자인 프로젝트 모임 일정 안내</p>
					<p class="description">최윤경 / 2018.05.23 10:30</p>
				</div>
			</div>
		</div>
	</div>
</section>

<section>
<div class="container">
	<div class="form">
			<form>
				<div class="form-row">
					<div class="form-group col-10">
						<input type="text" class="form-control" placeholder="검색어를 입력하세요.">
					</div>
					<div class="form-group col-2">
						<button type="submit" class="btn pull-right">검색</button>
					</div>
				</div>
			</form>
		</div>
	</div>
</section>
