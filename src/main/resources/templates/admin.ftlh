<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Admin</title>
</head>
<body>
<#import "menu/template.ftlh" as t>
<@t.template user>
</@t.template>
<h2>Панель администратора</h2>
<table border="1">
    <tr>
        <th>Email:</th>
        <th>Номер телефона:</th>
        <th>Активность</th>
        <th>Роли:</th>
        <th>Блокировка:</th>
        <th>Редактирование</th>
        <th>Подробная информация:</th>
    </tr>
    <#list users as user>
        <tr>
            <th>${user.email}</th>
            <th>${user.phoneNumber}</th>
            <th><#if user.active>Активен<#else>Заблокирован</#if></th>
            <th><#list user.roles as rol>${rol}, </#list></th>
            <th>
                <form action="/admin/user/block/${user.id}" method="post">
                    <input type="hidden" name="_csrf" value="${_csrf.token}">
                    <input type="submit" value="Бан">
                </form>
            </th>
            <th><a href="/admin/user/edit/${user.id}">Редактировние</a></th>
            <th><a href="/user/${user.id}">Подробная информация</a></th>
        </tr>
    <#else>
        Пользовати отсутствуют
    </#list>
</table>
<hr>
<h1>Добавить работу</h1>
<form action="/work/add" method="post" enctype="multipart/form-data">
    <input type="text" name="title" placeholder="Название работы"><br>
    <input type="text" name="description" placeholder="Краткое описание"><br>
    Первая фотография: <input type="file" name="file1"/><br><br>
    Вторая фотография: <input type="file" name="file2"/><br><br>
    <input type="hidden" name="_csrf" value="${_csrf.token}">
    <button type="submit">Добавить</button>
</form>

<h1>Добавить сертификат</h1>
<form action="/certificate/add" method="post" enctype="multipart/form-data">
    <input type="text" name="title" placeholder="Название"><br>
    <input type="text" name="description" placeholder="Краткое описание"><br>
    Первая фотография: <input type="file" name="file1"/><br><br>
    Вторая фотография: <input type="file" name="file2"/><br><br>
    <input type="hidden" name="_csrf" value="${_csrf.token}">
    <button type="submit">Добавить</button>
</form>
</body>
</html>