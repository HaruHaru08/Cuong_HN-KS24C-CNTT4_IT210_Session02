<%@ page contentType="text/html;charset=UTF-8" language="java"
         import="java.util.List, org.example.it210_session02.controller.ReportController.Student" %>

<%!
  // Biến đếm toàn cục (Thread-safe if used carefully)
  private int requestCounter = 0;
%>

<html>
<head>
  <title>Báo cáo điểm</title>
</head>
<body>

<%
  synchronized (this) {
    requestCounter++;
  }
  List<Student> list = (List<Student>) request.getAttribute("studentList");
  String title = (String) request.getAttribute("reportTitle");
%>

<h1><%= (title != null) ? title : "Báo cáo" %></h1>
<p>Lượt xem trang: <%= requestCounter %></p>

<table border="1">
  <thead>
  <tr>
    <th>STT</th>
    <th>Họ tên</th>
    <th>Điểm</th>
    <th>Xếp loại</th>
  </tr>
  </thead>
  <tbody>
  <%
    if (list != null) {
      for (int i = 0; i < list.size(); i++) {
        Student sv = list.get(i);
        String rank;
        if (sv.getScore() >= 90) {
          rank = "Xuất sắc";
        } else if (sv.getScore() >= 80) {
          rank = "Giỏi";
        } else if (sv.getScore() >= 70) {
          rank = "Khá";
        } else if (sv.getScore() >= 60) {
          rank = "Trung bình khá";
        } else if (sv.getScore() >= 50) {
          rank = "Trung bình";
        } else {
          rank = "Yếu";
        }
  %>
  <tr>
    <td><%= i + 1 %></td>
    <td><%= sv.getFullName() %></td>
    <td><%= sv.getScore() %></td>
    <td><%= rank %></td>
  </tr>
  <%
      }
    } else {
  %>
  <tr>
    <td colspan="4">Không có dữ liệu sinh viên.</td>
  </tr>
  <%
    }
  %>
  </tbody>
</table>

</body>
</html>
