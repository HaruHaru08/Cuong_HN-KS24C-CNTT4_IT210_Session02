<%--
  Created by IntelliJ IDEA.
  User: ACER
  Date: 06/04/2026
  Time: 9:41 CH
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<h2>Kết quả tìm kiếm cho: <c:out value="${keyword}" /></h2>

<p>Số ký tự của từ khóa: ${fn:length(keyword)} ký tự.</p>

<c:choose>
    <c:when test="${empty events}">
        <p>Không tìm thấy sự kiện nào phù hợp.</p>
    </c:when>
    <c:otherwise>
        <p>Tìm thấy <strong>${fn:length(events)}</strong> sự kiện.</p>

        <table border="1" cellpadding="10">
            <thead>
            <tr>
                <th>STT</th>
                <th>Tên sự kiện</th>
                <th>Ngày tổ chức</th>
                <th>Giá vé</th>
                <th>Vé còn lại</th>
                <th>Thao tác</th>
            </tr>
            </thead>
            <tbody>
            <c:forEach var="event" items="${events}" varStatus="status">
                <tr>
                    <td>${status.count}</td>
                    <td><c:out value="${event.name}" /></td>
                    <td>${event.eventDate}</td>
                    <td>
                        <c:choose>
                            <c:when test="${event.price == 0}">
                                <span class="badge-free">MIỄN PHÍ</span>
                            </c:when>
                            <c:otherwise>
                                <fmt:formatNumber value="${event.price}" type="number" /> VNĐ
                            </c:otherwise>
                        </c:choose>
                    </td>
                    <td>
                        <c:choose>
                            <c:when test="${event.remainingTickets == 0}">
                                <span class="sold-out">HẾT VÉ</span>
                            </c:when>
                            <c:when test="${event.remainingTickets < 10}">
                                <span class="low-stock">Sắp hết (còn ${event.remainingTickets} vé)</span>
                            </c:when>
                            <c:otherwise>
                                <span class="available">${event.remainingTickets}</span>
                            </c:otherwise>
                        </c:choose>
                    </td>
                    <td>
                        <c:url var="bookUrl" value="/events/${event.id}/book" />
                        <a href="${bookUrl}"
                           class="${event.remainingTickets == 0 ? 'disabled-link' : ''}">
                            Đặt vé
                        </a>
                    </td>
                </tr>
            </c:forEach>
            </tbody>
        </table>
    </c:otherwise>
</c:choose>

<hr>
<c:if test="${not empty events}">
    <p>Sự kiện nổi bật: <strong>${fn:toUpperCase(events[0].name)}</strong></p>
</c:if>
</body>
</html>
