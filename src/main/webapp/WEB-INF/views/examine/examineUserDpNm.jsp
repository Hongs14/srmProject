<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<select class="form-control form-control-sm" id="userDpNm2">
	<option value="0">전체</option>
	<c:forEach var="users" items="${examineFilter.userDpList}">
		<option>${users.userDpNm}</option>
	</c:forEach>
</select>