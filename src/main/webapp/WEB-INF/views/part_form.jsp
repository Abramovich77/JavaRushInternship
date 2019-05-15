<%--
  Created by IntelliJ IDEA.
  User: Oleg Abramovich
  Date: 14.5.19
  Time: 08:04
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Добавить/Редактировать детили</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
          integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.2/css/all.css"
          integrity="sha384-oS3vJWv+0UjzBfQzYUhtDYW+Pj2yciDJxpsK1OYPAYjqT085Qq/1cq5FLXAZQ7Ay" crossorigin="anonymous">
</head>
<body>
<div class="card">
    <div class="card-header">
        <h1>Добавить/Редактировать детили</h1>
        <h4><a href="/">К списку всех деталей </a></h4>
    </div>
    <div class="card-body">
        <form:form action="savePart" method="post" modelAttribute="part">
            <table>
                <form:hidden path="id"/>
                <tr>
                    <td><h4>Название:</h4></td>
                    <td><form:input path="title" class="form-control" required="true" maxlength="25"
                                    autofocus="true"/></td>
                </tr>
                <tr>
                    <td><h4>Количество:</h4></td>
                    <td><form:input path="quantity" class="form-control" type="number" min="0" max="999"/></td>
                </tr>
                <tr>
                    <td><h4>Необходимость:</h4></td>
                    <td><form:checkbox path="required" value="false"/></td>
                </tr>
                <tr>
                    <td colspan="2" align="left">
                        <button type="submit" class="btn btn-primary">Сохранить</button>
                    </td>
                </tr>
            </table>
        </form:form>
    </div>
</div>
</body>
</html>
