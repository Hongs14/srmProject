<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<div class="modal fade" id="logoutModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabelLogout"
   aria-hidden="true">
   <div class="modal-dialog" role="document">
     <div class="modal-content">
       <div class="modal-header">
         <h5 class="modal-title" id="exampleModalLabelLogout">Logout</h5>
         <button type="button" class="close" data-dismiss="modal" aria-label="Close">
           <span aria-hidden="true">&times;</span>
         </button>
       </div>
       <div class="modal-body">
         <p>정말 로그아웃 하시겠습니까?</p>
       </div>
       <div class="modal-footer">
         <button type="button" class="btn btn-outline-primary" data-dismiss="modal">취소</button>
         <a href="${pageContext.request.contextPath}/user/logout" class="btn btn-primary">로그아웃</a>
       </div>
     </div>
   </div>
 </div>