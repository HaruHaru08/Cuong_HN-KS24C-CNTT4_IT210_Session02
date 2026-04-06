<%--
  Created by IntelliJ IDEA.
  User: ACER
  Date: 06/04/2026
  Time: 9:17 CH
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<h3>Xin chào, ${sessionScope.loggedUser}! Vai trò: ${sessionScope.role}</h3>
<a href="logout">Đăng xuất</a>

<table border="1">
  <tr>
    <th>Mã đơn</th>
    <th>Sản phẩm</th>
    <th>Tổng tiền</th>
    <th>Ngày đặt</th>
  </tr>
  <c:forEach var="o" items="${orderList}">
    <tr>
      <td>${o.id}</td>
      <td>${o.productName}</td>
      <td><fmt:formatNumber value="${o.amount}" type="currency" currencySymbol="VNĐ"/></td>
      <td><fmt:formatDate value="${o.orderDate}" pattern="dd/MM/yyyy"/></td>
    </tr>
  </c:forEach>
</table>

<p><strong>Tổng lượt xem toàn hệ thống: ${applicationScope.totalViewCount}</strong></p>
</body>
</html>
