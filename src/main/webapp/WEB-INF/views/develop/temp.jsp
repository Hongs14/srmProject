<%@ page language="java" contentType="text/html charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:forEach var="data" items="${list}">
 <div class="row"> 
	<div class="col-1"><input type="checkbox"></div> 
 	<div class="col-1">${data.userJbps}</div> 
 	<div class="col-2">${data.userNm}</div> 
	<div class="col-3">${data.userTelNo}</div> 
 	<div class="col-5"> 
		<div class="row"> 
			<c:forEach var="devlist" items="${data.devList}">
				<div>${devlist.hrStartDate}</div>
			</c:forEach>
		</div>  
	</div>
</div>
</c:forEach>
