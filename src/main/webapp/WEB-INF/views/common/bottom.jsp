<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
  <!-- Scroll to top -->
  <a class="scroll-to-top rounded" href="#page-top">
    <i class="fas fa-angle-up"></i>
  </a>

  <script src="${pageContext.request.contextPath}/resources/vendor/bootstrap/js/bootstrap.bundle.js"></script>
  <script src="${pageContext.request.contextPath}/resources/vendor/jquery-easing/jquery.easing.js"></script>
  <script src="${pageContext.request.contextPath}/resources/js/ruang-admin.js"></script>
  <script src="${pageContext.request.contextPath}/resources/vendor/chart.js/Chart.js"></script>
  <script src="${pageContext.request.contextPath}/resources/js/demo/chart-area-demo.js"></script> 
  <%-- <!-- Page level plugins -->
  <script src="${pageContext.request.contextPath}/resources/vendor/datatables/jquery.dataTables.min.js"></script>
  <script src="${pageContext.request.contextPath}/resources/vendor/datatables/dataTables.bootstrap4.min.js"></script> --%>

  <!-- Page level custom scripts -->
  <script>
    $(document).ready(function () {
      $('#dataTable').DataTable(); // ID From dataTable 
      $('#dataTableHover').DataTable(); // ID From dataTable with Hover
    });
  </script>

  <!-- Select2 -->
  <script src="${pageContext.request.contextPath}/resources/vendor/select2/dist/js/select2.min.js"></script>
  <!-- Bootstrap Datepicker -->
  <script src="${pageContext.request.contextPath}/resources/vendor/bootstrap-datepicker/js/bootstrap-datepicker.min.js"></script>
  <!-- Bootstrap Touchspin -->
  <script src="${pageContext.request.contextPath}/resources/vendor/bootstrap-touchspin/js/jquery.bootstrap-touchspin.js"></script>
  <!-- ClockPicker -->
  <script src="${pageContext.request.contextPath}/resources/vendor/clock-picker/clockpicker.js"></script>
  <!-- Javascript for this page -->
  <script src="${pageContext.request.contextPath}/resources/js/form_advanceds.js"></script>