<%--
  Created by IntelliJ IDEA.
  User: Oleg Abramovich
  Date: 14.5.19
  Time: 09:38
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Список деталей</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
          integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.2/css/all.css"
          integrity="sha384-oS3vJWv+0UjzBfQzYUhtDYW+Pj2yciDJxpsK1OYPAYjqT085Qq/1cq5FLXAZQ7Ay" crossorigin="anonymous">
</head>
<body>
<div class="card">
    <div class="card-header">
        <h1 align="center">Список деталей</h1>
        <div>

            <form class="form-inline" method="post" action="search_part">
                <input type="text" name="title" class="form-control" placeholder="Введите название детали"/>
                <button type="submit" class="btn btn-primary">поиск</button>
            </form>

        </div>
        <h4>
            Добавить новое наименование <a href="newPart">тут</a>
        </h4>
        <span><i class="fas fa-filter"></i> <a href="">все детали</a> <a href="/requiredPart">обязательные детали</a> <a
                href="/optionalPart">опциональные детали</a></span>
    </div>
    <div class="card-body">
        <table class="table">
            <thead align="center" class="thead-dark">
            <th>Название</th>
            <th>Необходимость</th>
            <th>Количество</th>
            <th></th>
            </thead>
            <tbody>
            <c:forEach var="part" items="${partList}">
                <tr align="center">
                    <td>${part.title}</td>
                    <td>${part.required}</td>
                    <td>${part.quantity}</td>
                    <td><a class="fas fa-edit" href="editPart?id=${part.id}"></a>
                        &nbsp;&nbsp;&nbsp; <a href="deletePart?id=${part.id}" class="far fa-trash-alt"></a></td>
                </tr>
            </c:forEach>
            </tbody>
        </table>
        <div align="center" id="pagination">
            <c:url value="/" var="prev">
                <c:param name="page" value="${page-1}"/>
            </c:url>
            <c:if test="${page > 1}">
                <a href="<c:out value="${prev}" />" class="pn prev">Prev</a>
            </c:if>
            <c:forEach begin="1" end="${maxPages}" step="1" varStatus="i">
                <c:choose>
                    <c:when test="${page == i.index}">
                        <span>${i.index}</span>
                    </c:when>
                    <c:otherwise>
                        <c:url value="/" var="url">
                            <c:param name="page" value="${i.index}"/>
                        </c:url>
                        <a href='<c:out value="${url}" />'>${i.index}</a>
                    </c:otherwise>
                </c:choose>
            </c:forEach>
            <c:url value="/" var="next">
                <c:param name="page" value="${page + 1}"/>
            </c:url>
            <c:if test="${page + 1 <= maxPages}">
                <a href='<c:out value="${next}" />' class="pn next">Next</a>
            </c:if>
        </div>
        <span align="center">Можно собрать ${quantity} компьютеров </span>
    </div>
</div>
</body>
</html>