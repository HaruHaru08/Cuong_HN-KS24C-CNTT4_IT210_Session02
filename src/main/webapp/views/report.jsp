<%--
  Created by IntelliJ IDEA.
  User: ACER
  Date: 06/04/2026
  Time: 9:08 CH
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<h2>Báo cáo của sinh viên: <c:out value="${param.user}" default="Khách" /></h2>

<table border="1">
  <thead>
  <tr>
    <th>STT</th>
    <th>Tên môn học</th>
    <th>Điểm số</th>
    <th>Trạng thái</th>
  </tr>
  </thead>
  <tbody>
  <%-- 2. Dùng c:forEach thay cho vòng lặp for của Java --%>
  <c:forEach var="item" items="${studentReport.items}" varStatus="status">
    <tr>
      <td>${status.index + 1}</td>
      <td><c:out value="${item.subjectName}" /></td>
      <td>${item.score}</td>

        <%-- 3. Dùng c:choose thay cho if-else lộn xộn --%>
      <td>
        <c:choose>
          <c:when test="${item.score >= 5}">
            <span style="color: green;">Đạt</span>
          </c:when>
          <c:otherwise>
            <span style="color: red;">Không đạt</span>
          </c:otherwise>
        </c:choose>
      </td>
    </tr>
  </c:forEach>
  </tbody>
</table>

<p>Tổng kết:
  <strong>
    ${studentReport.averageScore >= 5 ? "Đủ điều kiện xét học bổng" : "Không đủ điều kiện"}
  </strong>
</p>
</body>
</html>
