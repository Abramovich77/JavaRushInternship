<%--
  Created by IntelliJ IDEA.
  User: Oleg Abramovich
  Date: 14.5.19
  Time: 09:32
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Опциональные детали</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
          integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.2/css/all.css"
          integrity="sha384-oS3vJWv+0UjzBfQzYUhtDYW+Pj2yciDJxpsK1OYPAYjqT085Qq/1cq5FLXAZQ7Ay" crossorigin="anonymous">

</head>
<body>
<div class="card">
    <div class="card-header">
        <h1>Опциональные детали</h1>
        <h4><a href="/">К списку всех деталей </a></h4>
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
            <c:forEach var="part" items="${result}">
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
        <span align="center">Можно собрать ${quantity} компьютеров </span>
    </div>
</div>


</body>
</html>
