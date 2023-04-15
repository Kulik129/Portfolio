<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Title</title>
</head>
<body>

<#if user.email??>
    <h3>Имя пользователя: <i>${user.name}</i></h3>
    <form action="/logout" method="post">
        <input type="hidden" name="_csrf" value="${_csrf.token}">
        <input type="submit" value="Выйти"/>
    </form>
    <#if user.isAdmin()>
        <a href="/admin">Панель администратора</a>
    </#if>
<#else>
    <h4><a href="/login">Войти</a></h4>
</#if>
<hr>


<div class="myWorks">
    <#list works as work>
        <div>
            <a href="work/${work.id}">
                <h1>${work.title}</h1>
                <form action="/work/delete/${work.id}" method="post">
                    <input type="hidden" name="_csrf" value="${_csrf.token}">
                    <input type="submit" value="delete">
                </form>
            </a>
        </div>
    <#else>
        <h1>Upss..</h1>
    </#list>
    <h1>Добавить работу</h1>
    <form action="/work/add" method="post" enctype="multipart/form-data">
        <input type="text" name="title" placeholder="Название работы"><br>
        <input type="text" name="description" placeholder="Краткое описание"><br>
        Первая фотография: <input type="file" name="file1"/><br><br>
        Вторая фотография: <input type="file" name="file2"/><br><br>
        <input type="hidden" name="_csrf" value="${_csrf.token}">
        <input type="submit" value="Добавить">
    </form>
</div>

<div class="certificates">
    <#list certificates as certificate>
        <div>
            <a href="/certificates/${certificate.id}">
                <h1>${certificate.title}</h1>
                <form action="/certificate/delete/${certificate.id}" method="post">
                    <input type="hidden" name="_csrf" value="${_csrf.token}">
                    <input type="submit" value="Удалить">
                </form>
            </a>
        </div>
    <#else>
        <h1>Upss=( </h1>
    </#list>
    <h1>Add certificate</h1>
    <form action="/certificate/add" method="post" enctype="multipart/form-data">
        <input type="text" name="title" placeholder="Название"><br>
        <input type="text" name="description" placeholder="Краткое описание"><br>
        Первая фотография: <input type="file" name="file1"/><br><br>
        Вторая фотография: <input type="file" name="file2"/><br><br>
        <input type="hidden" name="_csrf" value="${_csrf.token}">
        <input type="submit" value="Добавить">
    </form>
</div>
<div class="contact-me">
    <h1>Связаться со мной</h1><br>
    <form action="/message/send" method="post">
        <input type="text" name="sender" placeholder="Введите ваш email">
        <input type="text" name="messageSubject" placeholder="Тема письма">
        <input type="text" name="message" placeholder="Введите текст сообщения...">
        <input type="hidden" name="_csrf" value="${_csrf.token}">
        <input type="submit" value="Отправить">
    </form>
</div>
</body>
</html>