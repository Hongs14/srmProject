<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<head>
	<%@include file="/WEB-INF/views/common/head.jsp" %>
</head>
<body>
<div class="d-flex flex-column vh-100">
	<%@include file="/WEB-INF/views/common/top.jsp" %>
		<div class="container-fluid flex-grow-1">
			<div class="row h-100">
				<div class="col-md-2 bg-dark text-white">
					<%@include file="/WEB-INF/views/common/menu.jsp" %>
				</div>
				<div class="col-md-10">
				<!-- ********************************** -->
					<div class="card m-2">
					<div class="card-header">
						게시물 내용
					</div>
					<div class="card-body">
						<div>
							<div>
								<div>
									<p>
										<span>번호:</span> 
										<span>${board.bno}</span>
									</p>
									
									<p>
										<span>제목:</span> 
										<span>${board.btitle}</span>
									</p>
									
									<p>
										<span>글쓴이:</span> 
										<span>${board.mid}</span>
									<p>
									
									<p>
										<span>날짜:</span> 
										<span><fmt:formatDate value="${board.bdate}" pattern="yyyy-MM-dd HH.mm.ss"/></span> <br/>
									</p>
									
									<c:if test="${board.battachoname !=null}">
										<p>
											<span>첨부:</span> 
											<span>${board.battachoname}<a href="filedownload?bno=${board.bno}" class="btn btn-info btn-sm ml-2">다운로드</a></a></span> <br/>
										</p>
										<p>
											<img src="filedownload?bno=${board.bno}" width="200px"/>
										</p>
									</c:if>
								</div>
								
								<div>
									<span class="title">내용:</span> <br/>
									<textarea style="width:100%" readonly>${board.bcontent}</textarea>
								</div>
								
								<a class="btn btn-info btn-sm mt-2" href="list">목록</a>
								<a class="btn btn-info btn-sm mt-2" href="update?bno=${board.bno}">수정</a>
								<a class="btn btn-info btn-sm mt-2" href="delete?bno=${board.bno}">삭제</a>
								
							</div>
						</div>
					</div>
				</div>
				<!-- ********************************** -->
				</div>
			</div>
		</div>
	<%@include file="/WEB-INF/views/common/bottom.jsp" %>
	</div>
</body>