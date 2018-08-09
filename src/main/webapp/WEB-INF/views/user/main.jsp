<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>

<c:url var="R" value="/" />

<section id="content">
	<div class="container">
		<c:if test="${type == 1 }">
		<div class="row">
			<div class="col-lg-12">
				<p class="pull-right" data-url="${R}article_write?bd=1">공지 쓰기 <i class="ion-android-create"></i></p>
			</div>
		</div>
		</c:if>
		<div id="more-features" class="row">
			<c:if test="${!empty notices }">
				<c:forEach var="notice" items="${notices}">
					<div class="col-lg-12">
						<div class="box" data-url="${R}article?bd=1&at=${notice.id}">
							<p class="title"><span class="notice">공지</span>${notice.title }</p>
							<p class="description">관리자 / ${notice.date }</p>
						</div>
					</div>
				</c:forEach>
			</c:if>
			
			<c:if test="${!empty meetings }">
			<c:forEach var="meeting" items="${ meetings }">
			<div class="col-lg-12">
				<div class="box" data-url="meeting?id=${meeting.meetingId }">
					<p class="title">${ meeting.meetingName } </p>
					<c:if test="${ meeting.meetingExplain != null }">
						<p class="description">${ meeting.meetingExplain }</p>
					</c:if>
					
					<c:if test="${ meeting.mmType == 3 }">
					<p class="description">모임 관리자: ${meeting.userName} / 개설일: ${ meeting.meetingDate }</p>
					<button class="icon" data-url="meeting_setting?id=${meeting.meetingId }&st=0">관리</button>
					</c:if>
					
					<c:if test="${ meeting.mmType == 2 }">
					<p class="description">${meeting.userName} / 가입일: ${ meeting.mmDate }</p>
					</c:if>
				</div>
			</div>
			</c:forEach>
			
			</c:if>
			<c:if test="${empty meetings }">
			<div class="col-lg-12">
				<div class="box">
					<p class="title">가입한 모임이 없습니다.</p>
				</div>
			</div>
			</c:if>
		</div>
	</div>
</section>



<section>
	<div class="container">
		<div class="add-icon">
			<i class="ion-ios-plus-outline" data-url="meeting_create"></i>
		</div>
	</div>
</section>

<section id="alarm">
</section>
<!-- 
<section id="alarm">
	<div class="container">
		<p class="title">경스데이 알림!<i id="alarm_close" class="ion-close-round pull-right" data-url="#"></i></p>
		<p class="content">"성공회대학교 소프트웨어공학과 캡스톤 디자인 프로젝트 모임 일정 안내"<br/>새글이 올라왔습니다.</p>
	</div>
</section>
 -->
 <script>
 	var meetings = ${jsonMeetings};
 	console.log(meetings);
 	
 	var sock = new SockJS("${R}itda-webSocket");
 	sock.onopen = function(){
 		console.log("sock \"/itda-webSocket\" Connected");
 		for(var i=0; i<meetings.length; i++){
 			sock.send(JSON.stringify({meetingId: parseInt(meetings[i].meetingId), type: 'JOIN', content: '로그인되었습니다.', meetingName: meetings[i].meetingName}));
 			console.log("sock.send(JSON.stringify({meetingId: "+parseInt(meetings[i].meetingId)+", type: 'JOIN', content: '로그인되었습니다.'', meetingName: "+meetings[i].meetingName+"}));");
 		}
 		
 		sock.onmessage = function(e){
 			var e = JSON.parse(e.data);
 			var meetingName = e.meetingName;
 			var content = e.content;
 			console.log(meetingName+"알림!"+content);
 			var text = '<div class="container">'+
 				'<p class="title">'+meetingName+' 알림!<i id="alarm_close" class="ion-close-round pull-right" data-url="#"></i></p>'+
 				'<p class="content">"'+content+'"<br/>새글이 올라왔습니다.</p></div>';
 			$("#alarm").append(text);
 		}
 	}
 </script>